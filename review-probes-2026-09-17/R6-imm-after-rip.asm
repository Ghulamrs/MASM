; R6-imm-after-rip - an immediate after a RIP-relative displacement (corpus: 0)
; ml64 14.44:      C7 05 rel32 imm32 with REL32_4; 48 83 3D rel32 imm8 with REL32_1; same-section cmp dword ptr [lab],5 = 83 3D rel32 05 with REL32_1
; this assembler (ffa04ad): 'a label address with an immediate is not supported in this version'
.DATA
v DD 0
q DQ 0
.CODE
f PROC
        mov     v, 5
        mov     dword ptr v, 5
        cmp     q, 0
        add     v, 1
        shl     v, 2
        test    v, 1
        mov     qword ptr q, -1
        ret
f ENDP
END
; and same-section:
.CODE
f PROC
        cmp     dword ptr [lab], 5
lab:    ret
f ENDP
END
