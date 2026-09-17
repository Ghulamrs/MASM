#include "x64.h"

struct RegName {
    const char *name;
    int num;
    int size;
    int flag;       /* 1: needs a REX prefix (SPL..DIL); 2: forbids one (AH..BH) */
};

static const RegName reg_names[] = {
    {"RAX", 0, 64, 0}, {"RCX", 1, 64, 0}, {"RDX", 2, 64, 0}, {"RBX", 3, 64, 0},
    {"RSP", 4, 64, 0}, {"RBP", 5, 64, 0}, {"RSI", 6, 64, 0}, {"RDI", 7, 64, 0},
    {"R8", 8, 64, 0},  {"R9", 9, 64, 0},  {"R10", 10, 64, 0}, {"R11", 11, 64, 0},
    {"R12", 12, 64, 0}, {"R13", 13, 64, 0}, {"R14", 14, 64, 0}, {"R15", 15, 64, 0},
    {"EAX", 0, 32, 0}, {"ECX", 1, 32, 0}, {"EDX", 2, 32, 0}, {"EBX", 3, 32, 0},
    {"ESP", 4, 32, 0}, {"EBP", 5, 32, 0}, {"ESI", 6, 32, 0}, {"EDI", 7, 32, 0},
    {"R8D", 8, 32, 0}, {"R9D", 9, 32, 0}, {"R10D", 10, 32, 0}, {"R11D", 11, 32, 0},
    {"R12D", 12, 32, 0}, {"R13D", 13, 32, 0}, {"R14D", 14, 32, 0}, {"R15D", 15, 32, 0},
    {"AX", 0, 16, 0}, {"CX", 1, 16, 0}, {"DX", 2, 16, 0}, {"BX", 3, 16, 0},
    {"SP", 4, 16, 0}, {"BP", 5, 16, 0}, {"SI", 6, 16, 0}, {"DI", 7, 16, 0},
    {"R8W", 8, 16, 0}, {"R9W", 9, 16, 0}, {"R10W", 10, 16, 0}, {"R11W", 11, 16, 0},
    {"R12W", 12, 16, 0}, {"R13W", 13, 16, 0}, {"R14W", 14, 16, 0}, {"R15W", 15, 16, 0},
    {"AL", 0, 8, 0}, {"CL", 1, 8, 0}, {"DL", 2, 8, 0}, {"BL", 3, 8, 0},
    {"AH", 4, 8, 2}, {"CH", 5, 8, 2}, {"DH", 6, 8, 2}, {"BH", 7, 8, 2},
    {"SPL", 4, 8, 1}, {"BPL", 5, 8, 1}, {"SIL", 6, 8, 1}, {"DIL", 7, 8, 1},
    {"R8B", 8, 8, 0}, {"R9B", 9, 8, 0}, {"R10B", 10, 8, 0}, {"R11B", 11, 8, 0},
    {"R12B", 12, 8, 0}, {"R13B", 13, 8, 0}, {"R14B", 14, 8, 0}, {"R15B", 15, 8, 0},
};

static const RegName *find_reg(const Token &k)
{
    if (k.kind != T_NAME)
        return 0;
    std::string s = upper(k.text);
    for (size_t i = 0; i < sizeof reg_names / sizeof reg_names[0]; i++)
        if (s == reg_names[i].name)
            return &reg_names[i];
    return 0;
}

static bool is_word(const std::vector<Token> &t, size_t i, const char *w)
{
    return i < t.size() && t[i].kind == T_NAME && upper(t[i].text) == w;
}

static int ptr_size(const std::vector<Token> &t, size_t i)
{
    if (is_word(t, i, "BYTE")) return 8;
    if (is_word(t, i, "WORD")) return 16;
    if (is_word(t, i, "DWORD")) return 32;
    if (is_word(t, i, "QWORD")) return 64;
    return 0;
}

static int data_width(const std::string &w)
{
    if (w == "DB") return 1;
    if (w == "DW") return 2;
    if (w == "DD") return 4;
    if (w == "DQ") return 8;
    return 0;
}

