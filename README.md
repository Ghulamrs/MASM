# Assembler

A class-based, thread-safe assembler in C-style ISO C++14.
Stage 1: x86-64, MASM-compatible subset, Microsoft COFF `.obj` output.

## Layout

```
src/asm.h            shared structs, Unit, Target, ObjWriter, Assembler
src/lexer.cpp        source line -> tokens
src/expr.cpp         constant expressions
src/unit.cpp         sections, symbols, emission, fixup resolution
src/assembler.cpp    one job: read, assemble, resolve, write
src/x64.h            X64Target
src/x64_parse.cpp    MASM directives, data, operands
src/x64_encode.cpp   x86-64 instruction encoding
src/mscoff.h/.cpp    Microsoft COFF writer
src/main.cpp         command line, one thread per input file
tests/               regression tests (tests/run.sh)
```

Still to come: `c6x_parse.cpp`, `c6x_encode.cpp` (C6000 target) and `elf.cpp` (TI EABI writer).

## Build

Mac / Linux:

```
mkdir -p build && g++ -std=c++14 -O2 -pthread src/*.cpp -o build/asm
```

Visual Studio 2022: open the folder (CMakeLists.txt), or add `src/*.cpp` to a console project with C++14 selected.

## Use

```
asm -t x64 file.asm -o file.obj
asm -t x64 a.asm b.asm c.asm      each file on its own thread, a.obj b.obj c.obj
```

## Thread safety

Each `Assembler` owns its `Unit`, target and writer. No mutable globals or statics;
register and opcode tables are `const`. Errors are stored per job and printed after all threads join.

## Accepted in this version

Directives: `.CODE`, `.DATA`, `.CONST` (`.rdata`, read-only), `.DATA?` (`.bss`, uninitialised: `?` and `DUP (?)` only), `name SEGMENT [READONLY] [ALIGN(n)] ['CODE'|'DATA'] ... name ENDS` (blocks
nest inside `.CODE`/`.DATA`; `_TEXT`, `_DATA`, `CONST` and `_BSS` name the sections the dotted directives
open; the object carries ml64's characteristics: code `60000020`, data `C0000040`, READONLY `40000040`,
uninitialised `C0000080`, plus the alignment field), `END`, `PUBLIC`, `EXTERN`/`EXTRN` (`name:PROC`, `name:QWORD`),
`OPTION DOTNAME | NOSCOPED | PROC:PRIVATE | NOKEYWORD:<...> | CASEMAP:NONE | PROLOGUE:NONE | EPILOGUE:NONE`
(PROC:PRIVATE makes PROCs Static unless PUBLIC, as ml64; the others name what happens anyway),
`INCLUDELIB name` (a `.drectve` section with `/DEFAULTLIB:name`, as ml64 writes it), `TITLE`/`SUBTITLE`/`.LIST`
and the like (ignored), `name PROC [PUBLIC|PRIVATE] [FRAME]` with `.PUSHREG`, `.ALLOCSTACK`, `.SETFRAME`,
`.SAVEREG`, `.SAVEXMM128`, `.PUSHFRAME` and `.ENDPROLOG` (the UNWIND_INFO goes to `.xdata` and the
RUNTIME_FUNCTION to `.pdata`, relocated against the PROC and one Static `$xdatasym` exactly as ml64 writes them),
`name PROC` / `name ENDP`, `name EQU expr`, `ALIGN n` (a power of two up to the section's alignment, as ml64's A2189 requires), `ORG $+n`, `DB DW DD DQ REAL4 REAL8` with strings (a doubled quote is one quote, `DW 'ab'` the constant 6162h), reals (`DQ 1.5`, `DD -2.5`, stored as their float or double bits), `?`, `n DUP (x)`,
`COMM name:type[:count]` (an external the linker allocates, its size in the symbol's value) and `EXTERNDEF name:type` (public if the file defines it, extern if it only uses it),
labels as `DD`/`DQ` values (`DQ v+8` keeps the addend in place, as COFF does), `DD IMAGEREL label`
(ADDR32NB), and label differences `DB L2-L1` (folded when both are known, written at the end otherwise).

Instructions: `MOV MOVZX MOVSX MOVSXD ADD OR ADC SBB AND SUB XOR CMP TEST LEA IMUL` (one, two or three operands) `MUL DIV IDIV NEG NOT INC DEC
SHL SAL SHR SAR ROL ROR RCL RCR` (by a constant or by `CL`) `PUSH POP CALL JMP Jcc SETcc CMOVcc RET NOP CQO CDQ CDQE CWDE CWD CBW LEAVE INT`,
`XCHG CMPXCHG XADD BT BTS BTR BTC BSF BSR POPCNT LZCNT TZCNT`, `LOCK` and `REP`/`REPE`/`REPNE` prefixes, the string ops
`MOVSB..MOVSQ STOSB..STOSQ LODSB..LODSQ SCASB..SCASQ CMPSB..CMPSQ`, `CLD STD CLC STC CMC HLT PAUSE UD2 SYSCALL CPUID RDTSC
PUSHFQ POPFQ LFENCE MFENCE SFENCE`; SSE scalar and
128-bit: `MOVSD MOVSS ADDSD SUBSD MULSD DIVSD SQRTSD MINSD MAXSD` (and the `SS` forms), `UCOMISD COMISD
UCOMISS COMISS CVTSS2SD CVTSD2SS CVTSI2SD CVTSI2SS CVTTSD2SI CVTSD2SI CVTTSS2SI CVTSS2SI PXOR XORPD XORPS
ANDPD ANDPS ANDNPD ANDNPS ORPD ORPS PADDQ PSUBQ PAND POR PANDN MOVAPD MOVAPS MOVUPD MOVUPS MOVDQA MOVDQU
MOVQ MOVD` with `xmm0`-`xmm15` and `XMMWORD PTR`.

Operands: 64/32/16/8-bit and XMM registers (`ah`-`bh` never with a REX prefix, as ml64 rules), constants,
`BYTE`/`WORD`/`DWORD`/`QWORD PTR`, `[base + index*scale + disp]` also spelled `disp[base]` or `[base][index]`,
labels (RIP-relative; an immediate after the displacement makes the relocation `REL32_n`, as ml64 writes
it) bare or in brackets - a bare data label carries its declared width (`mov v, 5`
with `v DD 0` is a dword store) and `EXTERN name:QWORD` its type, so `call`/`jmp` through such a label is
`FF /2`/`FF /4` and `mov r64, [code_label]` is the label's address, as ml64 reads them - `label[reg*scale]` and `[reg+label]` (an absolute ADDR32
displacement, as ml64 makes them), `OFFSET label` into a 64-bit register, and character constants
(`'ab'` is 6162h). Expressions take `+ - * / MOD SHL SHR AND OR XOR NOT EQ NE LT LE GT GE LOW HIGH` at MASM's
levels (a true comparison is -1), parentheses, unary `+`/`-`, `$` and labels; numbers are decimal or
carry MASM's radix letter - `H`, `B`/`Y`, `O`/`Q`, `T`/`D`.

