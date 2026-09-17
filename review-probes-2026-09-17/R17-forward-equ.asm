; R17-forward-equ - EQU defined after use (corpus: 0 EQU)
; ml64 14.44:      B8 07 00 00 00
; this assembler (ffa04ad): "'LATER' is a constant, not an address" (unit.cpp:161-163; one pass)
.CODE
f PROC
        mov     eax, LATER
        ret
f ENDP
LATER EQU 7
END
