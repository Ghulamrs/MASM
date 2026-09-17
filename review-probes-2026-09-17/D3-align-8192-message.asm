; D3-align-8192-message - ALIGN 4096 / 8192
; ml64 14.44:      A2189 for both (segment alignment is 16)
; this assembler (ffa04ad): ALIGN 4096 accepted (see B5); ALIGN 8192 -> 'ALIGN needs a power of two' (x64_parse.cpp:160 - it is one; the cap is the reason)
.DATA
a DB 1
        ALIGN 4096
b DB 1
        ALIGN 8192
c DB 1
.CODE
f PROC
        ret
f ENDP
END
