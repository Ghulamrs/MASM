#ifndef X64_H
#define X64_H

#include "asm.h"

enum OpKind { O_REG, O_IMM, O_MEM };

struct Operand {
    OpKind kind;
    int size;
    int reg;
    int base;
    int index;
    int scale;
    long long value;
    int sym;
    bool label;
};

struct Code {
    unsigned char b[16];
    int n;
    int disp_at;
    int sym;
    RelKind kind;
};

class X64Target : public Target {
public:
    X64Target();
    void statement(Unit &u, std::vector<Token> &t);
    bool finished() const;

private:
    bool done;
    int proc;

    bool directive(Unit &u, std::vector<Token> &t);
    void data(Unit &u, const std::vector<Token> &t, size_t from, int width);
    bool operand(Unit &u, const std::vector<Token> &t, size_t a, size_t b, Operand &o);
    bool memory(Unit &u, const std::vector<Token> &t, size_t a, size_t b, Operand &o);
    void instruction(Unit &u, const std::string &name, std::vector<Operand> &ops);
};

#endif
