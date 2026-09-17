; D6-shift-by-1-rip - shift by 1 of a RIP-relative operand
; ml64 14.44:      48 D1 25 rel32 + REL32 (the D1 form carries no immediate)
; this assembler (ffa04ad): 'a label address with an immediate is not supported' (x64_encode.cpp:333 applies imm_after_rip to the count-1 form too)
.DATA
var8 DQ 0
var4 DD 0
.CODE
f PROC
        shl     qword ptr var8, 1
        sar     dword ptr var4, 1
        ret
f ENDP
END
