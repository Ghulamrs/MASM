; a07: shifts by 1 and by immediate, reg and memory, both widths
.CODE
f PROC
        shl     rax, 1
        sal     rax, 1
        shr     rax, 1
        sar     rax, 1
        shl     r8, 1
        shr     r15, 1
        sar     ecx, 1
        shl     r9d, 1
        shl     rax, 2
        sal     rcx, 3
        shr     rdx, 31
        sar     rbx, 63
        shl     r8, 7
        shr     r15d, 4
        sar     eax, 31
        shl     r9d, 5
        shl     qword ptr [rbx], 1
        sar     qword ptr [rbx], 2
        shr     dword ptr [rbp-8], 1
        shl     dword ptr [rbp-8], 3
        sar     qword ptr [r12+rax*8+16], 5
        shl     qword ptr [r13], 1
        shl     rax, 0
        shr     rax, 255
        ret
f ENDP
END
