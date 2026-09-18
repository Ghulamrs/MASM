; b02-main: main calls twice in the other half, which calls plus3 back, and reads mlval from its data
EXTERN twice:PROC
EXTERN printf:PROC
EXTERN mlval:DWORD
.DATA
fmt     DB "twice(20) = %d, mlval = %d", 10, 0
.CODE
plus3 PROC
        mov     eax, ecx
        add     eax, 3
        ret
plus3 ENDP
main PROC
        sub     rsp, 40
        mov     ecx, 20
        call    twice
        mov     edx, eax
        mov     r8d, mlval
        lea     rcx, fmt
        call    printf
        mov     eax, 46
        add     rsp, 40
        ret
main ENDP
END
