; R4-8-16-bit-registers - 8/16-bit registers, BYTE/WORD PTR (corpus: 6024 / 72 / 1234 / 68 lines)
; ml64 14.44:      B0 01; 8A C8; 41 B0 01; 66 B8 01 00; C6 03 01; 66 C7 03 01 00; 80 38 00; 04 01
; this assembler (ffa04ad): 'size unknown', 'two memory operands' (the register names are taken for labels), "'byte' is not a constant"
.CODE
f PROC
        mov     al, 1
        mov     cl, al
        mov     r8b, 1
        mov     ax, 1
        mov     byte ptr [rbx], 1
        mov     word ptr [rbx], 1
        cmp     byte ptr [rax], 0
        add     al, 1
        ret
f ENDP
END
