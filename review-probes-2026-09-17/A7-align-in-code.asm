; A7-align-in-code - ALIGN inside .CODE
; ml64 14.44:      one multi-byte NOP: 0F 1F 80 00 00 00 00
; this assembler (ffa04ad): seven 90 bytes (x64_parse.cpp:164)
.CODE
f PROC
        ret
        ALIGN 8
        ret
f ENDP
END
