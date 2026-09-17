; R7-label-plus-register - [label+reg*scale] (corpus: 0)
; ml64 14.44:      48 8B 04 CD disp32 with ADDR32 reloc (absolute 32-bit address)
; this assembler (ffa04ad): 'a label cannot be combined with registers in this version' (x64_parse.cpp:440-442)
.DATA
tab DQ 0, 0
.CODE
f PROC
        mov     rax, [tab+rcx*8]
        mov     rax, tab[rcx*8]
        jmp     qword ptr [tab+rax*8]
        lea     rax, [tab+rcx]
        ret
f ENDP
END
