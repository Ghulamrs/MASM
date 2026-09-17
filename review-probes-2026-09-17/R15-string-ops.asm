; R15-string-ops - REP MOVSB/STOSQ, MOVSB, STOSB, CLD (corpus: 0)
; ml64 14.44:      F3 A4; F3 48 AB; A4; AA; FC
; this assembler (ffa04ad): unknown instruction 'REP'
.CODE
f PROC
        rep movsb
        rep stosq
        movsb
        stosb
        cld
        ret
f ENDP
END
