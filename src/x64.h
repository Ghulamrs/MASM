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
    bool high;      /* AH, BH, CH or DH: never with a REX prefix */
    bool rexonly;   /* SPL, BPL, SIL or DIL: only with a REX prefix */
    bool wide;      /* an immediate spelled with 2^32 or more (MOV r64 takes the 64-bit form) */
};

struct Code {
    unsigned char b[16];
    int n;
    int disp_at;
    int sym;
    RelKind kind;
    bool rex;       /* a REX prefix is needed even with no bits set */
    bool high;      /* a high byte register is an operand */
    bool bad;       /* both: the combination ml64 refuses (A2218) */
};

class X64Target : public Target {
public:
    X64Target();
    void statement(Unit &u, std::vector<Token> &t);
    bool finished() const;

private:
    bool done;
    int proc;
    std::vector<int> segs;              /* sections enclosing the open SEGMENT blocks */
    std::vector<std::string> segnames;  /* their names as written, for ENDS */

    bool directive(Unit &u, std::vector<Token> &t);
    void segment(Unit &u, const std::vector<Token> &t);
    void data(Unit &u, const std::vector<Token> &t, size_t from, int width);
    bool operand(Unit &u, const std::vector<Token> &t, size_t a, size_t b, Operand &o);
    bool memory(Unit &u, const std::vector<Token> &t, const std::vector<size_t> &ranges, Operand &o);
    void instruction(Unit &u, const std::string &name, std::vector<Operand> &ops);
};

#endif
