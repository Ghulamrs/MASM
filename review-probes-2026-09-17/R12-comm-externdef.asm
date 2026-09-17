; R12-comm-externdef - COMM and EXTERNDEF (corpus: 0)
; ml64 14.44:      cv is UNDEF External with value 8 (common); ed external
; this assembler (ffa04ad): "'cv' is not a constant"
COMM cv:QWORD
EXTERNDEF ed:PROC
.DATA
dv DQ 0
PUBLIC dv
.CODE
f PROC
        mov rax, cv
        ret
f ENDP
END
