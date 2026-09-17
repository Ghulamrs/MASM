#ifndef ASM_H
#define ASM_H

#include <string>
#include <vector>

enum TokKind { T_NAME, T_NUM, T_STR, T_PUNCT };

struct Token {
    TokKind kind;
    std::string text;
    long long value;
    bool wide;      /* a number of 2^32 or more: MOV r64 takes the 64-bit immediate for it, as ml64 */
};

enum RelKind { R_REL32, R_ADDR64, R_ADDR32, R_ADDR32NB, R_DIFF };

struct Reloc {
    unsigned long offset;
    int symbol;
    RelKind kind;
};

struct Section {
    std::string name;
    bool code;          /* executable; instructions allowed */
    bool bss;           /* uninitialised: size only, no bytes in the object */
    bool readonly;
    bool info;          /* linker directives (.drectve): not loaded */
    int align;          /* 1, 2, 4, ... 8192 */
    std::vector<unsigned char> bytes;
    std::vector<Reloc> relocs;
};

enum SymBind { B_LOCAL, B_GLOBAL, B_EXTERN, B_CONST };

struct Symbol {
    std::string name;
    SymBind bind;
    bool defined;
    bool function;
    int section;
    long long value;
    int line;
};

struct Fixup {
    int section;
    unsigned long at;
    int symbol;
    int sub;        /* R_DIFF: the label subtracted */
    int width;      /* R_DIFF: bytes to write */
    RelKind kind;
    int line;
};

/* the value of an expression: a constant, or an address (a symbol plus a constant, a symbol
   difference until both are defined, or $ as a section offset), with the ml64 modifiers */
struct Value {
    long long v;
    int sym;        /* a label added, or -1 */
    int sub;        /* a label subtracted, or -1 */
    int sec;        /* the section of $, or -1 */
    bool imagerel;  /* IMAGEREL label */
    bool offset;    /* OFFSET label */
    bool wide;      /* a literal of 2^32 or more took part */
};

class Unit {
public:
    Unit();

    int line;
    int current;
    std::vector<Section> sections;
    std::vector<Symbol> symbols;
    std::vector<Fixup> fixups;
    std::vector<std::string> errors;

    void error(const std::string &msg);
    int section(const std::string &name, bool code, bool bss, bool readonly, int align);
    Section *cur();
    unsigned long here();

    int find(const std::string &name) const;
    int ref(const std::string &name);
    int location(int sec, long long off);
    bool define(const std::string &name);
    bool constant(const std::string &name, long long v);

    void emit8(unsigned v);
    void emit16(unsigned v);
    void emit32(unsigned long v);
    void emit64(unsigned long long v);
    void fixup(unsigned long at, int sym, RelKind kind);
    void difference(unsigned long at, int sym, int sub, int width);

    void resolve();
};

bool split_line(const std::string &src, std::vector<Token> &out, std::string &err);
std::string upper(const std::string &s);
bool is_punct(const std::vector<Token> &t, size_t i, char c);
bool eval(Unit &u, const std::vector<Token> &t, size_t from, size_t to, Value &v, std::string &err);
bool eval_const(Unit &u, const std::vector<Token> &t, size_t from, size_t to, long long &v, std::string &err);
bool located(const Unit &u, const Value &x, int &sec, long long &off);

class Target {
public:
    virtual ~Target() {}
    virtual void statement(Unit &u, std::vector<Token> &t) = 0;
    virtual bool finished() const = 0;
};

class ObjWriter {
public:
    virtual ~ObjWriter() {}
    virtual bool write(const Unit &u, const std::string &path, std::string &err) = 0;
};

class Assembler {
public:
    Assembler(const std::string &input, const std::string &output, Target *t, ObjWriter *w);
    ~Assembler();
    bool run();
    const std::vector<std::string> &errors() const;

private:
    std::string input;
    std::string output;
    Target *target;
    ObjWriter *writer;
    Unit unit;

    Assembler(const Assembler &);
    Assembler &operator=(const Assembler &);
};

#endif