static void split_items(const std::vector<Token> &t, size_t from, std::vector<size_t> &cuts)
{
    int depth = 0;
    cuts.push_back(from);
    for (size_t k = from; k < t.size(); k++) {
        if (is_punct(t, k, '(') || is_punct(t, k, '[')) depth++;
        else if (is_punct(t, k, ')') || is_punct(t, k, ']')) depth--;
        else if (depth == 0 && is_punct(t, k, ',')) cuts.push_back(k + 1);
    }
    cuts.push_back(t.size() + 1);
}

X64Target::X64Target() : done(false), proc(-1)
{
}

bool X64Target::finished() const
{
    return done;
}

void X64Target::statement(Unit &u, std::vector<Token> &t)
{
    if (t.size() >= 2 && t[0].kind == T_NAME && is_punct(t, 1, ':')) {
        u.define(t[0].text);
        t.erase(t.begin(), t.begin() + 2);
        if (t.empty())
            return;
    }
    if (t[0].kind != T_NAME) {
        u.error("statement expected");
        return;
    }
    if (directive(u, t))
        return;

    std::vector<Operand> ops;
    std::vector<size_t> cuts;
    split_items(t, 1, cuts);
    if (t.size() > 1) {
        for (size_t c = 0; c + 1 < cuts.size(); c++) {
            size_t a = cuts[c];
            size_t b = cuts[c + 1] - 1;
            if (a >= b) {
                u.error("operand expected");
                return;
            }
            Operand o;
            if (!operand(u, t, a, b, o))
                return;
            ops.push_back(o);
        }
    }
    instruction(u, upper(t[0].text), ops);
}

bool X64Target::directive(Unit &u, std::vector<Token> &t)
{
    std::string w = upper(t[0].text);

    if (w == ".CODE" || w == ".DATA") {
        if (t.size() != 1) u.error("unexpected text after " + w);
        if (proc >= 0) u.error("section change inside PROC");
        u.section(w == ".CODE" ? ".text" : ".data", w == ".CODE");
        return true;
    }
    if (w == "END") {
        if (proc >= 0) u.error("PROC without ENDP");
        done = true;
        return true;
    }
    if (w == "PUBLIC" || w == "EXTERN" || w == "EXTRN") {
        size_t k = 1;
        while (k < t.size()) {
            if (t[k].kind != T_NAME) {
                u.error("name expected");
                return true;
            }
            int s = u.ref(t[k].text);
            Symbol &sym = u.symbols[s];
            k++;
            std::string type;
            if (is_punct(t, k, ':')) {
                if (k + 1 >= t.size() || t[k + 1].kind != T_NAME) {
                    u.error("type expected after ':'");
                    return true;
                }
                type = upper(t[k + 1].text);
                k += 2;
            }
            if (w == "PUBLIC") {
                if (sym.bind == B_EXTERN || sym.bind == B_CONST)
                    u.error("'" + sym.name + "' cannot be PUBLIC");
                else
                    sym.bind = B_GLOBAL;
            } else {
                if (sym.defined || sym.bind == B_CONST || sym.bind == B_GLOBAL) {
                    u.error("'" + sym.name + "' is already defined");
                } else {
                    sym.bind = B_EXTERN;
                    sym.function = type == "PROC";
                }
            }
            if (k < t.size() && !is_punct(t, k, ',')) {
                u.error("',' expected");
                return true;
            }
            k++;
        }
        return true;
    }
    if (w == "ALIGN") {
        long long n;
        std::string err;
        if (!eval(u, t, 1, t.size(), n, err)) { u.error(err); return true; }
        if (n <= 0 || n > 4096 || (n & (n - 1))) { u.error("ALIGN needs a power of two"); return true; }
        Section *s = u.cur();
        if (!s) return true;
        while (u.here() % (unsigned long)n)
            u.emit8(s->code ? 0x90 : 0);
        return true;
    }
    int width = data_width(w);
    if (width) {
        data(u, t, 1, width);
        return true;
    }
    if (t.size() < 2 || t[1].kind != T_NAME)
        return false;

    std::string w2 = upper(t[1].text);
    if (w2 == "PROC") {
        if (proc >= 0) { u.error("nested PROC"); return true; }
        if (t.size() > 2) u.error("PROC attributes are not supported in this version");
        Section *s = u.cur();
        if (!s) return true;
        if (!s->code) { u.error("PROC outside .CODE"); return true; }
        if (!u.define(t[0].text)) return true;
        proc = u.find(t[0].text);
        u.symbols[proc].function = true;
        u.symbols[proc].bind = B_GLOBAL;
        return true;
    }
    if (w2 == "ENDP") {
        if (proc < 0 || u.symbols[proc].name != t[0].text)
            u.error("ENDP does not match PROC");
        proc = -1;
        return true;
    }
    if (w2 == "EQU") {
        long long v;
        std::string err;
        if (!eval(u, t, 2, t.size(), v, err)) u.error(err);
        else u.constant(t[0].text, v);
        return true;
    }
    width = data_width(w2);
    if (width) {
        if (u.define(t[0].text))
            data(u, t, 2, width);
        return true;
    }
    return false;
}

