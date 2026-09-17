#include "asm.h"

struct ExprState {
    Unit *u;
    const std::vector<Token> *t;
    size_t pos;
    size_t end;
    std::string err;
};

static bool sum(ExprState &e, Value &v);

static void clear(Value &v)
{
    v.v = 0;
    v.sym = -1;
    v.sub = -1;
    v.sec = -1;
    v.imagerel = false;
    v.offset = false;
    v.wide = false;
}

static bool is_const(const Value &v)
{
    return v.sym < 0 && v.sub < 0 && v.sec < 0 && !v.imagerel && !v.offset;
}

/* a defined label, or $, as a section and an offset */
bool located(const Unit &u, const Value &x, int &sec, long long &off)
{
    if (x.sub >= 0 || x.imagerel || x.offset)
        return false;
    if (x.sec >= 0) {
        sec = x.sec;
        off = x.v;
        return true;
    }
    if (x.sym >= 0) {
        const Symbol &s = u.symbols[x.sym];
        if (s.defined && s.bind != B_CONST && s.section >= 0) {
            sec = s.section;
            off = s.value + x.v;
            return true;
        }
    }
    return false;
}

static bool at(ExprState &e, char c)
{
    return e.pos < e.end && is_punct(*e.t, e.pos, c);
}

static bool word(ExprState &e, const char *w)
{
    return e.pos < e.end && (*e.t)[e.pos].kind == T_NAME && upper((*e.t)[e.pos].text) == w;
}

static bool not_const(ExprState &e, const Value &v)
{
    if (is_const(v))
        return false;
    if (v.sym >= 0) e.err = "'" + e.u->symbols[v.sym].name + "' is not a constant";
    else e.err = "'$' is not a constant";
    return true;
}

static bool atom(ExprState &e, Value &v)
{
    clear(v);
    if (e.pos >= e.end) {
        e.err = "expression expected";
        return false;
    }
    const Token &k = (*e.t)[e.pos];
    if (at(e, '-') || at(e, '+')) {
        bool neg = k.text[0] == '-';
        e.pos++;
        if (!atom(e, v)) return false;
        if (neg) {
            if (not_const(e, v)) return false;
            v.v = -v.v;
        }
        return true;
    }
    if (at(e, '(')) {
        e.pos++;
        if (!sum(e, v)) return false;
        if (!at(e, ')')) {
            e.err = "')' expected";
            return false;
        }
        e.pos++;
        return true;
    }
    if (k.kind == T_NUM) {
        v.v = k.value;
        v.wide = k.wide;
        e.pos++;
        return true;
    }
    if (k.kind == T_STR) {
        /* a character constant: up to eight characters, the first the most significant, as ml64 */
        if (k.text.empty() || k.text.size() > 8) {
            e.err = "a character constant needs one to eight characters";
            return false;
        }
        for (size_t i = 0; i < k.text.size(); i++)
            v.v = (long long)(((unsigned long long)v.v << 8) | (unsigned char)k.text[i]);
        e.pos++;
        return true;
    }
    if (k.kind == T_NAME) {
        if (k.text == "$") {
            if (e.u->current < 0) {
                e.err = "no section open (use .CODE or .DATA)";
                return false;
            }
            v.sec = e.u->current;
            v.v = (long long)e.u->here();
            e.pos++;
            return true;
        }
        if (word(e, "IMAGEREL") || word(e, "OFFSET")) {
            bool image = word(e, "IMAGEREL");
            e.pos++;
            if (!atom(e, v)) return false;
            if (v.sym < 0 || v.sub >= 0 || v.imagerel || v.offset) {
                e.err = std::string(image ? "IMAGEREL" : "OFFSET") + " needs a label";
                return false;
            }
            if (image) v.imagerel = true;
            else v.offset = true;
            return true;
        }
        int s = e.u->find(k.text);
        if (s >= 0 && e.u->symbols[s].bind == B_CONST)
            v.v = e.u->symbols[s].value;
        else
            v.sym = e.u->ref(k.text);
        e.pos++;
        return true;
    }
    e.err = "unexpected '" + k.text + "'";
    return false;
}

static bool product(ExprState &e, Value &v)
{
    if (!atom(e, v)) return false;
    while (at(e, '*') || at(e, '/')) {
        char op = (*e.t)[e.pos].text[0];
        e.pos++;
        Value r;
        if (!atom(e, r)) return false;
        if (not_const(e, v) || not_const(e, r)) return false;
        if (op == '*') {
            v.v = v.v * r.v;
        } else {
            if (r.v == 0) {
                e.err = "division by zero";
                return false;
            }
            v.v = v.v / r.v;
        }
        v.wide = v.wide || r.wide;
    }
    return true;
}

/* a + b: at most one address between them */
static bool add(ExprState &e, Value &a, const Value &b)
{
    if (!is_const(a) && !is_const(b)) {
        e.err = "two addresses cannot be added";
        return false;
    }
    if (is_const(a)) {
        long long v = a.v;
        bool wide = a.wide;
        a = b;
        a.v += v;
        a.wide = a.wide || wide;
    } else {
        a.v += b.v;
        a.wide = a.wide || b.wide;
    }
    return true;
}

/* a - b: a constant, a label difference folded once both are known, or kept for later */
static bool sub(ExprState &e, Value &a, const Value &b)
{
    if (is_const(b)) {
        a.v -= b.v;
        a.wide = a.wide || b.wide;
        return true;
    }
    if (a.imagerel || a.offset || b.imagerel || b.offset || b.sub >= 0 || a.sub >= 0) {
        e.err = "bad address arithmetic";
        return false;
    }
    int sa, sb;
    long long oa, ob;
    if (located(*e.u, a, sa, oa) && located(*e.u, b, sb, ob)) {
        if (sa != sb) {
            e.err = "labels in different sections cannot be subtracted";
            return false;
        }
        clear(a);
        a.v = oa - ob;
        return true;
    }
    if (a.sym >= 0 && b.sym >= 0) {
        a.sub = b.sym;
        a.v -= b.v;
        return true;
    }
    e.err = "a label can only be subtracted from a label";
    return false;
}

static bool sum(ExprState &e, Value &v)
{
    if (!product(e, v)) return false;
    while (at(e, '+') || at(e, '-')) {
        char op = (*e.t)[e.pos].text[0];
        e.pos++;
        Value r;
        if (!product(e, r)) return false;
        if (!(op == '+' ? add(e, v, r) : sub(e, v, r))) return false;
    }
    return true;
}

bool eval(Unit &u, const std::vector<Token> &t, size_t from, size_t to, Value &v, std::string &err)
{
    ExprState e;
    e.u = &u;
    e.t = &t;
    e.pos = from;
    e.end = to;
    if (!sum(e, v)) {
        err = e.err;
        return false;
    }
    if (e.pos != e.end) {
        err = "unexpected '" + t[e.pos].text + "'";
        return false;
    }
    return true;
}

bool eval_const(Unit &u, const std::vector<Token> &t, size_t from, size_t to, long long &v, std::string &err)
{
    Value x;
    if (!eval(u, t, from, to, x, err))
        return false;
    ExprState e;
    e.u = &u;
    if (not_const(e, x)) {
        err = e.err;
        return false;
    }
    v = x.v;
    return true;
}
