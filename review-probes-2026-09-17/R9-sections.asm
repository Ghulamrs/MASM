; R9-sections - .CONST, .DATA?, name SEGMENT/ENDS (corpus: 354 / 68 / 257 files)
; ml64 14.44:      sections .rdata (8), .bss (8), .text$mn; SEGMENT/ENDS accepted
; this assembler (ffa04ad): 'no section open' / unknown instruction; only .CODE->.text and .DATA->.data exist (x64_parse.cpp:105-110)
.CONST
c1 DQ 1
.DATA?
u1 DQ ?
_TEXT SEGMENT
_TEXT ENDS
.CODE
f PROC
        ret
f ENDP
END
