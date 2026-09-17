; R3-movzx-movsx-movsxd - MOVZX MOVSX MOVSXD (corpus: 17330 + 2406 + 1230 lines; 623 files use MOVSXD)
; ml64 14.44:      0F B6 C1; 0F B7 C1; 48 0F B6 03; 0F BE C1; 48 0F BF 03; 48 63 C1; 48 63 03
; this assembler (ffa04ad): unknown instruction
.CODE
f PROC
        movzx   eax, cl
        movzx   eax, cx
        movzx   rax, byte ptr [rbx]
        movsx   eax, cl
        movsx   rax, word ptr [rbx]
        movsxd  rax, ecx
        movsxd  rax, dword ptr [rbx]
        ret
f ENDP
END
