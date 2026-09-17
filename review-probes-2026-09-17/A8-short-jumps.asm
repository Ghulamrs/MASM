; A8-short-jumps - jumps to near labels (README: stage 2)
; ml64 14.44:      EB FD / 74 FB / EB 04 / 75 02 (short forms); 'jmp short' accepted
; this assembler (ffa04ad): E9 rel32 / 0F 84 rel32 always; 'jmp short bot' -> "'short' is not a constant". 97 of 97 differing instructions in the 29-file corpus sample are these
.CODE
f PROC
top:    nop
        jmp     top
        je      top
        jmp     bot
        jne     bot
        jmp     short bot
bot:    ret
f ENDP
END
