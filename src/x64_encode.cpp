#include "x64.h"

static void start(Code &c)
{
    c.n = 0;
    c.disp_at = -1;
    c.sym = -1;
    c.kind = R_REL32;
    c.rex = false;
    c.high = false;
    c.bad = false;
}

static void put(Code &c, unsigned v)
{
    c.b[c.n++] = (unsigned char)v;
}

static void put32(Code &c, long long v)
{
    for (int i = 0; i < 4; i++)
        put(c, (unsigned)((unsigned long long)v >> (8 * i)) & 0xFF);
}

/* an immediate of the operand's size: 1, 2 or 4 bytes (64-bit operands take a sign-extended 4) */
static void put_imm(Code &c, int size, long long v)
{
    if (size == 8) put(c, (unsigned)v & 0xFF);
    else if (size == 16) { put(c, (unsigned)v & 0xFF); put(c, (unsigned)(v >> 8) & 0xFF); }
    else put32(c, v);
}

static bool fits8(long long v)
{
    return v >= -128 && v <= 127;
}

static bool fits32(long long v)
{
    return v >= -2147483648LL && v <= 2147483647LL;
}

static bool is_rip(const Operand &m)
{
    return m.kind == O_MEM && m.sym >= 0;
}

/* an 8-bit register operand may need a REX prefix (SPL..DIL) or forbid one (AH..BH) */
static void note(Code &c, const Operand &o)
{
    if (o.kind != O_REG || o.size != 8)
        return;
    if (o.high) c.high = true;
    if (o.rexonly) c.rex = true;
}

static void rex(Code &c, int bits)
{
    if (bits || c.rex) {
        if (c.high) c.bad = true;
        put(c, 0x40 | bits);
    }
}

static void rm_code(Code &c, bool w, int regf, const Operand &m, const unsigned char *op, int opn)
{
    int bits = w ? 8 : 0;
    if (regf & 8) bits |= 4;
    if (m.kind == O_REG) {
        if (m.reg & 8) bits |= 1;
    } else {
        if (m.base >= 0 && (m.base & 8)) bits |= 1;
        if (m.index >= 0 && (m.index & 8)) bits |= 2;
    }
    rex(c, bits);
    for (int i = 0; i < opn; i++)
        put(c, op[i]);

    int r = (regf & 7) << 3;
    if (m.kind == O_REG) {
        put(c, 0xC0 | r | (m.reg & 7));
        return;
    }
    if (m.sym >= 0) {
        put(c, 0x05 | r);
        c.disp_at = c.n;
        c.sym = m.sym;
        put32(c, m.value);
        return;
    }
    int sb = m.scale == 8 ? 3 : m.scale == 4 ? 2 : m.scale == 2 ? 1 : 0;
    if (m.base < 0) {
        put(c, 0x04 | r);
        put(c, (sb << 6) | ((m.index < 0 ? 4 : m.index & 7) << 3) | 5);
        put32(c, m.value);
        return;
    }
    int mod;
    if (m.value == 0 && (m.base & 7) != 5) mod = 0x00;
    else if (fits8(m.value)) mod = 0x40;
    else mod = 0x80;
    if (m.index < 0 && (m.base & 7) != 4) {
        put(c, mod | r | (m.base & 7));
    } else {
        put(c, mod | r | 4);
        put(c, (sb << 6) | ((m.index < 0 ? 4 : m.index & 7) << 3) | (m.base & 7));
    }
    if (mod == 0x40) put(c, (unsigned)m.value & 0xFF);
    else if (mod == 0x80) put32(c, m.value);
}

static void rm1(Code &c, bool w, int regf, const Operand &m, unsigned op)
{
    unsigned char b[1] = { (unsigned char)op };
    rm_code(c, w, regf, m, b, 1);
}

static void rm2(Code &c, bool w, int regf, const Operand &m, unsigned op1, unsigned op2)
{
    unsigned char b[2] = { (unsigned char)op1, (unsigned char)op2 };
    rm_code(c, w, regf, m, b, 2);
}

/* one-byte opcode by operand size: 16 takes the 66 prefix, 8 the even opcode, 64 REX.W */
static void rm(Code &c, int size, int regf, const Operand &m, unsigned op)
{
    if (size == 16) put(c, 0x66);
    rm1(c, size == 64, regf, m, size == 8 ? (op & ~1u) : op);
}

/* the accumulator short forms: op with AL, op+1 with AX/EAX/RAX */
static void acc(Code &c, int size, unsigned op)
{
    if (size == 16) put(c, 0x66);
    rex(c, size == 64 ? 8 : 0);
    put(c, size == 8 ? (op & ~1u) : op);
}

