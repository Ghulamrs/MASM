; a11: no-operand instructions, RET n, LEA
.CODE
f PROC
        nop
        cqo
        cdq
        cdqe
        leave
        ret     8
        ret     0
        ret     65535
        lea     rax, [rbx]
        lea     eax, [rbx]
        lea     r8d, [r9+8]
        lea     rax, [rsp+8]
        lea     rax, [rbp]
        lea     r13, [r13]
        lea     r12, [r12]
        lea     rax, [rax+rax*2]
        lea     rax, [rax+rax*4+7]
        lea     rax, [rbx*8+8]
        ret
f ENDP
END
