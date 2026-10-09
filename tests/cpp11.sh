#!/bin/sh
# cpp11's own output as this assembler's input (review V6, 2026-10-08): four programs with
# exception tables, throw records, RTTI and COMDAT data, written by cpp11 -S -arch x86_64-windows
# in its two MASM dialects. Nothing but python3 is needed, so this runs on all three machines.
#   <case>.ml64.asm   -masm=ml64, no COMDAT: assembled here, its code bytes compared with
#                     <case>.ml.code - ml64 14.44's bytes for the same file (tests/windows/cpp11.cmd)
#   <case>.asm        -masm=masm, COMDAT and ASSOCIATIVE: assembled here, and its object must
#                     carry COMDAT sections; the box links and runs it (tests/windows/cpp11.cmd)
#
#   ASM=build/asm sh tests/cpp11.sh
cd "$(dirname "$0")/.." || exit 1
ASM=${ASM:-build/asm}
T=${T:-build/test/cpp11}
mkdir -p "$T"
fail=0; n=0
for f in tests/cpp11/*.ml64.asm; do
    b=$(basename "$f" .ml64.asm)
    n=$((n + 1))
    if ! "$ASM" -t x64 "$f" -o "$T/$b.ml64.obj" > "$T/$b.ml64.err" 2>&1; then
        echo "REFUSED $b.ml64: $(head -1 "$T/$b.ml64.err")"; fail=1; continue
    fi
    python3 tests/coffcode.py "$T/$b.ml64.obj" | tr -d '\r' > "$T/$b.mine"
    tr -d '\r' < "tests/cpp11/$b.ml.code" | cmp -s "$T/$b.mine" - || { echo "DIFFER $b: the code of its ml64 dialect is not ml64's"; fail=1; }
    if ! "$ASM" -t x64 "tests/cpp11/$b.asm" -o "$T/$b.obj" > "$T/$b.err" 2>&1; then
        echo "REFUSED $b: $(head -1 "$T/$b.err")"; fail=1; continue
    fi
    python3 tests/coffcode.py --comdat "$T/$b.obj" | grep -q '^comdat [1-9]' || { echo "NO-COMDAT $b"; fail=1; }
done
echo "cpp11.sh: $n cpp11 programs, $([ $fail = 0 ] && echo 'every one assembled, code identical to ml64' || echo FAILED)"
exit $fail
