#include "x64.h"
#include <cstdlib>

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
    {"XMM0", 0, 128, 0}, {"XMM1", 1, 128, 0}, {"XMM2", 2, 128, 0}, {"XMM3", 3, 128, 0},
    {"XMM4", 4, 128, 0}, {"XMM5", 5, 128, 0}, {"XMM6", 6, 128, 0}, {"XMM7", 7, 128, 0},
    {"XMM8", 8, 128, 0}, {"XMM9", 9, 128, 0}, {"XMM10", 10, 128, 0}, {"XMM11", 11, 128, 0},
    {"XMM12", 12, 128, 0}, {"XMM13", 13, 128, 0}, {"XMM14", 14, 128, 0}, {"XMM15", 15, 128, 0},
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
    if (is_word(t, i, "XMMWORD")) return 128;
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

X64Target::X64Target() : done(false), proc(-1), proc_private(false), frame(false), frame_start(0),
    frame_reg(0), frame_off(0), prolog_end(-1), xdatasym(-1)
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

    if (w == ".CODE" || w == ".DATA" || w == ".CONST" || w == ".DATA?") {
        /* the simplified segments: .text$mn, .data, .rdata (read-only) and .bss (uninitialised),
           all 16-aligned, as ml64 names and flags them */
        if (t.size() != 1) u.error("unexpected text after " + w);
        if (proc >= 0) u.error("section change inside PROC");
        if (!segs.empty()) u.error("SEGMENT without ENDS");
        if (w == ".CODE") u.section(".text", true, false, false, 16);
        else if (w == ".DATA") u.section(".data", false, false, false, 16);
        else if (w == ".CONST") u.section(".rdata", false, false, true, 16);
        else u.section(".bss", false, true, false, 16);
        return true;
    }
    if (w == "END") {
        if (proc >= 0) u.error("PROC without ENDP");
        if (!segs.empty()) u.error("SEGMENT without ENDS");
        if (!directives.empty()) {
            /* ml64 writes INCLUDELIB as a .drectve section after everything else */
            int i = u.section(".drectve", false, false, false, 1);
            u.sections[i].info = true;
            for (size_t k = 0; k < directives.size(); k++)
                u.emit8((unsigned char)directives[k]);
        }
        done = true;
        return true;
    }
    if (w == "OPTION") {
        option(u, t);
        return true;
    }
    if (w == ".PUSHREG" || w == ".ALLOCSTACK" || w == ".SETFRAME" || w == ".SAVEREG" ||
        w == ".SAVEXMM128" || w == ".PUSHFRAME" || w == ".ENDPROLOG") {
        unwind(u, t, w);
        return true;
    }
    if (w == "INCLUDELIB") {
        if (t.size() != 2 || t[1].kind != T_NAME) u.error("INCLUDELIB needs a library name");
        else directives += "/DEFAULTLIB:" + t[1].text + " ";
        return true;
    }
    if (w == "TITLE" || w == "SUBTITLE" || w == "SUBTTL" || w == "PAGE" ||
        w == ".LIST" || w == ".NOLIST" || w == ".XLIST" || w == ".LISTALL" || w == ".LISTIF" || w == ".NOLISTIF") {
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
        if (!eval_const(u, t, 1, t.size(), n, err)) { u.error(err); return true; }
        if (n <= 0 || n > 4096 || (n & (n - 1))) { u.error("ALIGN needs a power of two"); return true; }
        Section *s = u.cur();
        if (!s) return true;
        while (u.here() % (unsigned long)n)
            u.emit8(s->code ? 0x90 : 0);
        return true;
    }
    if (w == "ORG") {
        /* ORG $+n: skip forward, the gap zero-filled as ml64 leaves it */
        Value v;
        std::string err;
        int sec;
        long long off;
        Section *s = u.cur();
        if (!s) return true;
        if (!eval(u, t, 1, t.size(), v, err)) { u.error(err); return true; }
        if (!located(u, v, sec, off) || sec != u.current) { u.error("ORG needs a location in the current section"); return true; }
        if (off < (long long)u.here()) { u.error("ORG cannot move backwards in this version"); return true; }
        while ((long long)u.here() < off)
            u.emit8(0);
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
    if (w2 == "SEGMENT") {
        segment(u, t);
        return true;
    }
    if (w2 == "ENDS") {
        if (t.size() != 2) u.error("unexpected text after ENDS");
        else if (segs.empty()) u.error("ENDS without SEGMENT");
        else if (segnames.back() != t[0].text) u.error("ENDS does not match SEGMENT " + segnames.back());
        else {
            if (proc >= 0) u.error("PROC without ENDP");
            u.current = segs.back();
            segs.pop_back();
            segnames.pop_back();
        }
        return true;
    }
    if (w2 == "PROC") {
        if (proc >= 0) { u.error("nested PROC"); return true; }
        int global = proc_private ? 0 : 1;
        bool is_frame = false;
        for (size_t k = 2; k < t.size(); k++) {
            if (is_word(t, k, "PUBLIC")) global = 1;
            else if (is_word(t, k, "PRIVATE")) global = 0;
            else if (is_word(t, k, "FRAME") && k + 1 == t.size()) is_frame = true;
            else if (is_word(t, k, "FRAME")) { u.error("PROC FRAME:handler is not supported in this version"); return true; }
            else { u.error("PROC attributes are not supported in this version"); return true; }
        }
        Section *s = u.cur();
        if (!s) return true;
        if (!s->code) { u.error("PROC outside a code section"); return true; }
        if (is_frame) {
            /* ml64 opens .pdata and .xdata at the first PROC FRAME, in that order */
            int save = u.current;
            u.section(".pdata", false, false, true, 4);
            u.section(".xdata", false, false, true, 8);
            u.current = save;
        }
        if (!u.define(t[0].text)) return true;
        proc = u.find(t[0].text);
        u.symbols[proc].function = true;
        if (global) u.symbols[proc].bind = B_GLOBAL;
        frame = is_frame;
        frame_start = u.here();
        frame_reg = 0;
        frame_off = 0;
        prolog_end = -1;
        codes.clear();
        return true;
    }
    if (w2 == "ENDP") {
        if (proc < 0 || u.symbols[proc].name != t[0].text)
            u.error("ENDP does not match PROC");
        else if (frame)
            end_frame(u);
        proc = -1;
        frame = false;
        return true;
    }
    if (w2 == "EQU") {
        long long v;
        std::string err;
        if (!eval_const(u, t, 2, t.size(), v, err)) u.error(err);
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

/* OPTION name[:value], ...: the ones the compilers write are taken; DOTNAME and NOSCOPED describe
   what this assembler does anyway (dotted names are lexed, labels are file-scoped) */
void X64Target::option(Unit &u, const std::vector<Token> &t)
{
    size_t k = 1;
    while (k < t.size()) {
        if (t[k].kind != T_NAME) { u.error("OPTION name expected"); return; }
        std::string name = upper(t[k].text);
        k++;
        std::string value;
        if (is_punct(t, k, ':')) {
            k++;
            if (is_punct(t, k, '<')) {
                /* NOKEYWORD:<name name> - a text in angle brackets */
                k++;
                while (k < t.size() && !is_punct(t, k, '>')) k++;
                if (k >= t.size()) { u.error("'>' expected"); return; }
                value = "<>";
                k++;
            } else if (k < t.size() && t[k].kind == T_NAME) {
                value = upper(t[k].text);
                k++;
            } else { u.error("OPTION value expected after ':'"); return; }
        }
        if (name == "DOTNAME" || name == "NODOTNAME" || name == "NOSCOPED" || name == "SCOPED" ||
            name == "LJMP" || name == "NOLJMP" || name == "EMULATOR" || name == "NOEMULATOR") {
            if (!value.empty()) { u.error("OPTION " + name + " takes no value"); return; }
        } else if (name == "PROC") {
            if (value == "PRIVATE") proc_private = true;
            else if (value == "PUBLIC" || value == "EXPORT") proc_private = false;
            else { u.error("OPTION PROC needs PRIVATE, PUBLIC or EXPORT"); return; }
        } else if (name == "NOKEYWORD") {
            if (value != "<>") { u.error("OPTION NOKEYWORD needs <names>"); return; }
        } else if (name == "CASEMAP") {
            if (value != "NONE" && value != "NOTPUBLIC" && value != "ALL") { u.error("OPTION CASEMAP needs NONE, NOTPUBLIC or ALL"); return; }
        } else if (name == "PROLOGUE" || name == "EPILOGUE") {
            if (value != "NONE") { u.error("OPTION " + name + " takes only NONE in this version"); return; }
        } else if (name == "LANGUAGE") {
            if (value.empty()) { u.error("OPTION LANGUAGE needs a value"); return; }
        } else {
            u.error("OPTION " + name + " is not supported in this version");
            return;
        }
        if (k < t.size()) {
            if (!is_punct(t, k, ',')) { u.error("',' expected"); return; }
            k++;
        }
    }
}

static void slot16(std::vector<unsigned char> &e, unsigned long v)
{
    e.push_back((unsigned char)(v & 0xFF));
    e.push_back((unsigned char)((v >> 8) & 0xFF));
}

/* the unwind directives of a PROC FRAME: each becomes an UNWIND_CODE at the prologue offset
   reached so far, with ml64's operation numbers and large forms */
void X64Target::unwind(Unit &u, const std::vector<Token> &t, const std::string &w)
{
    if (proc < 0 || !frame) { u.error(w + " needs a PROC FRAME"); return; }
    if (prolog_end >= 0) { u.error(w + " after .ENDPROLOG"); return; }
    unsigned long off = u.here() - frame_start;
    if (off > 255) { u.error("prologue longer than 255 bytes"); return; }
    if (w == ".ENDPROLOG") {
        if (t.size() != 1) { u.error("unexpected text after .ENDPROLOG"); return; }
        prolog_end = (int)off;
        return;
    }
    std::vector<unsigned char> e;
    e.push_back((unsigned char)off);
    std::string err;
    long long n = 0;
    const RegName *r = t.size() > 1 ? find_reg(t[1]) : 0;
    if (w == ".PUSHFRAME") {
        bool code = t.size() == 2 && is_word(t, 1, "CODE");
        if (t.size() != 1 && !code) { u.error(".PUSHFRAME takes only CODE"); return; }
        e.push_back((unsigned char)(10 | (code ? 0x10 : 0)));
    } else if (w == ".ALLOCSTACK") {
        if (!eval_const(u, t, 1, t.size(), n, err)) { u.error(err); return; }
        if (n <= 0 || n % 8) { u.error(".ALLOCSTACK needs a positive multiple of 8"); return; }
        if (n <= 128) {
            e.push_back((unsigned char)(2 | ((n / 8 - 1) << 4)));
        } else if (n / 8 <= 0xFFFF) {
            e.push_back(1);
            slot16(e, (unsigned long)(n / 8));
        } else {
            e.push_back(1 | 0x10);
            slot16(e, (unsigned long)n & 0xFFFF);
            slot16(e, ((unsigned long)n >> 16) & 0xFFFF);
        }
    } else if (w == ".PUSHREG") {
        if (t.size() != 2 || !r || r->size != 64) { u.error(".PUSHREG needs a 64-bit register"); return; }
        e.push_back((unsigned char)(r->num << 4));
    } else if (w == ".SETFRAME") {
        if (t.size() < 4 || !r || r->size != 64 || !is_punct(t, 2, ',')) { u.error(".SETFRAME needs a 64-bit register and an offset"); return; }
        if (!eval_const(u, t, 3, t.size(), n, err)) { u.error(err); return; }
        if (n < 0 || n > 240 || n % 16) { u.error(".SETFRAME offset must be a multiple of 16 up to 240"); return; }
        e.push_back((unsigned char)(3 | (r->num << 4)));
        frame_reg = r->num;
        frame_off = (int)(n / 16);
    } else if (w == ".SAVEREG" || w == ".SAVEXMM128") {
        bool xmm = w == ".SAVEXMM128";
        int num = -1;
        if (t.size() > 1 && xmm) {
            std::string x = upper(t[1].text);
            if (x.size() > 3 && x.compare(0, 3, "XMM") == 0) num = atoi(x.c_str() + 3);
            if (num < 0 || num > 15) num = -1;
        } else if (r && r->size == 64) {
            num = r->num;
        }
        if (t.size() < 4 || num < 0 || !is_punct(t, 2, ',')) { u.error(w + " needs a register and an offset"); return; }
        if (!eval_const(u, t, 3, t.size(), n, err)) { u.error(err); return; }
        int unit = xmm ? 16 : 8;
        if (n < 0 || n % unit) { u.error(w + " offset must be a multiple of " + (xmm ? "16" : "8")); return; }
        if (n / unit <= 0xFFFF) {
            e.push_back((unsigned char)((xmm ? 8 : 4) | (num << 4)));
            slot16(e, (unsigned long)(n / unit));
        } else {
            e.push_back((unsigned char)((xmm ? 9 : 5) | (num << 4)));
            slot16(e, (unsigned long)n & 0xFFFF);
            slot16(e, ((unsigned long)n >> 16) & 0xFFFF);
        }
    }
    codes.push_back(e);
}

/* ENDP of a PROC FRAME: the UNWIND_INFO into .xdata (version 1, codes last-first, padded to an
   even count) and the RUNTIME_FUNCTION into .pdata, relocated as ml64 does: ADDR32NB on the PROC
   for start and end (the size in place) and on $xdatasym with the entry's offset in place */
void X64Target::end_frame(Unit &u)
{
    if (prolog_end < 0) { u.error("PROC FRAME without .ENDPROLOG"); return; }
    unsigned long size = u.here() - frame_start;
    std::vector<unsigned char> x;
    unsigned count = 0;
    for (size_t i = 0; i < codes.size(); i++)
        count += (unsigned)codes[i].size() / 2;
    if (count > 255) { u.error("too many unwind codes"); return; }
    x.push_back(1);
    x.push_back((unsigned char)prolog_end);
    x.push_back((unsigned char)count);
    x.push_back((unsigned char)(frame_reg | (frame_off << 4)));
    for (size_t i = codes.size(); i-- > 0; )
        x.insert(x.end(), codes[i].begin(), codes[i].end());
    if (count & 1) { x.push_back(0); x.push_back(0); }

    int save = u.current;
    u.section(".xdata", false, false, true, 8);
    unsigned long xoff = u.here();
    if (xdatasym < 0) {
        if (!u.define("$xdatasym")) { u.current = save; return; }
        xdatasym = u.find("$xdatasym");
    }
    for (size_t i = 0; i < x.size(); i++)
        u.emit8(x[i]);
    u.section(".pdata", false, false, true, 4);
    u.fixup(u.here(), proc, R_ADDR32NB);
    u.emit32(0);
    u.fixup(u.here(), proc, R_ADDR32NB);
    u.emit32(size);
    u.fixup(u.here(), xdatasym, R_ADDR32NB);
    u.emit32(xoff - (unsigned long)u.symbols[xdatasym].value);
    u.current = save;
}

/* name SEGMENT [READONLY] [ALIGN(n)] ['CODE'|'DATA'] ... name ENDS; blocks nest, and the classic
   _TEXT, _DATA, CONST and _BSS are the sections .CODE, .DATA, .CONST and .DATA? open */
void X64Target::segment(Unit &u, const std::vector<Token> &t)
{
    std::string name = t[0].text;
    std::string up = upper(name);
    bool code = false;
    bool bss = false;
    bool readonly = false;
    int align = 16;
    if (up == "_TEXT") { name = ".text"; code = true; }
    else if (up == "_DATA") name = ".data";
    else if (up == "CONST") { name = ".rdata"; readonly = true; }
    else if (up == "_BSS") { name = ".bss"; bss = true; }
    size_t k = 2;
    while (k < t.size()) {
        if (is_word(t, k, "READONLY")) { readonly = true; k++; }
        else if (is_word(t, k, "ALIGN") && is_punct(t, k + 1, '(') && k + 3 < t.size() &&
                 t[k + 2].kind == T_NUM && is_punct(t, k + 3, ')')) {
            align = t[k + 2].value > 8192 ? 0 : (int)t[k + 2].value;
            k += 4;
        }
        else if (is_word(t, k, "BYTE")) { align = 1; k++; }
        else if (is_word(t, k, "WORD")) { align = 2; k++; }
        else if (is_word(t, k, "DWORD")) { align = 4; k++; }
        else if (is_word(t, k, "PARA")) { align = 16; k++; }
        else if (is_word(t, k, "PAGE")) { align = 256; k++; }
        else if (t[k].kind == T_STR) {
            std::string cls = upper(t[k].text);
            if (cls == "CODE") code = true;
            else if (cls == "BSS") bss = true;
            else if (cls != "DATA" && cls != "CONST") { u.error("unknown segment class '" + t[k].text + "'"); return; }
            k++;
        }
        else { u.error("bad SEGMENT attribute '" + t[k].text + "'"); return; }
    }
    if (align <= 0 || (align & (align - 1))) { u.error("SEGMENT alignment must be a power of two up to 8192"); return; }
    if (proc >= 0) { u.error("SEGMENT inside PROC"); return; }
    segs.push_back(u.current);
    segnames.push_back(t[0].text);
    u.section(name, code, bss, readonly, align);
}

static size_t dup_at(const std::vector<Token> &t, size_t a, size_t b)
{
    size_t dup = a;
    while (dup < b && !is_word(t, dup, "DUP")) dup++;
    return dup;
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
    Section *sec = u.cur();
    if (!sec)
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
        if (a >= b) {
            u.error("value expected");
            return;
        }
        if (b - a == 1 && t[a].kind == T_NAME && t[a].text == "?") {
            put(u, width, 0);
            continue;
        }
        size_t dup = dup_at(t, a, b);
        if (sec->bss && !(dup < b && dup + 4 == b && t[dup + 2].text == "?")) {
            u.error("initialised data in an uninitialised section");
            return;
        }
        if (width == 1 && b - a == 1 && t[a].kind == T_STR) {
            if (t[a].text.empty()) u.error("empty string");
            for (size_t k = 0; k < t[a].text.size(); k++)
                u.emit8((unsigned char)t[a].text[k]);
            continue;
        }
        if (dup < b) {
            long long count;
            if (!eval_const(u, t, a, dup, count, err)) { u.error(err); return; }
            if (count < 0 || count > 100000000) { u.error("bad DUP count"); return; }
            if (!is_punct(t, dup + 1, '(') || !is_punct(t, b - 1, ')') || dup + 2 >= b - 1) {
                u.error("DUP needs a value in parentheses");
                return;
            }
            long long fill = 0;
            if (!(dup + 4 == b && t[dup + 2].kind == T_NAME && t[dup + 2].text == "?")) {
                if (!eval_const(u, t, dup + 2, b - 1, fill, err)) { u.error(err); return; }
                if (!fits(width, fill)) { u.error("value does not fit"); return; }
            }
            for (long long k = 0; k < count; k++)
                put(u, width, fill);
            continue;
        }
        Value v;
        if (!eval(u, t, a, b, v, err)) { u.error(err); return; }
        if (v.sec >= 0) { u.error("'$' cannot be stored as data in this version"); return; }
        if (v.sym >= 0 && v.sub >= 0) {
            /* a label difference: written once both labels are known */
            u.difference(u.here(), v.sym, v.sub, width);
            put(u, width, v.v);
            continue;
        }
        if (v.sym >= 0) {
            if (v.imagerel && width != 4) { u.error("IMAGEREL needs DD"); return; }
            if (width < 4) { u.error("an address needs DD or DQ"); return; }
            u.fixup(u.here(), v.sym, v.imagerel ? R_ADDR32NB : width == 8 ? R_ADDR64 : R_ADDR32);
            put(u, width, v.v);
            continue;
        }
        if (!fits(width, v.v)) { u.error("value does not fit"); return; }
        put(u, width, v.v);
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
    o.wide = false;

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

    /* bracket groups at depth 0, and the text between them, are all address terms: [rbx+8],
       8[rbx], [rbx][rcx*4], name[rcx] */
    std::vector<size_t> ranges;
    bool bracket = false;
    size_t start = a;
    int depth = 0;
    for (size_t i = a; i < b; ) {
        if (depth == 0 && is_punct(t, i, '[')) {
            if (i > start) { ranges.push_back(start); ranges.push_back(i); }
            size_t j = i + 1;
            int d = 1;
            while (j < b && d) {
                if (is_punct(t, j, '[')) d++;
                else if (is_punct(t, j, ']')) d--;
                if (d) j++;
            }
            if (j >= b) {
                u.error("']' expected");
                return false;
            }
            if (j == i + 1) {
                u.error("empty brackets");
                return false;
            }
            ranges.push_back(i + 1);
            ranges.push_back(j);
            bracket = true;
            i = j + 1;
            start = i;
            continue;
        }
        if (is_punct(t, i, '(')) depth++;
        else if (is_punct(t, i, ')')) depth--;
        i++;
    }
    if (start < b) { ranges.push_back(start); ranges.push_back(b); }
    if (bracket)
        return memory(u, t, ranges, o);

    Value v;
    std::string err;
    if (!eval(u, t, a, b, v, err)) {
        u.error(err);
        return false;
    }
    if (v.sub >= 0) {
        u.error("a label difference needs both labels defined before it");
        return false;
    }
    if (v.offset) {
        o.sym = v.sym;
        o.value = v.v;
        return true;
    }
    if (v.sym >= 0 || v.sec >= 0) {
        o.kind = O_MEM;
        o.sym = v.sec >= 0 ? u.location(v.sec, v.v) : v.sym;
        o.value = v.sec >= 0 ? 0 : v.v;
        o.label = true;
        return true;
    }
    if (o.size) {
        u.error("memory operand expected after PTR");
        return false;
    }
    o.value = v.v;
    o.wide = v.wide;
    return true;
}

/* the address terms: registers with an optional scale, and expressions that may carry one label */
bool X64Target::memory(Unit &u, const std::vector<Token> &t, const std::vector<size_t> &ranges, Operand &o)
{
    o.kind = O_MEM;
    Value acc;
    acc.v = 0; acc.sym = -1; acc.sub = -1; acc.sec = -1; acc.imagerel = false; acc.offset = false; acc.wide = false;
    for (size_t r = 0; r + 1 < ranges.size(); r += 2) {
        size_t a = ranges[r];
        size_t b = ranges[r + 1];
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
            const RegName *r1 = find_reg(t[k]);
            const RegName *r2 = e - k == 3 ? find_reg(t[e - 1]) : 0;
            if (r1 || r2) {
                int num;
                int size;
                int scale = 1;
                if (e - k == 1) {
                    num = r1->num;
                    size = r1->size;
                } else if (e - k == 3 && is_punct(t, k + 1, '*') && (r1 ? t[e - 1].kind == T_NUM : t[k].kind == T_NUM)) {
                    const RegName *q = r1 ? r1 : r2;
                    num = q->num;
                    size = q->size;
                    scale = (int)(r1 ? t[e - 1].value : t[k].value);
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
                    if (num == 4 && scale == 1 && o.base >= 0 && o.base != 4) {
                        /* [rax+rsp]: rsp can only be the base, so the other register indexes */
                        o.index = o.base;
                        o.base = 4;
                    } else if (num == 4) {
                        u.error("RSP cannot be an index");
                        return false;
                    } else {
                        o.index = num;
                        o.scale = scale;
                    }
                } else {
                    u.error("too many registers in address");
                    return false;
                }
            } else {
                Value v;
                std::string err;
                if (!eval(u, t, k, e, v, err)) {
                    u.error(err);
                    return false;
                }
                if (v.imagerel || v.offset || v.sub >= 0) {
                    u.error("bad label term in address");
                    return false;
                }
                bool addr = v.sym >= 0 || v.sec >= 0;
                if (addr && (sign < 0 || acc.sym >= 0 || acc.sec >= 0)) {
                    u.error("bad label term in address");
                    return false;
                }
                if (addr) {
                    acc.sym = v.sym;
                    acc.sec = v.sec;
                }
                acc.v += sign * v.v;
            }
            k = e;
        }
    }
    if (acc.sec >= 0) {
        o.sym = u.location(acc.sec, acc.v);
        acc.v = 0;
    } else {
        o.sym = acc.sym;
    }
    o.label = o.sym >= 0 && o.base < 0 && o.index < 0;
    o.value = acc.v;
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
