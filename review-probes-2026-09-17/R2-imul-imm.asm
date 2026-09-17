; R2-imul-imm - IMUL r,imm and r,r/m,imm (corpus: 0)
; ml64 14.44:      48 6B C0 05; 48 6B C3 05; 48 69 C3 E8 03 00 00; 6B 03 FF; 4D 6B C1 80; 4D 69 C1 80 00 00 00
; this assembler (ffa04ad): 'IMUL needs a register and a register or memory operand'
.CODE
f PROC
        imul    rax, 5
        imul    rax, rbx, 5
        imul    rax, rbx, 1000
        imul    eax, dword ptr [rbx], -1
        imul    r8, r9, -128
        imul    r8, r9, 128
        ret
f ENDP
END