static void emit(Unit &u, const Code &c)
{
    if (c.bad) {
        u.error("AH, BH, CH or DH cannot be used with SPL, BPL, SIL, DIL or R8-R15");
        return;
    }
    unsigned long at = u.here();
    for (int i = 0; i < c.n; i++)
        u.emit8(c.b[i]);
    if (c.disp_at >= 0)
        u.fixup(at + c.disp_at, c.sym, c.kind);
}

static void rel32(Unit &u, int prefix, unsigned op, int sym)
{
    Code c;
    start(c);
    if (prefix >= 0) put(c, prefix);
    put(c, op);
    c.disp_at = c.n;
    c.sym = sym;
    put32(c, 0);
    emit(u, c);
}

struct Name {
    const char *name;
    int code;
};

static const Name arith_names[] = {
    {"ADD", 0}, {"OR", 1}, {"ADC", 2}, {"SBB", 3},
    {"AND", 4}, {"SUB", 5}, {"XOR", 6}, {"CMP", 7},
};

static const Name unary_names[] = {
    {"NOT", 2}, {"NEG", 3}, {"MUL", 4}, {"DIV", 6}, {"IDIV", 7},
};

static const Name shift_names[] = {
    {"SHL", 4}, {"SAL", 4}, {"SHR", 5}, {"SAR", 7},
};

static const Name jcc_names[] = {
    {"JO", 0}, {"JNO", 1}, {"JB", 2}, {"JC", 2}, {"JNAE", 2},
    {"JAE", 3}, {"JNB", 3}, {"JNC", 3}, {"JE", 4}, {"JZ", 4},
    {"JNE", 5}, {"JNZ", 5}, {"JBE", 6}, {"JNA", 6}, {"JA", 7}, {"JNBE", 7},
    {"JS", 8}, {"JNS", 9}, {"JP", 10}, {"JPE", 10}, {"JNP", 11}, {"JPO", 11},
    {"JL", 12}, {"JNGE", 12}, {"JGE", 13}, {"JNL", 13},
    {"JLE", 14}, {"JNG", 14}, {"JG", 15}, {"JNLE", 15},
};

static int lookup(const Name *list, int n, const std::string &name)
{
    for (int i = 0; i < n; i++)
        if (name == list[i].name)
            return list[i].code;
    return -1;
}

static const Name plain_names[] = {
    {"RET", 0xC3}, {"NOP", 0x90}, {"CDQ", 0x99}, {"LEAVE", 0xC9}, {"INT3", 0xCC},
};

static bool same_size(Unit &u, Operand &a, Operand &b)
{
    if (a.size == 0) a.size = b.size;
    if (b.size == 0) b.size = a.size;
    if (a.size == 0) {
        u.error("size unknown; use BYTE, WORD, DWORD or QWORD PTR");
        return false;
    }
    if (a.size != b.size) {
        u.error("operand sizes differ");
        return false;
    }
    return true;
}

static bool need_size(Unit &u, const Operand &m)
{
    if (m.size == 0) {
        u.error("size unknown; use BYTE, WORD, DWORD or QWORD PTR");
        return false;
    }
    return true;
}

/* the immediate must fit the operand's width, signed or unsigned; a 64-bit operand takes a signed 32 */
static bool imm_fits(Unit &u, int size, long long v)
{
    bool ok;
    if (size == 8) ok = v >= -128 && v <= 255;
    else if (size == 16) ok = v >= -32768 && v <= 65535;
    else if (size == 32) ok = v >= -2147483648LL && v <= 4294967295LL;
    else ok = fits32(v);
    if (ok)
        return true;
    u.error(size == 64 ? "immediate does not fit in 32 bits" : "immediate does not fit the operand");
    return false;
}

static bool imm_after_rip(Unit &u, const Operand &m)
{
    if (!is_rip(m))
        return false;
    u.error("a label address with an immediate is not supported in this version");
    return true;
}

/* the value as the operand width sees it, sign-extended back */
static long long narrow(int size, long long v)
{
    if (size == 8) return (long long)(signed char)(v & 0xFF);
    if (size == 16) return (long long)(short)(v & 0xFFFF);
    return (long long)(int)(unsigned int)(v & 0xFFFFFFFFLL);
}

