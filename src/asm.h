#ifndef ASM_H
#define ASM_H

#include <string>
#include <vector>

enum TokKind { T_NAME, T_NUM, T_STR, T_PUNCT };

struct Token {
    TokKind kind;
    std::string text;
    long long value;
};

enum RelKind { R_REL32, R_ADDR64, R_ADDR32 };

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
    RelKind kind;
    int line;
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
    bool define(const std::string &name);
    bool constant(const std::string &name, long long v);

    void emit8(unsigned v);
    void emit16(unsigned v);
    void emit32(unsigned long v);
    void emit64(unsigned long long v);
    void fixup(unsigned long at, int sym, RelKind kind);

    void resolve();
};

bool split_line(const std::string &src, std::vector<Token> &out, std::string &err);
std::string upper(const std::string &s);
bool is_punct(const std::vector<Token> &t, size_t i, char c);
bool eval(const Unit &u, const std::vector<Token> &t, size_t from, size_t to, long long &v, std::string &err);

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