static void put(Unit &u, int width, long long v)
{
    if (width == 1) u.emit8((unsigned)v);
    else if (width == 2) u.emit16((unsigned)v);
    else if (width == 4) u.emit32((unsigned long)v);
    else u.emit64((unsigned long long)v);
}

static bool fits(int width, long long v)
{
    if (width == 8) return true;
    long long lo = -(1LL << (width * 8 - 1));
    long long hi = (1LL << (width * 8)) - 1;
    return v >= lo && v <= hi;
}

void X64Target::data(Unit &u, const std::vector<Token> &t, size_t from, int width)
{
    if (!u.cur())
        return;
    if (from >= t.size()) {
        u.error("value expected");
        return;
    }
    std::vector<size_t> cuts;
    split_items(t, from, cuts);
    for (size_t c = 0; c + 1 < cuts.size(); c++) {
        size_t a = cuts[c];
        size_t b = cuts[c + 1] - 1;
        std::string err;
        long long v;
        if (a >= b) {
            u.error("value expected");
            return;
        }
        if (b - a == 1 && t[a].kind == T_NAME && t[a].text == "?") {
            put(u, width, 0);
            continue;
        }
        if (width == 1 && b - a == 1 && t[a].kind == T_STR) {
            if (t[a].text.empty()) u.error("empty string");
            for (size_t k = 0; k < t[a].text.size(); k++)
                u.emit8((unsigned char)t[a].text[k]);
            continue;
        }
        size_t dup = a;
        while (dup < b && !is_word(t, dup, "DUP")) dup++;
        if (dup < b) {
            long long count;
            if (!eval(u, t, a, dup, count, err)) { u.error(err); return; }
            if (count < 0 || count > 100000000) { u.error("bad DUP count"); return; }
            if (!is_punct(t, dup + 1, '(') || !is_punct(t, b - 1, ')') || dup + 2 >= b - 1) {
                u.error("DUP needs a value in parentheses");
                return;
            }
            long long fill = 0;
            if (!(dup + 4 == b && t[dup + 2].kind == T_NAME && t[dup + 2].text == "?")) {
                if (!eval(u, t, dup + 2, b - 1, fill, err)) { u.error(err); return; }
                if (!fits(width, fill)) { u.error("value does not fit"); return; }
            }
            for (long long k = 0; k < count; k++)
                put(u, width, fill);
            continue;
        }
        if (b - a == 1 && t[a].kind == T_NAME) {
            int s = u.find(t[a].text);
            if (s < 0 || u.symbols[s].bind != B_CONST) {
                if (width < 4) {
                    u.error("an address needs DD or DQ");
                    return;
                }
                u.fixup(u.here(), u.ref(t[a].text), width == 8 ? R_ADDR64 : R_ADDR32);
                put(u, width, 0);
                continue;
            }
        }
        if (!eval(u, t, a, b, v, err)) { u.error(err); return; }
        if (!fits(width, v)) { u.error("value does not fit"); return; }
        put(u, width, v);
    }
}

