; R26-org-and-dollar - $ and ORG $+4 (corpus: ORG 11 lines in 8 cxx1 .xdata$x blocks)
; ml64 14.44:      assembles
; this assembler (ffa04ad): "'$' is not a constant"; ORG unknown
.CODE
f PROC
  jmp $+5
  jmp $
  ret
f ENDP
END
.DATA
x DD 1
        ORG $+4
y DD 2
END