Notes:
- Symbols are case-sensitive (ml64 with `OPTION CASEMAP:NONE`); keywords are not.
- Labels are file-scoped, as under `OPTION NOSCOPED`: `name::` is taken and means the same as `name:`, and
  `@@:` is an anonymous label that `@B` (the nearest back) and `@F` (the next forward) reach across PROCs,
  where ml64 stops at the PROC's end.
- Expressions are evaluated with explicit stacks, so nesting is limited by memory, not the thread's stack;
  a number of 2^64 or more is refused (ml64's A2071).
- `PROC` names are public, as in MASM, unless `OPTION PROC:PRIVATE` or `name PROC PRIVATE` says otherwise.
- The source is assembled in passes until the layout settles: a jump to a label in reach takes the
  8-bit form (`SHORT` forces it, `NEAR PTR` the 32-bit form), a forward `EQU` or label type is known on
  the second pass, and a jump only ever widens, so the passes end. A `CALL`/`JMP`/`Jcc` to its own section
  is settled in the object; any other RIP-relative reference is a relocation, as ml64 leaves it.

## Checking against ml64 on Windows

```
ml64 /c /Fo ref.obj tests\basic.asm
asm -t x64 tests\basic.asm -o mine.obj
dumpbin /disasm /relocations ref.obj > ref.txt
dumpbin /disasm /relocations mine.obj > mine.txt
fc ref.txt mine.txt
```

Encodings are ml64's byte for byte, where ml64 has a choice: `test a, b` puts the first operand in
the reg field (`48 85 C1`), `mov r64, imm` takes the 64-bit form when the literal was spelled as one
(`0FFFFFFFFFFFFFFFFh` or a decimal of 2^32 or more) and the sign-extended 32-bit form otherwise,
`[reg*1]` with no base stays an index (a SIB with no base), `RET 0` is `C3`, and `ALIGN` in code pads
with one long NOP (`0F 1F /0` with `66` prefixes, up to 15 bytes). The object is ml64's too: `.text$mn`
and then `.data` are opened before the first line and every other section numbered by first use; an
extern carries no type; a label in a code section is class Label, a data name or a private `PROC`
Static; and a Static symbol is written only when a relocation refers to it (a `PROC` always). The
681 `.asm` files the compilers emit for x86_64-windows assemble to ml64's bytes, relocations and
symbols, every file. What ml64 adds and this does not: `@comp.id`, `@feat.00`, `.debug$S`, a timestamp.

## Next

1. Study the Compiler-C / Compiler-S / C++ / Compiler++ generators and their `.asm` output; extend the subset to match.
2. C6000 target and TI ELF writer.
