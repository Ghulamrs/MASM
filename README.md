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

Directives: `.CODE`, `.DATA`, `END`, `PUBLIC`, `EXTERN`/`EXTRN` (`name:PROC`, `name:QWORD`),
`name PROC` / `name ENDP`, `name EQU expr`, `ALIGN n`, `DB DW DD DQ` with strings, `?`, `n DUP (x)`,
and labels as `DD`/`DQ` values.

Instructions: `MOV MOVZX MOVSX MOVSXD ADD OR ADC SBB AND SUB XOR CMP TEST LEA IMUL MUL DIV IDIV NEG NOT INC DEC
SHL SAL SHR SAR PUSH POP CALL JMP Jcc RET NOP CQO CDQ CDQE LEAVE INT3`.

Operands: 64/32/16/8-bit registers (`ah`-`bh` never with a REX prefix, as ml64 rules), constants,
`BYTE`/`WORD`/`DWORD`/`QWORD PTR`, `[base + index*scale + disp]`,
and labels (RIP-relative), bare or in brackets.

Notes:
- Symbols are case-sensitive; keywords are not.
- `PROC` names are public, as in MASM.
- Relative jumps are always the 32-bit form; short jumps come in stage 2.

## Checking against ml64 on Windows

```
ml64 /c /Fo ref.obj tests\basic.asm
asm -t x64 tests\basic.asm -o mine.obj
dumpbin /disasm /relocations ref.obj > ref.txt
dumpbin /disasm /relocations mine.obj > mine.txt
fc ref.txt mine.txt
```

Encodings were checked byte for byte against GNU `as`, and follow MASM's register-to-register
form (`8B`, `03`, ...). Stage 2 begins with this ml64 comparison.

## Next

1. Study the Compiler-C / Compiler-S / C++ / Compiler++ generators and their `.asm` output; extend the subset to match.
2. Short jumps, SSE (floats), `PROC FRAME` and unwind directives (`.pdata`/`.xdata`).
3. C6000 target and TI ELF writer.
