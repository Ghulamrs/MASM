#include "asm.h"

struct ExprState {
    const Unit *u;
    const std::vector<Token> *t;
    size_t pos;
    size_t end;
    std::string err;
};

static bool sum(ExprState &e, long long &v);

static bool at(ExprState &e, char c)
{
    return e.pos < e.end && is_punct(*e.t, e.pos, c);
}

static bool atom(ExprState &e, long long &v)
{
    if (e.pos >= e.end) {
        e.err = "expression expected";
        return false;
    }
    const Token &k = (*e.t)[e.pos];
    if (at(e, '-')) {
        e.pos++;
        if (!atom(e, v)) return false;
        v = -v;
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
        v = k.value;
        e.pos++;
        return true;
    }
    if (k.kind == T_STR && k.text.size() == 1) {
        v = (unsigned char)k.text[0];
        e.pos++;
        return true;
    }
    if (k.kind == T_NAME) {
        int s = e.u->find(k.text);
        if (s >= 0 && e.u->symbols[s].bind == B_CONST) {
            v = e.u->symbols[s].value;
            e.pos++;
            return true;
        }
        e.err = "'" + k.text + "' is not a constant";
        return false;
    }
    e.err = "unexpected '" + k.text + "'";
    return false;
}

static bool product(ExprState &e, long long &v)
{
    if (!atom(e, v)) return false;
    while (at(e, '*') || at(e, '/')) {
        char op = (*e.t)[e.pos].text[0];
        e.pos++;
        long long r;
        if (!atom(e, r)) return false;
        if (op == '*') {
            v = v * r;
        } else {
            if (r == 0) {
                e.err = "division by zero";
                return false;
            }
            v = v / r;
        }
    }
    return true;
}

static bool sum(ExprState &e, long long &v)
{
    if (!product(e, v)) return false;
    while (at(e, '+') || at(e, '-')) {
        char op = (*e.t)[e.pos].text[0];
        e.pos++;
        long long r;
        if (!product(e, r)) return false;
        v = op == '+' ? v + r : v - r;
    }
    return true;
}

bool eval(const Unit &u, const std::vector<Token> &t, size_t from, size_t to, long long &v, std::string &err)
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
