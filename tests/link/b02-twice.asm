; b02-twice: the other half of b02 - twice, plus3 called back, mlval
EXTERN plus3:PROC
PUBLIC mlval
.DATA
mlval   DD 100
.CODE
twice PROC
        sub     rsp, 40
        call    plus3
        add     eax, eax
        add     rsp, 40
        ret
twice ENDP
END
