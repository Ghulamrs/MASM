; R24-expression-operators - MOD SHL SHR AND OR NOT unary + (corpus: 0)
; ml64 14.44:      assembles
; this assembler (ffa04ad): "unexpected 'MOD'" ... (expr.cpp knows + - * / and unary - only)
A EQU 7 MOD 3
B EQU 1 SHL 4
C EQU 6 AND 3
D EQU NOT 0
E EQU +5
F EQU 2 + 3 * 4
G EQU (2 + 3) * 4
H EQU -2 * 3
I EQU 7 / -2
J EQU 10 - 2 - 3
K EQU 100 / 10 / 2
L EQU --5
.DATA
t DD A, B, C, D, E, F, G, H, I, J, K, L
.CODE
fn PROC
        ret
fn ENDP
END
