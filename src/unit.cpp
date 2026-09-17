#include "asm.h"
#include <cstdio>

Unit::Unit() : line(0), current(-1)
{
}

void Unit::error(const std::string &msg)
{
    char buf[32];
    snprintf(buf, sizeof buf, "line %d: ", line);
    errors.push_back(buf + msg);
}

int Unit::section(const std::string &name, bool code, bool bss, bool readonly, int align)
{
    for (size_t i = 0; i < sections.size(); i++)
        if (sections[i].name == name) {
            current = (int)i;
            return current;
        }
    Section s;
    s.name = name;
    s.code = code;
    s.bss = bss;
    s.readonly = readonly;
    s.info = false;
    s.align = align;
    sections.push_back(s);
    current = (int)sections.size() - 1;
    return current;
}

Section *Unit::cur()
{
    if (current < 0) {
        error("no section open (use .CODE or .DATA)");
        return 0;
    }
    return &sections[current];
}

unsigned long Unit::here()
{
    return current < 0 ? 0 : (unsigned long)sections[current].bytes.size();
}

int Unit::find(const std::string &name) const
{
    for (size_t i = 0; i < symbols.size(); i++)
        if (symbols[i].name == name)
            return (int)i;
    return -1;
}

int Unit::ref(const std::string &name)
{
    int i = find(name);
    if (i >= 0)
        return i;
    Symbol s;
    s.name = name;
    s.bind = B_LOCAL;
    s.defined = false;
    s.function = false;
    s.type = SYM_UNTYPED;
    s.section = -1;
    s.value = 0;
    s.line = line;
    symbols.push_back(s);
    return (int)symbols.size() - 1;
}

/* an anonymous defined label for $ used as an address */
int Unit::location(int sec, long long off)
{
    char buf[32];
    snprintf(buf, sizeof buf, "\001%u", (unsigned)symbols.size());
    int i = ref(buf);
    Symbol &s = symbols[i];
    s.defined = true;
    s.type = SYM_NEAR;
    s.section = sec;
    s.value = off;
    return i;
}

bool Unit::define(const std::string &name, int type)
{
    if (!cur())
        return false;
    int i = ref(name);
    Symbol &s = symbols[i];
    if (s.defined || s.bind == B_EXTERN || s.bind == B_CONST) {
        error("'" + name + "' is already defined");
        return false;
    }
    s.defined = true;
    s.type = type;
    s.section = current;
    s.value = (long long)here();
    s.line = line;
    return true;
}

bool Unit::constant(const std::string &name, long long v)
{
    int i = ref(name);
    Symbol &s = symbols[i];
    if (s.defined) {
        error("'" + name + "' is already defined");
        return false;
    }
    s.bind = B_CONST;
    s.defined = true;
    s.value = v;
    return true;
}

void Unit::emit8(unsigned v)
{
    Section *s = cur();
    if (s)
        s->bytes.push_back((unsigned char)(v & 0xFF));
}

void Unit::emit16(unsigned v)
{
    emit8(v);
    emit8(v >> 8);
}

void Unit::emit32(unsigned long v)
{
    emit16((unsigned)(v & 0xFFFF));
    emit16((unsigned)((v >> 16) & 0xFFFF));
}

void Unit::emit64(unsigned long long v)
{
    emit32((unsigned long)(v & 0xFFFFFFFFull));
    emit32((unsigned long)(v >> 32));
}

void Unit::fixup(unsigned long at, int sym, RelKind kind)
{
    Fixup f;
    f.section = current;
    f.at = at;
    f.symbol = sym;
    f.sub = -1;
    f.width = 4;
    f.kind = kind;
    f.line = line;
    fixups.push_back(f);
}

/* a label difference to be written once both labels are known */
void Unit::difference(unsigned long at, int sym, int sub, int width)
{
    fixup(at, sym, R_DIFF);
    fixups.back().sub = sub;
    fixups.back().width = width;
}

static long read32(const std::vector<unsigned char> &b, unsigned long at)
{
    unsigned long v = b[at] | (b[at + 1] << 8) | (b[at + 2] << 16) | ((unsigned long)b[at + 3] << 24);
    return (long)(int)v;
}

static void write32(std::vector<unsigned char> &b, unsigned long at, long v)
{
    for (int i = 0; i < 4; i++)
        b[at + i] = (unsigned char)((unsigned long)v >> (8 * i));
}

void Unit::resolve()
{
    for (size_t i = 0; i < symbols.size(); i++) {
        const Symbol &s = symbols[i];
        if (!s.defined && s.bind != B_EXTERN) {
            line = s.line;
            error("'" + s.name + "' is not defined");
        }
    }
    for (size_t i = 0; i < fixups.size(); i++) {
        const Fixup &f = fixups[i];
        const Symbol &s = symbols[f.symbol];
        line = f.line;
        if (s.bind == B_CONST) {
            error("'" + s.name + "' is a constant, not an address");
            continue;
        }
        Section &sec = sections[f.section];
        if (f.kind == R_DIFF) {
            const Symbol &t = symbols[f.sub];
            if (t.bind == B_CONST) { error("'" + t.name + "' is a constant, not an address"); continue; }
            if (!s.defined || !t.defined) continue;
            if (s.section != t.section) { error("labels in different sections cannot be subtracted"); continue; }
            long long d = s.value - t.value;
            for (int i = 0; i < f.width; i++)
                d += (long long)sec.bytes[f.at + i] << (8 * i);
            long long lo = f.width == 8 ? 0 : -(1LL << (f.width * 8 - 1));
            long long hi = f.width == 8 ? 0 : (1LL << (f.width * 8)) - 1;
            if (f.width != 8 && (d < lo || d > hi)) { error("label difference does not fit"); continue; }
            for (int i = 0; i < f.width; i++)
                sec.bytes[f.at + i] = (unsigned char)((unsigned long long)d >> (8 * i));
            continue;
        }
        if (f.kind == R_REL32 && s.defined && s.section == f.section) {
            long a = read32(sec.bytes, f.at);
            write32(sec.bytes, f.at, (long)(s.value + a - (long long)(f.at + 4)));
            continue;
        }
        Reloc r;
        r.offset = f.at;
        r.symbol = f.symbol;
        r.kind = f.kind;
        sec.relocs.push_back(r);
    }
}
