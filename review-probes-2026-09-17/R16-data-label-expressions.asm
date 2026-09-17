; R16-data-label-expressions - DQ v+8, DD v+4, DD IMAGEREL v (corpus: IMAGEREL 13702 lines, label-difference DB 13755 lines, 257 files)
; ml64 14.44:      ADDR64 v (addend 8 in place); ADDR32 v; ADDR32NB v
; this assembler (ffa04ad): "'v' is not a constant" (expr.cpp:51-59: a label is never an expression term; x64_parse.cpp:274-284 accepts a label only as a whole item)
.DATA
v DQ 0
t DQ v+8
u DD v+4
w DD IMAGEREL v
.CODE
f PROC
        ret
f ENDP
END
