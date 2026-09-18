; a09: PUSH/POP every register, immediates at the boundaries, memory
.CODE
f PROC
        push    rax
        push    rcx
        push    rdx
        push    rbx
        push    rsp
        push    rbp
        push    rsi
        push    rdi
        push    r8
        push    r9
        push    r10
        push    r11
        push    r12
        push    r13
        push    r14
        push    r15
        pop     rax
        pop     rcx
        pop     rdx
        pop     rbx
        pop     rsp
        pop     rbp
        pop     rsi
        pop     rdi
        pop     r8
        pop     r9
        pop     r10
        pop     r11
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        push    0
        push    1
        push    127
        push    128
        push    -1
        push    -128
        push    -129
        push    7FFFFFFFh
        push    -2147483648
        push    qword ptr [rbx]
        push    qword ptr [r12]
        push    qword ptr [r13]
        push    qword ptr [rsp+8]
        push    qword ptr [rbp-8]
        push    qword ptr [rbx+rcx*8+16]
        pop     qword ptr [rbx]
        pop     qword ptr [r12]
        pop     qword ptr [rsp+8]
        pop     qword ptr [r13+rax*4-8]
        ret
f ENDP
END
