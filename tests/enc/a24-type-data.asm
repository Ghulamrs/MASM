; a24: the type names as data directives, and DUP (0) in a BSS segment - shci's globals - beside
; the same words as operand sizes, which they stay when PTR follows
_BSS    SEGMENT
shm_globals QWORD 2 DUP (0)
flags   DWORD  3 DUP (?)
_BSS    ENDS
_DATA   SEGMENT
table   QWORD  1, 2, 3
small   BYTE   7, 8
half    WORD   9
_DATA   ENDS
.CODE
f PROC
        lea     r11, shm_globals
        mov     DWORD PTR [r11+0], eax
        mov     QWORD PTR [r11+8], rcx
        lea     r11, flags
        mov     BYTE PTR [r11+2], al
        mov     rax, QWORD PTR table
        movzx   eax, BYTE PTR small
        movzx   eax, WORD PTR half
        ret
f ENDP
END
