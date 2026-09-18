; b01: a main that calls printf through EXTERN printf:PROC and returns 7
EXTERN printf:PROC
.DATA
fmt     DB "sum = %d, ptr = %p", 10, 0
counter DQ 40
ptrs    DQ fmt, counter
.CODE
main PROC
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     rax, counter
        add     rax, 2
        mov     counter, rax
        lea     rcx, fmt
        mov     rdx, counter
        mov     r8, ptrs
        call    printf
        mov     eax, 7
        leave
        ret
main ENDP
END
