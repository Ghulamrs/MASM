; A5-mov-from-code-label - mov r64, [code_label]
; ml64 14.44:      48 B8 imm64 + ADDR64 reloc (mov rax, offset back - MASM takes a NEAR label in brackets as its address)
; this assembler (ffa04ad): 48 8B 05 rel32 (loads the qword of code at back)
.CODE
f PROC
back:   nop
        mov     rax, [back]
        mov     rax, qword ptr [back]
        ret
f ENDP
END
