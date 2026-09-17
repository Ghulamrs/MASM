; R25-typed-label-store - mov v, 5 where v is DD (corpus: 0 - the compilers always write DWORD PTR)
; ml64 14.44:      C7 05 rel32 imm32 (the label's type gives the size)
; this assembler (ffa04ad): 'size unknown; use QWORD PTR or DWORD PTR' (Symbol carries no type, asm.h:29-37)
.DATA
v DD 0
.CODE
f PROC
        mov     v, 5
        ret
f ENDP
END
