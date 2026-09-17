; A2-mov64-spelled-64bit - MOV r64 with a 64-bit-spelled value whose sign-extension fits imm32
; ml64 14.44:      48 B9 F8 FF FF FF FF FF FF FF (10-byte imm64 for a 64-bit literal; -8 would give 48 C7 C1 F8 FF FF FF)
; this assembler (ffa04ad): 48 C7 C1 F8 FF FF FF (chooses by value, x64_encode.cpp:257) - same value, 3 bytes shorter; shows as a diff in every cxx1 file that emits e.g. mov rcx, 18446744073709551608
.CODE
f PROC
        mov     rcx, 18446744073709551608
        mov     rax, 18446744073709551615
        mov     rax, 4612811918334230528
        mov     rax, 9223372036854775808
        mov     rax, 2147483648
        mov     rax, 4294967295
        mov     rax, 4294967296
        ret
f ENDP
END
