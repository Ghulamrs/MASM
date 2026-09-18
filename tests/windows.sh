#!/bin/sh
# The checks that need the Windows box (ssh alias `windows`, VS 2022 at its usual place): the cl
# build of the sources, the encoding files assembled there and compared with the Mac's objects,
# b01/b02 linked and run against ml64's halves, and - given a corpus directory - every file of it
# assembled by both and diffed on all three streams.
#   sh tests/windows.sh [corpus dir]
cd "$(dirname "$0")/.." || exit 1
ASM=${ASM:-build/asm}
BOX=${BOX:-windows}
ROOT="C:/masm-tests"
T=${T:-build/test/windows}
mkdir -p "$T"
find . -name "* [0-9].*" -delete
COPYFILE_DISABLE=1 tar -C . --no-xattrs -czf "$T/tree.tgz" src tests || exit 1
W=$(echo "$ROOT" | sed 's|/|\\|g')        # the same place in cmd's spelling
ssh -n -o BatchMode=yes "$BOX" "if not exist $W mkdir $W" > /dev/null || exit 1
scp -q "$T/tree.tgz" "$BOX:$ROOT/tree.tgz" || exit 1
ssh -n -o BatchMode=yes "$BOX" "cd /d $W & tar xzf tree.tgz & $W\\tests\\windows\\build.cmd $W" | grep -E "warning|error|BUILD" || exit 1
# the encoding files, assembled there: the cl build must make the same objects as the clang one
ssh -n -o BatchMode=yes "$BOX" "$W\\tests\\windows\\enc.cmd $W" | grep -v ENC-DONE
mkdir -p "$T/enc"
scp -q "$BOX:$ROOT/build/enc/*.obj" "$T/enc/" || exit 1
same=0; differ=0
for f in tests/enc/*.asm; do
    b=$(basename "$f" .asm)
    "$ASM" -t x64 "$f" -o "$T/enc/$b-mac.obj" && cmp -s "$T/enc/$b-mac.obj" "$T/enc/$b.obj" && same=$((same + 1)) || { differ=$((differ + 1)); echo "DIFFER $b: cl and clang builds disagree"; }
done
echo "windows.sh: $same encoding objects identical from both builds, $differ differ"
ssh -n -o BatchMode=yes "$BOX" "$W\\tests\\windows\\link.cmd $W" | grep -vE "^\s*$"
if [ -n "$1" ]; then
    corpus=$1
    name=$(basename "$corpus")
    COPYFILE_DISABLE=1 tar -C "$corpus" --no-xattrs -czf "$T/$name.tgz" . || exit 1
    ssh -n -o BatchMode=yes "$BOX" "if not exist $W\\corpus\\$name mkdir $W\\corpus\\$name" > /dev/null
    scp -q "$T/$name.tgz" "$BOX:$ROOT/corpus/$name.tgz" || exit 1
    ssh -n -o BatchMode=yes "$BOX" "cd /d $W\\corpus\\$name & tar xzf ..\\$name.tgz & $W\\tests\\windows\\corpus.cmd $W $W\\corpus\\$name & tar czf all.tgz ml\\*.all my\\*.all" | tail -1
    mkdir -p "$T/$name" && scp -q "$BOX:$ROOT/corpus/$name/all.tgz" "$T/$name/" && tar xzf "$T/$name/all.tgz" -C "$T/$name"
    python3 tests/corpus-diff.py "$T/$name/my" "$T/$name/ml"
fi