void X64Target::instruction(Unit &u, const std::string &name, std::vector<Operand> &ops)
{
    Section *sec = u.cur();
    if (!sec)
        return;
    if (!sec->code) {
        u.error("instruction outside .CODE");
        return;
    }
    size_t n = ops.size();
    Code c;
    start(c);
    for (size_t i = 0; i < n; i++)
        note(c, ops[i]);
    int k;

    k = lookup(plain_names, 5, name);
    if (k >= 0 || name == "CQO" || name == "CDQE") {
        if (n == 1 && name == "RET" && ops[0].kind == O_IMM) {
            if (ops[0].value < 0 || ops[0].value > 0xFFFF) { u.error("RET value does not fit"); return; }
            u.emit8(0xC2);
            u.emit16((unsigned)ops[0].value);
            return;
        }
        if (n != 0) { u.error(name + " takes no operands"); return; }
        if (name == "CQO") { u.emit8(0x48); u.emit8(0x99); return; }
        if (name == "CDQE") { u.emit8(0x48); u.emit8(0x98); return; }
        u.emit8(k);
        return;
    }

    k = lookup(arith_names, 8, name);
    if (k >= 0 || name == "MOV" || name == "TEST") {
        if (n != 2) { u.error(name + " needs two operands"); return; }
        Operand &d = ops[0];
        Operand &s = ops[1];
        if (d.kind == O_IMM) { u.error("destination cannot be a constant"); return; }
        if (d.kind == O_MEM && s.kind == O_MEM) { u.error("two memory operands"); return; }
        bool mov = name == "MOV";
        bool test = name == "TEST";
        if (s.kind != O_IMM) {
            if (!same_size(u, d, s)) return;
            int size = d.size;
            if (test) {
                if (s.kind == O_REG) rm(c, size, s.reg, d, 0x85);
                else rm(c, size, d.reg, s, 0x85);
            } else if (d.kind == O_REG) {
                rm(c, size, d.reg, s, mov ? 0x8B : (unsigned)(k * 8 + 3));
            } else {
                rm(c, size, s.reg, d, mov ? 0x89 : (unsigned)(k * 8 + 1));
            }
            emit(u, c);
            return;
        }
        if (!need_size(u, d) || imm_after_rip(u, d)) return;
        int size = d.size;
        long long v = s.value;
        if (mov && d.kind == O_REG && size == 64 && !fits32(v)) {
            put(c, 0x48 | ((d.reg & 8) ? 1 : 0));
            put(c, 0xB8 | (d.reg & 7));
            u.emit8(c.b[0]);
            u.emit8(c.b[1]);
            u.emit64((unsigned long long)v);
            return;
        }
        if (!imm_fits(u, size, v)) return;
        v = narrow(size, v);
        if (mov && d.kind == O_REG && size != 64) {
            if (size == 16) put(c, 0x66);
            rex(c, (d.reg & 8) ? 1 : 0);
            put(c, (size == 8 ? 0xB0 : 0xB8) | (d.reg & 7));
        } else if (mov) {
            rm(c, size, 0, d, 0xC7);
        } else if (test) {
            if (d.kind == O_REG && d.reg == 0) acc(c, size, 0xA9);
            else rm(c, size, 0, d, 0xF7);
        } else if (size != 8 && fits8(v)) {
            rm(c, size, k, d, 0x83);
            put(c, (unsigned)v & 0xFF);
            emit(u, c);
            return;
        } else if (d.kind == O_REG && d.reg == 0) {
            acc(c, size, (unsigned)(k * 8 + 5));
        } else {
            rm(c, size, k, d, 0x81);
        }
        put_imm(c, size, v);
        emit(u, c);
        return;
    }

    if (name == "MOVZX" || name == "MOVSX" || name == "MOVSXD") {
        if (n != 2 || ops[0].kind != O_REG || ops[1].kind == O_IMM || ops[0].size == 8) {
            u.error(name + " needs a register and a smaller register or memory operand");
            return;
        }
        Operand &d = ops[0];
        Operand &s = ops[1];
        if (!need_size(u, s)) return;
        if (name == "MOVSXD") {
            if (d.size != 64 || s.size != 32) { u.error("MOVSXD takes a 64-bit register and a 32-bit operand"); return; }
            rm1(c, true, d.reg, s, 0x63);
            emit(u, c);
            return;
        }
        if (s.size != 8 && !(s.size == 16 && d.size != 16)) { u.error(name + " needs an 8- or 16-bit operand smaller than the register"); return; }
        if (d.size == 16) put(c, 0x66);
        rm2(c, d.size == 64, d.reg, s, 0x0F, (name == "MOVZX" ? 0xB6 : 0xBE) + (s.size == 16 ? 1 : 0));
        emit(u, c);
        return;
    }

    if (name == "LEA") {
        if (n != 2 || ops[0].kind != O_REG || ops[1].kind != O_MEM || ops[0].size == 8) {
            u.error("LEA needs a register and a memory operand");
            return;
        }
        if (ops[0].size == 16) put(c, 0x66);
        rm1(c, ops[0].size == 64, ops[0].reg, ops[1], 0x8D);
        emit(u, c);
        return;
    }

    if (name == "IMUL" && n == 2) {
        if (ops[0].kind != O_REG || ops[1].kind == O_IMM || ops[0].size == 8) {
            u.error("IMUL needs a register and a register or memory operand");
            return;
        }
        if (!same_size(u, ops[0], ops[1])) return;
        if (ops[0].size == 16) put(c, 0x66);
        rm2(c, ops[0].size == 64, ops[0].reg, ops[1], 0x0F, 0xAF);
        emit(u, c);
        return;
    }

    k = lookup(unary_names, 5, name);
    if (k < 0 && name == "IMUL") k = 5;
    if (k >= 0 || name == "INC" || name == "DEC") {
        if (n != 1 || ops[0].kind == O_IMM) { u.error(name + " needs one register or memory operand"); return; }
        if (!need_size(u, ops[0])) return;
        if (k >= 0) rm(c, ops[0].size, k, ops[0], 0xF7);
        else rm(c, ops[0].size, name == "INC" ? 0 : 1, ops[0], 0xFF);
        emit(u, c);
        return;
    }

    k = lookup(shift_names, 4, name);
    if (k >= 0) {
        if (n != 2 || ops[0].kind == O_IMM || ops[1].kind != O_IMM) {
            u.error(name + " needs a destination and a constant count in this version");
            return;
        }
        if (!need_size(u, ops[0]) || imm_after_rip(u, ops[0])) return;
        long long v = ops[1].value;
        if (v < 0 || v > 255) { u.error("shift count does not fit"); return; }
        if (v == 1) {
            rm(c, ops[0].size, k, ops[0], 0xD1);
        } else {
            rm(c, ops[0].size, k, ops[0], 0xC1);
            put(c, (unsigned)v);
        }
        emit(u, c);
        return;
    }

    if (name == "PUSH" || name == "POP") {
        bool push = name == "PUSH";
        if (n != 1) { u.error(name + " needs one operand"); return; }
        Operand &o = ops[0];
        if (o.kind == O_REG) {
            if (o.size != 64 && o.size != 16) { u.error(name + " needs a 64-bit register"); return; }
            if (o.size == 16) u.emit8(0x66);
            if (o.reg & 8) u.emit8(0x41);
            u.emit8((push ? 0x50 : 0x58) | (o.reg & 7));
            return;
        }
        if (o.kind == O_IMM) {
            if (!push) { u.error("POP needs a register or memory operand"); return; }
            if (!fits32(o.value)) { u.error("immediate does not fit in 32 bits"); return; }
            if (fits8(o.value)) { u.emit8(0x6A); u.emit8((unsigned)o.value & 0xFF); }
            else { u.emit8(0x68); u.emit32((unsigned long)o.value); }
            return;
        }
        if (o.size != 64 && o.size != 16 && !o.label) { u.error(name + " needs QWORD PTR"); return; }
        if (o.size == 16) put(c, 0x66);
        rm1(c, false, push ? 6 : 0, o, push ? 0xFF : 0x8F);
        emit(u, c);
        return;
    }

    if (name == "CALL" || name == "JMP") {
        bool call = name == "CALL";
        if (n != 1 || ops[0].kind == O_IMM) { u.error(name + " needs a target"); return; }
        Operand &o = ops[0];
        if (o.kind == O_MEM && o.label && o.size == 0) {
            rel32(u, -1, call ? 0xE8 : 0xE9, o.sym);
            return;
        }
        if (o.size != 64) { u.error(name + " needs a 64-bit register or QWORD PTR"); return; }
        rm1(c, false, call ? 2 : 4, o, 0xFF);
        emit(u, c);
        return;
    }

    k = lookup(jcc_names, 30, name);
    if (k >= 0) {
        if (n != 1 || ops[0].kind != O_MEM || !ops[0].label) {
            u.error(name + " needs a label");
            return;
        }
        rel32(u, 0x0F, 0x80 + k, ops[0].sym);
        return;
    }

    u.error("unknown instruction '" + name + "'");
}
