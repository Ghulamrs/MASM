; a08: Jcc/JMP/CALL to labels far enough for rel32 in ml64 too, and through registers and memory
EXTERN ext:PROC
.CODE
f PROC
top:    nop
        jmp     far1
        call    far1
        call    ext
        jmp     ext
        jo      far1
        jno     far1
        jb      far1
        jc      far1
        jnae    far1
        jae     far1
        jnb     far1
        jnc     far1
        je      far1
        jz      far1
        jne     far1
        jnz     far1
        jbe     far1
        jna     far1
        ja      far1
        jnbe    far1
        js      far1
        jns     far1
        jp      far1
        jpe     far1
        jnp     far1
        jpo     far1
        jl      far1
        jnge    far1
        jge     far1
        jnl     far1
        jle     far1
        jng     far1
        jg      far1
        jnle    far1
        call    rax
        call    rcx
        call    r8
        call    r12
        call    r15
        call    qword ptr [rax]
        call    qword ptr [r12+8]
        call    qword ptr [rsp+8]
        call    qword ptr [rbp-8]
        call    qword ptr [r13]
        call    qword ptr [rbx+rcx*8]
        call    qword ptr [rbx+rcx*8+16]
        jmp     rax
        jmp     r13
        jmp     qword ptr [rax]
        jmp     qword ptr [rsp+8]
        jmp     qword ptr [r12]
        jmp     qword ptr [rbx+rcx*8+16]
        DB      200 DUP (90h)
far1:   nop
        jmp     top
        je      top
        jg      top
        jmp     far2
        jne     far2
        DB      200 DUP (90h)
far2:   ret
f ENDP
g PROC
        call    f
        jmp     f
        je      f
        ret
g ENDP
END
