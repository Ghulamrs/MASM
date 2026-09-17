; A3-index-scale1-no-base - [reg*1] with no base register
; ml64 14.44:      mov rax,[rbx*1] = 48 8B 04 1D 00 00 00 00 (SIB index form, disp32)
; this assembler (ffa04ad): 48 8B 03 (folds the index into a base, x64_parse.cpp:444-447) - same address, different bytes
.CODE
f PROC
        mov     rax, [rbx*1]
        mov     rax, [rbx*1+16]
        lea     rax, [rcx*1+1000]
        ret
f ENDP
END
