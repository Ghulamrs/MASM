; D4-proc-scoped-label - a code label referenced from another PROC
; ml64 14.44:      error A2006: undefined symbol : loc (labels are PROC-scoped unless OPTION NOSCOPED)
; this assembler (ffa04ad): assembles; labels are file-scoped (unit.cpp:69-84) - the OPTION NOSCOPED behaviour cxx1 asks for, without the option
PUBLIC dv
EXTERN ext:PROC
EXTERN ev:DWORD
.DATA
dv DD 0
lv DD 0
.CODE
f PROC
        mov     eax, ev
        mov     eax, lv
        call    ext
        call    g
loc:    ret
f ENDP
g PROC
        jmp     loc
        ret
g ENDP
END
