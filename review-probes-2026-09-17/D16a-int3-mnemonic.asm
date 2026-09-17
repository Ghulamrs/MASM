; D16a-int3-mnemonic - INT3 as a mnemonic
; ml64 14.44:      error A2008: syntax error : int3
; this assembler (ffa04ad): CC (x64_encode.cpp:154 spells it INT3)
.CODE
f PROC
        int3
        ret
f ENDP
END
