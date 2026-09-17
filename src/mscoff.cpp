#include "mscoff.h"
#include <fstream>

typedef std::vector<unsigned char> Bytes;

static void u8(Bytes &b, unsigned v) { b.push_back((unsigned char)v); }
static void u16(Bytes &b, unsigned v) { u8(b, v & 0xFF); u8(b, (v >> 8) & 0xFF); }
static void u32(Bytes &b, unsigned long v) { u16(b, v & 0xFFFF); u16(b, (v >> 16) & 0xFFFF); }

static void set32(Bytes &b, size_t at, unsigned long v)
{
    for (int i = 0; i < 4; i++)
        b[at + i] = (unsigned char)(v >> (8 * i));
}

static void name8(Bytes &b, const std::string &name, Bytes &strings)
{
    if (name.size() <= 8) {
        for (size_t i = 0; i < 8; i++)
            u8(b, i < name.size() ? (unsigned char)name[i] : 0);
        return;
    }
    u32(b, 0);
    u32(b, (unsigned long)(strings.size() + 4));
    for (size_t i = 0; i < name.size(); i++)
        u8(strings, (unsigned char)name[i]);
    u8(strings, 0);
}

static unsigned reloc_type(RelKind k)
{
    if (k == R_ADDR64) return 0x0001;
    if (k == R_ADDR32) return 0x0002;
    return 0x0004;
}

bool CoffWriter::write(const Unit &u, const std::string &path, std::string &err)
{
    const size_t nsec = u.sections.size();
    std::vector<long> index(u.symbols.size(), -1);
    long count = (long)nsec * 2;
    for (size_t i = 0; i < u.symbols.size(); i++) {
        const Symbol &s = u.symbols[i];
        if (s.bind == B_CONST || (!s.defined && s.bind != B_EXTERN))
            continue;
        index[i] = count++;
    }

    Bytes out;
    Bytes strings;
    u16(out, 0x8664);
    u16(out, (unsigned)nsec);
    u32(out, 0);
    size_t symptr_at = out.size();
    u32(out, 0);
    u32(out, (unsigned long)count);
    u16(out, 0);
    u16(out, 0);

    std::vector<size_t> header_at(nsec);
    for (size_t i = 0; i < nsec; i++) {
        const Section &s = u.sections[i];
        header_at[i] = out.size();
        name8(out, s.name, strings);
        u32(out, 0);
        u32(out, 0);
        u32(out, (unsigned long)s.bytes.size());
        u32(out, 0);
        u32(out, 0);
        u32(out, 0);
        u16(out, (unsigned)s.relocs.size());
        u16(out, 0);
        u32(out, s.code ? 0x60500020UL : 0xC0500040UL);
    }

    for (size_t i = 0; i < nsec; i++) {
        const Section &s = u.sections[i];
        if (s.relocs.size() > 0xFFFF) {
            err = "too many relocations in " + s.name;
            return false;
        }
        if (!s.bytes.empty()) {
            set32(out, header_at[i] + 20, (unsigned long)out.size());
            out.insert(out.end(), s.bytes.begin(), s.bytes.end());
        }
        if (!s.relocs.empty()) {
            set32(out, header_at[i] + 24, (unsigned long)out.size());
            for (size_t r = 0; r < s.relocs.size(); r++) {
                u32(out, s.relocs[r].offset);
                u32(out, (unsigned long)index[s.relocs[r].symbol]);
                u16(out, reloc_type(s.relocs[r].kind));
            }
        }
    }

    set32(out, symptr_at, (unsigned long)out.size());
    for (size_t i = 0; i < nsec; i++) {
        const Section &s = u.sections[i];
        name8(out, s.name, strings);
        u32(out, 0);
        u16(out, (unsigned)(i + 1));
        u16(out, 0);
        u8(out, 3);
        u8(out, 1);
        u32(out, (unsigned long)s.bytes.size());
        u16(out, (unsigned)s.relocs.size());
        u16(out, 0);
        u32(out, 0);
        u16(out, 0);
        u8(out, 0);
        u8(out, 0);
        u16(out, 0);
    }
    for (size_t i = 0; i < u.symbols.size(); i++) {
        if (index[i] < 0)
            continue;
        const Symbol &s = u.symbols[i];
        name8(out, s.name, strings);
        u32(out, s.defined ? (unsigned long)s.value : 0);
        u16(out, s.defined ? (unsigned)(s.section + 1) : 0);
        u16(out, s.function ? 0x20 : 0);
        u8(out, s.bind == B_LOCAL ? 3 : 2);
        u8(out, 0);
    }
    u32(out, (unsigned long)(strings.size() + 4));
    out.insert(out.end(), strings.begin(), strings.end());

    std::ofstream f(path.c_str(), std::ios::binary);
    if (!f) {
        err = "cannot create " + path;
        return false;
    }
    f.write((const char *)&out[0], (std::streamsize)out.size());
    if (!f) {
        err = "cannot write " + path;
        return false;
    }
    return true;
}
