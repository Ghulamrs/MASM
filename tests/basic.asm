; first-stage test: calls, arithmetic, memory forms, data, externs
EXTERN printf:PROC
PUBLIC counter

SIZE_N EQU 4 * 2

.DATA
msg      DB "sum = %d", 10, 0
counter  DQ 0
table    DD 1, 2, 3, -1
buffer   DB SIZE_N DUP (?)
ptrs     DQ msg, counter

.CODE
main PROC
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        push    r12
        mov     eax, 5
        mov     rcx, 1000
        mov     r8, 123456789012
        mov     rax, -1
        add     rax, rcx
        add     rax, 1000
        sub     r9, 7
        cmp     r10d, 70000
        xor     eax, eax
        and     rbx, r14
        test    rcx, rdx
        mov     rax, qword ptr [rbx]
        mov     rax, [rsp + 8]
        mov     rdx, [rbp - 16]
        mov     [r12 + rcx*8 + 24], r15
        mov     eax, dword ptr [r13]
        lea     rdx, [rax + rbx*4 - 3]
        mov     dword ptr [rbx + 4], 99
        lea     rcx, msg
        mov     rax, counter
        inc     qword ptr [rbp - 8]
        imul    rax, rbx
        cqo
        idiv    rcx
        neg     r11
        shl     rax, 1
        sar     rdx, SIZE_N
        call    printf
        call    helper
        call    rax
        jmp     done
done:   pop     r12
        leave
        ret
main ENDP

helper PROC
        cmp     rcx, 0
        je      helper_end
        dec     rcx
        jne     helper
helper_end:
        ret
helper ENDP
END
