; R11-option - OPTION PROC:PRIVATE, NOKEYWORD, INCLUDELIB, TITLE (corpus: OPTION in all 257 cxx1 files)
; ml64 14.44:      assembles; PROC:PRIVATE makes PROCs Static (see R27's g)
; this assembler (ffa04ad): 'PROC attributes are not supported' (OPTION PROC is read as name PROC), 'unexpected character <', unknown instruction
OPTION PROC:PRIVATE
OPTION NOKEYWORD:<fabs>
INCLUDELIB libcmt
TITLE x
.CODE
f PROC
        ret
f ENDP
END
