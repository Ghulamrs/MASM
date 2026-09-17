; R5-setcc-cmovcc - SETcc / CMOVcc (corpus: ~2200 SETcc lines, 0 CMOV)
; ml64 14.44:      0F 94 C0; 0F 9C C1; 48 0F 44 C1; 0F 4C C1
; this assembler (ffa04ad): unknown instruction
.CODE
f PROC
        sete    al
        setl    cl
        cmove   rax, rcx
        cmovl   eax, ecx
        ret
f ENDP
END
