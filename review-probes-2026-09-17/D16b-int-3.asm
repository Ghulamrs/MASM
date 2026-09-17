; D16b-int-3 - INT 3 and INT 29h
; ml64 14.44:      CC; CD 29
; this assembler (ffa04ad): unknown instruction 'INT'
.CODE
f PROC
        int     3
        int     29h
        ret
f ENDP
END
