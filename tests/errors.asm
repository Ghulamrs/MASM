.CODE
f PROC
        mov     rax, ebx
        push    eax
        mov     [rbx], 5
        mov     rax, [ebx]
        lea     rax, rbx
        frob    rax
        jmp     nowhere
        add     counter, 1
f ENDP
END
