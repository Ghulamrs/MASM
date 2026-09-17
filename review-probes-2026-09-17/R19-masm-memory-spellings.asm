; R19-masm-memory-spellings - 8[rbx], [rbx][8], [rbx][rcx] (corpus: 0)
; ml64 14.44:      assembles
; this assembler (ffa04ad): 'bad register term in address', "unexpected '['"
.CODE
f PROC
        mov     rax, [rbx][8]
        mov     rax, 8[rbx]
        mov     rax, [rbx][rcx]
        mov     rax, qword ptr 8[rbx+rcx*8]
        ret
f ENDP
END
