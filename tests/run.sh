#!/bin/sh
# The regression tests, on any of the three machines: python3 is the one thing needed. ml64 is the
# oracle throughout - its bytes are checked in under tests/enc - so the GNU as/objdump legs of the
# first version are gone; tests/windows has the checks that need the box (ml64, link, the corpus).
#
#   ASM=build/asm sh tests/run.sh
cd "$(dirname "$0")/.." || exit 1
ASM=${ASM:-build/asm}
T=${T:-build/test}
mkdir -p "$T"
fail=0

# 1. every instruction against ml64, byte for byte
T="$T/enc" ASM="$ASM" sh tests/enc.sh || fail=1

# 2. the messages: what is refused says why, in these words
"$ASM" -t x64 tests/errors.asm -o "$T/errors.obj" 2> "$T/errors.txt"
diff -u tests/expect/errors.txt "$T/errors.txt" || fail=1
for f in tests/refuse/*.asm; do
    b=$(basename "$f" .asm)
    if "$ASM" -t x64 "$f" -o "$T/$b.obj" > "$T/$b.msg" 2>&1; then echo "refuse/$b: assembled, should have been refused"; fail=1; continue; fi
    head -1 "$T/$b.msg" | sed "s|^$f: ||" | diff - "tests/refuse/$b.expect" > /dev/null || { echo "refuse/$b: $(head -1 "$T/$b.msg")"; fail=1; }
done

# 3. a 20,000-deep expression assembles (D1), and the jobs
"$ASM" -t x64 tests/deep.asm -o "$T/deep.obj" || { echo "deep.asm refused"; fail=1; }
for i in 1 2 3 4 5 6 7 8; do sed "s/helper/helper$i/g" tests/basic.asm > "$T/p$i.asm"; done
"$ASM" -t x64 "$T"/p?.asm || fail=1
for i in 1 2 3 4 5 6 7 8; do
    "$ASM" -t x64 "$T/p$i.asm" -o "$T/s$i.obj" && cmp "$T/p$i.obj" "$T/s$i.obj" || fail=1
done
"$ASM" -t x64 tests/basic.asm tests/basic.asm > "$T/dup.msg" 2>&1 && { echo "two jobs writing one object were not refused"; fail=1; }
grep -q "would both write" "$T/dup.msg" || { echo "duplicate output: $(cat "$T/dup.msg")"; fail=1; }

[ $fail = 0 ] && echo "all tests passed" || echo "TESTS FAILED"
exit $fail
