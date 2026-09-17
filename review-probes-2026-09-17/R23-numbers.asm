; R23-numbers - number spellings (corpus: decimal and nnH only)
; ml64 14.44:      10o, 10q, 1010b, 0ABh, DQ 1.5, 18446744073709551615 assemble; 0x10, 12_34, 2^64 refused
; this assembler (ffa04ad): bad number '10o'/'10q'; "unexpected '.5'"; 2^64 accepted (see D2)
.DATA
n1 DD 0x10
n2 DD 10o
n3 DD 10q
n4 DD 1010b
n5 DD 0ABh
n6 DQ 1.5
n7 DD 12_34
n8 DQ 18446744073709551615
n9 DQ 18446744073709551616
.CODE
f PROC
        ret
f ENDP
END
