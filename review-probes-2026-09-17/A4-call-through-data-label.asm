; A4-call-through-data-label - CALL/JMP to a label that is data (EXTERN name:QWORD or DQ)
; ml64 14.44:      call fp = FF 15 rel32 (indirect through the qword); jmp d = FF 25 rel32
; this assembler (ffa04ad): E8 rel32 / E9 rel32 - a direct call/jump TO THE VARIABLE (x64_encode.cpp:373-375 treats every bare label as code); wrong code if ever emitted (the corpus never does)
EXTERN fp:QWORD
.DATA
d       DQ 0
.CODE
f PROC
        call    fp
        jmp     fp
        jmp     d
        call    d
        ret
f ENDP
END
