; B5-align-beyond-section - ALIGN 32 in a section whose header says 16-byte alignment
; ml64 14.44:      error A2189: invalid combination with segment alignment : 32
; this assembler (ffa04ad): accepted; b lands at 0x20 in a section flagged ALIGN_16BYTES (mscoff.cpp:73), so the alignment is not honoured at link time (x64_parse.cpp:160-164)
.DATA
a DB 1
        ALIGN 32
b DB 2
.CODE
f PROC
        ret
f ENDP
END
