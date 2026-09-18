; a06: IMUL one- and two-operand forms; MUL
.CODE
f PROC
        imul    rax
        imul    rcx
        imul    r8
        imul    r15
        imul    eax
        imul    r9d
        imul    qword ptr [rbx]
        imul    dword ptr [r12+8]
        imul    rax, rbx
        imul    rax, r8
        imul    r8, rax
        imul    r15, r14
        imul    eax, ecx
        imul    r9d, r10d
        imul    rax, [rbx]
        imul    rax, qword ptr [rbx]
        imul    r8, qword ptr [r9+8]
        imul    eax, dword ptr [rsp+8]
        imul    r15d, dword ptr [r13]
        mul     rax
        mul     r9
        mul     ecx
        mul     qword ptr [rbx]
        mul     dword ptr [rbp-8]
        ret
f ENDP
END
