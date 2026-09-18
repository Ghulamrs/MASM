; a12: data directives, strings, DUP, ?, EQU, ALIGN in both sections, PUBLIC, labels in data
PUBLIC gv, gtab
EXTERN e1:PROC
EXTERN e2:QWORD
EXTRN e3:PROC
K       EQU 4 * 2
KA      EQU K + 1
KB      EQU (K + 1) * 3 - 20 / 5
KC      EQU -K
KD      EQU 'A'
.DATA
b1      DB 0, 1, 127, 128, 255, -1, -128, 'A', "ab", 0
s1      DB "hello, world", 10, 0
s2      DB 'single quoted; not a comment', 0
w1      DW 0, 1, 32767, 32768, 65535, -1, -32768, K
d1      DD 0, 1, 7FFFFFFFh, 80000000h, 0FFFFFFFFh, -1, -2147483648, KB
q1      DQ 0, 1, 7FFFFFFFFFFFFFFFh, 8000000000000000h, 0FFFFFFFFFFFFFFFFh, -1, 123456789012, KC
u1      DB ?
u2      DW ?
u4      DD ?
u8      DQ ?
z1      DB 16 DUP (0)
z2      DB 3 DUP (?)
z3      DW 4 DUP (1234h)
z4      DD K DUP (-1)
z5      DQ 2 DUP (?)
gv      DQ 42
        ALIGN 8
a8      DB 1
        ALIGN 16
a16     DB 1
        ALIGN 4
a4      DB 1
        ALIGN 2
a2      DB 1
        ALIGN 1
gtab    DQ b1, s1, gv, f, e1, e2, e3, lab, f
dtab    DD b1, s1, gv, f, e1, lab
        DB 1, 2, 3
        DQ gv
.CODE
f PROC
        mov     eax, K
        mov     rax, KD
        mov     rcx, KC
        add     rax, KA * 2
        DB      0CCh
f ENDP
        ALIGN 4
lab:    ret
        ALIGN 16
        ret
        ALIGN 8
END