bool X64Target::operand(Unit &u, const std::vector<Token> &t, size_t a, size_t b, Operand &o)
{
    o.kind = O_IMM;
    o.size = 0;
    o.reg = -1;
    o.base = -1;
    o.index = -1;
    o.scale = 1;
    o.value = 0;
    o.sym = -1;
    o.label = false;
    o.high = false;
    o.rexonly = false;

    int ptr = ptr_size(t, a);
    if (ptr) {
        if (!is_word(t, a + 1, "PTR")) {
            u.error("PTR expected");
            return false;
        }
        o.size = ptr;
        a += 2;
        if (a >= b) {
            u.error("memory operand expected");
            return false;
        }
    }
    if (b - a == 1) {
        const RegName *r = find_reg(t[a]);
        if (r) {
            if (o.size) {
                u.error("PTR before a register");
                return false;
            }
            o.kind = O_REG;
            o.reg = r->num;
            o.size = r->size;
            o.high = r->flag == 2;
            o.rexonly = r->flag == 1;
            return true;
        }
    }
    if (is_punct(t, a, '[')) {
        if (!is_punct(t, b - 1, ']') || b - a < 3) {
            u.error("']' expected");
            return false;
        }
        return memory(u, t, a + 1, b - 1, o);
    }
    if (b - a == 1 && t[a].kind == T_NAME) {
        int s = u.find(t[a].text);
        if (s < 0 || u.symbols[s].bind != B_CONST) {
            o.kind = O_MEM;
            o.sym = u.ref(t[a].text);
            o.label = true;
            return true;
        }
    }
    if (o.size) {
        u.error("memory operand expected after PTR");
        return false;
    }
    std::string err;
    if (!eval(u, t, a, b, o.value, err)) {
        u.error(err);
        return false;
    }
    return true;
}

bool X64Target::memory(Unit &u, const std::vector<Token> &t, size_t a, size_t b, Operand &o)
{
    o.kind = O_MEM;
    size_t k = a;
    while (k < b) {
        int sign = 1;
        if (is_punct(t, k, '+') || is_punct(t, k, '-')) {
            if (t[k].text[0] == '-') sign = -1;
            k++;
        }
        size_t e = k;
        int depth = 0;
        while (e < b) {
            if (is_punct(t, e, '(')) depth++;
            else if (is_punct(t, e, ')')) depth--;
            else if (depth == 0 && e > k && (is_punct(t, e, '+') || is_punct(t, e, '-'))) break;
            e++;
        }
        if (e == k) {
            u.error("address term expected");
            return false;
        }
        const RegName *r = find_reg(t[k]);
        const RegName *r2 = e - k == 3 ? find_reg(t[e - 1]) : 0;
        if (r || r2) {
            int num;
            int size;
            int scale = 1;
            if (e - k == 1) {
                num = r->num;
                size = r->size;
            } else if (e - k == 3 && is_punct(t, k + 1, '*') && (r ? t[e - 1].kind == T_NUM : t[k].kind == T_NUM)) {
                const RegName *q = r ? r : r2;
                num = q->num;
                size = q->size;
                scale = (int)(r ? t[e - 1].value : t[k].value);
                if (scale != 1 && scale != 2 && scale != 4 && scale != 8) {
                    u.error("scale must be 1, 2, 4 or 8");
                    return false;
                }
            } else {
                u.error("bad register term in address");
                return false;
            }
            if (sign < 0) {
                u.error("a register cannot be subtracted");
                return false;
            }
            if (size != 64) {
                u.error("only 64-bit registers can address memory in this version");
                return false;
            }
            if (scale == 1 && o.base < 0 && e - k == 1) {
                o.base = num;
            } else if (o.index < 0) {
                if (num == 4) {
                    u.error("RSP cannot be an index");
                    return false;
                }
                o.index = num;
                o.scale = scale;
            } else {
                u.error("too many registers in address");
                return false;
            }
        } else if (e - k == 1 && t[k].kind == T_NAME &&
                   (u.find(t[k].text) < 0 || u.symbols[u.find(t[k].text)].bind != B_CONST)) {
            if (o.sym >= 0 || sign < 0) {
                u.error("bad label term in address");
                return false;
            }
            o.sym = u.ref(t[k].text);
        } else {
            long long v;
            std::string err;
            if (!eval(u, t, k, e, v, err)) {
                u.error(err);
                return false;
            }
            o.value += sign * v;
        }
        k = e;
    }
    if (o.sym >= 0 && (o.base >= 0 || o.index >= 0)) {
        u.error("a label cannot be combined with registers in this version");
        return false;
    }
    if (o.base < 0 && o.index >= 0 && o.scale == 1) {
        o.base = o.index;
        o.index = -1;
    }
    if (o.value < -2147483648LL || o.value > 2147483647LL) {
        u.error("displacement does not fit in 32 bits");
        return false;
    }
    return true;
}
