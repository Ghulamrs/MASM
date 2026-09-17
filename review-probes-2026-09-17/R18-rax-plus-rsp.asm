; R18-rax-plus-rsp - [rax+rsp] (corpus: 0)
; ml64 14.44:      48 8B 04 04 (rsp made the base)
; this assembler (ffa04ad): 'RSP cannot be an index' (x64_parse.cpp:412-415)
.CODE
f PROC
        mov     rax, [rax+rsp]
        ret
f ENDP
END
