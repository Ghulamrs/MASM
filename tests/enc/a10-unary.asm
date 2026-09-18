; a10: NEG NOT MUL DIV IDIV INC DEC on registers and memory, both widths
.CODE
f PROC
        neg     rax
        neg     r8
        neg     r15
        neg     eax
        neg     r9d
        neg     qword ptr [rbx]
        neg     dword ptr [r12+8]
        not     rax
        not     r10
        not     ecx
        not     qword ptr [rbp-8]
        not     dword ptr [r13]
        div     rcx
        div     r11
        div     ecx
        div     r12d
        div     qword ptr [rsp+8]
        div     dword ptr [rbx+rcx*4]
        idiv    rcx
        idiv    r11
        idiv    ecx
        idiv    r12d
        idiv    qword ptr [rsp+8]
        idiv    dword ptr [rbx+rcx*4]
        inc     rax
        inc     r8
        inc     eax
        inc     r15d
        inc     qword ptr [rbx]
        inc     dword ptr [rbp-8]
        dec     rax
        dec     r8
        dec     eax
        dec     r15d
        dec     qword ptr [rbx]
        dec     dword ptr [rbp-8]
        ret
f ENDP
END
