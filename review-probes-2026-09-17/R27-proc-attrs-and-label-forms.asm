; R27-proc-attrs-and-label-forms - PROC PUBLIC/PRIVATE, ::, @@/@B, mangled names (corpus: 0 attrs, 0 ::, 0 @@; mangled names everywhere)
; ml64 14.44:      g is Static, f External; $L1:: and @@ accepted; ?x@@YAXXZ assembles
; this assembler (ffa04ad): 'PROC attributes are not supported'; 'statement expected' at $L1::; "'@B' is not defined"; the mangled name is fine
.CODE
f PROC PUBLIC
        ret
f ENDP
g PROC PRIVATE
        ret
g ENDP
$L1::
@@:     nop
        jmp @B
?x@@YAXXZ PROC
        ret
?x@@YAXXZ ENDP
END
