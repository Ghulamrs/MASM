; R22-strings - doubled quotes, DW/DD character constants (corpus: plain single-quoted DB strings only)
; ml64 14.44:      assembles
; this assembler (ffa04ad): "unexpected 'it'" ... (lexer.cpp:76-85 has no doubled-quote rule; DW/DD take a 1-char string only)
.DATA
s1 DB 'it''s', 0
s2 DB "say ""hi""", 0
s3 DW 'ab'
s4 DD 'abcd'
s5 DB 'a', 'b'
.CODE
f PROC
        mov     eax, 'ab'
        ret
f ENDP
END
