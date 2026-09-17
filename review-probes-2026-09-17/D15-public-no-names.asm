; D15-public-no-names - PUBLIC and EXTERN with no operand
; ml64 14.44:      (not run on ml64)
; this assembler (ffa04ad): accepted silently, rc 0 (x64_parse.cpp:116-154 loop body never runs)
.CODE
PUBLIC
EXTERN
f PROC
  ret
f ENDP
END
