; R8-offset - OFFSET label (corpus: 0)
; ml64 14.44:      48 B8 imm64 with ADDR64
; this assembler (ffa04ad): "'offset' is not a constant"
.DATA
v DQ 0
.CODE
f PROC
        mov     rax, offset v
        mov     rax, OFFSET f
        ret
f ENDP
END
