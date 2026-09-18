#!/bin/sh
# Every instruction against ml64: tests/enc/*.asm are assembled here and their code bytes compared
# with tests/enc/*.ml.b, the bytes per instruction ml64 14.44 produced for the same file (dumpbin
# /disasm, normalised). Nothing but python3 is needed, so this runs on all three machines.
cd "$(dirname "$0")/.." || exit 1
ASM=${ASM:-build/asm}
T=${T:-build/test/enc}
mkdir -p "$T"
files=0; same=0; differ=0; refused=0
for f in tests/enc/*.asm; do
    b=$(basename "$f" .asm)
    files=$((files + 1))
    if ! "$ASM" -t x64 "$f" -o "$T/$b.obj" > "$T/$b.err" 2>&1; then
        echo "REFUSED $b: $(head -1 "$T/$b.err")"; refused=$((refused + 1)); continue
    fi
    python3 tests/coffcode.py "$T/$b.obj" | tr -d '\n' | sed 's/ //g' > "$T/$b.mine"
    tr -d '\n' < "tests/enc/$b.ml.b" | sed 's/ //g' > "$T/$b.ml64"
    if cmp -s "$T/$b.mine" "$T/$b.ml64"; then same=$((same + 1))
    else
        differ=$((differ + 1))
        n=$(wc -l < "tests/enc/$b.ml.b" | tr -d ' ')
        echo "DIFFER $b ($n instructions): first difference at byte $(cmp "$T/$b.mine" "$T/$b.ml64" 2>&1 | sed 's/.*byte \([0-9]*\).*/\1/')"
    fi
done
echo "enc.sh: $files files, $same identical to ml64, $differ differ, $refused refused"
[ "$differ" = 0 ] && [ "$refused" = 0 ]
