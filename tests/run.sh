#!/bin/sh
# regression tests; needs GNU objdump and as (Linux or Homebrew binutils)
cd "$(dirname "$0")/.." || exit 1
ASM=build/asm
T=build/test
mkdir -p $T
fail=0

$ASM -t x64 tests/basic.asm -o $T/basic.obj || fail=1
objdump -d -r -t -M intel $T/basic.obj | tail -n +4 | diff -u tests/expect/basic.dis - || fail=1

as -O0 tests/basic_gas.s -o $T/gas.o && objcopy -O binary -j .text $T/gas.o $T/gas.bin
objcopy -O binary -j .text $T/basic.obj $T/basic.bin
head -c "$(wc -c < $T/gas.bin)" $T/basic.bin | cmp - $T/gas.bin || fail=1

$ASM -t x64 tests/errors.asm -o $T/errors.obj 2> $T/errors.txt
diff -u tests/expect/errors.txt $T/errors.txt || fail=1

for i in 1 2 3 4 5 6 7 8; do sed "s/helper/helper$i/g" tests/basic.asm > $T/p$i.asm; done
$ASM -t x64 $T/p?.asm || fail=1
for i in 1 2 3 4 5 6 7 8; do
    $ASM -t x64 $T/p$i.asm -o $T/s$i.obj && cmp $T/p$i.obj $T/s$i.obj || fail=1
done

[ $fail = 0 ] && echo "all tests passed" || echo "TESTS FAILED"
exit $fail
