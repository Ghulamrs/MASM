; a04: [base], disp8, disp32, SIB-required bases, disp8-required bases, index*scale, all r8-r15 positions
.CODE
f PROC
        mov     rax, [rax]
        mov     r9, qword ptr [rax]
        mov     [rax], rax
        mov     [rax], r10
        mov     eax, dword ptr [rax]
        mov     dword ptr [rax], r11d
        lea     rcx, [rax]
        lea     r12, [rax]
        mov     rax, [rax+8]
        mov     r9, qword ptr [rax+8]
        mov     [rax+8], rax
        mov     [rax+8], r10
        mov     eax, dword ptr [rax+8]
        mov     dword ptr [rax+8], r11d
        lea     rcx, [rax+8]
        lea     r12, [rax+8]
        mov     rax, [rax-8]
        mov     r9, qword ptr [rax-8]
        mov     [rax-8], rax
        mov     [rax-8], r10
        mov     eax, dword ptr [rax-8]
        mov     dword ptr [rax-8], r11d
        lea     rcx, [rax-8]
        lea     r12, [rax-8]
        mov     rax, [rax+127]
        mov     r9, qword ptr [rax+127]
        mov     [rax+127], rax
        mov     [rax+127], r10
        mov     eax, dword ptr [rax+127]
        mov     dword ptr [rax+127], r11d
        lea     rcx, [rax+127]
        lea     r12, [rax+127]
        mov     rax, [rax-128]
        mov     r9, qword ptr [rax-128]
        mov     [rax-128], rax
        mov     [rax-128], r10
        mov     eax, dword ptr [rax-128]
        mov     dword ptr [rax-128], r11d
        lea     rcx, [rax-128]
        lea     r12, [rax-128]
        mov     rax, [rax+128]
        mov     r9, qword ptr [rax+128]
        mov     [rax+128], rax
        mov     [rax+128], r10
        mov     eax, dword ptr [rax+128]
        mov     dword ptr [rax+128], r11d
        lea     rcx, [rax+128]
        lea     r12, [rax+128]
        mov     rax, [rax-129]
        mov     r9, qword ptr [rax-129]
        mov     [rax-129], rax
        mov     [rax-129], r10
        mov     eax, dword ptr [rax-129]
        mov     dword ptr [rax-129], r11d
        lea     rcx, [rax-129]
        lea     r12, [rax-129]
        mov     rax, [rax+1000]
        mov     r9, qword ptr [rax+1000]
        mov     [rax+1000], rax
        mov     [rax+1000], r10
        mov     eax, dword ptr [rax+1000]
        mov     dword ptr [rax+1000], r11d
        lea     rcx, [rax+1000]
        lea     r12, [rax+1000]
        mov     rax, [rax-1000]
        mov     r9, qword ptr [rax-1000]
        mov     [rax-1000], rax
        mov     [rax-1000], r10
        mov     eax, dword ptr [rax-1000]
        mov     dword ptr [rax-1000], r11d
        lea     rcx, [rax-1000]
        lea     r12, [rax-1000]
        mov     rax, [rax+7FFFFFFFh]
        mov     r9, qword ptr [rax+7FFFFFFFh]
        mov     [rax+7FFFFFFFh], rax
        mov     [rax+7FFFFFFFh], r10
        mov     eax, dword ptr [rax+7FFFFFFFh]
        mov     dword ptr [rax+7FFFFFFFh], r11d
        lea     rcx, [rax+7FFFFFFFh]
        lea     r12, [rax+7FFFFFFFh]
        mov     rax, [rax-2147483648]
        mov     r9, qword ptr [rax-2147483648]
        mov     [rax-2147483648], rax
        mov     [rax-2147483648], r10
        mov     eax, dword ptr [rax-2147483648]
        mov     dword ptr [rax-2147483648], r11d
        lea     rcx, [rax-2147483648]
        lea     r12, [rax-2147483648]
        mov     rax, [rcx]
        mov     r9, qword ptr [rcx]
        mov     [rcx], rax
        mov     [rcx], r10
        mov     eax, dword ptr [rcx]
        mov     dword ptr [rcx], r11d
        lea     rcx, [rcx]
        lea     r12, [rcx]
        mov     rax, [rcx+8]
        mov     r9, qword ptr [rcx+8]
        mov     [rcx+8], rax
        mov     [rcx+8], r10
        mov     eax, dword ptr [rcx+8]
        mov     dword ptr [rcx+8], r11d
        lea     rcx, [rcx+8]
        lea     r12, [rcx+8]
        mov     rax, [rcx-8]
        mov     r9, qword ptr [rcx-8]
        mov     [rcx-8], rax
        mov     [rcx-8], r10
        mov     eax, dword ptr [rcx-8]
        mov     dword ptr [rcx-8], r11d
        lea     rcx, [rcx-8]
        lea     r12, [rcx-8]
        mov     rax, [rcx+127]
        mov     r9, qword ptr [rcx+127]
        mov     [rcx+127], rax
        mov     [rcx+127], r10
        mov     eax, dword ptr [rcx+127]
        mov     dword ptr [rcx+127], r11d
        lea     rcx, [rcx+127]
        lea     r12, [rcx+127]
        mov     rax, [rcx-128]
        mov     r9, qword ptr [rcx-128]
        mov     [rcx-128], rax
        mov     [rcx-128], r10
        mov     eax, dword ptr [rcx-128]
        mov     dword ptr [rcx-128], r11d
        lea     rcx, [rcx-128]
        lea     r12, [rcx-128]
        mov     rax, [rcx+128]
        mov     r9, qword ptr [rcx+128]
        mov     [rcx+128], rax
        mov     [rcx+128], r10
        mov     eax, dword ptr [rcx+128]
        mov     dword ptr [rcx+128], r11d
        lea     rcx, [rcx+128]
        lea     r12, [rcx+128]
        mov     rax, [rcx-129]
        mov     r9, qword ptr [rcx-129]
        mov     [rcx-129], rax
        mov     [rcx-129], r10
        mov     eax, dword ptr [rcx-129]
        mov     dword ptr [rcx-129], r11d
        lea     rcx, [rcx-129]
        lea     r12, [rcx-129]
        mov     rax, [rcx+1000]
        mov     r9, qword ptr [rcx+1000]
        mov     [rcx+1000], rax
        mov     [rcx+1000], r10
        mov     eax, dword ptr [rcx+1000]
        mov     dword ptr [rcx+1000], r11d
        lea     rcx, [rcx+1000]
        lea     r12, [rcx+1000]
        mov     rax, [rcx-1000]
        mov     r9, qword ptr [rcx-1000]
        mov     [rcx-1000], rax
        mov     [rcx-1000], r10
        mov     eax, dword ptr [rcx-1000]
        mov     dword ptr [rcx-1000], r11d
        lea     rcx, [rcx-1000]
        lea     r12, [rcx-1000]
        mov     rax, [rcx+7FFFFFFFh]
        mov     r9, qword ptr [rcx+7FFFFFFFh]
        mov     [rcx+7FFFFFFFh], rax
        mov     [rcx+7FFFFFFFh], r10
        mov     eax, dword ptr [rcx+7FFFFFFFh]
        mov     dword ptr [rcx+7FFFFFFFh], r11d
        lea     rcx, [rcx+7FFFFFFFh]
        lea     r12, [rcx+7FFFFFFFh]
        mov     rax, [rcx-2147483648]
        mov     r9, qword ptr [rcx-2147483648]
        mov     [rcx-2147483648], rax
        mov     [rcx-2147483648], r10
        mov     eax, dword ptr [rcx-2147483648]
        mov     dword ptr [rcx-2147483648], r11d
        lea     rcx, [rcx-2147483648]
        lea     r12, [rcx-2147483648]
        mov     rax, [rdx]
        mov     r9, qword ptr [rdx]
        mov     [rdx], rax
        mov     [rdx], r10
        mov     eax, dword ptr [rdx]
        mov     dword ptr [rdx], r11d
        lea     rcx, [rdx]
        lea     r12, [rdx]
        mov     rax, [rdx+8]
        mov     r9, qword ptr [rdx+8]
        mov     [rdx+8], rax
        mov     [rdx+8], r10
        mov     eax, dword ptr [rdx+8]
        mov     dword ptr [rdx+8], r11d
        lea     rcx, [rdx+8]
        lea     r12, [rdx+8]
        mov     rax, [rdx-8]
        mov     r9, qword ptr [rdx-8]
        mov     [rdx-8], rax
        mov     [rdx-8], r10
        mov     eax, dword ptr [rdx-8]
        mov     dword ptr [rdx-8], r11d
        lea     rcx, [rdx-8]
        lea     r12, [rdx-8]
        mov     rax, [rdx+127]
        mov     r9, qword ptr [rdx+127]
        mov     [rdx+127], rax
        mov     [rdx+127], r10
        mov     eax, dword ptr [rdx+127]
        mov     dword ptr [rdx+127], r11d
        lea     rcx, [rdx+127]
        lea     r12, [rdx+127]
        mov     rax, [rdx-128]
        mov     r9, qword ptr [rdx-128]
        mov     [rdx-128], rax
        mov     [rdx-128], r10
        mov     eax, dword ptr [rdx-128]
        mov     dword ptr [rdx-128], r11d
        lea     rcx, [rdx-128]
        lea     r12, [rdx-128]
        mov     rax, [rdx+128]
        mov     r9, qword ptr [rdx+128]
        mov     [rdx+128], rax
        mov     [rdx+128], r10
        mov     eax, dword ptr [rdx+128]
        mov     dword ptr [rdx+128], r11d
        lea     rcx, [rdx+128]
        lea     r12, [rdx+128]
        mov     rax, [rdx-129]
        mov     r9, qword ptr [rdx-129]
        mov     [rdx-129], rax
        mov     [rdx-129], r10
        mov     eax, dword ptr [rdx-129]
        mov     dword ptr [rdx-129], r11d
        lea     rcx, [rdx-129]
        lea     r12, [rdx-129]
        mov     rax, [rdx+1000]
        mov     r9, qword ptr [rdx+1000]
        mov     [rdx+1000], rax
        mov     [rdx+1000], r10
        mov     eax, dword ptr [rdx+1000]
        mov     dword ptr [rdx+1000], r11d
        lea     rcx, [rdx+1000]
        lea     r12, [rdx+1000]
        mov     rax, [rdx-1000]
        mov     r9, qword ptr [rdx-1000]
        mov     [rdx-1000], rax
        mov     [rdx-1000], r10
        mov     eax, dword ptr [rdx-1000]
        mov     dword ptr [rdx-1000], r11d
        lea     rcx, [rdx-1000]
        lea     r12, [rdx-1000]
        mov     rax, [rdx+7FFFFFFFh]
        mov     r9, qword ptr [rdx+7FFFFFFFh]
        mov     [rdx+7FFFFFFFh], rax
        mov     [rdx+7FFFFFFFh], r10
        mov     eax, dword ptr [rdx+7FFFFFFFh]
        mov     dword ptr [rdx+7FFFFFFFh], r11d
        lea     rcx, [rdx+7FFFFFFFh]
        lea     r12, [rdx+7FFFFFFFh]
        mov     rax, [rdx-2147483648]
        mov     r9, qword ptr [rdx-2147483648]
        mov     [rdx-2147483648], rax
        mov     [rdx-2147483648], r10
        mov     eax, dword ptr [rdx-2147483648]
        mov     dword ptr [rdx-2147483648], r11d
        lea     rcx, [rdx-2147483648]
        lea     r12, [rdx-2147483648]
        mov     rax, [rbx]
        mov     r9, qword ptr [rbx]
        mov     [rbx], rax
        mov     [rbx], r10
        mov     eax, dword ptr [rbx]
        mov     dword ptr [rbx], r11d
        lea     rcx, [rbx]
        lea     r12, [rbx]
        mov     rax, [rbx+8]
        mov     r9, qword ptr [rbx+8]
        mov     [rbx+8], rax
        mov     [rbx+8], r10
        mov     eax, dword ptr [rbx+8]
        mov     dword ptr [rbx+8], r11d
        lea     rcx, [rbx+8]
        lea     r12, [rbx+8]
        mov     rax, [rbx-8]
        mov     r9, qword ptr [rbx-8]
        mov     [rbx-8], rax
        mov     [rbx-8], r10
        mov     eax, dword ptr [rbx-8]
        mov     dword ptr [rbx-8], r11d
        lea     rcx, [rbx-8]
        lea     r12, [rbx-8]
        mov     rax, [rbx+127]
        mov     r9, qword ptr [rbx+127]
        mov     [rbx+127], rax
        mov     [rbx+127], r10
        mov     eax, dword ptr [rbx+127]
        mov     dword ptr [rbx+127], r11d
        lea     rcx, [rbx+127]
        lea     r12, [rbx+127]
        mov     rax, [rbx-128]
        mov     r9, qword ptr [rbx-128]
        mov     [rbx-128], rax
        mov     [rbx-128], r10
        mov     eax, dword ptr [rbx-128]
        mov     dword ptr [rbx-128], r11d
        lea     rcx, [rbx-128]
        lea     r12, [rbx-128]
        mov     rax, [rbx+128]
        mov     r9, qword ptr [rbx+128]
        mov     [rbx+128], rax
        mov     [rbx+128], r10
        mov     eax, dword ptr [rbx+128]
        mov     dword ptr [rbx+128], r11d
        lea     rcx, [rbx+128]
        lea     r12, [rbx+128]
        mov     rax, [rbx-129]
        mov     r9, qword ptr [rbx-129]
        mov     [rbx-129], rax
        mov     [rbx-129], r10
        mov     eax, dword ptr [rbx-129]
        mov     dword ptr [rbx-129], r11d
        lea     rcx, [rbx-129]
        lea     r12, [rbx-129]
        mov     rax, [rbx+1000]
        mov     r9, qword ptr [rbx+1000]
        mov     [rbx+1000], rax
        mov     [rbx+1000], r10
        mov     eax, dword ptr [rbx+1000]
        mov     dword ptr [rbx+1000], r11d
        lea     rcx, [rbx+1000]
        lea     r12, [rbx+1000]
        mov     rax, [rbx-1000]
        mov     r9, qword ptr [rbx-1000]
        mov     [rbx-1000], rax
        mov     [rbx-1000], r10
        mov     eax, dword ptr [rbx-1000]
        mov     dword ptr [rbx-1000], r11d
        lea     rcx, [rbx-1000]
        lea     r12, [rbx-1000]
        mov     rax, [rbx+7FFFFFFFh]
        mov     r9, qword ptr [rbx+7FFFFFFFh]
        mov     [rbx+7FFFFFFFh], rax
        mov     [rbx+7FFFFFFFh], r10
        mov     eax, dword ptr [rbx+7FFFFFFFh]
        mov     dword ptr [rbx+7FFFFFFFh], r11d
        lea     rcx, [rbx+7FFFFFFFh]
        lea     r12, [rbx+7FFFFFFFh]
        mov     rax, [rbx-2147483648]
        mov     r9, qword ptr [rbx-2147483648]
        mov     [rbx-2147483648], rax
        mov     [rbx-2147483648], r10
        mov     eax, dword ptr [rbx-2147483648]
        mov     dword ptr [rbx-2147483648], r11d
        lea     rcx, [rbx-2147483648]
        lea     r12, [rbx-2147483648]
        mov     rax, [rsp]
        mov     r9, qword ptr [rsp]
        mov     [rsp], rax
        mov     [rsp], r10
        mov     eax, dword ptr [rsp]
        mov     dword ptr [rsp], r11d
        lea     rcx, [rsp]
        lea     r12, [rsp]
        mov     rax, [rsp+8]
        mov     r9, qword ptr [rsp+8]
        mov     [rsp+8], rax
        mov     [rsp+8], r10
        mov     eax, dword ptr [rsp+8]
        mov     dword ptr [rsp+8], r11d
        lea     rcx, [rsp+8]
        lea     r12, [rsp+8]
        mov     rax, [rsp-8]
        mov     r9, qword ptr [rsp-8]
        mov     [rsp-8], rax
        mov     [rsp-8], r10
        mov     eax, dword ptr [rsp-8]
        mov     dword ptr [rsp-8], r11d
        lea     rcx, [rsp-8]
        lea     r12, [rsp-8]
        mov     rax, [rsp+127]
        mov     r9, qword ptr [rsp+127]
        mov     [rsp+127], rax
        mov     [rsp+127], r10
        mov     eax, dword ptr [rsp+127]
        mov     dword ptr [rsp+127], r11d
        lea     rcx, [rsp+127]
        lea     r12, [rsp+127]
        mov     rax, [rsp-128]
        mov     r9, qword ptr [rsp-128]
        mov     [rsp-128], rax
        mov     [rsp-128], r10
        mov     eax, dword ptr [rsp-128]
        mov     dword ptr [rsp-128], r11d
        lea     rcx, [rsp-128]
        lea     r12, [rsp-128]
        mov     rax, [rsp+128]
        mov     r9, qword ptr [rsp+128]
        mov     [rsp+128], rax
        mov     [rsp+128], r10
        mov     eax, dword ptr [rsp+128]
        mov     dword ptr [rsp+128], r11d
        lea     rcx, [rsp+128]
        lea     r12, [rsp+128]
        mov     rax, [rsp-129]
        mov     r9, qword ptr [rsp-129]
        mov     [rsp-129], rax
        mov     [rsp-129], r10
        mov     eax, dword ptr [rsp-129]
        mov     dword ptr [rsp-129], r11d
        lea     rcx, [rsp-129]
        lea     r12, [rsp-129]
        mov     rax, [rsp+1000]
        mov     r9, qword ptr [rsp+1000]
        mov     [rsp+1000], rax
        mov     [rsp+1000], r10
        mov     eax, dword ptr [rsp+1000]
        mov     dword ptr [rsp+1000], r11d
        lea     rcx, [rsp+1000]
        lea     r12, [rsp+1000]
        mov     rax, [rsp-1000]
        mov     r9, qword ptr [rsp-1000]
        mov     [rsp-1000], rax
        mov     [rsp-1000], r10
        mov     eax, dword ptr [rsp-1000]
        mov     dword ptr [rsp-1000], r11d
        lea     rcx, [rsp-1000]
        lea     r12, [rsp-1000]
        mov     rax, [rsp+7FFFFFFFh]
        mov     r9, qword ptr [rsp+7FFFFFFFh]
        mov     [rsp+7FFFFFFFh], rax
        mov     [rsp+7FFFFFFFh], r10
        mov     eax, dword ptr [rsp+7FFFFFFFh]
        mov     dword ptr [rsp+7FFFFFFFh], r11d
        lea     rcx, [rsp+7FFFFFFFh]
        lea     r12, [rsp+7FFFFFFFh]
        mov     rax, [rsp-2147483648]
        mov     r9, qword ptr [rsp-2147483648]
        mov     [rsp-2147483648], rax
        mov     [rsp-2147483648], r10
        mov     eax, dword ptr [rsp-2147483648]
        mov     dword ptr [rsp-2147483648], r11d
        lea     rcx, [rsp-2147483648]
        lea     r12, [rsp-2147483648]
        mov     rax, [rbp]
        mov     r9, qword ptr [rbp]
        mov     [rbp], rax
        mov     [rbp], r10
        mov     eax, dword ptr [rbp]
        mov     dword ptr [rbp], r11d
        lea     rcx, [rbp]
        lea     r12, [rbp]
        mov     rax, [rbp+8]
        mov     r9, qword ptr [rbp+8]
        mov     [rbp+8], rax
        mov     [rbp+8], r10
        mov     eax, dword ptr [rbp+8]
        mov     dword ptr [rbp+8], r11d
        lea     rcx, [rbp+8]
        lea     r12, [rbp+8]
        mov     rax, [rbp-8]
        mov     r9, qword ptr [rbp-8]
        mov     [rbp-8], rax
        mov     [rbp-8], r10
        mov     eax, dword ptr [rbp-8]
        mov     dword ptr [rbp-8], r11d
        lea     rcx, [rbp-8]
        lea     r12, [rbp-8]
        mov     rax, [rbp+127]
        mov     r9, qword ptr [rbp+127]
        mov     [rbp+127], rax
        mov     [rbp+127], r10
        mov     eax, dword ptr [rbp+127]
        mov     dword ptr [rbp+127], r11d
        lea     rcx, [rbp+127]
        lea     r12, [rbp+127]
        mov     rax, [rbp-128]
        mov     r9, qword ptr [rbp-128]
        mov     [rbp-128], rax
        mov     [rbp-128], r10
        mov     eax, dword ptr [rbp-128]
        mov     dword ptr [rbp-128], r11d
        lea     rcx, [rbp-128]
        lea     r12, [rbp-128]
        mov     rax, [rbp+128]
        mov     r9, qword ptr [rbp+128]
        mov     [rbp+128], rax
        mov     [rbp+128], r10
        mov     eax, dword ptr [rbp+128]
        mov     dword ptr [rbp+128], r11d
        lea     rcx, [rbp+128]
        lea     r12, [rbp+128]
        mov     rax, [rbp-129]
        mov     r9, qword ptr [rbp-129]
        mov     [rbp-129], rax
        mov     [rbp-129], r10
        mov     eax, dword ptr [rbp-129]
        mov     dword ptr [rbp-129], r11d
        lea     rcx, [rbp-129]
        lea     r12, [rbp-129]
        mov     rax, [rbp+1000]
        mov     r9, qword ptr [rbp+1000]
        mov     [rbp+1000], rax
        mov     [rbp+1000], r10
        mov     eax, dword ptr [rbp+1000]
        mov     dword ptr [rbp+1000], r11d
        lea     rcx, [rbp+1000]
        lea     r12, [rbp+1000]
        mov     rax, [rbp-1000]
        mov     r9, qword ptr [rbp-1000]
        mov     [rbp-1000], rax
        mov     [rbp-1000], r10
        mov     eax, dword ptr [rbp-1000]
        mov     dword ptr [rbp-1000], r11d
        lea     rcx, [rbp-1000]
        lea     r12, [rbp-1000]
        mov     rax, [rbp+7FFFFFFFh]
        mov     r9, qword ptr [rbp+7FFFFFFFh]
        mov     [rbp+7FFFFFFFh], rax
        mov     [rbp+7FFFFFFFh], r10
        mov     eax, dword ptr [rbp+7FFFFFFFh]
        mov     dword ptr [rbp+7FFFFFFFh], r11d
        lea     rcx, [rbp+7FFFFFFFh]
        lea     r12, [rbp+7FFFFFFFh]
        mov     rax, [rbp-2147483648]
        mov     r9, qword ptr [rbp-2147483648]
        mov     [rbp-2147483648], rax
        mov     [rbp-2147483648], r10
        mov     eax, dword ptr [rbp-2147483648]
        mov     dword ptr [rbp-2147483648], r11d
        lea     rcx, [rbp-2147483648]
        lea     r12, [rbp-2147483648]
        mov     rax, [rsi]
        mov     r9, qword ptr [rsi]
        mov     [rsi], rax
        mov     [rsi], r10
        mov     eax, dword ptr [rsi]
        mov     dword ptr [rsi], r11d
        lea     rcx, [rsi]
        lea     r12, [rsi]
        mov     rax, [rsi+8]
        mov     r9, qword ptr [rsi+8]
        mov     [rsi+8], rax
        mov     [rsi+8], r10
        mov     eax, dword ptr [rsi+8]
        mov     dword ptr [rsi+8], r11d
        lea     rcx, [rsi+8]
        lea     r12, [rsi+8]
        mov     rax, [rsi-8]
        mov     r9, qword ptr [rsi-8]
        mov     [rsi-8], rax
        mov     [rsi-8], r10
        mov     eax, dword ptr [rsi-8]
        mov     dword ptr [rsi-8], r11d
        lea     rcx, [rsi-8]
        lea     r12, [rsi-8]
        mov     rax, [rsi+127]
        mov     r9, qword ptr [rsi+127]
        mov     [rsi+127], rax
        mov     [rsi+127], r10
        mov     eax, dword ptr [rsi+127]
        mov     dword ptr [rsi+127], r11d
        lea     rcx, [rsi+127]
        lea     r12, [rsi+127]
        mov     rax, [rsi-128]
        mov     r9, qword ptr [rsi-128]
        mov     [rsi-128], rax
        mov     [rsi-128], r10
        mov     eax, dword ptr [rsi-128]
        mov     dword ptr [rsi-128], r11d
        lea     rcx, [rsi-128]
        lea     r12, [rsi-128]
        mov     rax, [rsi+128]
        mov     r9, qword ptr [rsi+128]
        mov     [rsi+128], rax
        mov     [rsi+128], r10
        mov     eax, dword ptr [rsi+128]
        mov     dword ptr [rsi+128], r11d
        lea     rcx, [rsi+128]
        lea     r12, [rsi+128]
        mov     rax, [rsi-129]
        mov     r9, qword ptr [rsi-129]
        mov     [rsi-129], rax
        mov     [rsi-129], r10
        mov     eax, dword ptr [rsi-129]
        mov     dword ptr [rsi-129], r11d
        lea     rcx, [rsi-129]
        lea     r12, [rsi-129]
        mov     rax, [rsi+1000]
        mov     r9, qword ptr [rsi+1000]
        mov     [rsi+1000], rax
        mov     [rsi+1000], r10
        mov     eax, dword ptr [rsi+1000]
        mov     dword ptr [rsi+1000], r11d
        lea     rcx, [rsi+1000]
        lea     r12, [rsi+1000]
        mov     rax, [rsi-1000]
        mov     r9, qword ptr [rsi-1000]
        mov     [rsi-1000], rax
        mov     [rsi-1000], r10
        mov     eax, dword ptr [rsi-1000]
        mov     dword ptr [rsi-1000], r11d
        lea     rcx, [rsi-1000]
        lea     r12, [rsi-1000]
        mov     rax, [rsi+7FFFFFFFh]
        mov     r9, qword ptr [rsi+7FFFFFFFh]
        mov     [rsi+7FFFFFFFh], rax
        mov     [rsi+7FFFFFFFh], r10
        mov     eax, dword ptr [rsi+7FFFFFFFh]
        mov     dword ptr [rsi+7FFFFFFFh], r11d
        lea     rcx, [rsi+7FFFFFFFh]
        lea     r12, [rsi+7FFFFFFFh]
        mov     rax, [rsi-2147483648]
        mov     r9, qword ptr [rsi-2147483648]
        mov     [rsi-2147483648], rax
        mov     [rsi-2147483648], r10
        mov     eax, dword ptr [rsi-2147483648]
        mov     dword ptr [rsi-2147483648], r11d
        lea     rcx, [rsi-2147483648]
        lea     r12, [rsi-2147483648]
        mov     rax, [rdi]
        mov     r9, qword ptr [rdi]
        mov     [rdi], rax
        mov     [rdi], r10
        mov     eax, dword ptr [rdi]
        mov     dword ptr [rdi], r11d
        lea     rcx, [rdi]
        lea     r12, [rdi]
        mov     rax, [rdi+8]
        mov     r9, qword ptr [rdi+8]
        mov     [rdi+8], rax
        mov     [rdi+8], r10
        mov     eax, dword ptr [rdi+8]
        mov     dword ptr [rdi+8], r11d
        lea     rcx, [rdi+8]
        lea     r12, [rdi+8]
        mov     rax, [rdi-8]
        mov     r9, qword ptr [rdi-8]
        mov     [rdi-8], rax
        mov     [rdi-8], r10
        mov     eax, dword ptr [rdi-8]
        mov     dword ptr [rdi-8], r11d
        lea     rcx, [rdi-8]
        lea     r12, [rdi-8]
        mov     rax, [rdi+127]
        mov     r9, qword ptr [rdi+127]
        mov     [rdi+127], rax
        mov     [rdi+127], r10
        mov     eax, dword ptr [rdi+127]
        mov     dword ptr [rdi+127], r11d
        lea     rcx, [rdi+127]
        lea     r12, [rdi+127]
        mov     rax, [rdi-128]
        mov     r9, qword ptr [rdi-128]
        mov     [rdi-128], rax
        mov     [rdi-128], r10
        mov     eax, dword ptr [rdi-128]
        mov     dword ptr [rdi-128], r11d
        lea     rcx, [rdi-128]
        lea     r12, [rdi-128]
        mov     rax, [rdi+128]
        mov     r9, qword ptr [rdi+128]
        mov     [rdi+128], rax
        mov     [rdi+128], r10
        mov     eax, dword ptr [rdi+128]
        mov     dword ptr [rdi+128], r11d
        lea     rcx, [rdi+128]
        lea     r12, [rdi+128]
        mov     rax, [rdi-129]
        mov     r9, qword ptr [rdi-129]
        mov     [rdi-129], rax
        mov     [rdi-129], r10
        mov     eax, dword ptr [rdi-129]
        mov     dword ptr [rdi-129], r11d
        lea     rcx, [rdi-129]
        lea     r12, [rdi-129]
        mov     rax, [rdi+1000]
        mov     r9, qword ptr [rdi+1000]
        mov     [rdi+1000], rax
        mov     [rdi+1000], r10
        mov     eax, dword ptr [rdi+1000]
        mov     dword ptr [rdi+1000], r11d
        lea     rcx, [rdi+1000]
        lea     r12, [rdi+1000]
        mov     rax, [rdi-1000]
        mov     r9, qword ptr [rdi-1000]
        mov     [rdi-1000], rax
        mov     [rdi-1000], r10
        mov     eax, dword ptr [rdi-1000]
        mov     dword ptr [rdi-1000], r11d
        lea     rcx, [rdi-1000]
        lea     r12, [rdi-1000]
        mov     rax, [rdi+7FFFFFFFh]
        mov     r9, qword ptr [rdi+7FFFFFFFh]
        mov     [rdi+7FFFFFFFh], rax
        mov     [rdi+7FFFFFFFh], r10
        mov     eax, dword ptr [rdi+7FFFFFFFh]
        mov     dword ptr [rdi+7FFFFFFFh], r11d
        lea     rcx, [rdi+7FFFFFFFh]
        lea     r12, [rdi+7FFFFFFFh]
        mov     rax, [rdi-2147483648]
        mov     r9, qword ptr [rdi-2147483648]
        mov     [rdi-2147483648], rax
        mov     [rdi-2147483648], r10
        mov     eax, dword ptr [rdi-2147483648]
        mov     dword ptr [rdi-2147483648], r11d
        lea     rcx, [rdi-2147483648]
        lea     r12, [rdi-2147483648]
        mov     rax, [r8]
        mov     r9, qword ptr [r8]
        mov     [r8], rax
        mov     [r8], r10
        mov     eax, dword ptr [r8]
        mov     dword ptr [r8], r11d
        lea     rcx, [r8]
        lea     r12, [r8]
        mov     rax, [r8+8]
        mov     r9, qword ptr [r8+8]
        mov     [r8+8], rax
        mov     [r8+8], r10
        mov     eax, dword ptr [r8+8]
        mov     dword ptr [r8+8], r11d
        lea     rcx, [r8+8]
        lea     r12, [r8+8]
        mov     rax, [r8-8]
        mov     r9, qword ptr [r8-8]
        mov     [r8-8], rax
        mov     [r8-8], r10
        mov     eax, dword ptr [r8-8]
        mov     dword ptr [r8-8], r11d
        lea     rcx, [r8-8]
        lea     r12, [r8-8]
        mov     rax, [r8+127]
        mov     r9, qword ptr [r8+127]
        mov     [r8+127], rax
        mov     [r8+127], r10
        mov     eax, dword ptr [r8+127]
        mov     dword ptr [r8+127], r11d
        lea     rcx, [r8+127]
        lea     r12, [r8+127]
        mov     rax, [r8-128]
        mov     r9, qword ptr [r8-128]
        mov     [r8-128], rax
        mov     [r8-128], r10
        mov     eax, dword ptr [r8-128]
        mov     dword ptr [r8-128], r11d
        lea     rcx, [r8-128]
        lea     r12, [r8-128]
        mov     rax, [r8+128]
        mov     r9, qword ptr [r8+128]
        mov     [r8+128], rax
        mov     [r8+128], r10
        mov     eax, dword ptr [r8+128]
        mov     dword ptr [r8+128], r11d
        lea     rcx, [r8+128]
        lea     r12, [r8+128]
        mov     rax, [r8-129]
        mov     r9, qword ptr [r8-129]
        mov     [r8-129], rax
        mov     [r8-129], r10
        mov     eax, dword ptr [r8-129]
        mov     dword ptr [r8-129], r11d
        lea     rcx, [r8-129]
        lea     r12, [r8-129]
        mov     rax, [r8+1000]
        mov     r9, qword ptr [r8+1000]
        mov     [r8+1000], rax
        mov     [r8+1000], r10
        mov     eax, dword ptr [r8+1000]
        mov     dword ptr [r8+1000], r11d
        lea     rcx, [r8+1000]
        lea     r12, [r8+1000]
        mov     rax, [r8-1000]
        mov     r9, qword ptr [r8-1000]
        mov     [r8-1000], rax
        mov     [r8-1000], r10
        mov     eax, dword ptr [r8-1000]
        mov     dword ptr [r8-1000], r11d
        lea     rcx, [r8-1000]
        lea     r12, [r8-1000]
        mov     rax, [r8+7FFFFFFFh]
        mov     r9, qword ptr [r8+7FFFFFFFh]
        mov     [r8+7FFFFFFFh], rax
        mov     [r8+7FFFFFFFh], r10
        mov     eax, dword ptr [r8+7FFFFFFFh]
        mov     dword ptr [r8+7FFFFFFFh], r11d
        lea     rcx, [r8+7FFFFFFFh]
        lea     r12, [r8+7FFFFFFFh]
        mov     rax, [r8-2147483648]
        mov     r9, qword ptr [r8-2147483648]
        mov     [r8-2147483648], rax
        mov     [r8-2147483648], r10
        mov     eax, dword ptr [r8-2147483648]
        mov     dword ptr [r8-2147483648], r11d
        lea     rcx, [r8-2147483648]
        lea     r12, [r8-2147483648]
        mov     rax, [r9]
        mov     r9, qword ptr [r9]
        mov     [r9], rax
        mov     [r9], r10
        mov     eax, dword ptr [r9]
        mov     dword ptr [r9], r11d
        lea     rcx, [r9]
        lea     r12, [r9]
        mov     rax, [r9+8]
        mov     r9, qword ptr [r9+8]
        mov     [r9+8], rax
        mov     [r9+8], r10
        mov     eax, dword ptr [r9+8]
        mov     dword ptr [r9+8], r11d
        lea     rcx, [r9+8]
        lea     r12, [r9+8]
        mov     rax, [r9-8]
        mov     r9, qword ptr [r9-8]
        mov     [r9-8], rax
        mov     [r9-8], r10
        mov     eax, dword ptr [r9-8]
        mov     dword ptr [r9-8], r11d
        lea     rcx, [r9-8]
        lea     r12, [r9-8]
        mov     rax, [r9+127]
        mov     r9, qword ptr [r9+127]
        mov     [r9+127], rax
        mov     [r9+127], r10
        mov     eax, dword ptr [r9+127]
        mov     dword ptr [r9+127], r11d
        lea     rcx, [r9+127]
        lea     r12, [r9+127]
        mov     rax, [r9-128]
        mov     r9, qword ptr [r9-128]
        mov     [r9-128], rax
        mov     [r9-128], r10
        mov     eax, dword ptr [r9-128]
        mov     dword ptr [r9-128], r11d
        lea     rcx, [r9-128]
        lea     r12, [r9-128]
        mov     rax, [r9+128]
        mov     r9, qword ptr [r9+128]
        mov     [r9+128], rax
        mov     [r9+128], r10
        mov     eax, dword ptr [r9+128]
        mov     dword ptr [r9+128], r11d
        lea     rcx, [r9+128]
        lea     r12, [r9+128]
        mov     rax, [r9-129]
        mov     r9, qword ptr [r9-129]
        mov     [r9-129], rax
        mov     [r9-129], r10
        mov     eax, dword ptr [r9-129]
        mov     dword ptr [r9-129], r11d
        lea     rcx, [r9-129]
        lea     r12, [r9-129]
        mov     rax, [r9+1000]
        mov     r9, qword ptr [r9+1000]
        mov     [r9+1000], rax
        mov     [r9+1000], r10
        mov     eax, dword ptr [r9+1000]
        mov     dword ptr [r9+1000], r11d
        lea     rcx, [r9+1000]
        lea     r12, [r9+1000]
        mov     rax, [r9-1000]
        mov     r9, qword ptr [r9-1000]
        mov     [r9-1000], rax
        mov     [r9-1000], r10
        mov     eax, dword ptr [r9-1000]
        mov     dword ptr [r9-1000], r11d
        lea     rcx, [r9-1000]
        lea     r12, [r9-1000]
        mov     rax, [r9+7FFFFFFFh]
        mov     r9, qword ptr [r9+7FFFFFFFh]
        mov     [r9+7FFFFFFFh], rax
        mov     [r9+7FFFFFFFh], r10
        mov     eax, dword ptr [r9+7FFFFFFFh]
        mov     dword ptr [r9+7FFFFFFFh], r11d
        lea     rcx, [r9+7FFFFFFFh]
        lea     r12, [r9+7FFFFFFFh]
        mov     rax, [r9-2147483648]
        mov     r9, qword ptr [r9-2147483648]
        mov     [r9-2147483648], rax
        mov     [r9-2147483648], r10
        mov     eax, dword ptr [r9-2147483648]
        mov     dword ptr [r9-2147483648], r11d
        lea     rcx, [r9-2147483648]
        lea     r12, [r9-2147483648]
        mov     rax, [r10]
        mov     r9, qword ptr [r10]
        mov     [r10], rax
        mov     [r10], r10
        mov     eax, dword ptr [r10]
        mov     dword ptr [r10], r11d
        lea     rcx, [r10]
        lea     r12, [r10]
        mov     rax, [r10+8]
        mov     r9, qword ptr [r10+8]
        mov     [r10+8], rax
        mov     [r10+8], r10
        mov     eax, dword ptr [r10+8]
        mov     dword ptr [r10+8], r11d
        lea     rcx, [r10+8]
        lea     r12, [r10+8]
        mov     rax, [r10-8]
        mov     r9, qword ptr [r10-8]
        mov     [r10-8], rax
        mov     [r10-8], r10
        mov     eax, dword ptr [r10-8]
        mov     dword ptr [r10-8], r11d
        lea     rcx, [r10-8]
        lea     r12, [r10-8]
        mov     rax, [r10+127]
        mov     r9, qword ptr [r10+127]
        mov     [r10+127], rax
        mov     [r10+127], r10
        mov     eax, dword ptr [r10+127]
        mov     dword ptr [r10+127], r11d
        lea     rcx, [r10+127]
        lea     r12, [r10+127]
        mov     rax, [r10-128]
        mov     r9, qword ptr [r10-128]
        mov     [r10-128], rax
        mov     [r10-128], r10
        mov     eax, dword ptr [r10-128]
        mov     dword ptr [r10-128], r11d
        lea     rcx, [r10-128]
        lea     r12, [r10-128]
        mov     rax, [r10+128]
        mov     r9, qword ptr [r10+128]
        mov     [r10+128], rax
        mov     [r10+128], r10
        mov     eax, dword ptr [r10+128]
        mov     dword ptr [r10+128], r11d
        lea     rcx, [r10+128]
        lea     r12, [r10+128]
        mov     rax, [r10-129]
        mov     r9, qword ptr [r10-129]
        mov     [r10-129], rax
        mov     [r10-129], r10
        mov     eax, dword ptr [r10-129]
        mov     dword ptr [r10-129], r11d
        lea     rcx, [r10-129]
        lea     r12, [r10-129]
        mov     rax, [r10+1000]
        mov     r9, qword ptr [r10+1000]
        mov     [r10+1000], rax
        mov     [r10+1000], r10
        mov     eax, dword ptr [r10+1000]
        mov     dword ptr [r10+1000], r11d
        lea     rcx, [r10+1000]
        lea     r12, [r10+1000]
        mov     rax, [r10-1000]
        mov     r9, qword ptr [r10-1000]
        mov     [r10-1000], rax
        mov     [r10-1000], r10
        mov     eax, dword ptr [r10-1000]
        mov     dword ptr [r10-1000], r11d
        lea     rcx, [r10-1000]
        lea     r12, [r10-1000]
        mov     rax, [r10+7FFFFFFFh]
        mov     r9, qword ptr [r10+7FFFFFFFh]
        mov     [r10+7FFFFFFFh], rax
        mov     [r10+7FFFFFFFh], r10
        mov     eax, dword ptr [r10+7FFFFFFFh]
        mov     dword ptr [r10+7FFFFFFFh], r11d
        lea     rcx, [r10+7FFFFFFFh]
        lea     r12, [r10+7FFFFFFFh]
        mov     rax, [r10-2147483648]
        mov     r9, qword ptr [r10-2147483648]
        mov     [r10-2147483648], rax
        mov     [r10-2147483648], r10
        mov     eax, dword ptr [r10-2147483648]
        mov     dword ptr [r10-2147483648], r11d
        lea     rcx, [r10-2147483648]
        lea     r12, [r10-2147483648]
        mov     rax, [r11]
        mov     r9, qword ptr [r11]
        mov     [r11], rax
        mov     [r11], r10
        mov     eax, dword ptr [r11]
        mov     dword ptr [r11], r11d
        lea     rcx, [r11]
        lea     r12, [r11]
        mov     rax, [r11+8]
        mov     r9, qword ptr [r11+8]
        mov     [r11+8], rax
        mov     [r11+8], r10
        mov     eax, dword ptr [r11+8]
        mov     dword ptr [r11+8], r11d
        lea     rcx, [r11+8]
        lea     r12, [r11+8]
        mov     rax, [r11-8]
        mov     r9, qword ptr [r11-8]
        mov     [r11-8], rax
        mov     [r11-8], r10
        mov     eax, dword ptr [r11-8]
        mov     dword ptr [r11-8], r11d
        lea     rcx, [r11-8]
        lea     r12, [r11-8]
        mov     rax, [r11+127]
        mov     r9, qword ptr [r11+127]
        mov     [r11+127], rax
        mov     [r11+127], r10
        mov     eax, dword ptr [r11+127]
        mov     dword ptr [r11+127], r11d
        lea     rcx, [r11+127]
        lea     r12, [r11+127]
        mov     rax, [r11-128]
        mov     r9, qword ptr [r11-128]
        mov     [r11-128], rax
        mov     [r11-128], r10
        mov     eax, dword ptr [r11-128]
        mov     dword ptr [r11-128], r11d
        lea     rcx, [r11-128]
        lea     r12, [r11-128]
        mov     rax, [r11+128]
        mov     r9, qword ptr [r11+128]
        mov     [r11+128], rax
        mov     [r11+128], r10
        mov     eax, dword ptr [r11+128]
        mov     dword ptr [r11+128], r11d
        lea     rcx, [r11+128]
        lea     r12, [r11+128]
        mov     rax, [r11-129]
        mov     r9, qword ptr [r11-129]
        mov     [r11-129], rax
        mov     [r11-129], r10
        mov     eax, dword ptr [r11-129]
        mov     dword ptr [r11-129], r11d
        lea     rcx, [r11-129]
        lea     r12, [r11-129]
        mov     rax, [r11+1000]
        mov     r9, qword ptr [r11+1000]
        mov     [r11+1000], rax
        mov     [r11+1000], r10
        mov     eax, dword ptr [r11+1000]
        mov     dword ptr [r11+1000], r11d
        lea     rcx, [r11+1000]
        lea     r12, [r11+1000]
        mov     rax, [r11-1000]
        mov     r9, qword ptr [r11-1000]
        mov     [r11-1000], rax
        mov     [r11-1000], r10
        mov     eax, dword ptr [r11-1000]
        mov     dword ptr [r11-1000], r11d
        lea     rcx, [r11-1000]
        lea     r12, [r11-1000]
        mov     rax, [r11+7FFFFFFFh]
        mov     r9, qword ptr [r11+7FFFFFFFh]
        mov     [r11+7FFFFFFFh], rax
        mov     [r11+7FFFFFFFh], r10
        mov     eax, dword ptr [r11+7FFFFFFFh]
        mov     dword ptr [r11+7FFFFFFFh], r11d
        lea     rcx, [r11+7FFFFFFFh]
        lea     r12, [r11+7FFFFFFFh]
        mov     rax, [r11-2147483648]
        mov     r9, qword ptr [r11-2147483648]
        mov     [r11-2147483648], rax
        mov     [r11-2147483648], r10
        mov     eax, dword ptr [r11-2147483648]
        mov     dword ptr [r11-2147483648], r11d
        lea     rcx, [r11-2147483648]
        lea     r12, [r11-2147483648]
        mov     rax, [r12]
        mov     r9, qword ptr [r12]
        mov     [r12], rax
        mov     [r12], r10
        mov     eax, dword ptr [r12]
        mov     dword ptr [r12], r11d
        lea     rcx, [r12]
        lea     r12, [r12]
        mov     rax, [r12+8]
        mov     r9, qword ptr [r12+8]
        mov     [r12+8], rax
        mov     [r12+8], r10
        mov     eax, dword ptr [r12+8]
        mov     dword ptr [r12+8], r11d
        lea     rcx, [r12+8]
        lea     r12, [r12+8]
        mov     rax, [r12-8]
        mov     r9, qword ptr [r12-8]
        mov     [r12-8], rax
        mov     [r12-8], r10
        mov     eax, dword ptr [r12-8]
        mov     dword ptr [r12-8], r11d
        lea     rcx, [r12-8]
        lea     r12, [r12-8]
        mov     rax, [r12+127]
        mov     r9, qword ptr [r12+127]
        mov     [r12+127], rax
        mov     [r12+127], r10
        mov     eax, dword ptr [r12+127]
        mov     dword ptr [r12+127], r11d
        lea     rcx, [r12+127]
        lea     r12, [r12+127]
        mov     rax, [r12-128]
        mov     r9, qword ptr [r12-128]
        mov     [r12-128], rax
        mov     [r12-128], r10
        mov     eax, dword ptr [r12-128]
        mov     dword ptr [r12-128], r11d
        lea     rcx, [r12-128]
        lea     r12, [r12-128]
        mov     rax, [r12+128]
        mov     r9, qword ptr [r12+128]
        mov     [r12+128], rax
        mov     [r12+128], r10
        mov     eax, dword ptr [r12+128]
        mov     dword ptr [r12+128], r11d
        lea     rcx, [r12+128]
        lea     r12, [r12+128]
        mov     rax, [r12-129]
        mov     r9, qword ptr [r12-129]
        mov     [r12-129], rax
        mov     [r12-129], r10
        mov     eax, dword ptr [r12-129]
        mov     dword ptr [r12-129], r11d
        lea     rcx, [r12-129]
        lea     r12, [r12-129]
        mov     rax, [r12+1000]
        mov     r9, qword ptr [r12+1000]
        mov     [r12+1000], rax
        mov     [r12+1000], r10
        mov     eax, dword ptr [r12+1000]
        mov     dword ptr [r12+1000], r11d
        lea     rcx, [r12+1000]
        lea     r12, [r12+1000]
        mov     rax, [r12-1000]
        mov     r9, qword ptr [r12-1000]
        mov     [r12-1000], rax
        mov     [r12-1000], r10
        mov     eax, dword ptr [r12-1000]
        mov     dword ptr [r12-1000], r11d
        lea     rcx, [r12-1000]
        lea     r12, [r12-1000]
        mov     rax, [r12+7FFFFFFFh]
        mov     r9, qword ptr [r12+7FFFFFFFh]
        mov     [r12+7FFFFFFFh], rax
        mov     [r12+7FFFFFFFh], r10
        mov     eax, dword ptr [r12+7FFFFFFFh]
        mov     dword ptr [r12+7FFFFFFFh], r11d
        lea     rcx, [r12+7FFFFFFFh]
        lea     r12, [r12+7FFFFFFFh]
        mov     rax, [r12-2147483648]
        mov     r9, qword ptr [r12-2147483648]
        mov     [r12-2147483648], rax
        mov     [r12-2147483648], r10
        mov     eax, dword ptr [r12-2147483648]
        mov     dword ptr [r12-2147483648], r11d
        lea     rcx, [r12-2147483648]
        lea     r12, [r12-2147483648]
        mov     rax, [r13]
        mov     r9, qword ptr [r13]
        mov     [r13], rax
        mov     [r13], r10
        mov     eax, dword ptr [r13]
        mov     dword ptr [r13], r11d
        lea     rcx, [r13]
        lea     r12, [r13]
        mov     rax, [r13+8]
        mov     r9, qword ptr [r13+8]
        mov     [r13+8], rax
        mov     [r13+8], r10
        mov     eax, dword ptr [r13+8]
        mov     dword ptr [r13+8], r11d
        lea     rcx, [r13+8]
        lea     r12, [r13+8]
        mov     rax, [r13-8]
        mov     r9, qword ptr [r13-8]
        mov     [r13-8], rax
        mov     [r13-8], r10
        mov     eax, dword ptr [r13-8]
        mov     dword ptr [r13-8], r11d
        lea     rcx, [r13-8]
        lea     r12, [r13-8]
        mov     rax, [r13+127]
        mov     r9, qword ptr [r13+127]
        mov     [r13+127], rax
        mov     [r13+127], r10
        mov     eax, dword ptr [r13+127]
        mov     dword ptr [r13+127], r11d
        lea     rcx, [r13+127]
        lea     r12, [r13+127]
        mov     rax, [r13-128]
        mov     r9, qword ptr [r13-128]
        mov     [r13-128], rax
        mov     [r13-128], r10
        mov     eax, dword ptr [r13-128]
        mov     dword ptr [r13-128], r11d
        lea     rcx, [r13-128]
        lea     r12, [r13-128]
        mov     rax, [r13+128]
        mov     r9, qword ptr [r13+128]
        mov     [r13+128], rax
        mov     [r13+128], r10
        mov     eax, dword ptr [r13+128]
        mov     dword ptr [r13+128], r11d
        lea     rcx, [r13+128]
        lea     r12, [r13+128]
        mov     rax, [r13-129]
        mov     r9, qword ptr [r13-129]
        mov     [r13-129], rax
        mov     [r13-129], r10
        mov     eax, dword ptr [r13-129]
        mov     dword ptr [r13-129], r11d
        lea     rcx, [r13-129]
        lea     r12, [r13-129]
        mov     rax, [r13+1000]
        mov     r9, qword ptr [r13+1000]
        mov     [r13+1000], rax
        mov     [r13+1000], r10
        mov     eax, dword ptr [r13+1000]
        mov     dword ptr [r13+1000], r11d
        lea     rcx, [r13+1000]
        lea     r12, [r13+1000]
        mov     rax, [r13-1000]
        mov     r9, qword ptr [r13-1000]
        mov     [r13-1000], rax
        mov     [r13-1000], r10
        mov     eax, dword ptr [r13-1000]
        mov     dword ptr [r13-1000], r11d
        lea     rcx, [r13-1000]
        lea     r12, [r13-1000]
        mov     rax, [r13+7FFFFFFFh]
        mov     r9, qword ptr [r13+7FFFFFFFh]
        mov     [r13+7FFFFFFFh], rax
        mov     [r13+7FFFFFFFh], r10
        mov     eax, dword ptr [r13+7FFFFFFFh]
        mov     dword ptr [r13+7FFFFFFFh], r11d
        lea     rcx, [r13+7FFFFFFFh]
        lea     r12, [r13+7FFFFFFFh]
        mov     rax, [r13-2147483648]
        mov     r9, qword ptr [r13-2147483648]
        mov     [r13-2147483648], rax
        mov     [r13-2147483648], r10
        mov     eax, dword ptr [r13-2147483648]
        mov     dword ptr [r13-2147483648], r11d
        lea     rcx, [r13-2147483648]
        lea     r12, [r13-2147483648]
        mov     rax, [r14]
        mov     r9, qword ptr [r14]
        mov     [r14], rax
        mov     [r14], r10
        mov     eax, dword ptr [r14]
        mov     dword ptr [r14], r11d
        lea     rcx, [r14]
        lea     r12, [r14]
        mov     rax, [r14+8]
        mov     r9, qword ptr [r14+8]
        mov     [r14+8], rax
        mov     [r14+8], r10
        mov     eax, dword ptr [r14+8]
        mov     dword ptr [r14+8], r11d
        lea     rcx, [r14+8]
        lea     r12, [r14+8]
        mov     rax, [r14-8]
        mov     r9, qword ptr [r14-8]
        mov     [r14-8], rax
        mov     [r14-8], r10
        mov     eax, dword ptr [r14-8]
        mov     dword ptr [r14-8], r11d
        lea     rcx, [r14-8]
        lea     r12, [r14-8]
        mov     rax, [r14+127]
        mov     r9, qword ptr [r14+127]
        mov     [r14+127], rax
        mov     [r14+127], r10
        mov     eax, dword ptr [r14+127]
        mov     dword ptr [r14+127], r11d
        lea     rcx, [r14+127]
        lea     r12, [r14+127]
        mov     rax, [r14-128]
        mov     r9, qword ptr [r14-128]
        mov     [r14-128], rax
        mov     [r14-128], r10
        mov     eax, dword ptr [r14-128]
        mov     dword ptr [r14-128], r11d
        lea     rcx, [r14-128]
        lea     r12, [r14-128]
        mov     rax, [r14+128]
        mov     r9, qword ptr [r14+128]
        mov     [r14+128], rax
        mov     [r14+128], r10
        mov     eax, dword ptr [r14+128]
        mov     dword ptr [r14+128], r11d
        lea     rcx, [r14+128]
        lea     r12, [r14+128]
        mov     rax, [r14-129]
        mov     r9, qword ptr [r14-129]
        mov     [r14-129], rax
        mov     [r14-129], r10
        mov     eax, dword ptr [r14-129]
        mov     dword ptr [r14-129], r11d
        lea     rcx, [r14-129]
        lea     r12, [r14-129]
        mov     rax, [r14+1000]
        mov     r9, qword ptr [r14+1000]
        mov     [r14+1000], rax
        mov     [r14+1000], r10
        mov     eax, dword ptr [r14+1000]
        mov     dword ptr [r14+1000], r11d
        lea     rcx, [r14+1000]
        lea     r12, [r14+1000]
        mov     rax, [r14-1000]
        mov     r9, qword ptr [r14-1000]
        mov     [r14-1000], rax
        mov     [r14-1000], r10
        mov     eax, dword ptr [r14-1000]
        mov     dword ptr [r14-1000], r11d
        lea     rcx, [r14-1000]
        lea     r12, [r14-1000]
        mov     rax, [r14+7FFFFFFFh]
        mov     r9, qword ptr [r14+7FFFFFFFh]
        mov     [r14+7FFFFFFFh], rax
        mov     [r14+7FFFFFFFh], r10
        mov     eax, dword ptr [r14+7FFFFFFFh]
        mov     dword ptr [r14+7FFFFFFFh], r11d
        lea     rcx, [r14+7FFFFFFFh]
        lea     r12, [r14+7FFFFFFFh]
        mov     rax, [r14-2147483648]
        mov     r9, qword ptr [r14-2147483648]
        mov     [r14-2147483648], rax
        mov     [r14-2147483648], r10
        mov     eax, dword ptr [r14-2147483648]
        mov     dword ptr [r14-2147483648], r11d
        lea     rcx, [r14-2147483648]
        lea     r12, [r14-2147483648]
        mov     rax, [r15]
        mov     r9, qword ptr [r15]
        mov     [r15], rax
        mov     [r15], r10
        mov     eax, dword ptr [r15]
        mov     dword ptr [r15], r11d
        lea     rcx, [r15]
        lea     r12, [r15]
        mov     rax, [r15+8]
        mov     r9, qword ptr [r15+8]
        mov     [r15+8], rax
        mov     [r15+8], r10
        mov     eax, dword ptr [r15+8]
        mov     dword ptr [r15+8], r11d
        lea     rcx, [r15+8]
        lea     r12, [r15+8]
        mov     rax, [r15-8]
        mov     r9, qword ptr [r15-8]
        mov     [r15-8], rax
        mov     [r15-8], r10
        mov     eax, dword ptr [r15-8]
        mov     dword ptr [r15-8], r11d
        lea     rcx, [r15-8]
        lea     r12, [r15-8]
        mov     rax, [r15+127]
        mov     r9, qword ptr [r15+127]
        mov     [r15+127], rax
        mov     [r15+127], r10
        mov     eax, dword ptr [r15+127]
        mov     dword ptr [r15+127], r11d
        lea     rcx, [r15+127]
        lea     r12, [r15+127]
        mov     rax, [r15-128]
        mov     r9, qword ptr [r15-128]
        mov     [r15-128], rax
        mov     [r15-128], r10
        mov     eax, dword ptr [r15-128]
        mov     dword ptr [r15-128], r11d
        lea     rcx, [r15-128]
        lea     r12, [r15-128]
        mov     rax, [r15+128]
        mov     r9, qword ptr [r15+128]
        mov     [r15+128], rax
        mov     [r15+128], r10
        mov     eax, dword ptr [r15+128]
        mov     dword ptr [r15+128], r11d
        lea     rcx, [r15+128]
        lea     r12, [r15+128]
        mov     rax, [r15-129]
        mov     r9, qword ptr [r15-129]
        mov     [r15-129], rax
        mov     [r15-129], r10
        mov     eax, dword ptr [r15-129]
        mov     dword ptr [r15-129], r11d
        lea     rcx, [r15-129]
        lea     r12, [r15-129]
        mov     rax, [r15+1000]
        mov     r9, qword ptr [r15+1000]
        mov     [r15+1000], rax
        mov     [r15+1000], r10
        mov     eax, dword ptr [r15+1000]
        mov     dword ptr [r15+1000], r11d
        lea     rcx, [r15+1000]
        lea     r12, [r15+1000]
        mov     rax, [r15-1000]
        mov     r9, qword ptr [r15-1000]
        mov     [r15-1000], rax
        mov     [r15-1000], r10
        mov     eax, dword ptr [r15-1000]
        mov     dword ptr [r15-1000], r11d
        lea     rcx, [r15-1000]
        lea     r12, [r15-1000]
        mov     rax, [r15+7FFFFFFFh]
        mov     r9, qword ptr [r15+7FFFFFFFh]
        mov     [r15+7FFFFFFFh], rax
        mov     [r15+7FFFFFFFh], r10
        mov     eax, dword ptr [r15+7FFFFFFFh]
        mov     dword ptr [r15+7FFFFFFFh], r11d
        lea     rcx, [r15+7FFFFFFFh]
        lea     r12, [r15+7FFFFFFFh]
        mov     rax, [r15-2147483648]
        mov     r9, qword ptr [r15-2147483648]
        mov     [r15-2147483648], rax
        mov     [r15-2147483648], r10
        mov     eax, dword ptr [r15-2147483648]
        mov     dword ptr [r15-2147483648], r11d
        lea     rcx, [r15-2147483648]
        lea     r12, [r15-2147483648]
        mov     rax, [rax*1]
        mov     rax, [rax*1+16]
        mov     rax, [rax*1-16]
        lea     rax, [rax*1+1000]
        mov     rax, [rax+rax*1]
        mov     rax, [rax+rax*1+8]
        mov     rax, [rax+rax*1-8]
        mov     rax, [rax+rax*1+1000]
        mov     [rax+rax*1+1000], r8
        lea     r14, [rax+rax*1-1000]
        mov     rax, [rbx+rax*1]
        mov     rax, [rbx+rax*1+8]
        mov     rax, [rbx+rax*1-8]
        mov     rax, [rbx+rax*1+1000]
        mov     [rbx+rax*1+1000], r8
        lea     r14, [rbx+rax*1-1000]
        mov     rax, [rsp+rax*1]
        mov     rax, [rsp+rax*1+8]
        mov     rax, [rsp+rax*1-8]
        mov     rax, [rsp+rax*1+1000]
        mov     [rsp+rax*1+1000], r8
        lea     r14, [rsp+rax*1-1000]
        mov     rax, [rbp+rax*1]
        mov     rax, [rbp+rax*1+8]
        mov     rax, [rbp+rax*1-8]
        mov     rax, [rbp+rax*1+1000]
        mov     [rbp+rax*1+1000], r8
        lea     r14, [rbp+rax*1-1000]
        mov     rax, [r12+rax*1]
        mov     rax, [r12+rax*1+8]
        mov     rax, [r12+rax*1-8]
        mov     rax, [r12+rax*1+1000]
        mov     [r12+rax*1+1000], r8
        lea     r14, [r12+rax*1-1000]
        mov     rax, [r13+rax*1]
        mov     rax, [r13+rax*1+8]
        mov     rax, [r13+rax*1-8]
        mov     rax, [r13+rax*1+1000]
        mov     [r13+rax*1+1000], r8
        lea     r14, [r13+rax*1-1000]
        mov     rax, [r15+rax*1]
        mov     rax, [r15+rax*1+8]
        mov     rax, [r15+rax*1-8]
        mov     rax, [r15+rax*1+1000]
        mov     [r15+rax*1+1000], r8
        lea     r14, [r15+rax*1-1000]
        mov     rax, [rax*2]
        mov     rax, [rax*2+16]
        mov     rax, [rax*2-16]
        lea     rax, [rax*2+1000]
        mov     rax, [rax+rax*2]
        mov     rax, [rax+rax*2+8]
        mov     rax, [rax+rax*2-8]
        mov     rax, [rax+rax*2+1000]
        mov     [rax+rax*2+1000], r8
        lea     r14, [rax+rax*2-1000]
        mov     rax, [rbx+rax*2]
        mov     rax, [rbx+rax*2+8]
        mov     rax, [rbx+rax*2-8]
        mov     rax, [rbx+rax*2+1000]
        mov     [rbx+rax*2+1000], r8
        lea     r14, [rbx+rax*2-1000]
        mov     rax, [rsp+rax*2]
        mov     rax, [rsp+rax*2+8]
        mov     rax, [rsp+rax*2-8]
        mov     rax, [rsp+rax*2+1000]
        mov     [rsp+rax*2+1000], r8
        lea     r14, [rsp+rax*2-1000]
        mov     rax, [rbp+rax*2]
        mov     rax, [rbp+rax*2+8]
        mov     rax, [rbp+rax*2-8]
        mov     rax, [rbp+rax*2+1000]
        mov     [rbp+rax*2+1000], r8
        lea     r14, [rbp+rax*2-1000]
        mov     rax, [r12+rax*2]
        mov     rax, [r12+rax*2+8]
        mov     rax, [r12+rax*2-8]
        mov     rax, [r12+rax*2+1000]
        mov     [r12+rax*2+1000], r8
        lea     r14, [r12+rax*2-1000]
        mov     rax, [r13+rax*2]
        mov     rax, [r13+rax*2+8]
        mov     rax, [r13+rax*2-8]
        mov     rax, [r13+rax*2+1000]
        mov     [r13+rax*2+1000], r8
        lea     r14, [r13+rax*2-1000]
        mov     rax, [r15+rax*2]
        mov     rax, [r15+rax*2+8]
        mov     rax, [r15+rax*2-8]
        mov     rax, [r15+rax*2+1000]
        mov     [r15+rax*2+1000], r8
        lea     r14, [r15+rax*2-1000]
        mov     rax, [rax*4]
        mov     rax, [rax*4+16]
        mov     rax, [rax*4-16]
        lea     rax, [rax*4+1000]
        mov     rax, [rax+rax*4]
        mov     rax, [rax+rax*4+8]
        mov     rax, [rax+rax*4-8]
        mov     rax, [rax+rax*4+1000]
        mov     [rax+rax*4+1000], r8
        lea     r14, [rax+rax*4-1000]
        mov     rax, [rbx+rax*4]
        mov     rax, [rbx+rax*4+8]
        mov     rax, [rbx+rax*4-8]
        mov     rax, [rbx+rax*4+1000]
        mov     [rbx+rax*4+1000], r8
        lea     r14, [rbx+rax*4-1000]
        mov     rax, [rsp+rax*4]
        mov     rax, [rsp+rax*4+8]
        mov     rax, [rsp+rax*4-8]
        mov     rax, [rsp+rax*4+1000]
        mov     [rsp+rax*4+1000], r8
        lea     r14, [rsp+rax*4-1000]
        mov     rax, [rbp+rax*4]
        mov     rax, [rbp+rax*4+8]
        mov     rax, [rbp+rax*4-8]
        mov     rax, [rbp+rax*4+1000]
        mov     [rbp+rax*4+1000], r8
        lea     r14, [rbp+rax*4-1000]
        mov     rax, [r12+rax*4]
        mov     rax, [r12+rax*4+8]
        mov     rax, [r12+rax*4-8]
        mov     rax, [r12+rax*4+1000]
        mov     [r12+rax*4+1000], r8
        lea     r14, [r12+rax*4-1000]
        mov     rax, [r13+rax*4]
        mov     rax, [r13+rax*4+8]
        mov     rax, [r13+rax*4-8]
        mov     rax, [r13+rax*4+1000]
        mov     [r13+rax*4+1000], r8
        lea     r14, [r13+rax*4-1000]
        mov     rax, [r15+rax*4]
        mov     rax, [r15+rax*4+8]
        mov     rax, [r15+rax*4-8]
        mov     rax, [r15+rax*4+1000]
        mov     [r15+rax*4+1000], r8
        lea     r14, [r15+rax*4-1000]
        mov     rax, [rax*8]
        mov     rax, [rax*8+16]
        mov     rax, [rax*8-16]
        lea     rax, [rax*8+1000]
        mov     rax, [rax+rax*8]
        mov     rax, [rax+rax*8+8]
        mov     rax, [rax+rax*8-8]
        mov     rax, [rax+rax*8+1000]
        mov     [rax+rax*8+1000], r8
        lea     r14, [rax+rax*8-1000]
        mov     rax, [rbx+rax*8]
        mov     rax, [rbx+rax*8+8]
        mov     rax, [rbx+rax*8-8]
        mov     rax, [rbx+rax*8+1000]
        mov     [rbx+rax*8+1000], r8
        lea     r14, [rbx+rax*8-1000]
        mov     rax, [rsp+rax*8]
        mov     rax, [rsp+rax*8+8]
        mov     rax, [rsp+rax*8-8]
        mov     rax, [rsp+rax*8+1000]
        mov     [rsp+rax*8+1000], r8
        lea     r14, [rsp+rax*8-1000]
        mov     rax, [rbp+rax*8]
        mov     rax, [rbp+rax*8+8]
        mov     rax, [rbp+rax*8-8]
        mov     rax, [rbp+rax*8+1000]
        mov     [rbp+rax*8+1000], r8
        lea     r14, [rbp+rax*8-1000]
        mov     rax, [r12+rax*8]
        mov     rax, [r12+rax*8+8]
        mov     rax, [r12+rax*8-8]
        mov     rax, [r12+rax*8+1000]
        mov     [r12+rax*8+1000], r8
        lea     r14, [r12+rax*8-1000]
        mov     rax, [r13+rax*8]
        mov     rax, [r13+rax*8+8]
        mov     rax, [r13+rax*8-8]
        mov     rax, [r13+rax*8+1000]
        mov     [r13+rax*8+1000], r8
        lea     r14, [r13+rax*8-1000]
        mov     rax, [r15+rax*8]
        mov     rax, [r15+rax*8+8]
        mov     rax, [r15+rax*8-8]
        mov     rax, [r15+rax*8+1000]
        mov     [r15+rax*8+1000], r8
        lea     r14, [r15+rax*8-1000]
        mov     rax, [rcx*1]
        mov     rax, [rcx*1+16]
        mov     rax, [rcx*1-16]
        lea     rax, [rcx*1+1000]
        mov     rax, [rax+rcx*1]
        mov     rax, [rax+rcx*1+8]
        mov     rax, [rax+rcx*1-8]
        mov     rax, [rax+rcx*1+1000]
        mov     [rax+rcx*1+1000], r8
        lea     r14, [rax+rcx*1-1000]
        mov     rax, [rbx+rcx*1]
        mov     rax, [rbx+rcx*1+8]
        mov     rax, [rbx+rcx*1-8]
        mov     rax, [rbx+rcx*1+1000]
        mov     [rbx+rcx*1+1000], r8
        lea     r14, [rbx+rcx*1-1000]
        mov     rax, [rsp+rcx*1]
        mov     rax, [rsp+rcx*1+8]
        mov     rax, [rsp+rcx*1-8]
        mov     rax, [rsp+rcx*1+1000]
        mov     [rsp+rcx*1+1000], r8
        lea     r14, [rsp+rcx*1-1000]
        mov     rax, [rbp+rcx*1]
        mov     rax, [rbp+rcx*1+8]
        mov     rax, [rbp+rcx*1-8]
        mov     rax, [rbp+rcx*1+1000]
        mov     [rbp+rcx*1+1000], r8
        lea     r14, [rbp+rcx*1-1000]
        mov     rax, [r12+rcx*1]
        mov     rax, [r12+rcx*1+8]
        mov     rax, [r12+rcx*1-8]
        mov     rax, [r12+rcx*1+1000]
        mov     [r12+rcx*1+1000], r8
        lea     r14, [r12+rcx*1-1000]
        mov     rax, [r13+rcx*1]
        mov     rax, [r13+rcx*1+8]
        mov     rax, [r13+rcx*1-8]
        mov     rax, [r13+rcx*1+1000]
        mov     [r13+rcx*1+1000], r8
        lea     r14, [r13+rcx*1-1000]
        mov     rax, [r15+rcx*1]
        mov     rax, [r15+rcx*1+8]
        mov     rax, [r15+rcx*1-8]
        mov     rax, [r15+rcx*1+1000]
        mov     [r15+rcx*1+1000], r8
        lea     r14, [r15+rcx*1-1000]
        mov     rax, [rcx*2]
        mov     rax, [rcx*2+16]
        mov     rax, [rcx*2-16]
        lea     rax, [rcx*2+1000]
        mov     rax, [rax+rcx*2]
        mov     rax, [rax+rcx*2+8]
        mov     rax, [rax+rcx*2-8]
        mov     rax, [rax+rcx*2+1000]
        mov     [rax+rcx*2+1000], r8
        lea     r14, [rax+rcx*2-1000]
        mov     rax, [rbx+rcx*2]
        mov     rax, [rbx+rcx*2+8]
        mov     rax, [rbx+rcx*2-8]
        mov     rax, [rbx+rcx*2+1000]
        mov     [rbx+rcx*2+1000], r8
        lea     r14, [rbx+rcx*2-1000]
        mov     rax, [rsp+rcx*2]
        mov     rax, [rsp+rcx*2+8]
        mov     rax, [rsp+rcx*2-8]
        mov     rax, [rsp+rcx*2+1000]
        mov     [rsp+rcx*2+1000], r8
        lea     r14, [rsp+rcx*2-1000]
        mov     rax, [rbp+rcx*2]
        mov     rax, [rbp+rcx*2+8]
        mov     rax, [rbp+rcx*2-8]
        mov     rax, [rbp+rcx*2+1000]
        mov     [rbp+rcx*2+1000], r8
        lea     r14, [rbp+rcx*2-1000]
        mov     rax, [r12+rcx*2]
        mov     rax, [r12+rcx*2+8]
        mov     rax, [r12+rcx*2-8]
        mov     rax, [r12+rcx*2+1000]
        mov     [r12+rcx*2+1000], r8
        lea     r14, [r12+rcx*2-1000]
        mov     rax, [r13+rcx*2]
        mov     rax, [r13+rcx*2+8]
        mov     rax, [r13+rcx*2-8]
        mov     rax, [r13+rcx*2+1000]
        mov     [r13+rcx*2+1000], r8
        lea     r14, [r13+rcx*2-1000]
        mov     rax, [r15+rcx*2]
        mov     rax, [r15+rcx*2+8]
        mov     rax, [r15+rcx*2-8]
        mov     rax, [r15+rcx*2+1000]
        mov     [r15+rcx*2+1000], r8
        lea     r14, [r15+rcx*2-1000]
        mov     rax, [rcx*4]
        mov     rax, [rcx*4+16]
        mov     rax, [rcx*4-16]
        lea     rax, [rcx*4+1000]
        mov     rax, [rax+rcx*4]
        mov     rax, [rax+rcx*4+8]
        mov     rax, [rax+rcx*4-8]
        mov     rax, [rax+rcx*4+1000]
        mov     [rax+rcx*4+1000], r8
        lea     r14, [rax+rcx*4-1000]
        mov     rax, [rbx+rcx*4]
        mov     rax, [rbx+rcx*4+8]
        mov     rax, [rbx+rcx*4-8]
        mov     rax, [rbx+rcx*4+1000]
        mov     [rbx+rcx*4+1000], r8
        lea     r14, [rbx+rcx*4-1000]
        mov     rax, [rsp+rcx*4]
        mov     rax, [rsp+rcx*4+8]
        mov     rax, [rsp+rcx*4-8]
        mov     rax, [rsp+rcx*4+1000]
        mov     [rsp+rcx*4+1000], r8
        lea     r14, [rsp+rcx*4-1000]
        mov     rax, [rbp+rcx*4]
        mov     rax, [rbp+rcx*4+8]
        mov     rax, [rbp+rcx*4-8]
        mov     rax, [rbp+rcx*4+1000]
        mov     [rbp+rcx*4+1000], r8
        lea     r14, [rbp+rcx*4-1000]
        mov     rax, [r12+rcx*4]
        mov     rax, [r12+rcx*4+8]
        mov     rax, [r12+rcx*4-8]
        mov     rax, [r12+rcx*4+1000]
        mov     [r12+rcx*4+1000], r8
        lea     r14, [r12+rcx*4-1000]
        mov     rax, [r13+rcx*4]
        mov     rax, [r13+rcx*4+8]
        mov     rax, [r13+rcx*4-8]
        mov     rax, [r13+rcx*4+1000]
        mov     [r13+rcx*4+1000], r8
        lea     r14, [r13+rcx*4-1000]
        mov     rax, [r15+rcx*4]
        mov     rax, [r15+rcx*4+8]
        mov     rax, [r15+rcx*4-8]
        mov     rax, [r15+rcx*4+1000]
        mov     [r15+rcx*4+1000], r8
        lea     r14, [r15+rcx*4-1000]
        mov     rax, [rcx*8]
        mov     rax, [rcx*8+16]
        mov     rax, [rcx*8-16]
        lea     rax, [rcx*8+1000]
        mov     rax, [rax+rcx*8]
        mov     rax, [rax+rcx*8+8]
        mov     rax, [rax+rcx*8-8]
        mov     rax, [rax+rcx*8+1000]
        mov     [rax+rcx*8+1000], r8
        lea     r14, [rax+rcx*8-1000]
        mov     rax, [rbx+rcx*8]
        mov     rax, [rbx+rcx*8+8]
        mov     rax, [rbx+rcx*8-8]
        mov     rax, [rbx+rcx*8+1000]
        mov     [rbx+rcx*8+1000], r8
        lea     r14, [rbx+rcx*8-1000]
        mov     rax, [rsp+rcx*8]
        mov     rax, [rsp+rcx*8+8]
        mov     rax, [rsp+rcx*8-8]
        mov     rax, [rsp+rcx*8+1000]
        mov     [rsp+rcx*8+1000], r8
        lea     r14, [rsp+rcx*8-1000]
        mov     rax, [rbp+rcx*8]
        mov     rax, [rbp+rcx*8+8]
        mov     rax, [rbp+rcx*8-8]
        mov     rax, [rbp+rcx*8+1000]
        mov     [rbp+rcx*8+1000], r8
        lea     r14, [rbp+rcx*8-1000]
        mov     rax, [r12+rcx*8]
        mov     rax, [r12+rcx*8+8]
        mov     rax, [r12+rcx*8-8]
        mov     rax, [r12+rcx*8+1000]
        mov     [r12+rcx*8+1000], r8
        lea     r14, [r12+rcx*8-1000]
        mov     rax, [r13+rcx*8]
        mov     rax, [r13+rcx*8+8]
        mov     rax, [r13+rcx*8-8]
        mov     rax, [r13+rcx*8+1000]
        mov     [r13+rcx*8+1000], r8
        lea     r14, [r13+rcx*8-1000]
        mov     rax, [r15+rcx*8]
        mov     rax, [r15+rcx*8+8]
        mov     rax, [r15+rcx*8-8]
        mov     rax, [r15+rcx*8+1000]
        mov     [r15+rcx*8+1000], r8
        lea     r14, [r15+rcx*8-1000]
        mov     rax, [rdx*1]
        mov     rax, [rdx*1+16]
        mov     rax, [rdx*1-16]
        lea     rax, [rdx*1+1000]
        mov     rax, [rax+rdx*1]
        mov     rax, [rax+rdx*1+8]
        mov     rax, [rax+rdx*1-8]
        mov     rax, [rax+rdx*1+1000]
        mov     [rax+rdx*1+1000], r8
        lea     r14, [rax+rdx*1-1000]
        mov     rax, [rbx+rdx*1]
        mov     rax, [rbx+rdx*1+8]
        mov     rax, [rbx+rdx*1-8]
        mov     rax, [rbx+rdx*1+1000]
        mov     [rbx+rdx*1+1000], r8
        lea     r14, [rbx+rdx*1-1000]
        mov     rax, [rsp+rdx*1]
        mov     rax, [rsp+rdx*1+8]
        mov     rax, [rsp+rdx*1-8]
        mov     rax, [rsp+rdx*1+1000]
        mov     [rsp+rdx*1+1000], r8
        lea     r14, [rsp+rdx*1-1000]
        mov     rax, [rbp+rdx*1]
        mov     rax, [rbp+rdx*1+8]
        mov     rax, [rbp+rdx*1-8]
        mov     rax, [rbp+rdx*1+1000]
        mov     [rbp+rdx*1+1000], r8
        lea     r14, [rbp+rdx*1-1000]
        mov     rax, [r12+rdx*1]
        mov     rax, [r12+rdx*1+8]
        mov     rax, [r12+rdx*1-8]
        mov     rax, [r12+rdx*1+1000]
        mov     [r12+rdx*1+1000], r8
        lea     r14, [r12+rdx*1-1000]
        mov     rax, [r13+rdx*1]
        mov     rax, [r13+rdx*1+8]
        mov     rax, [r13+rdx*1-8]
        mov     rax, [r13+rdx*1+1000]
        mov     [r13+rdx*1+1000], r8
        lea     r14, [r13+rdx*1-1000]
        mov     rax, [r15+rdx*1]
        mov     rax, [r15+rdx*1+8]
        mov     rax, [r15+rdx*1-8]
        mov     rax, [r15+rdx*1+1000]
        mov     [r15+rdx*1+1000], r8
        lea     r14, [r15+rdx*1-1000]
        mov     rax, [rdx*2]
        mov     rax, [rdx*2+16]
        mov     rax, [rdx*2-16]
        lea     rax, [rdx*2+1000]
        mov     rax, [rax+rdx*2]
        mov     rax, [rax+rdx*2+8]
        mov     rax, [rax+rdx*2-8]
        mov     rax, [rax+rdx*2+1000]
        mov     [rax+rdx*2+1000], r8
        lea     r14, [rax+rdx*2-1000]
        mov     rax, [rbx+rdx*2]
        mov     rax, [rbx+rdx*2+8]
        mov     rax, [rbx+rdx*2-8]
        mov     rax, [rbx+rdx*2+1000]
        mov     [rbx+rdx*2+1000], r8
        lea     r14, [rbx+rdx*2-1000]
        mov     rax, [rsp+rdx*2]
        mov     rax, [rsp+rdx*2+8]
        mov     rax, [rsp+rdx*2-8]
        mov     rax, [rsp+rdx*2+1000]
        mov     [rsp+rdx*2+1000], r8
        lea     r14, [rsp+rdx*2-1000]
        mov     rax, [rbp+rdx*2]
        mov     rax, [rbp+rdx*2+8]
        mov     rax, [rbp+rdx*2-8]
        mov     rax, [rbp+rdx*2+1000]
        mov     [rbp+rdx*2+1000], r8
        lea     r14, [rbp+rdx*2-1000]
        mov     rax, [r12+rdx*2]
        mov     rax, [r12+rdx*2+8]
        mov     rax, [r12+rdx*2-8]
        mov     rax, [r12+rdx*2+1000]
        mov     [r12+rdx*2+1000], r8
        lea     r14, [r12+rdx*2-1000]
        mov     rax, [r13+rdx*2]
        mov     rax, [r13+rdx*2+8]
        mov     rax, [r13+rdx*2-8]
        mov     rax, [r13+rdx*2+1000]
        mov     [r13+rdx*2+1000], r8
        lea     r14, [r13+rdx*2-1000]
        mov     rax, [r15+rdx*2]
        mov     rax, [r15+rdx*2+8]
        mov     rax, [r15+rdx*2-8]
        mov     rax, [r15+rdx*2+1000]
        mov     [r15+rdx*2+1000], r8
        lea     r14, [r15+rdx*2-1000]
        mov     rax, [rdx*4]
        mov     rax, [rdx*4+16]
        mov     rax, [rdx*4-16]
        lea     rax, [rdx*4+1000]
        mov     rax, [rax+rdx*4]
        mov     rax, [rax+rdx*4+8]
        mov     rax, [rax+rdx*4-8]
        mov     rax, [rax+rdx*4+1000]
        mov     [rax+rdx*4+1000], r8
        lea     r14, [rax+rdx*4-1000]
        mov     rax, [rbx+rdx*4]
        mov     rax, [rbx+rdx*4+8]
        mov     rax, [rbx+rdx*4-8]
        mov     rax, [rbx+rdx*4+1000]
        mov     [rbx+rdx*4+1000], r8
        lea     r14, [rbx+rdx*4-1000]
        mov     rax, [rsp+rdx*4]
        mov     rax, [rsp+rdx*4+8]
        mov     rax, [rsp+rdx*4-8]
        mov     rax, [rsp+rdx*4+1000]
        mov     [rsp+rdx*4+1000], r8
        lea     r14, [rsp+rdx*4-1000]
        mov     rax, [rbp+rdx*4]
        mov     rax, [rbp+rdx*4+8]
        mov     rax, [rbp+rdx*4-8]
        mov     rax, [rbp+rdx*4+1000]
        mov     [rbp+rdx*4+1000], r8
        lea     r14, [rbp+rdx*4-1000]
        mov     rax, [r12+rdx*4]
        mov     rax, [r12+rdx*4+8]
        mov     rax, [r12+rdx*4-8]
        mov     rax, [r12+rdx*4+1000]
        mov     [r12+rdx*4+1000], r8
        lea     r14, [r12+rdx*4-1000]
        mov     rax, [r13+rdx*4]
        mov     rax, [r13+rdx*4+8]
        mov     rax, [r13+rdx*4-8]
        mov     rax, [r13+rdx*4+1000]
        mov     [r13+rdx*4+1000], r8
        lea     r14, [r13+rdx*4-1000]
        mov     rax, [r15+rdx*4]
        mov     rax, [r15+rdx*4+8]
        mov     rax, [r15+rdx*4-8]
        mov     rax, [r15+rdx*4+1000]
        mov     [r15+rdx*4+1000], r8
        lea     r14, [r15+rdx*4-1000]
        mov     rax, [rdx*8]
        mov     rax, [rdx*8+16]
        mov     rax, [rdx*8-16]
        lea     rax, [rdx*8+1000]
        mov     rax, [rax+rdx*8]
        mov     rax, [rax+rdx*8+8]
        mov     rax, [rax+rdx*8-8]
        mov     rax, [rax+rdx*8+1000]
        mov     [rax+rdx*8+1000], r8
        lea     r14, [rax+rdx*8-1000]
        mov     rax, [rbx+rdx*8]
        mov     rax, [rbx+rdx*8+8]
        mov     rax, [rbx+rdx*8-8]
        mov     rax, [rbx+rdx*8+1000]
        mov     [rbx+rdx*8+1000], r8
        lea     r14, [rbx+rdx*8-1000]
        mov     rax, [rsp+rdx*8]
        mov     rax, [rsp+rdx*8+8]
        mov     rax, [rsp+rdx*8-8]
        mov     rax, [rsp+rdx*8+1000]
        mov     [rsp+rdx*8+1000], r8
        lea     r14, [rsp+rdx*8-1000]
        mov     rax, [rbp+rdx*8]
        mov     rax, [rbp+rdx*8+8]
        mov     rax, [rbp+rdx*8-8]
        mov     rax, [rbp+rdx*8+1000]
        mov     [rbp+rdx*8+1000], r8
        lea     r14, [rbp+rdx*8-1000]
        mov     rax, [r12+rdx*8]
        mov     rax, [r12+rdx*8+8]
        mov     rax, [r12+rdx*8-8]
        mov     rax, [r12+rdx*8+1000]
        mov     [r12+rdx*8+1000], r8
        lea     r14, [r12+rdx*8-1000]
        mov     rax, [r13+rdx*8]
        mov     rax, [r13+rdx*8+8]
        mov     rax, [r13+rdx*8-8]
        mov     rax, [r13+rdx*8+1000]
        mov     [r13+rdx*8+1000], r8
        lea     r14, [r13+rdx*8-1000]
        mov     rax, [r15+rdx*8]
        mov     rax, [r15+rdx*8+8]
        mov     rax, [r15+rdx*8-8]
        mov     rax, [r15+rdx*8+1000]
        mov     [r15+rdx*8+1000], r8
        lea     r14, [r15+rdx*8-1000]
        mov     rax, [rbx*1]
        mov     rax, [rbx*1+16]
        mov     rax, [rbx*1-16]
        lea     rax, [rbx*1+1000]
        mov     rax, [rax+rbx*1]
        mov     rax, [rax+rbx*1+8]
        mov     rax, [rax+rbx*1-8]
        mov     rax, [rax+rbx*1+1000]
        mov     [rax+rbx*1+1000], r8
        lea     r14, [rax+rbx*1-1000]
        mov     rax, [rbx+rbx*1]
        mov     rax, [rbx+rbx*1+8]
        mov     rax, [rbx+rbx*1-8]
        mov     rax, [rbx+rbx*1+1000]
        mov     [rbx+rbx*1+1000], r8
        lea     r14, [rbx+rbx*1-1000]
        mov     rax, [rsp+rbx*1]
        mov     rax, [rsp+rbx*1+8]
        mov     rax, [rsp+rbx*1-8]
        mov     rax, [rsp+rbx*1+1000]
        mov     [rsp+rbx*1+1000], r8
        lea     r14, [rsp+rbx*1-1000]
        mov     rax, [rbp+rbx*1]
        mov     rax, [rbp+rbx*1+8]
        mov     rax, [rbp+rbx*1-8]
        mov     rax, [rbp+rbx*1+1000]
        mov     [rbp+rbx*1+1000], r8
        lea     r14, [rbp+rbx*1-1000]
        mov     rax, [r12+rbx*1]
        mov     rax, [r12+rbx*1+8]
        mov     rax, [r12+rbx*1-8]
        mov     rax, [r12+rbx*1+1000]
        mov     [r12+rbx*1+1000], r8
        lea     r14, [r12+rbx*1-1000]
        mov     rax, [r13+rbx*1]
        mov     rax, [r13+rbx*1+8]
        mov     rax, [r13+rbx*1-8]
        mov     rax, [r13+rbx*1+1000]
        mov     [r13+rbx*1+1000], r8
        lea     r14, [r13+rbx*1-1000]
        mov     rax, [r15+rbx*1]
        mov     rax, [r15+rbx*1+8]
        mov     rax, [r15+rbx*1-8]
        mov     rax, [r15+rbx*1+1000]
        mov     [r15+rbx*1+1000], r8
        lea     r14, [r15+rbx*1-1000]
        mov     rax, [rbx*2]
        mov     rax, [rbx*2+16]
        mov     rax, [rbx*2-16]
        lea     rax, [rbx*2+1000]
        mov     rax, [rax+rbx*2]
        mov     rax, [rax+rbx*2+8]
        mov     rax, [rax+rbx*2-8]
        mov     rax, [rax+rbx*2+1000]
        mov     [rax+rbx*2+1000], r8
        lea     r14, [rax+rbx*2-1000]
        mov     rax, [rbx+rbx*2]
        mov     rax, [rbx+rbx*2+8]
        mov     rax, [rbx+rbx*2-8]
        mov     rax, [rbx+rbx*2+1000]
        mov     [rbx+rbx*2+1000], r8
        lea     r14, [rbx+rbx*2-1000]
        mov     rax, [rsp+rbx*2]
        mov     rax, [rsp+rbx*2+8]
        mov     rax, [rsp+rbx*2-8]
        mov     rax, [rsp+rbx*2+1000]
        mov     [rsp+rbx*2+1000], r8
        lea     r14, [rsp+rbx*2-1000]
        mov     rax, [rbp+rbx*2]
        mov     rax, [rbp+rbx*2+8]
        mov     rax, [rbp+rbx*2-8]
        mov     rax, [rbp+rbx*2+1000]
        mov     [rbp+rbx*2+1000], r8
        lea     r14, [rbp+rbx*2-1000]
        mov     rax, [r12+rbx*2]
        mov     rax, [r12+rbx*2+8]
        mov     rax, [r12+rbx*2-8]
        mov     rax, [r12+rbx*2+1000]
        mov     [r12+rbx*2+1000], r8
        lea     r14, [r12+rbx*2-1000]
        mov     rax, [r13+rbx*2]
        mov     rax, [r13+rbx*2+8]
        mov     rax, [r13+rbx*2-8]
        mov     rax, [r13+rbx*2+1000]
        mov     [r13+rbx*2+1000], r8
        lea     r14, [r13+rbx*2-1000]
        mov     rax, [r15+rbx*2]
        mov     rax, [r15+rbx*2+8]
        mov     rax, [r15+rbx*2-8]
        mov     rax, [r15+rbx*2+1000]
        mov     [r15+rbx*2+1000], r8
        lea     r14, [r15+rbx*2-1000]
        mov     rax, [rbx*4]
        mov     rax, [rbx*4+16]
        mov     rax, [rbx*4-16]
        lea     rax, [rbx*4+1000]
        mov     rax, [rax+rbx*4]
        mov     rax, [rax+rbx*4+8]
        mov     rax, [rax+rbx*4-8]
        mov     rax, [rax+rbx*4+1000]
        mov     [rax+rbx*4+1000], r8
        lea     r14, [rax+rbx*4-1000]
        mov     rax, [rbx+rbx*4]
        mov     rax, [rbx+rbx*4+8]
        mov     rax, [rbx+rbx*4-8]
        mov     rax, [rbx+rbx*4+1000]
        mov     [rbx+rbx*4+1000], r8
        lea     r14, [rbx+rbx*4-1000]
        mov     rax, [rsp+rbx*4]
        mov     rax, [rsp+rbx*4+8]
        mov     rax, [rsp+rbx*4-8]
        mov     rax, [rsp+rbx*4+1000]
        mov     [rsp+rbx*4+1000], r8
        lea     r14, [rsp+rbx*4-1000]
        mov     rax, [rbp+rbx*4]
        mov     rax, [rbp+rbx*4+8]
        mov     rax, [rbp+rbx*4-8]
        mov     rax, [rbp+rbx*4+1000]
        mov     [rbp+rbx*4+1000], r8
        lea     r14, [rbp+rbx*4-1000]
        mov     rax, [r12+rbx*4]
        mov     rax, [r12+rbx*4+8]
        mov     rax, [r12+rbx*4-8]
        mov     rax, [r12+rbx*4+1000]
        mov     [r12+rbx*4+1000], r8
        lea     r14, [r12+rbx*4-1000]
        mov     rax, [r13+rbx*4]
        mov     rax, [r13+rbx*4+8]
        mov     rax, [r13+rbx*4-8]
        mov     rax, [r13+rbx*4+1000]
        mov     [r13+rbx*4+1000], r8
        lea     r14, [r13+rbx*4-1000]
        mov     rax, [r15+rbx*4]
        mov     rax, [r15+rbx*4+8]
        mov     rax, [r15+rbx*4-8]
        mov     rax, [r15+rbx*4+1000]
        mov     [r15+rbx*4+1000], r8
        lea     r14, [r15+rbx*4-1000]
        mov     rax, [rbx*8]
        mov     rax, [rbx*8+16]
        mov     rax, [rbx*8-16]
        lea     rax, [rbx*8+1000]
        mov     rax, [rax+rbx*8]
        mov     rax, [rax+rbx*8+8]
        mov     rax, [rax+rbx*8-8]
        mov     rax, [rax+rbx*8+1000]
        mov     [rax+rbx*8+1000], r8
        lea     r14, [rax+rbx*8-1000]
        mov     rax, [rbx+rbx*8]
        mov     rax, [rbx+rbx*8+8]
        mov     rax, [rbx+rbx*8-8]
        mov     rax, [rbx+rbx*8+1000]
        mov     [rbx+rbx*8+1000], r8
        lea     r14, [rbx+rbx*8-1000]
        mov     rax, [rsp+rbx*8]
        mov     rax, [rsp+rbx*8+8]
        mov     rax, [rsp+rbx*8-8]
        mov     rax, [rsp+rbx*8+1000]
        mov     [rsp+rbx*8+1000], r8
        lea     r14, [rsp+rbx*8-1000]
        mov     rax, [rbp+rbx*8]
        mov     rax, [rbp+rbx*8+8]
        mov     rax, [rbp+rbx*8-8]
        mov     rax, [rbp+rbx*8+1000]
        mov     [rbp+rbx*8+1000], r8
        lea     r14, [rbp+rbx*8-1000]
        mov     rax, [r12+rbx*8]
        mov     rax, [r12+rbx*8+8]
        mov     rax, [r12+rbx*8-8]
        mov     rax, [r12+rbx*8+1000]
        mov     [r12+rbx*8+1000], r8
        lea     r14, [r12+rbx*8-1000]
        mov     rax, [r13+rbx*8]
        mov     rax, [r13+rbx*8+8]
        mov     rax, [r13+rbx*8-8]
        mov     rax, [r13+rbx*8+1000]
        mov     [r13+rbx*8+1000], r8
        lea     r14, [r13+rbx*8-1000]
        mov     rax, [r15+rbx*8]
        mov     rax, [r15+rbx*8+8]
        mov     rax, [r15+rbx*8-8]
        mov     rax, [r15+rbx*8+1000]
        mov     [r15+rbx*8+1000], r8
        lea     r14, [r15+rbx*8-1000]
        mov     rax, [rbp*1]
        mov     rax, [rbp*1+16]
        mov     rax, [rbp*1-16]
        lea     rax, [rbp*1+1000]
        mov     rax, [rax+rbp*1]
        mov     rax, [rax+rbp*1+8]
        mov     rax, [rax+rbp*1-8]
        mov     rax, [rax+rbp*1+1000]
        mov     [rax+rbp*1+1000], r8
        lea     r14, [rax+rbp*1-1000]
        mov     rax, [rbx+rbp*1]
        mov     rax, [rbx+rbp*1+8]
        mov     rax, [rbx+rbp*1-8]
        mov     rax, [rbx+rbp*1+1000]
        mov     [rbx+rbp*1+1000], r8
        lea     r14, [rbx+rbp*1-1000]
        mov     rax, [rsp+rbp*1]
        mov     rax, [rsp+rbp*1+8]
        mov     rax, [rsp+rbp*1-8]
        mov     rax, [rsp+rbp*1+1000]
        mov     [rsp+rbp*1+1000], r8
        lea     r14, [rsp+rbp*1-1000]
        mov     rax, [rbp+rbp*1]
        mov     rax, [rbp+rbp*1+8]
        mov     rax, [rbp+rbp*1-8]
        mov     rax, [rbp+rbp*1+1000]
        mov     [rbp+rbp*1+1000], r8
        lea     r14, [rbp+rbp*1-1000]
        mov     rax, [r12+rbp*1]
        mov     rax, [r12+rbp*1+8]
        mov     rax, [r12+rbp*1-8]
        mov     rax, [r12+rbp*1+1000]
        mov     [r12+rbp*1+1000], r8
        lea     r14, [r12+rbp*1-1000]
        mov     rax, [r13+rbp*1]
        mov     rax, [r13+rbp*1+8]
        mov     rax, [r13+rbp*1-8]
        mov     rax, [r13+rbp*1+1000]
        mov     [r13+rbp*1+1000], r8
        lea     r14, [r13+rbp*1-1000]
        mov     rax, [r15+rbp*1]
        mov     rax, [r15+rbp*1+8]
        mov     rax, [r15+rbp*1-8]
        mov     rax, [r15+rbp*1+1000]
        mov     [r15+rbp*1+1000], r8
        lea     r14, [r15+rbp*1-1000]
        mov     rax, [rbp*2]
        mov     rax, [rbp*2+16]
        mov     rax, [rbp*2-16]
        lea     rax, [rbp*2+1000]
        mov     rax, [rax+rbp*2]
        mov     rax, [rax+rbp*2+8]
        mov     rax, [rax+rbp*2-8]
        mov     rax, [rax+rbp*2+1000]
        mov     [rax+rbp*2+1000], r8
        lea     r14, [rax+rbp*2-1000]
        mov     rax, [rbx+rbp*2]
        mov     rax, [rbx+rbp*2+8]
        mov     rax, [rbx+rbp*2-8]
        mov     rax, [rbx+rbp*2+1000]
        mov     [rbx+rbp*2+1000], r8
        lea     r14, [rbx+rbp*2-1000]
        mov     rax, [rsp+rbp*2]
        mov     rax, [rsp+rbp*2+8]
        mov     rax, [rsp+rbp*2-8]
        mov     rax, [rsp+rbp*2+1000]
        mov     [rsp+rbp*2+1000], r8
        lea     r14, [rsp+rbp*2-1000]
        mov     rax, [rbp+rbp*2]
        mov     rax, [rbp+rbp*2+8]
        mov     rax, [rbp+rbp*2-8]
        mov     rax, [rbp+rbp*2+1000]
        mov     [rbp+rbp*2+1000], r8
        lea     r14, [rbp+rbp*2-1000]
        mov     rax, [r12+rbp*2]
        mov     rax, [r12+rbp*2+8]
        mov     rax, [r12+rbp*2-8]
        mov     rax, [r12+rbp*2+1000]
        mov     [r12+rbp*2+1000], r8
        lea     r14, [r12+rbp*2-1000]
        mov     rax, [r13+rbp*2]
        mov     rax, [r13+rbp*2+8]
        mov     rax, [r13+rbp*2-8]
        mov     rax, [r13+rbp*2+1000]
        mov     [r13+rbp*2+1000], r8
        lea     r14, [r13+rbp*2-1000]
        mov     rax, [r15+rbp*2]
        mov     rax, [r15+rbp*2+8]
        mov     rax, [r15+rbp*2-8]
        mov     rax, [r15+rbp*2+1000]
        mov     [r15+rbp*2+1000], r8
        lea     r14, [r15+rbp*2-1000]
        mov     rax, [rbp*4]
        mov     rax, [rbp*4+16]
        mov     rax, [rbp*4-16]
        lea     rax, [rbp*4+1000]
        mov     rax, [rax+rbp*4]
        mov     rax, [rax+rbp*4+8]
        mov     rax, [rax+rbp*4-8]
        mov     rax, [rax+rbp*4+1000]
        mov     [rax+rbp*4+1000], r8
        lea     r14, [rax+rbp*4-1000]
        mov     rax, [rbx+rbp*4]
        mov     rax, [rbx+rbp*4+8]
        mov     rax, [rbx+rbp*4-8]
        mov     rax, [rbx+rbp*4+1000]
        mov     [rbx+rbp*4+1000], r8
        lea     r14, [rbx+rbp*4-1000]
        mov     rax, [rsp+rbp*4]
        mov     rax, [rsp+rbp*4+8]
        mov     rax, [rsp+rbp*4-8]
        mov     rax, [rsp+rbp*4+1000]
        mov     [rsp+rbp*4+1000], r8
        lea     r14, [rsp+rbp*4-1000]
        mov     rax, [rbp+rbp*4]
        mov     rax, [rbp+rbp*4+8]
        mov     rax, [rbp+rbp*4-8]
        mov     rax, [rbp+rbp*4+1000]
        mov     [rbp+rbp*4+1000], r8
        lea     r14, [rbp+rbp*4-1000]
        mov     rax, [r12+rbp*4]
        mov     rax, [r12+rbp*4+8]
        mov     rax, [r12+rbp*4-8]
        mov     rax, [r12+rbp*4+1000]
        mov     [r12+rbp*4+1000], r8
        lea     r14, [r12+rbp*4-1000]
        mov     rax, [r13+rbp*4]
        mov     rax, [r13+rbp*4+8]
        mov     rax, [r13+rbp*4-8]
        mov     rax, [r13+rbp*4+1000]
        mov     [r13+rbp*4+1000], r8
        lea     r14, [r13+rbp*4-1000]
        mov     rax, [r15+rbp*4]
        mov     rax, [r15+rbp*4+8]
        mov     rax, [r15+rbp*4-8]
        mov     rax, [r15+rbp*4+1000]
        mov     [r15+rbp*4+1000], r8
        lea     r14, [r15+rbp*4-1000]
        mov     rax, [rbp*8]
        mov     rax, [rbp*8+16]
        mov     rax, [rbp*8-16]
        lea     rax, [rbp*8+1000]
        mov     rax, [rax+rbp*8]
        mov     rax, [rax+rbp*8+8]
        mov     rax, [rax+rbp*8-8]
        mov     rax, [rax+rbp*8+1000]
        mov     [rax+rbp*8+1000], r8
        lea     r14, [rax+rbp*8-1000]
        mov     rax, [rbx+rbp*8]
        mov     rax, [rbx+rbp*8+8]
        mov     rax, [rbx+rbp*8-8]
        mov     rax, [rbx+rbp*8+1000]
        mov     [rbx+rbp*8+1000], r8
        lea     r14, [rbx+rbp*8-1000]
        mov     rax, [rsp+rbp*8]
        mov     rax, [rsp+rbp*8+8]
        mov     rax, [rsp+rbp*8-8]
        mov     rax, [rsp+rbp*8+1000]
        mov     [rsp+rbp*8+1000], r8
        lea     r14, [rsp+rbp*8-1000]
        mov     rax, [rbp+rbp*8]
        mov     rax, [rbp+rbp*8+8]
        mov     rax, [rbp+rbp*8-8]
        mov     rax, [rbp+rbp*8+1000]
        mov     [rbp+rbp*8+1000], r8
        lea     r14, [rbp+rbp*8-1000]
        mov     rax, [r12+rbp*8]
        mov     rax, [r12+rbp*8+8]
        mov     rax, [r12+rbp*8-8]
        mov     rax, [r12+rbp*8+1000]
        mov     [r12+rbp*8+1000], r8
        lea     r14, [r12+rbp*8-1000]
        mov     rax, [r13+rbp*8]
        mov     rax, [r13+rbp*8+8]
        mov     rax, [r13+rbp*8-8]
        mov     rax, [r13+rbp*8+1000]
        mov     [r13+rbp*8+1000], r8
        lea     r14, [r13+rbp*8-1000]
        mov     rax, [r15+rbp*8]
        mov     rax, [r15+rbp*8+8]
        mov     rax, [r15+rbp*8-8]
        mov     rax, [r15+rbp*8+1000]
        mov     [r15+rbp*8+1000], r8
        lea     r14, [r15+rbp*8-1000]
        mov     rax, [rsi*1]
        mov     rax, [rsi*1+16]
        mov     rax, [rsi*1-16]
        lea     rax, [rsi*1+1000]
        mov     rax, [rax+rsi*1]
        mov     rax, [rax+rsi*1+8]
        mov     rax, [rax+rsi*1-8]
        mov     rax, [rax+rsi*1+1000]
        mov     [rax+rsi*1+1000], r8
        lea     r14, [rax+rsi*1-1000]
        mov     rax, [rbx+rsi*1]
        mov     rax, [rbx+rsi*1+8]
        mov     rax, [rbx+rsi*1-8]
        mov     rax, [rbx+rsi*1+1000]
        mov     [rbx+rsi*1+1000], r8
        lea     r14, [rbx+rsi*1-1000]
        mov     rax, [rsp+rsi*1]
        mov     rax, [rsp+rsi*1+8]
        mov     rax, [rsp+rsi*1-8]
        mov     rax, [rsp+rsi*1+1000]
        mov     [rsp+rsi*1+1000], r8
        lea     r14, [rsp+rsi*1-1000]
        mov     rax, [rbp+rsi*1]
        mov     rax, [rbp+rsi*1+8]
        mov     rax, [rbp+rsi*1-8]
        mov     rax, [rbp+rsi*1+1000]
        mov     [rbp+rsi*1+1000], r8
        lea     r14, [rbp+rsi*1-1000]
        mov     rax, [r12+rsi*1]
        mov     rax, [r12+rsi*1+8]
        mov     rax, [r12+rsi*1-8]
        mov     rax, [r12+rsi*1+1000]
        mov     [r12+rsi*1+1000], r8
        lea     r14, [r12+rsi*1-1000]
        mov     rax, [r13+rsi*1]
        mov     rax, [r13+rsi*1+8]
        mov     rax, [r13+rsi*1-8]
        mov     rax, [r13+rsi*1+1000]
        mov     [r13+rsi*1+1000], r8
        lea     r14, [r13+rsi*1-1000]
        mov     rax, [r15+rsi*1]
        mov     rax, [r15+rsi*1+8]
        mov     rax, [r15+rsi*1-8]
        mov     rax, [r15+rsi*1+1000]
        mov     [r15+rsi*1+1000], r8
        lea     r14, [r15+rsi*1-1000]
        mov     rax, [rsi*2]
        mov     rax, [rsi*2+16]
        mov     rax, [rsi*2-16]
        lea     rax, [rsi*2+1000]
        mov     rax, [rax+rsi*2]
        mov     rax, [rax+rsi*2+8]
        mov     rax, [rax+rsi*2-8]
        mov     rax, [rax+rsi*2+1000]
        mov     [rax+rsi*2+1000], r8
        lea     r14, [rax+rsi*2-1000]
        mov     rax, [rbx+rsi*2]
        mov     rax, [rbx+rsi*2+8]
        mov     rax, [rbx+rsi*2-8]
        mov     rax, [rbx+rsi*2+1000]
        mov     [rbx+rsi*2+1000], r8
        lea     r14, [rbx+rsi*2-1000]
        mov     rax, [rsp+rsi*2]
        mov     rax, [rsp+rsi*2+8]
        mov     rax, [rsp+rsi*2-8]
        mov     rax, [rsp+rsi*2+1000]
        mov     [rsp+rsi*2+1000], r8
        lea     r14, [rsp+rsi*2-1000]
        mov     rax, [rbp+rsi*2]
        mov     rax, [rbp+rsi*2+8]
        mov     rax, [rbp+rsi*2-8]
        mov     rax, [rbp+rsi*2+1000]
        mov     [rbp+rsi*2+1000], r8
        lea     r14, [rbp+rsi*2-1000]
        mov     rax, [r12+rsi*2]
        mov     rax, [r12+rsi*2+8]
        mov     rax, [r12+rsi*2-8]
        mov     rax, [r12+rsi*2+1000]
        mov     [r12+rsi*2+1000], r8
        lea     r14, [r12+rsi*2-1000]
        mov     rax, [r13+rsi*2]
        mov     rax, [r13+rsi*2+8]
        mov     rax, [r13+rsi*2-8]
        mov     rax, [r13+rsi*2+1000]
        mov     [r13+rsi*2+1000], r8
        lea     r14, [r13+rsi*2-1000]
        mov     rax, [r15+rsi*2]
        mov     rax, [r15+rsi*2+8]
        mov     rax, [r15+rsi*2-8]
        mov     rax, [r15+rsi*2+1000]
        mov     [r15+rsi*2+1000], r8
        lea     r14, [r15+rsi*2-1000]
        mov     rax, [rsi*4]
        mov     rax, [rsi*4+16]
        mov     rax, [rsi*4-16]
        lea     rax, [rsi*4+1000]
        mov     rax, [rax+rsi*4]
        mov     rax, [rax+rsi*4+8]
        mov     rax, [rax+rsi*4-8]
        mov     rax, [rax+rsi*4+1000]
        mov     [rax+rsi*4+1000], r8
        lea     r14, [rax+rsi*4-1000]
        mov     rax, [rbx+rsi*4]
        mov     rax, [rbx+rsi*4+8]
        mov     rax, [rbx+rsi*4-8]
        mov     rax, [rbx+rsi*4+1000]
        mov     [rbx+rsi*4+1000], r8
        lea     r14, [rbx+rsi*4-1000]
        mov     rax, [rsp+rsi*4]
        mov     rax, [rsp+rsi*4+8]
        mov     rax, [rsp+rsi*4-8]
        mov     rax, [rsp+rsi*4+1000]
        mov     [rsp+rsi*4+1000], r8
        lea     r14, [rsp+rsi*4-1000]
        mov     rax, [rbp+rsi*4]
        mov     rax, [rbp+rsi*4+8]
        mov     rax, [rbp+rsi*4-8]
        mov     rax, [rbp+rsi*4+1000]
        mov     [rbp+rsi*4+1000], r8
        lea     r14, [rbp+rsi*4-1000]
        mov     rax, [r12+rsi*4]
        mov     rax, [r12+rsi*4+8]
        mov     rax, [r12+rsi*4-8]
        mov     rax, [r12+rsi*4+1000]
        mov     [r12+rsi*4+1000], r8
        lea     r14, [r12+rsi*4-1000]
        mov     rax, [r13+rsi*4]
        mov     rax, [r13+rsi*4+8]
        mov     rax, [r13+rsi*4-8]
        mov     rax, [r13+rsi*4+1000]
        mov     [r13+rsi*4+1000], r8
        lea     r14, [r13+rsi*4-1000]
        mov     rax, [r15+rsi*4]
        mov     rax, [r15+rsi*4+8]
        mov     rax, [r15+rsi*4-8]
        mov     rax, [r15+rsi*4+1000]
        mov     [r15+rsi*4+1000], r8
        lea     r14, [r15+rsi*4-1000]
        mov     rax, [rsi*8]
        mov     rax, [rsi*8+16]
        mov     rax, [rsi*8-16]
        lea     rax, [rsi*8+1000]
        mov     rax, [rax+rsi*8]
        mov     rax, [rax+rsi*8+8]
        mov     rax, [rax+rsi*8-8]
        mov     rax, [rax+rsi*8+1000]
        mov     [rax+rsi*8+1000], r8
        lea     r14, [rax+rsi*8-1000]
        mov     rax, [rbx+rsi*8]
        mov     rax, [rbx+rsi*8+8]
        mov     rax, [rbx+rsi*8-8]
        mov     rax, [rbx+rsi*8+1000]
        mov     [rbx+rsi*8+1000], r8
        lea     r14, [rbx+rsi*8-1000]
        mov     rax, [rsp+rsi*8]
        mov     rax, [rsp+rsi*8+8]
        mov     rax, [rsp+rsi*8-8]
        mov     rax, [rsp+rsi*8+1000]
        mov     [rsp+rsi*8+1000], r8
        lea     r14, [rsp+rsi*8-1000]
        mov     rax, [rbp+rsi*8]
        mov     rax, [rbp+rsi*8+8]
        mov     rax, [rbp+rsi*8-8]
        mov     rax, [rbp+rsi*8+1000]
        mov     [rbp+rsi*8+1000], r8
        lea     r14, [rbp+rsi*8-1000]
        mov     rax, [r12+rsi*8]
        mov     rax, [r12+rsi*8+8]
        mov     rax, [r12+rsi*8-8]
        mov     rax, [r12+rsi*8+1000]
        mov     [r12+rsi*8+1000], r8
        lea     r14, [r12+rsi*8-1000]
        mov     rax, [r13+rsi*8]
        mov     rax, [r13+rsi*8+8]
        mov     rax, [r13+rsi*8-8]
        mov     rax, [r13+rsi*8+1000]
        mov     [r13+rsi*8+1000], r8
        lea     r14, [r13+rsi*8-1000]
        mov     rax, [r15+rsi*8]
        mov     rax, [r15+rsi*8+8]
        mov     rax, [r15+rsi*8-8]
        mov     rax, [r15+rsi*8+1000]
        mov     [r15+rsi*8+1000], r8
        lea     r14, [r15+rsi*8-1000]
        mov     rax, [rdi*1]
        mov     rax, [rdi*1+16]
        mov     rax, [rdi*1-16]
        lea     rax, [rdi*1+1000]
        mov     rax, [rax+rdi*1]
        mov     rax, [rax+rdi*1+8]
        mov     rax, [rax+rdi*1-8]
        mov     rax, [rax+rdi*1+1000]
        mov     [rax+rdi*1+1000], r8
        lea     r14, [rax+rdi*1-1000]
        mov     rax, [rbx+rdi*1]
        mov     rax, [rbx+rdi*1+8]
        mov     rax, [rbx+rdi*1-8]
        mov     rax, [rbx+rdi*1+1000]
        mov     [rbx+rdi*1+1000], r8
        lea     r14, [rbx+rdi*1-1000]
        mov     rax, [rsp+rdi*1]
        mov     rax, [rsp+rdi*1+8]
        mov     rax, [rsp+rdi*1-8]
        mov     rax, [rsp+rdi*1+1000]
        mov     [rsp+rdi*1+1000], r8
        lea     r14, [rsp+rdi*1-1000]
        mov     rax, [rbp+rdi*1]
        mov     rax, [rbp+rdi*1+8]
        mov     rax, [rbp+rdi*1-8]
        mov     rax, [rbp+rdi*1+1000]
        mov     [rbp+rdi*1+1000], r8
        lea     r14, [rbp+rdi*1-1000]
        mov     rax, [r12+rdi*1]
        mov     rax, [r12+rdi*1+8]
        mov     rax, [r12+rdi*1-8]
        mov     rax, [r12+rdi*1+1000]
        mov     [r12+rdi*1+1000], r8
        lea     r14, [r12+rdi*1-1000]
        mov     rax, [r13+rdi*1]
        mov     rax, [r13+rdi*1+8]
        mov     rax, [r13+rdi*1-8]
        mov     rax, [r13+rdi*1+1000]
        mov     [r13+rdi*1+1000], r8
        lea     r14, [r13+rdi*1-1000]
        mov     rax, [r15+rdi*1]
        mov     rax, [r15+rdi*1+8]
        mov     rax, [r15+rdi*1-8]
        mov     rax, [r15+rdi*1+1000]
        mov     [r15+rdi*1+1000], r8
        lea     r14, [r15+rdi*1-1000]
        mov     rax, [rdi*2]
        mov     rax, [rdi*2+16]
        mov     rax, [rdi*2-16]
        lea     rax, [rdi*2+1000]
        mov     rax, [rax+rdi*2]
        mov     rax, [rax+rdi*2+8]
        mov     rax, [rax+rdi*2-8]
        mov     rax, [rax+rdi*2+1000]
        mov     [rax+rdi*2+1000], r8
        lea     r14, [rax+rdi*2-1000]
        mov     rax, [rbx+rdi*2]
        mov     rax, [rbx+rdi*2+8]
        mov     rax, [rbx+rdi*2-8]
        mov     rax, [rbx+rdi*2+1000]
        mov     [rbx+rdi*2+1000], r8
        lea     r14, [rbx+rdi*2-1000]
        mov     rax, [rsp+rdi*2]
        mov     rax, [rsp+rdi*2+8]
        mov     rax, [rsp+rdi*2-8]
        mov     rax, [rsp+rdi*2+1000]
        mov     [rsp+rdi*2+1000], r8
        lea     r14, [rsp+rdi*2-1000]
        mov     rax, [rbp+rdi*2]
        mov     rax, [rbp+rdi*2+8]
        mov     rax, [rbp+rdi*2-8]
        mov     rax, [rbp+rdi*2+1000]
        mov     [rbp+rdi*2+1000], r8
        lea     r14, [rbp+rdi*2-1000]
        mov     rax, [r12+rdi*2]
        mov     rax, [r12+rdi*2+8]
        mov     rax, [r12+rdi*2-8]
        mov     rax, [r12+rdi*2+1000]
        mov     [r12+rdi*2+1000], r8
        lea     r14, [r12+rdi*2-1000]
        mov     rax, [r13+rdi*2]
        mov     rax, [r13+rdi*2+8]
        mov     rax, [r13+rdi*2-8]
        mov     rax, [r13+rdi*2+1000]
        mov     [r13+rdi*2+1000], r8
        lea     r14, [r13+rdi*2-1000]
        mov     rax, [r15+rdi*2]
        mov     rax, [r15+rdi*2+8]
        mov     rax, [r15+rdi*2-8]
        mov     rax, [r15+rdi*2+1000]
        mov     [r15+rdi*2+1000], r8
        lea     r14, [r15+rdi*2-1000]
        mov     rax, [rdi*4]
        mov     rax, [rdi*4+16]
        mov     rax, [rdi*4-16]
        lea     rax, [rdi*4+1000]
        mov     rax, [rax+rdi*4]
        mov     rax, [rax+rdi*4+8]
        mov     rax, [rax+rdi*4-8]
        mov     rax, [rax+rdi*4+1000]
        mov     [rax+rdi*4+1000], r8
        lea     r14, [rax+rdi*4-1000]
        mov     rax, [rbx+rdi*4]
        mov     rax, [rbx+rdi*4+8]
        mov     rax, [rbx+rdi*4-8]
        mov     rax, [rbx+rdi*4+1000]
        mov     [rbx+rdi*4+1000], r8
        lea     r14, [rbx+rdi*4-1000]
        mov     rax, [rsp+rdi*4]
        mov     rax, [rsp+rdi*4+8]
        mov     rax, [rsp+rdi*4-8]
        mov     rax, [rsp+rdi*4+1000]
        mov     [rsp+rdi*4+1000], r8
        lea     r14, [rsp+rdi*4-1000]
        mov     rax, [rbp+rdi*4]
        mov     rax, [rbp+rdi*4+8]
        mov     rax, [rbp+rdi*4-8]
        mov     rax, [rbp+rdi*4+1000]
        mov     [rbp+rdi*4+1000], r8
        lea     r14, [rbp+rdi*4-1000]
        mov     rax, [r12+rdi*4]
        mov     rax, [r12+rdi*4+8]
        mov     rax, [r12+rdi*4-8]
        mov     rax, [r12+rdi*4+1000]
        mov     [r12+rdi*4+1000], r8
        lea     r14, [r12+rdi*4-1000]
        mov     rax, [r13+rdi*4]
        mov     rax, [r13+rdi*4+8]
        mov     rax, [r13+rdi*4-8]
        mov     rax, [r13+rdi*4+1000]
        mov     [r13+rdi*4+1000], r8
        lea     r14, [r13+rdi*4-1000]
        mov     rax, [r15+rdi*4]
        mov     rax, [r15+rdi*4+8]
        mov     rax, [r15+rdi*4-8]
        mov     rax, [r15+rdi*4+1000]
        mov     [r15+rdi*4+1000], r8
        lea     r14, [r15+rdi*4-1000]
        mov     rax, [rdi*8]
        mov     rax, [rdi*8+16]
        mov     rax, [rdi*8-16]
        lea     rax, [rdi*8+1000]
        mov     rax, [rax+rdi*8]
        mov     rax, [rax+rdi*8+8]
        mov     rax, [rax+rdi*8-8]
        mov     rax, [rax+rdi*8+1000]
        mov     [rax+rdi*8+1000], r8
        lea     r14, [rax+rdi*8-1000]
        mov     rax, [rbx+rdi*8]
        mov     rax, [rbx+rdi*8+8]
        mov     rax, [rbx+rdi*8-8]
        mov     rax, [rbx+rdi*8+1000]
        mov     [rbx+rdi*8+1000], r8
        lea     r14, [rbx+rdi*8-1000]
        mov     rax, [rsp+rdi*8]
        mov     rax, [rsp+rdi*8+8]
        mov     rax, [rsp+rdi*8-8]
        mov     rax, [rsp+rdi*8+1000]
        mov     [rsp+rdi*8+1000], r8
        lea     r14, [rsp+rdi*8-1000]
        mov     rax, [rbp+rdi*8]
        mov     rax, [rbp+rdi*8+8]
        mov     rax, [rbp+rdi*8-8]
        mov     rax, [rbp+rdi*8+1000]
        mov     [rbp+rdi*8+1000], r8
        lea     r14, [rbp+rdi*8-1000]
        mov     rax, [r12+rdi*8]
        mov     rax, [r12+rdi*8+8]
        mov     rax, [r12+rdi*8-8]
        mov     rax, [r12+rdi*8+1000]
        mov     [r12+rdi*8+1000], r8
        lea     r14, [r12+rdi*8-1000]
        mov     rax, [r13+rdi*8]
        mov     rax, [r13+rdi*8+8]
        mov     rax, [r13+rdi*8-8]
        mov     rax, [r13+rdi*8+1000]
        mov     [r13+rdi*8+1000], r8
        lea     r14, [r13+rdi*8-1000]
        mov     rax, [r15+rdi*8]
        mov     rax, [r15+rdi*8+8]
        mov     rax, [r15+rdi*8-8]
        mov     rax, [r15+rdi*8+1000]
        mov     [r15+rdi*8+1000], r8
        lea     r14, [r15+rdi*8-1000]
        mov     rax, [r8*1]
        mov     rax, [r8*1+16]
        mov     rax, [r8*1-16]
        lea     rax, [r8*1+1000]
        mov     rax, [rax+r8*1]
        mov     rax, [rax+r8*1+8]
        mov     rax, [rax+r8*1-8]
        mov     rax, [rax+r8*1+1000]
        mov     [rax+r8*1+1000], r8
        lea     r14, [rax+r8*1-1000]
        mov     rax, [rbx+r8*1]
        mov     rax, [rbx+r8*1+8]
        mov     rax, [rbx+r8*1-8]
        mov     rax, [rbx+r8*1+1000]
        mov     [rbx+r8*1+1000], r8
        lea     r14, [rbx+r8*1-1000]
        mov     rax, [rsp+r8*1]
        mov     rax, [rsp+r8*1+8]
        mov     rax, [rsp+r8*1-8]
        mov     rax, [rsp+r8*1+1000]
        mov     [rsp+r8*1+1000], r8
        lea     r14, [rsp+r8*1-1000]
        mov     rax, [rbp+r8*1]
        mov     rax, [rbp+r8*1+8]
        mov     rax, [rbp+r8*1-8]
        mov     rax, [rbp+r8*1+1000]
        mov     [rbp+r8*1+1000], r8
        lea     r14, [rbp+r8*1-1000]
        mov     rax, [r12+r8*1]
        mov     rax, [r12+r8*1+8]
        mov     rax, [r12+r8*1-8]
        mov     rax, [r12+r8*1+1000]
        mov     [r12+r8*1+1000], r8
        lea     r14, [r12+r8*1-1000]
        mov     rax, [r13+r8*1]
        mov     rax, [r13+r8*1+8]
        mov     rax, [r13+r8*1-8]
        mov     rax, [r13+r8*1+1000]
        mov     [r13+r8*1+1000], r8
        lea     r14, [r13+r8*1-1000]
        mov     rax, [r15+r8*1]
        mov     rax, [r15+r8*1+8]
        mov     rax, [r15+r8*1-8]
        mov     rax, [r15+r8*1+1000]
        mov     [r15+r8*1+1000], r8
        lea     r14, [r15+r8*1-1000]
        mov     rax, [r8*2]
        mov     rax, [r8*2+16]
        mov     rax, [r8*2-16]
        lea     rax, [r8*2+1000]
        mov     rax, [rax+r8*2]
        mov     rax, [rax+r8*2+8]
        mov     rax, [rax+r8*2-8]
        mov     rax, [rax+r8*2+1000]
        mov     [rax+r8*2+1000], r8
        lea     r14, [rax+r8*2-1000]
        mov     rax, [rbx+r8*2]
        mov     rax, [rbx+r8*2+8]
        mov     rax, [rbx+r8*2-8]
        mov     rax, [rbx+r8*2+1000]
        mov     [rbx+r8*2+1000], r8
        lea     r14, [rbx+r8*2-1000]
        mov     rax, [rsp+r8*2]
        mov     rax, [rsp+r8*2+8]
        mov     rax, [rsp+r8*2-8]
        mov     rax, [rsp+r8*2+1000]
        mov     [rsp+r8*2+1000], r8
        lea     r14, [rsp+r8*2-1000]
        mov     rax, [rbp+r8*2]
        mov     rax, [rbp+r8*2+8]
        mov     rax, [rbp+r8*2-8]
        mov     rax, [rbp+r8*2+1000]
        mov     [rbp+r8*2+1000], r8
        lea     r14, [rbp+r8*2-1000]
        mov     rax, [r12+r8*2]
        mov     rax, [r12+r8*2+8]
        mov     rax, [r12+r8*2-8]
        mov     rax, [r12+r8*2+1000]
        mov     [r12+r8*2+1000], r8
        lea     r14, [r12+r8*2-1000]
        mov     rax, [r13+r8*2]
        mov     rax, [r13+r8*2+8]
        mov     rax, [r13+r8*2-8]
        mov     rax, [r13+r8*2+1000]
        mov     [r13+r8*2+1000], r8
        lea     r14, [r13+r8*2-1000]
        mov     rax, [r15+r8*2]
        mov     rax, [r15+r8*2+8]
        mov     rax, [r15+r8*2-8]
        mov     rax, [r15+r8*2+1000]
        mov     [r15+r8*2+1000], r8
        lea     r14, [r15+r8*2-1000]
        mov     rax, [r8*4]
        mov     rax, [r8*4+16]
        mov     rax, [r8*4-16]
        lea     rax, [r8*4+1000]
        mov     rax, [rax+r8*4]
        mov     rax, [rax+r8*4+8]
        mov     rax, [rax+r8*4-8]
        mov     rax, [rax+r8*4+1000]
        mov     [rax+r8*4+1000], r8
        lea     r14, [rax+r8*4-1000]
        mov     rax, [rbx+r8*4]
        mov     rax, [rbx+r8*4+8]
        mov     rax, [rbx+r8*4-8]
        mov     rax, [rbx+r8*4+1000]
        mov     [rbx+r8*4+1000], r8
        lea     r14, [rbx+r8*4-1000]
        mov     rax, [rsp+r8*4]
        mov     rax, [rsp+r8*4+8]
        mov     rax, [rsp+r8*4-8]
        mov     rax, [rsp+r8*4+1000]
        mov     [rsp+r8*4+1000], r8
        lea     r14, [rsp+r8*4-1000]
        mov     rax, [rbp+r8*4]
        mov     rax, [rbp+r8*4+8]
        mov     rax, [rbp+r8*4-8]
        mov     rax, [rbp+r8*4+1000]
        mov     [rbp+r8*4+1000], r8
        lea     r14, [rbp+r8*4-1000]
        mov     rax, [r12+r8*4]
        mov     rax, [r12+r8*4+8]
        mov     rax, [r12+r8*4-8]
        mov     rax, [r12+r8*4+1000]
        mov     [r12+r8*4+1000], r8
        lea     r14, [r12+r8*4-1000]
        mov     rax, [r13+r8*4]
        mov     rax, [r13+r8*4+8]
        mov     rax, [r13+r8*4-8]
        mov     rax, [r13+r8*4+1000]
        mov     [r13+r8*4+1000], r8
        lea     r14, [r13+r8*4-1000]
        mov     rax, [r15+r8*4]
        mov     rax, [r15+r8*4+8]
        mov     rax, [r15+r8*4-8]
        mov     rax, [r15+r8*4+1000]
        mov     [r15+r8*4+1000], r8
        lea     r14, [r15+r8*4-1000]
        mov     rax, [r8*8]
        mov     rax, [r8*8+16]
        mov     rax, [r8*8-16]
        lea     rax, [r8*8+1000]
        mov     rax, [rax+r8*8]
        mov     rax, [rax+r8*8+8]
        mov     rax, [rax+r8*8-8]
        mov     rax, [rax+r8*8+1000]
        mov     [rax+r8*8+1000], r8
        lea     r14, [rax+r8*8-1000]
        mov     rax, [rbx+r8*8]
        mov     rax, [rbx+r8*8+8]
        mov     rax, [rbx+r8*8-8]
        mov     rax, [rbx+r8*8+1000]
        mov     [rbx+r8*8+1000], r8
        lea     r14, [rbx+r8*8-1000]
        mov     rax, [rsp+r8*8]
        mov     rax, [rsp+r8*8+8]
        mov     rax, [rsp+r8*8-8]
        mov     rax, [rsp+r8*8+1000]
        mov     [rsp+r8*8+1000], r8
        lea     r14, [rsp+r8*8-1000]
        mov     rax, [rbp+r8*8]
        mov     rax, [rbp+r8*8+8]
        mov     rax, [rbp+r8*8-8]
        mov     rax, [rbp+r8*8+1000]
        mov     [rbp+r8*8+1000], r8
        lea     r14, [rbp+r8*8-1000]
        mov     rax, [r12+r8*8]
        mov     rax, [r12+r8*8+8]
        mov     rax, [r12+r8*8-8]
        mov     rax, [r12+r8*8+1000]
        mov     [r12+r8*8+1000], r8
        lea     r14, [r12+r8*8-1000]
        mov     rax, [r13+r8*8]
        mov     rax, [r13+r8*8+8]
        mov     rax, [r13+r8*8-8]
        mov     rax, [r13+r8*8+1000]
        mov     [r13+r8*8+1000], r8
        lea     r14, [r13+r8*8-1000]
        mov     rax, [r15+r8*8]
        mov     rax, [r15+r8*8+8]
        mov     rax, [r15+r8*8-8]
        mov     rax, [r15+r8*8+1000]
        mov     [r15+r8*8+1000], r8
        lea     r14, [r15+r8*8-1000]
        mov     rax, [r9*1]
        mov     rax, [r9*1+16]
        mov     rax, [r9*1-16]
        lea     rax, [r9*1+1000]
        mov     rax, [rax+r9*1]
        mov     rax, [rax+r9*1+8]
        mov     rax, [rax+r9*1-8]
        mov     rax, [rax+r9*1+1000]
        mov     [rax+r9*1+1000], r8
        lea     r14, [rax+r9*1-1000]
        mov     rax, [rbx+r9*1]
        mov     rax, [rbx+r9*1+8]
        mov     rax, [rbx+r9*1-8]
        mov     rax, [rbx+r9*1+1000]
        mov     [rbx+r9*1+1000], r8
        lea     r14, [rbx+r9*1-1000]
        mov     rax, [rsp+r9*1]
        mov     rax, [rsp+r9*1+8]
        mov     rax, [rsp+r9*1-8]
        mov     rax, [rsp+r9*1+1000]
        mov     [rsp+r9*1+1000], r8
        lea     r14, [rsp+r9*1-1000]
        mov     rax, [rbp+r9*1]
        mov     rax, [rbp+r9*1+8]
        mov     rax, [rbp+r9*1-8]
        mov     rax, [rbp+r9*1+1000]
        mov     [rbp+r9*1+1000], r8
        lea     r14, [rbp+r9*1-1000]
        mov     rax, [r12+r9*1]
        mov     rax, [r12+r9*1+8]
        mov     rax, [r12+r9*1-8]
        mov     rax, [r12+r9*1+1000]
        mov     [r12+r9*1+1000], r8
        lea     r14, [r12+r9*1-1000]
        mov     rax, [r13+r9*1]
        mov     rax, [r13+r9*1+8]
        mov     rax, [r13+r9*1-8]
        mov     rax, [r13+r9*1+1000]
        mov     [r13+r9*1+1000], r8
        lea     r14, [r13+r9*1-1000]
        mov     rax, [r15+r9*1]
        mov     rax, [r15+r9*1+8]
        mov     rax, [r15+r9*1-8]
        mov     rax, [r15+r9*1+1000]
        mov     [r15+r9*1+1000], r8
        lea     r14, [r15+r9*1-1000]
        mov     rax, [r9*2]
        mov     rax, [r9*2+16]
        mov     rax, [r9*2-16]
        lea     rax, [r9*2+1000]
        mov     rax, [rax+r9*2]
        mov     rax, [rax+r9*2+8]
        mov     rax, [rax+r9*2-8]
        mov     rax, [rax+r9*2+1000]
        mov     [rax+r9*2+1000], r8
        lea     r14, [rax+r9*2-1000]
        mov     rax, [rbx+r9*2]
        mov     rax, [rbx+r9*2+8]
        mov     rax, [rbx+r9*2-8]
        mov     rax, [rbx+r9*2+1000]
        mov     [rbx+r9*2+1000], r8
        lea     r14, [rbx+r9*2-1000]
        mov     rax, [rsp+r9*2]
        mov     rax, [rsp+r9*2+8]
        mov     rax, [rsp+r9*2-8]
        mov     rax, [rsp+r9*2+1000]
        mov     [rsp+r9*2+1000], r8
        lea     r14, [rsp+r9*2-1000]
        mov     rax, [rbp+r9*2]
        mov     rax, [rbp+r9*2+8]
        mov     rax, [rbp+r9*2-8]
        mov     rax, [rbp+r9*2+1000]
        mov     [rbp+r9*2+1000], r8
        lea     r14, [rbp+r9*2-1000]
        mov     rax, [r12+r9*2]
        mov     rax, [r12+r9*2+8]
        mov     rax, [r12+r9*2-8]
        mov     rax, [r12+r9*2+1000]
        mov     [r12+r9*2+1000], r8
        lea     r14, [r12+r9*2-1000]
        mov     rax, [r13+r9*2]
        mov     rax, [r13+r9*2+8]
        mov     rax, [r13+r9*2-8]
        mov     rax, [r13+r9*2+1000]
        mov     [r13+r9*2+1000], r8
        lea     r14, [r13+r9*2-1000]
        mov     rax, [r15+r9*2]
        mov     rax, [r15+r9*2+8]
        mov     rax, [r15+r9*2-8]
        mov     rax, [r15+r9*2+1000]
        mov     [r15+r9*2+1000], r8
        lea     r14, [r15+r9*2-1000]
        mov     rax, [r9*4]
        mov     rax, [r9*4+16]
        mov     rax, [r9*4-16]
        lea     rax, [r9*4+1000]
        mov     rax, [rax+r9*4]
        mov     rax, [rax+r9*4+8]
        mov     rax, [rax+r9*4-8]
        mov     rax, [rax+r9*4+1000]
        mov     [rax+r9*4+1000], r8
        lea     r14, [rax+r9*4-1000]
        mov     rax, [rbx+r9*4]
        mov     rax, [rbx+r9*4+8]
        mov     rax, [rbx+r9*4-8]
        mov     rax, [rbx+r9*4+1000]
        mov     [rbx+r9*4+1000], r8
        lea     r14, [rbx+r9*4-1000]
        mov     rax, [rsp+r9*4]
        mov     rax, [rsp+r9*4+8]
        mov     rax, [rsp+r9*4-8]
        mov     rax, [rsp+r9*4+1000]
        mov     [rsp+r9*4+1000], r8
        lea     r14, [rsp+r9*4-1000]
        mov     rax, [rbp+r9*4]
        mov     rax, [rbp+r9*4+8]
        mov     rax, [rbp+r9*4-8]
        mov     rax, [rbp+r9*4+1000]
        mov     [rbp+r9*4+1000], r8
        lea     r14, [rbp+r9*4-1000]
        mov     rax, [r12+r9*4]
        mov     rax, [r12+r9*4+8]
        mov     rax, [r12+r9*4-8]
        mov     rax, [r12+r9*4+1000]
        mov     [r12+r9*4+1000], r8
        lea     r14, [r12+r9*4-1000]
        mov     rax, [r13+r9*4]
        mov     rax, [r13+r9*4+8]
        mov     rax, [r13+r9*4-8]
        mov     rax, [r13+r9*4+1000]
        mov     [r13+r9*4+1000], r8
        lea     r14, [r13+r9*4-1000]
        mov     rax, [r15+r9*4]
        mov     rax, [r15+r9*4+8]
        mov     rax, [r15+r9*4-8]
        mov     rax, [r15+r9*4+1000]
        mov     [r15+r9*4+1000], r8
        lea     r14, [r15+r9*4-1000]
        mov     rax, [r9*8]
        mov     rax, [r9*8+16]
        mov     rax, [r9*8-16]
        lea     rax, [r9*8+1000]
        mov     rax, [rax+r9*8]
        mov     rax, [rax+r9*8+8]
        mov     rax, [rax+r9*8-8]
        mov     rax, [rax+r9*8+1000]
        mov     [rax+r9*8+1000], r8
        lea     r14, [rax+r9*8-1000]
        mov     rax, [rbx+r9*8]
        mov     rax, [rbx+r9*8+8]
        mov     rax, [rbx+r9*8-8]
        mov     rax, [rbx+r9*8+1000]
        mov     [rbx+r9*8+1000], r8
        lea     r14, [rbx+r9*8-1000]
        mov     rax, [rsp+r9*8]
        mov     rax, [rsp+r9*8+8]
        mov     rax, [rsp+r9*8-8]
        mov     rax, [rsp+r9*8+1000]
        mov     [rsp+r9*8+1000], r8
        lea     r14, [rsp+r9*8-1000]
        mov     rax, [rbp+r9*8]
        mov     rax, [rbp+r9*8+8]
        mov     rax, [rbp+r9*8-8]
        mov     rax, [rbp+r9*8+1000]
        mov     [rbp+r9*8+1000], r8
        lea     r14, [rbp+r9*8-1000]
        mov     rax, [r12+r9*8]
        mov     rax, [r12+r9*8+8]
        mov     rax, [r12+r9*8-8]
        mov     rax, [r12+r9*8+1000]
        mov     [r12+r9*8+1000], r8
        lea     r14, [r12+r9*8-1000]
        mov     rax, [r13+r9*8]
        mov     rax, [r13+r9*8+8]
        mov     rax, [r13+r9*8-8]
        mov     rax, [r13+r9*8+1000]
        mov     [r13+r9*8+1000], r8
        lea     r14, [r13+r9*8-1000]
        mov     rax, [r15+r9*8]
        mov     rax, [r15+r9*8+8]
        mov     rax, [r15+r9*8-8]
        mov     rax, [r15+r9*8+1000]
        mov     [r15+r9*8+1000], r8
        lea     r14, [r15+r9*8-1000]
        mov     rax, [r10*1]
        mov     rax, [r10*1+16]
        mov     rax, [r10*1-16]
        lea     rax, [r10*1+1000]
        mov     rax, [rax+r10*1]
        mov     rax, [rax+r10*1+8]
        mov     rax, [rax+r10*1-8]
        mov     rax, [rax+r10*1+1000]
        mov     [rax+r10*1+1000], r8
        lea     r14, [rax+r10*1-1000]
        mov     rax, [rbx+r10*1]
        mov     rax, [rbx+r10*1+8]
        mov     rax, [rbx+r10*1-8]
        mov     rax, [rbx+r10*1+1000]
        mov     [rbx+r10*1+1000], r8
        lea     r14, [rbx+r10*1-1000]
        mov     rax, [rsp+r10*1]
        mov     rax, [rsp+r10*1+8]
        mov     rax, [rsp+r10*1-8]
        mov     rax, [rsp+r10*1+1000]
        mov     [rsp+r10*1+1000], r8
        lea     r14, [rsp+r10*1-1000]
        mov     rax, [rbp+r10*1]
        mov     rax, [rbp+r10*1+8]
        mov     rax, [rbp+r10*1-8]
        mov     rax, [rbp+r10*1+1000]
        mov     [rbp+r10*1+1000], r8
        lea     r14, [rbp+r10*1-1000]
        mov     rax, [r12+r10*1]
        mov     rax, [r12+r10*1+8]
        mov     rax, [r12+r10*1-8]
        mov     rax, [r12+r10*1+1000]
        mov     [r12+r10*1+1000], r8
        lea     r14, [r12+r10*1-1000]
        mov     rax, [r13+r10*1]
        mov     rax, [r13+r10*1+8]
        mov     rax, [r13+r10*1-8]
        mov     rax, [r13+r10*1+1000]
        mov     [r13+r10*1+1000], r8
        lea     r14, [r13+r10*1-1000]
        mov     rax, [r15+r10*1]
        mov     rax, [r15+r10*1+8]
        mov     rax, [r15+r10*1-8]
        mov     rax, [r15+r10*1+1000]
        mov     [r15+r10*1+1000], r8
        lea     r14, [r15+r10*1-1000]
        mov     rax, [r10*2]
        mov     rax, [r10*2+16]
        mov     rax, [r10*2-16]
        lea     rax, [r10*2+1000]
        mov     rax, [rax+r10*2]
        mov     rax, [rax+r10*2+8]
        mov     rax, [rax+r10*2-8]
        mov     rax, [rax+r10*2+1000]
        mov     [rax+r10*2+1000], r8
        lea     r14, [rax+r10*2-1000]
        mov     rax, [rbx+r10*2]
        mov     rax, [rbx+r10*2+8]
        mov     rax, [rbx+r10*2-8]
        mov     rax, [rbx+r10*2+1000]
        mov     [rbx+r10*2+1000], r8
        lea     r14, [rbx+r10*2-1000]
        mov     rax, [rsp+r10*2]
        mov     rax, [rsp+r10*2+8]
        mov     rax, [rsp+r10*2-8]
        mov     rax, [rsp+r10*2+1000]
        mov     [rsp+r10*2+1000], r8
        lea     r14, [rsp+r10*2-1000]
        mov     rax, [rbp+r10*2]
        mov     rax, [rbp+r10*2+8]
        mov     rax, [rbp+r10*2-8]
        mov     rax, [rbp+r10*2+1000]
        mov     [rbp+r10*2+1000], r8
        lea     r14, [rbp+r10*2-1000]
        mov     rax, [r12+r10*2]
        mov     rax, [r12+r10*2+8]
        mov     rax, [r12+r10*2-8]
        mov     rax, [r12+r10*2+1000]
        mov     [r12+r10*2+1000], r8
        lea     r14, [r12+r10*2-1000]
        mov     rax, [r13+r10*2]
        mov     rax, [r13+r10*2+8]
        mov     rax, [r13+r10*2-8]
        mov     rax, [r13+r10*2+1000]
        mov     [r13+r10*2+1000], r8
        lea     r14, [r13+r10*2-1000]
        mov     rax, [r15+r10*2]
        mov     rax, [r15+r10*2+8]
        mov     rax, [r15+r10*2-8]
        mov     rax, [r15+r10*2+1000]
        mov     [r15+r10*2+1000], r8
        lea     r14, [r15+r10*2-1000]
        mov     rax, [r10*4]
        mov     rax, [r10*4+16]
        mov     rax, [r10*4-16]
        lea     rax, [r10*4+1000]
        mov     rax, [rax+r10*4]
        mov     rax, [rax+r10*4+8]
        mov     rax, [rax+r10*4-8]
        mov     rax, [rax+r10*4+1000]
        mov     [rax+r10*4+1000], r8
        lea     r14, [rax+r10*4-1000]
        mov     rax, [rbx+r10*4]
        mov     rax, [rbx+r10*4+8]
        mov     rax, [rbx+r10*4-8]
        mov     rax, [rbx+r10*4+1000]
        mov     [rbx+r10*4+1000], r8
        lea     r14, [rbx+r10*4-1000]
        mov     rax, [rsp+r10*4]
        mov     rax, [rsp+r10*4+8]
        mov     rax, [rsp+r10*4-8]
        mov     rax, [rsp+r10*4+1000]
        mov     [rsp+r10*4+1000], r8
        lea     r14, [rsp+r10*4-1000]
        mov     rax, [rbp+r10*4]
        mov     rax, [rbp+r10*4+8]
        mov     rax, [rbp+r10*4-8]
        mov     rax, [rbp+r10*4+1000]
        mov     [rbp+r10*4+1000], r8
        lea     r14, [rbp+r10*4-1000]
        mov     rax, [r12+r10*4]
        mov     rax, [r12+r10*4+8]
        mov     rax, [r12+r10*4-8]
        mov     rax, [r12+r10*4+1000]
        mov     [r12+r10*4+1000], r8
        lea     r14, [r12+r10*4-1000]
        mov     rax, [r13+r10*4]
        mov     rax, [r13+r10*4+8]
        mov     rax, [r13+r10*4-8]
        mov     rax, [r13+r10*4+1000]
        mov     [r13+r10*4+1000], r8
        lea     r14, [r13+r10*4-1000]
        mov     rax, [r15+r10*4]
        mov     rax, [r15+r10*4+8]
        mov     rax, [r15+r10*4-8]
        mov     rax, [r15+r10*4+1000]
        mov     [r15+r10*4+1000], r8
        lea     r14, [r15+r10*4-1000]
        mov     rax, [r10*8]
        mov     rax, [r10*8+16]
        mov     rax, [r10*8-16]
        lea     rax, [r10*8+1000]
        mov     rax, [rax+r10*8]
        mov     rax, [rax+r10*8+8]
        mov     rax, [rax+r10*8-8]
        mov     rax, [rax+r10*8+1000]
        mov     [rax+r10*8+1000], r8
        lea     r14, [rax+r10*8-1000]
        mov     rax, [rbx+r10*8]
        mov     rax, [rbx+r10*8+8]
        mov     rax, [rbx+r10*8-8]
        mov     rax, [rbx+r10*8+1000]
        mov     [rbx+r10*8+1000], r8
        lea     r14, [rbx+r10*8-1000]
        mov     rax, [rsp+r10*8]
        mov     rax, [rsp+r10*8+8]
        mov     rax, [rsp+r10*8-8]
        mov     rax, [rsp+r10*8+1000]
        mov     [rsp+r10*8+1000], r8
        lea     r14, [rsp+r10*8-1000]
        mov     rax, [rbp+r10*8]
        mov     rax, [rbp+r10*8+8]
        mov     rax, [rbp+r10*8-8]
        mov     rax, [rbp+r10*8+1000]
        mov     [rbp+r10*8+1000], r8
        lea     r14, [rbp+r10*8-1000]
        mov     rax, [r12+r10*8]
        mov     rax, [r12+r10*8+8]
        mov     rax, [r12+r10*8-8]
        mov     rax, [r12+r10*8+1000]
        mov     [r12+r10*8+1000], r8
        lea     r14, [r12+r10*8-1000]
        mov     rax, [r13+r10*8]
        mov     rax, [r13+r10*8+8]
        mov     rax, [r13+r10*8-8]
        mov     rax, [r13+r10*8+1000]
        mov     [r13+r10*8+1000], r8
        lea     r14, [r13+r10*8-1000]
        mov     rax, [r15+r10*8]
        mov     rax, [r15+r10*8+8]
        mov     rax, [r15+r10*8-8]
        mov     rax, [r15+r10*8+1000]
        mov     [r15+r10*8+1000], r8
        lea     r14, [r15+r10*8-1000]
        mov     rax, [r11*1]
        mov     rax, [r11*1+16]
        mov     rax, [r11*1-16]
        lea     rax, [r11*1+1000]
        mov     rax, [rax+r11*1]
        mov     rax, [rax+r11*1+8]
        mov     rax, [rax+r11*1-8]
        mov     rax, [rax+r11*1+1000]
        mov     [rax+r11*1+1000], r8
        lea     r14, [rax+r11*1-1000]
        mov     rax, [rbx+r11*1]
        mov     rax, [rbx+r11*1+8]
        mov     rax, [rbx+r11*1-8]
        mov     rax, [rbx+r11*1+1000]
        mov     [rbx+r11*1+1000], r8
        lea     r14, [rbx+r11*1-1000]
        mov     rax, [rsp+r11*1]
        mov     rax, [rsp+r11*1+8]
        mov     rax, [rsp+r11*1-8]
        mov     rax, [rsp+r11*1+1000]
        mov     [rsp+r11*1+1000], r8
        lea     r14, [rsp+r11*1-1000]
        mov     rax, [rbp+r11*1]
        mov     rax, [rbp+r11*1+8]
        mov     rax, [rbp+r11*1-8]
        mov     rax, [rbp+r11*1+1000]
        mov     [rbp+r11*1+1000], r8
        lea     r14, [rbp+r11*1-1000]
        mov     rax, [r12+r11*1]
        mov     rax, [r12+r11*1+8]
        mov     rax, [r12+r11*1-8]
        mov     rax, [r12+r11*1+1000]
        mov     [r12+r11*1+1000], r8
        lea     r14, [r12+r11*1-1000]
        mov     rax, [r13+r11*1]
        mov     rax, [r13+r11*1+8]
        mov     rax, [r13+r11*1-8]
        mov     rax, [r13+r11*1+1000]
        mov     [r13+r11*1+1000], r8
        lea     r14, [r13+r11*1-1000]
        mov     rax, [r15+r11*1]
        mov     rax, [r15+r11*1+8]
        mov     rax, [r15+r11*1-8]
        mov     rax, [r15+r11*1+1000]
        mov     [r15+r11*1+1000], r8
        lea     r14, [r15+r11*1-1000]
        mov     rax, [r11*2]
        mov     rax, [r11*2+16]
        mov     rax, [r11*2-16]
        lea     rax, [r11*2+1000]
        mov     rax, [rax+r11*2]
        mov     rax, [rax+r11*2+8]
        mov     rax, [rax+r11*2-8]
        mov     rax, [rax+r11*2+1000]
        mov     [rax+r11*2+1000], r8
        lea     r14, [rax+r11*2-1000]
        mov     rax, [rbx+r11*2]
        mov     rax, [rbx+r11*2+8]
        mov     rax, [rbx+r11*2-8]
        mov     rax, [rbx+r11*2+1000]
        mov     [rbx+r11*2+1000], r8
        lea     r14, [rbx+r11*2-1000]
        mov     rax, [rsp+r11*2]
        mov     rax, [rsp+r11*2+8]
        mov     rax, [rsp+r11*2-8]
        mov     rax, [rsp+r11*2+1000]
        mov     [rsp+r11*2+1000], r8
        lea     r14, [rsp+r11*2-1000]
        mov     rax, [rbp+r11*2]
        mov     rax, [rbp+r11*2+8]
        mov     rax, [rbp+r11*2-8]
        mov     rax, [rbp+r11*2+1000]
        mov     [rbp+r11*2+1000], r8
        lea     r14, [rbp+r11*2-1000]
        mov     rax, [r12+r11*2]
        mov     rax, [r12+r11*2+8]
        mov     rax, [r12+r11*2-8]
        mov     rax, [r12+r11*2+1000]
        mov     [r12+r11*2+1000], r8
        lea     r14, [r12+r11*2-1000]
        mov     rax, [r13+r11*2]
        mov     rax, [r13+r11*2+8]
        mov     rax, [r13+r11*2-8]
        mov     rax, [r13+r11*2+1000]
        mov     [r13+r11*2+1000], r8
        lea     r14, [r13+r11*2-1000]
        mov     rax, [r15+r11*2]
        mov     rax, [r15+r11*2+8]
        mov     rax, [r15+r11*2-8]
        mov     rax, [r15+r11*2+1000]
        mov     [r15+r11*2+1000], r8
        lea     r14, [r15+r11*2-1000]
        mov     rax, [r11*4]
        mov     rax, [r11*4+16]
        mov     rax, [r11*4-16]
        lea     rax, [r11*4+1000]
        mov     rax, [rax+r11*4]
        mov     rax, [rax+r11*4+8]
        mov     rax, [rax+r11*4-8]
        mov     rax, [rax+r11*4+1000]
        mov     [rax+r11*4+1000], r8
        lea     r14, [rax+r11*4-1000]
        mov     rax, [rbx+r11*4]
        mov     rax, [rbx+r11*4+8]
        mov     rax, [rbx+r11*4-8]
        mov     rax, [rbx+r11*4+1000]
        mov     [rbx+r11*4+1000], r8
        lea     r14, [rbx+r11*4-1000]
        mov     rax, [rsp+r11*4]
        mov     rax, [rsp+r11*4+8]
        mov     rax, [rsp+r11*4-8]
        mov     rax, [rsp+r11*4+1000]
        mov     [rsp+r11*4+1000], r8
        lea     r14, [rsp+r11*4-1000]
        mov     rax, [rbp+r11*4]
        mov     rax, [rbp+r11*4+8]
        mov     rax, [rbp+r11*4-8]
        mov     rax, [rbp+r11*4+1000]
        mov     [rbp+r11*4+1000], r8
        lea     r14, [rbp+r11*4-1000]
        mov     rax, [r12+r11*4]
        mov     rax, [r12+r11*4+8]
        mov     rax, [r12+r11*4-8]
        mov     rax, [r12+r11*4+1000]
        mov     [r12+r11*4+1000], r8
        lea     r14, [r12+r11*4-1000]
        mov     rax, [r13+r11*4]
        mov     rax, [r13+r11*4+8]
        mov     rax, [r13+r11*4-8]
        mov     rax, [r13+r11*4+1000]
        mov     [r13+r11*4+1000], r8
        lea     r14, [r13+r11*4-1000]
        mov     rax, [r15+r11*4]
        mov     rax, [r15+r11*4+8]
        mov     rax, [r15+r11*4-8]
        mov     rax, [r15+r11*4+1000]
        mov     [r15+r11*4+1000], r8
        lea     r14, [r15+r11*4-1000]
        mov     rax, [r11*8]
        mov     rax, [r11*8+16]
        mov     rax, [r11*8-16]
        lea     rax, [r11*8+1000]
        mov     rax, [rax+r11*8]
        mov     rax, [rax+r11*8+8]
        mov     rax, [rax+r11*8-8]
        mov     rax, [rax+r11*8+1000]
        mov     [rax+r11*8+1000], r8
        lea     r14, [rax+r11*8-1000]
        mov     rax, [rbx+r11*8]
        mov     rax, [rbx+r11*8+8]
        mov     rax, [rbx+r11*8-8]
        mov     rax, [rbx+r11*8+1000]
        mov     [rbx+r11*8+1000], r8
        lea     r14, [rbx+r11*8-1000]
        mov     rax, [rsp+r11*8]
        mov     rax, [rsp+r11*8+8]
        mov     rax, [rsp+r11*8-8]
        mov     rax, [rsp+r11*8+1000]
        mov     [rsp+r11*8+1000], r8
        lea     r14, [rsp+r11*8-1000]
        mov     rax, [rbp+r11*8]
        mov     rax, [rbp+r11*8+8]
        mov     rax, [rbp+r11*8-8]
        mov     rax, [rbp+r11*8+1000]
        mov     [rbp+r11*8+1000], r8
        lea     r14, [rbp+r11*8-1000]
        mov     rax, [r12+r11*8]
        mov     rax, [r12+r11*8+8]
        mov     rax, [r12+r11*8-8]
        mov     rax, [r12+r11*8+1000]
        mov     [r12+r11*8+1000], r8
        lea     r14, [r12+r11*8-1000]
        mov     rax, [r13+r11*8]
        mov     rax, [r13+r11*8+8]
        mov     rax, [r13+r11*8-8]
        mov     rax, [r13+r11*8+1000]
        mov     [r13+r11*8+1000], r8
        lea     r14, [r13+r11*8-1000]
        mov     rax, [r15+r11*8]
        mov     rax, [r15+r11*8+8]
        mov     rax, [r15+r11*8-8]
        mov     rax, [r15+r11*8+1000]
        mov     [r15+r11*8+1000], r8
        lea     r14, [r15+r11*8-1000]
        mov     rax, [r12*1]
        mov     rax, [r12*1+16]
        mov     rax, [r12*1-16]
        lea     rax, [r12*1+1000]
        mov     rax, [rax+r12*1]
        mov     rax, [rax+r12*1+8]
        mov     rax, [rax+r12*1-8]
        mov     rax, [rax+r12*1+1000]
        mov     [rax+r12*1+1000], r8
        lea     r14, [rax+r12*1-1000]
        mov     rax, [rbx+r12*1]
        mov     rax, [rbx+r12*1+8]
        mov     rax, [rbx+r12*1-8]
        mov     rax, [rbx+r12*1+1000]
        mov     [rbx+r12*1+1000], r8
        lea     r14, [rbx+r12*1-1000]
        mov     rax, [rsp+r12*1]
        mov     rax, [rsp+r12*1+8]
        mov     rax, [rsp+r12*1-8]
        mov     rax, [rsp+r12*1+1000]
        mov     [rsp+r12*1+1000], r8
        lea     r14, [rsp+r12*1-1000]
        mov     rax, [rbp+r12*1]
        mov     rax, [rbp+r12*1+8]
        mov     rax, [rbp+r12*1-8]
        mov     rax, [rbp+r12*1+1000]
        mov     [rbp+r12*1+1000], r8
        lea     r14, [rbp+r12*1-1000]
        mov     rax, [r12+r12*1]
        mov     rax, [r12+r12*1+8]
        mov     rax, [r12+r12*1-8]
        mov     rax, [r12+r12*1+1000]
        mov     [r12+r12*1+1000], r8
        lea     r14, [r12+r12*1-1000]
        mov     rax, [r13+r12*1]
        mov     rax, [r13+r12*1+8]
        mov     rax, [r13+r12*1-8]
        mov     rax, [r13+r12*1+1000]
        mov     [r13+r12*1+1000], r8
        lea     r14, [r13+r12*1-1000]
        mov     rax, [r15+r12*1]
        mov     rax, [r15+r12*1+8]
        mov     rax, [r15+r12*1-8]
        mov     rax, [r15+r12*1+1000]
        mov     [r15+r12*1+1000], r8
        lea     r14, [r15+r12*1-1000]
        mov     rax, [r12*2]
        mov     rax, [r12*2+16]
        mov     rax, [r12*2-16]
        lea     rax, [r12*2+1000]
        mov     rax, [rax+r12*2]
        mov     rax, [rax+r12*2+8]
        mov     rax, [rax+r12*2-8]
        mov     rax, [rax+r12*2+1000]
        mov     [rax+r12*2+1000], r8
        lea     r14, [rax+r12*2-1000]
        mov     rax, [rbx+r12*2]
        mov     rax, [rbx+r12*2+8]
        mov     rax, [rbx+r12*2-8]
        mov     rax, [rbx+r12*2+1000]
        mov     [rbx+r12*2+1000], r8
        lea     r14, [rbx+r12*2-1000]
        mov     rax, [rsp+r12*2]
        mov     rax, [rsp+r12*2+8]
        mov     rax, [rsp+r12*2-8]
        mov     rax, [rsp+r12*2+1000]
        mov     [rsp+r12*2+1000], r8
        lea     r14, [rsp+r12*2-1000]
        mov     rax, [rbp+r12*2]
        mov     rax, [rbp+r12*2+8]
        mov     rax, [rbp+r12*2-8]
        mov     rax, [rbp+r12*2+1000]
        mov     [rbp+r12*2+1000], r8
        lea     r14, [rbp+r12*2-1000]
        mov     rax, [r12+r12*2]
        mov     rax, [r12+r12*2+8]
        mov     rax, [r12+r12*2-8]
        mov     rax, [r12+r12*2+1000]
        mov     [r12+r12*2+1000], r8
        lea     r14, [r12+r12*2-1000]
        mov     rax, [r13+r12*2]
        mov     rax, [r13+r12*2+8]
        mov     rax, [r13+r12*2-8]
        mov     rax, [r13+r12*2+1000]
        mov     [r13+r12*2+1000], r8
        lea     r14, [r13+r12*2-1000]
        mov     rax, [r15+r12*2]
        mov     rax, [r15+r12*2+8]
        mov     rax, [r15+r12*2-8]
        mov     rax, [r15+r12*2+1000]
        mov     [r15+r12*2+1000], r8
        lea     r14, [r15+r12*2-1000]
        mov     rax, [r12*4]
        mov     rax, [r12*4+16]
        mov     rax, [r12*4-16]
        lea     rax, [r12*4+1000]
        mov     rax, [rax+r12*4]
        mov     rax, [rax+r12*4+8]
        mov     rax, [rax+r12*4-8]
        mov     rax, [rax+r12*4+1000]
        mov     [rax+r12*4+1000], r8
        lea     r14, [rax+r12*4-1000]
        mov     rax, [rbx+r12*4]
        mov     rax, [rbx+r12*4+8]
        mov     rax, [rbx+r12*4-8]
        mov     rax, [rbx+r12*4+1000]
        mov     [rbx+r12*4+1000], r8
        lea     r14, [rbx+r12*4-1000]
        mov     rax, [rsp+r12*4]
        mov     rax, [rsp+r12*4+8]
        mov     rax, [rsp+r12*4-8]
        mov     rax, [rsp+r12*4+1000]
        mov     [rsp+r12*4+1000], r8
        lea     r14, [rsp+r12*4-1000]
        mov     rax, [rbp+r12*4]
        mov     rax, [rbp+r12*4+8]
        mov     rax, [rbp+r12*4-8]
        mov     rax, [rbp+r12*4+1000]
        mov     [rbp+r12*4+1000], r8
        lea     r14, [rbp+r12*4-1000]
        mov     rax, [r12+r12*4]
        mov     rax, [r12+r12*4+8]
        mov     rax, [r12+r12*4-8]
        mov     rax, [r12+r12*4+1000]
        mov     [r12+r12*4+1000], r8
        lea     r14, [r12+r12*4-1000]
        mov     rax, [r13+r12*4]
        mov     rax, [r13+r12*4+8]
        mov     rax, [r13+r12*4-8]
        mov     rax, [r13+r12*4+1000]
        mov     [r13+r12*4+1000], r8
        lea     r14, [r13+r12*4-1000]
        mov     rax, [r15+r12*4]
        mov     rax, [r15+r12*4+8]
        mov     rax, [r15+r12*4-8]
        mov     rax, [r15+r12*4+1000]
        mov     [r15+r12*4+1000], r8
        lea     r14, [r15+r12*4-1000]
        mov     rax, [r12*8]
        mov     rax, [r12*8+16]
        mov     rax, [r12*8-16]
        lea     rax, [r12*8+1000]
        mov     rax, [rax+r12*8]
        mov     rax, [rax+r12*8+8]
        mov     rax, [rax+r12*8-8]
        mov     rax, [rax+r12*8+1000]
        mov     [rax+r12*8+1000], r8
        lea     r14, [rax+r12*8-1000]
        mov     rax, [rbx+r12*8]
        mov     rax, [rbx+r12*8+8]
        mov     rax, [rbx+r12*8-8]
        mov     rax, [rbx+r12*8+1000]
        mov     [rbx+r12*8+1000], r8
        lea     r14, [rbx+r12*8-1000]
        mov     rax, [rsp+r12*8]
        mov     rax, [rsp+r12*8+8]
        mov     rax, [rsp+r12*8-8]
        mov     rax, [rsp+r12*8+1000]
        mov     [rsp+r12*8+1000], r8
        lea     r14, [rsp+r12*8-1000]
        mov     rax, [rbp+r12*8]
        mov     rax, [rbp+r12*8+8]
        mov     rax, [rbp+r12*8-8]
        mov     rax, [rbp+r12*8+1000]
        mov     [rbp+r12*8+1000], r8
        lea     r14, [rbp+r12*8-1000]
        mov     rax, [r12+r12*8]
        mov     rax, [r12+r12*8+8]
        mov     rax, [r12+r12*8-8]
        mov     rax, [r12+r12*8+1000]
        mov     [r12+r12*8+1000], r8
        lea     r14, [r12+r12*8-1000]
        mov     rax, [r13+r12*8]
        mov     rax, [r13+r12*8+8]
        mov     rax, [r13+r12*8-8]
        mov     rax, [r13+r12*8+1000]
        mov     [r13+r12*8+1000], r8
        lea     r14, [r13+r12*8-1000]
        mov     rax, [r15+r12*8]
        mov     rax, [r15+r12*8+8]
        mov     rax, [r15+r12*8-8]
        mov     rax, [r15+r12*8+1000]
        mov     [r15+r12*8+1000], r8
        lea     r14, [r15+r12*8-1000]
        mov     rax, [r13*1]
        mov     rax, [r13*1+16]
        mov     rax, [r13*1-16]
        lea     rax, [r13*1+1000]
        mov     rax, [rax+r13*1]
        mov     rax, [rax+r13*1+8]
        mov     rax, [rax+r13*1-8]
        mov     rax, [rax+r13*1+1000]
        mov     [rax+r13*1+1000], r8
        lea     r14, [rax+r13*1-1000]
        mov     rax, [rbx+r13*1]
        mov     rax, [rbx+r13*1+8]
        mov     rax, [rbx+r13*1-8]
        mov     rax, [rbx+r13*1+1000]
        mov     [rbx+r13*1+1000], r8
        lea     r14, [rbx+r13*1-1000]
        mov     rax, [rsp+r13*1]
        mov     rax, [rsp+r13*1+8]
        mov     rax, [rsp+r13*1-8]
        mov     rax, [rsp+r13*1+1000]
        mov     [rsp+r13*1+1000], r8
        lea     r14, [rsp+r13*1-1000]
        mov     rax, [rbp+r13*1]
        mov     rax, [rbp+r13*1+8]
        mov     rax, [rbp+r13*1-8]
        mov     rax, [rbp+r13*1+1000]
        mov     [rbp+r13*1+1000], r8
        lea     r14, [rbp+r13*1-1000]
        mov     rax, [r12+r13*1]
        mov     rax, [r12+r13*1+8]
        mov     rax, [r12+r13*1-8]
        mov     rax, [r12+r13*1+1000]
        mov     [r12+r13*1+1000], r8
        lea     r14, [r12+r13*1-1000]
        mov     rax, [r13+r13*1]
        mov     rax, [r13+r13*1+8]
        mov     rax, [r13+r13*1-8]
        mov     rax, [r13+r13*1+1000]
        mov     [r13+r13*1+1000], r8
        lea     r14, [r13+r13*1-1000]
        mov     rax, [r15+r13*1]
        mov     rax, [r15+r13*1+8]
        mov     rax, [r15+r13*1-8]
        mov     rax, [r15+r13*1+1000]
        mov     [r15+r13*1+1000], r8
        lea     r14, [r15+r13*1-1000]
        mov     rax, [r13*2]
        mov     rax, [r13*2+16]
        mov     rax, [r13*2-16]
        lea     rax, [r13*2+1000]
        mov     rax, [rax+r13*2]
        mov     rax, [rax+r13*2+8]
        mov     rax, [rax+r13*2-8]
        mov     rax, [rax+r13*2+1000]
        mov     [rax+r13*2+1000], r8
        lea     r14, [rax+r13*2-1000]
        mov     rax, [rbx+r13*2]
        mov     rax, [rbx+r13*2+8]
        mov     rax, [rbx+r13*2-8]
        mov     rax, [rbx+r13*2+1000]
        mov     [rbx+r13*2+1000], r8
        lea     r14, [rbx+r13*2-1000]
        mov     rax, [rsp+r13*2]
        mov     rax, [rsp+r13*2+8]
        mov     rax, [rsp+r13*2-8]
        mov     rax, [rsp+r13*2+1000]
        mov     [rsp+r13*2+1000], r8
        lea     r14, [rsp+r13*2-1000]
        mov     rax, [rbp+r13*2]
        mov     rax, [rbp+r13*2+8]
        mov     rax, [rbp+r13*2-8]
        mov     rax, [rbp+r13*2+1000]
        mov     [rbp+r13*2+1000], r8
        lea     r14, [rbp+r13*2-1000]
        mov     rax, [r12+r13*2]
        mov     rax, [r12+r13*2+8]
        mov     rax, [r12+r13*2-8]
        mov     rax, [r12+r13*2+1000]
        mov     [r12+r13*2+1000], r8
        lea     r14, [r12+r13*2-1000]
        mov     rax, [r13+r13*2]
        mov     rax, [r13+r13*2+8]
        mov     rax, [r13+r13*2-8]
        mov     rax, [r13+r13*2+1000]
        mov     [r13+r13*2+1000], r8
        lea     r14, [r13+r13*2-1000]
        mov     rax, [r15+r13*2]
        mov     rax, [r15+r13*2+8]
        mov     rax, [r15+r13*2-8]
        mov     rax, [r15+r13*2+1000]
        mov     [r15+r13*2+1000], r8
        lea     r14, [r15+r13*2-1000]
        mov     rax, [r13*4]
        mov     rax, [r13*4+16]
        mov     rax, [r13*4-16]
        lea     rax, [r13*4+1000]
        mov     rax, [rax+r13*4]
        mov     rax, [rax+r13*4+8]
        mov     rax, [rax+r13*4-8]
        mov     rax, [rax+r13*4+1000]
        mov     [rax+r13*4+1000], r8
        lea     r14, [rax+r13*4-1000]
        mov     rax, [rbx+r13*4]
        mov     rax, [rbx+r13*4+8]
        mov     rax, [rbx+r13*4-8]
        mov     rax, [rbx+r13*4+1000]
        mov     [rbx+r13*4+1000], r8
        lea     r14, [rbx+r13*4-1000]
        mov     rax, [rsp+r13*4]
        mov     rax, [rsp+r13*4+8]
        mov     rax, [rsp+r13*4-8]
        mov     rax, [rsp+r13*4+1000]
        mov     [rsp+r13*4+1000], r8
        lea     r14, [rsp+r13*4-1000]
        mov     rax, [rbp+r13*4]
        mov     rax, [rbp+r13*4+8]
        mov     rax, [rbp+r13*4-8]
        mov     rax, [rbp+r13*4+1000]
        mov     [rbp+r13*4+1000], r8
        lea     r14, [rbp+r13*4-1000]
        mov     rax, [r12+r13*4]
        mov     rax, [r12+r13*4+8]
        mov     rax, [r12+r13*4-8]
        mov     rax, [r12+r13*4+1000]
        mov     [r12+r13*4+1000], r8
        lea     r14, [r12+r13*4-1000]
        mov     rax, [r13+r13*4]
        mov     rax, [r13+r13*4+8]
        mov     rax, [r13+r13*4-8]
        mov     rax, [r13+r13*4+1000]
        mov     [r13+r13*4+1000], r8
        lea     r14, [r13+r13*4-1000]
        mov     rax, [r15+r13*4]
        mov     rax, [r15+r13*4+8]
        mov     rax, [r15+r13*4-8]
        mov     rax, [r15+r13*4+1000]
        mov     [r15+r13*4+1000], r8
        lea     r14, [r15+r13*4-1000]
        mov     rax, [r13*8]
        mov     rax, [r13*8+16]
        mov     rax, [r13*8-16]
        lea     rax, [r13*8+1000]
        mov     rax, [rax+r13*8]
        mov     rax, [rax+r13*8+8]
        mov     rax, [rax+r13*8-8]
        mov     rax, [rax+r13*8+1000]
        mov     [rax+r13*8+1000], r8
        lea     r14, [rax+r13*8-1000]
        mov     rax, [rbx+r13*8]
        mov     rax, [rbx+r13*8+8]
        mov     rax, [rbx+r13*8-8]
        mov     rax, [rbx+r13*8+1000]
        mov     [rbx+r13*8+1000], r8
        lea     r14, [rbx+r13*8-1000]
        mov     rax, [rsp+r13*8]
        mov     rax, [rsp+r13*8+8]
        mov     rax, [rsp+r13*8-8]
        mov     rax, [rsp+r13*8+1000]
        mov     [rsp+r13*8+1000], r8
        lea     r14, [rsp+r13*8-1000]
        mov     rax, [rbp+r13*8]
        mov     rax, [rbp+r13*8+8]
        mov     rax, [rbp+r13*8-8]
        mov     rax, [rbp+r13*8+1000]
        mov     [rbp+r13*8+1000], r8
        lea     r14, [rbp+r13*8-1000]
        mov     rax, [r12+r13*8]
        mov     rax, [r12+r13*8+8]
        mov     rax, [r12+r13*8-8]
        mov     rax, [r12+r13*8+1000]
        mov     [r12+r13*8+1000], r8
        lea     r14, [r12+r13*8-1000]
        mov     rax, [r13+r13*8]
        mov     rax, [r13+r13*8+8]
        mov     rax, [r13+r13*8-8]
        mov     rax, [r13+r13*8+1000]
        mov     [r13+r13*8+1000], r8
        lea     r14, [r13+r13*8-1000]
        mov     rax, [r15+r13*8]
        mov     rax, [r15+r13*8+8]
        mov     rax, [r15+r13*8-8]
        mov     rax, [r15+r13*8+1000]
        mov     [r15+r13*8+1000], r8
        lea     r14, [r15+r13*8-1000]
        mov     rax, [r14*1]
        mov     rax, [r14*1+16]
        mov     rax, [r14*1-16]
        lea     rax, [r14*1+1000]
        mov     rax, [rax+r14*1]
        mov     rax, [rax+r14*1+8]
        mov     rax, [rax+r14*1-8]
        mov     rax, [rax+r14*1+1000]
        mov     [rax+r14*1+1000], r8
        lea     r14, [rax+r14*1-1000]
        mov     rax, [rbx+r14*1]
        mov     rax, [rbx+r14*1+8]
        mov     rax, [rbx+r14*1-8]
        mov     rax, [rbx+r14*1+1000]
        mov     [rbx+r14*1+1000], r8
        lea     r14, [rbx+r14*1-1000]
        mov     rax, [rsp+r14*1]
        mov     rax, [rsp+r14*1+8]
        mov     rax, [rsp+r14*1-8]
        mov     rax, [rsp+r14*1+1000]
        mov     [rsp+r14*1+1000], r8
        lea     r14, [rsp+r14*1-1000]
        mov     rax, [rbp+r14*1]
        mov     rax, [rbp+r14*1+8]
        mov     rax, [rbp+r14*1-8]
        mov     rax, [rbp+r14*1+1000]
        mov     [rbp+r14*1+1000], r8
        lea     r14, [rbp+r14*1-1000]
        mov     rax, [r12+r14*1]
        mov     rax, [r12+r14*1+8]
        mov     rax, [r12+r14*1-8]
        mov     rax, [r12+r14*1+1000]
        mov     [r12+r14*1+1000], r8
        lea     r14, [r12+r14*1-1000]
        mov     rax, [r13+r14*1]
        mov     rax, [r13+r14*1+8]
        mov     rax, [r13+r14*1-8]
        mov     rax, [r13+r14*1+1000]
        mov     [r13+r14*1+1000], r8
        lea     r14, [r13+r14*1-1000]
        mov     rax, [r15+r14*1]
        mov     rax, [r15+r14*1+8]
        mov     rax, [r15+r14*1-8]
        mov     rax, [r15+r14*1+1000]
        mov     [r15+r14*1+1000], r8
        lea     r14, [r15+r14*1-1000]
        mov     rax, [r14*2]
        mov     rax, [r14*2+16]
        mov     rax, [r14*2-16]
        lea     rax, [r14*2+1000]
        mov     rax, [rax+r14*2]
        mov     rax, [rax+r14*2+8]
        mov     rax, [rax+r14*2-8]
        mov     rax, [rax+r14*2+1000]
        mov     [rax+r14*2+1000], r8
        lea     r14, [rax+r14*2-1000]
        mov     rax, [rbx+r14*2]
        mov     rax, [rbx+r14*2+8]
        mov     rax, [rbx+r14*2-8]
        mov     rax, [rbx+r14*2+1000]
        mov     [rbx+r14*2+1000], r8
        lea     r14, [rbx+r14*2-1000]
        mov     rax, [rsp+r14*2]
        mov     rax, [rsp+r14*2+8]
        mov     rax, [rsp+r14*2-8]
        mov     rax, [rsp+r14*2+1000]
        mov     [rsp+r14*2+1000], r8
        lea     r14, [rsp+r14*2-1000]
        mov     rax, [rbp+r14*2]
        mov     rax, [rbp+r14*2+8]
        mov     rax, [rbp+r14*2-8]
        mov     rax, [rbp+r14*2+1000]
        mov     [rbp+r14*2+1000], r8
        lea     r14, [rbp+r14*2-1000]
        mov     rax, [r12+r14*2]
        mov     rax, [r12+r14*2+8]
        mov     rax, [r12+r14*2-8]
        mov     rax, [r12+r14*2+1000]
        mov     [r12+r14*2+1000], r8
        lea     r14, [r12+r14*2-1000]
        mov     rax, [r13+r14*2]
        mov     rax, [r13+r14*2+8]
        mov     rax, [r13+r14*2-8]
        mov     rax, [r13+r14*2+1000]
        mov     [r13+r14*2+1000], r8
        lea     r14, [r13+r14*2-1000]
        mov     rax, [r15+r14*2]
        mov     rax, [r15+r14*2+8]
        mov     rax, [r15+r14*2-8]
        mov     rax, [r15+r14*2+1000]
        mov     [r15+r14*2+1000], r8
        lea     r14, [r15+r14*2-1000]
        mov     rax, [r14*4]
        mov     rax, [r14*4+16]
        mov     rax, [r14*4-16]
        lea     rax, [r14*4+1000]
        mov     rax, [rax+r14*4]
        mov     rax, [rax+r14*4+8]
        mov     rax, [rax+r14*4-8]
        mov     rax, [rax+r14*4+1000]
        mov     [rax+r14*4+1000], r8
        lea     r14, [rax+r14*4-1000]
        mov     rax, [rbx+r14*4]
        mov     rax, [rbx+r14*4+8]
        mov     rax, [rbx+r14*4-8]
        mov     rax, [rbx+r14*4+1000]
        mov     [rbx+r14*4+1000], r8
        lea     r14, [rbx+r14*4-1000]
        mov     rax, [rsp+r14*4]
        mov     rax, [rsp+r14*4+8]
        mov     rax, [rsp+r14*4-8]
        mov     rax, [rsp+r14*4+1000]
        mov     [rsp+r14*4+1000], r8
        lea     r14, [rsp+r14*4-1000]
        mov     rax, [rbp+r14*4]
        mov     rax, [rbp+r14*4+8]
        mov     rax, [rbp+r14*4-8]
        mov     rax, [rbp+r14*4+1000]
        mov     [rbp+r14*4+1000], r8
        lea     r14, [rbp+r14*4-1000]
        mov     rax, [r12+r14*4]
        mov     rax, [r12+r14*4+8]
        mov     rax, [r12+r14*4-8]
        mov     rax, [r12+r14*4+1000]
        mov     [r12+r14*4+1000], r8
        lea     r14, [r12+r14*4-1000]
        mov     rax, [r13+r14*4]
        mov     rax, [r13+r14*4+8]
        mov     rax, [r13+r14*4-8]
        mov     rax, [r13+r14*4+1000]
        mov     [r13+r14*4+1000], r8
        lea     r14, [r13+r14*4-1000]
        mov     rax, [r15+r14*4]
        mov     rax, [r15+r14*4+8]
        mov     rax, [r15+r14*4-8]
        mov     rax, [r15+r14*4+1000]
        mov     [r15+r14*4+1000], r8
        lea     r14, [r15+r14*4-1000]
        mov     rax, [r14*8]
        mov     rax, [r14*8+16]
        mov     rax, [r14*8-16]
        lea     rax, [r14*8+1000]
        mov     rax, [rax+r14*8]
        mov     rax, [rax+r14*8+8]
        mov     rax, [rax+r14*8-8]
        mov     rax, [rax+r14*8+1000]
        mov     [rax+r14*8+1000], r8
        lea     r14, [rax+r14*8-1000]
        mov     rax, [rbx+r14*8]
        mov     rax, [rbx+r14*8+8]
        mov     rax, [rbx+r14*8-8]
        mov     rax, [rbx+r14*8+1000]
        mov     [rbx+r14*8+1000], r8
        lea     r14, [rbx+r14*8-1000]
        mov     rax, [rsp+r14*8]
        mov     rax, [rsp+r14*8+8]
        mov     rax, [rsp+r14*8-8]
        mov     rax, [rsp+r14*8+1000]
        mov     [rsp+r14*8+1000], r8
        lea     r14, [rsp+r14*8-1000]
        mov     rax, [rbp+r14*8]
        mov     rax, [rbp+r14*8+8]
        mov     rax, [rbp+r14*8-8]
        mov     rax, [rbp+r14*8+1000]
        mov     [rbp+r14*8+1000], r8
        lea     r14, [rbp+r14*8-1000]
        mov     rax, [r12+r14*8]
        mov     rax, [r12+r14*8+8]
        mov     rax, [r12+r14*8-8]
        mov     rax, [r12+r14*8+1000]
        mov     [r12+r14*8+1000], r8
        lea     r14, [r12+r14*8-1000]
        mov     rax, [r13+r14*8]
        mov     rax, [r13+r14*8+8]
        mov     rax, [r13+r14*8-8]
        mov     rax, [r13+r14*8+1000]
        mov     [r13+r14*8+1000], r8
        lea     r14, [r13+r14*8-1000]
        mov     rax, [r15+r14*8]
        mov     rax, [r15+r14*8+8]
        mov     rax, [r15+r14*8-8]
        mov     rax, [r15+r14*8+1000]
        mov     [r15+r14*8+1000], r8
        lea     r14, [r15+r14*8-1000]
        mov     rax, [r15*1]
        mov     rax, [r15*1+16]
        mov     rax, [r15*1-16]
        lea     rax, [r15*1+1000]
        mov     rax, [rax+r15*1]
        mov     rax, [rax+r15*1+8]
        mov     rax, [rax+r15*1-8]
        mov     rax, [rax+r15*1+1000]
        mov     [rax+r15*1+1000], r8
        lea     r14, [rax+r15*1-1000]
        mov     rax, [rbx+r15*1]
        mov     rax, [rbx+r15*1+8]
        mov     rax, [rbx+r15*1-8]
        mov     rax, [rbx+r15*1+1000]
        mov     [rbx+r15*1+1000], r8
        lea     r14, [rbx+r15*1-1000]
        mov     rax, [rsp+r15*1]
        mov     rax, [rsp+r15*1+8]
        mov     rax, [rsp+r15*1-8]
        mov     rax, [rsp+r15*1+1000]
        mov     [rsp+r15*1+1000], r8
        lea     r14, [rsp+r15*1-1000]
        mov     rax, [rbp+r15*1]
        mov     rax, [rbp+r15*1+8]
        mov     rax, [rbp+r15*1-8]
        mov     rax, [rbp+r15*1+1000]
        mov     [rbp+r15*1+1000], r8
        lea     r14, [rbp+r15*1-1000]
        mov     rax, [r12+r15*1]
        mov     rax, [r12+r15*1+8]
        mov     rax, [r12+r15*1-8]
        mov     rax, [r12+r15*1+1000]
        mov     [r12+r15*1+1000], r8
        lea     r14, [r12+r15*1-1000]
        mov     rax, [r13+r15*1]
        mov     rax, [r13+r15*1+8]
        mov     rax, [r13+r15*1-8]
        mov     rax, [r13+r15*1+1000]
        mov     [r13+r15*1+1000], r8
        lea     r14, [r13+r15*1-1000]
        mov     rax, [r15+r15*1]
        mov     rax, [r15+r15*1+8]
        mov     rax, [r15+r15*1-8]
        mov     rax, [r15+r15*1+1000]
        mov     [r15+r15*1+1000], r8
        lea     r14, [r15+r15*1-1000]
        mov     rax, [r15*2]
        mov     rax, [r15*2+16]
        mov     rax, [r15*2-16]
        lea     rax, [r15*2+1000]
        mov     rax, [rax+r15*2]
        mov     rax, [rax+r15*2+8]
        mov     rax, [rax+r15*2-8]
        mov     rax, [rax+r15*2+1000]
        mov     [rax+r15*2+1000], r8
        lea     r14, [rax+r15*2-1000]
        mov     rax, [rbx+r15*2]
        mov     rax, [rbx+r15*2+8]
        mov     rax, [rbx+r15*2-8]
        mov     rax, [rbx+r15*2+1000]
        mov     [rbx+r15*2+1000], r8
        lea     r14, [rbx+r15*2-1000]
        mov     rax, [rsp+r15*2]
        mov     rax, [rsp+r15*2+8]
        mov     rax, [rsp+r15*2-8]
        mov     rax, [rsp+r15*2+1000]
        mov     [rsp+r15*2+1000], r8
        lea     r14, [rsp+r15*2-1000]
        mov     rax, [rbp+r15*2]
        mov     rax, [rbp+r15*2+8]
        mov     rax, [rbp+r15*2-8]
        mov     rax, [rbp+r15*2+1000]
        mov     [rbp+r15*2+1000], r8
        lea     r14, [rbp+r15*2-1000]
        mov     rax, [r12+r15*2]
        mov     rax, [r12+r15*2+8]
        mov     rax, [r12+r15*2-8]
        mov     rax, [r12+r15*2+1000]
        mov     [r12+r15*2+1000], r8
        lea     r14, [r12+r15*2-1000]
        mov     rax, [r13+r15*2]
        mov     rax, [r13+r15*2+8]
        mov     rax, [r13+r15*2-8]
        mov     rax, [r13+r15*2+1000]
        mov     [r13+r15*2+1000], r8
        lea     r14, [r13+r15*2-1000]
        mov     rax, [r15+r15*2]
        mov     rax, [r15+r15*2+8]
        mov     rax, [r15+r15*2-8]
        mov     rax, [r15+r15*2+1000]
        mov     [r15+r15*2+1000], r8
        lea     r14, [r15+r15*2-1000]
        mov     rax, [r15*4]
        mov     rax, [r15*4+16]
        mov     rax, [r15*4-16]
        lea     rax, [r15*4+1000]
        mov     rax, [rax+r15*4]
        mov     rax, [rax+r15*4+8]
        mov     rax, [rax+r15*4-8]
        mov     rax, [rax+r15*4+1000]
        mov     [rax+r15*4+1000], r8
        lea     r14, [rax+r15*4-1000]
        mov     rax, [rbx+r15*4]
        mov     rax, [rbx+r15*4+8]
        mov     rax, [rbx+r15*4-8]
        mov     rax, [rbx+r15*4+1000]
        mov     [rbx+r15*4+1000], r8
        lea     r14, [rbx+r15*4-1000]
        mov     rax, [rsp+r15*4]
        mov     rax, [rsp+r15*4+8]
        mov     rax, [rsp+r15*4-8]
        mov     rax, [rsp+r15*4+1000]
        mov     [rsp+r15*4+1000], r8
        lea     r14, [rsp+r15*4-1000]
        mov     rax, [rbp+r15*4]
        mov     rax, [rbp+r15*4+8]
        mov     rax, [rbp+r15*4-8]
        mov     rax, [rbp+r15*4+1000]
        mov     [rbp+r15*4+1000], r8
        lea     r14, [rbp+r15*4-1000]
        mov     rax, [r12+r15*4]
        mov     rax, [r12+r15*4+8]
        mov     rax, [r12+r15*4-8]
        mov     rax, [r12+r15*4+1000]
        mov     [r12+r15*4+1000], r8
        lea     r14, [r12+r15*4-1000]
        mov     rax, [r13+r15*4]
        mov     rax, [r13+r15*4+8]
        mov     rax, [r13+r15*4-8]
        mov     rax, [r13+r15*4+1000]
        mov     [r13+r15*4+1000], r8
        lea     r14, [r13+r15*4-1000]
        mov     rax, [r15+r15*4]
        mov     rax, [r15+r15*4+8]
        mov     rax, [r15+r15*4-8]
        mov     rax, [r15+r15*4+1000]
        mov     [r15+r15*4+1000], r8
        lea     r14, [r15+r15*4-1000]
        mov     rax, [r15*8]
        mov     rax, [r15*8+16]
        mov     rax, [r15*8-16]
        lea     rax, [r15*8+1000]
        mov     rax, [rax+r15*8]
        mov     rax, [rax+r15*8+8]
        mov     rax, [rax+r15*8-8]
        mov     rax, [rax+r15*8+1000]
        mov     [rax+r15*8+1000], r8
        lea     r14, [rax+r15*8-1000]
        mov     rax, [rbx+r15*8]
        mov     rax, [rbx+r15*8+8]
        mov     rax, [rbx+r15*8-8]
        mov     rax, [rbx+r15*8+1000]
        mov     [rbx+r15*8+1000], r8
        lea     r14, [rbx+r15*8-1000]
        mov     rax, [rsp+r15*8]
        mov     rax, [rsp+r15*8+8]
        mov     rax, [rsp+r15*8-8]
        mov     rax, [rsp+r15*8+1000]
        mov     [rsp+r15*8+1000], r8
        lea     r14, [rsp+r15*8-1000]
        mov     rax, [rbp+r15*8]
        mov     rax, [rbp+r15*8+8]
        mov     rax, [rbp+r15*8-8]
        mov     rax, [rbp+r15*8+1000]
        mov     [rbp+r15*8+1000], r8
        lea     r14, [rbp+r15*8-1000]
        mov     rax, [r12+r15*8]
        mov     rax, [r12+r15*8+8]
        mov     rax, [r12+r15*8-8]
        mov     rax, [r12+r15*8+1000]
        mov     [r12+r15*8+1000], r8
        lea     r14, [r12+r15*8-1000]
        mov     rax, [r13+r15*8]
        mov     rax, [r13+r15*8+8]
        mov     rax, [r13+r15*8-8]
        mov     rax, [r13+r15*8+1000]
        mov     [r13+r15*8+1000], r8
        lea     r14, [r13+r15*8-1000]
        mov     rax, [r15+r15*8]
        mov     rax, [r15+r15*8+8]
        mov     rax, [r15+r15*8-8]
        mov     rax, [r15+r15*8+1000]
        mov     [r15+r15*8+1000], r8
        lea     r14, [r15+r15*8-1000]
        mov     rax, [rbx+rcx]
        mov     rax, [rcx+rbx]
        mov     rax, [4*rbx]
        mov     rax, [rax+4*rbx+8]
        mov     rax, [rbx+rcx*1]
        mov     rax, [rsp+rax]
        mov     rax, [rsp+rax*4+8]
        mov     rax, [rbp+rbp*2]
        mov     rax, [rbx - 3 + 5]
        mov     rax, [rbx + 2*4]
        mov     rax, [rbx + (1+2)*4]
        ret
f ENDP
END
