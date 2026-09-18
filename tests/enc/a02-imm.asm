; a02: immediates at the imm8/imm32 boundaries, rax short forms, r8-r15
.CODE
f PROC
        add     rax, 0
        add     rax, 1
        add     rax, 127
        add     rax, 128
        add     rax, -128
        add     rax, -129
        add     rax, 255
        add     rax, 256
        add     rax, -1
        add     rax, 7FFFFFFFh
        add     rax, -2147483648
        add     rcx, 0
        add     rcx, 1
        add     rcx, 127
        add     rcx, 128
        add     rcx, -128
        add     rcx, -129
        add     rcx, 255
        add     rcx, 256
        add     rcx, -1
        add     rcx, 7FFFFFFFh
        add     rcx, -2147483648
        add     r8, 0
        add     r8, 1
        add     r8, 127
        add     r8, 128
        add     r8, -128
        add     r8, -129
        add     r8, 255
        add     r8, 256
        add     r8, -1
        add     r8, 7FFFFFFFh
        add     r8, -2147483648
        add     r15, 0
        add     r15, 1
        add     r15, 127
        add     r15, 128
        add     r15, -128
        add     r15, -129
        add     r15, 255
        add     r15, 256
        add     r15, -1
        add     r15, 7FFFFFFFh
        add     r15, -2147483648
        add     eax, 0
        add     eax, 1
        add     eax, 127
        add     eax, 128
        add     eax, -128
        add     eax, -129
        add     eax, 255
        add     eax, 256
        add     eax, -1
        add     eax, 7FFFFFFFh
        add     eax, -2147483648
        add     ecx, 0
        add     ecx, 1
        add     ecx, 127
        add     ecx, 128
        add     ecx, -128
        add     ecx, -129
        add     ecx, 255
        add     ecx, 256
        add     ecx, -1
        add     ecx, 7FFFFFFFh
        add     ecx, -2147483648
        add     r8d, 0
        add     r8d, 1
        add     r8d, 127
        add     r8d, 128
        add     r8d, -128
        add     r8d, -129
        add     r8d, 255
        add     r8d, 256
        add     r8d, -1
        add     r8d, 7FFFFFFFh
        add     r8d, -2147483648
        add     r15d, 0
        add     r15d, 1
        add     r15d, 127
        add     r15d, 128
        add     r15d, -128
        add     r15d, -129
        add     r15d, 255
        add     r15d, 256
        add     r15d, -1
        add     r15d, 7FFFFFFFh
        add     r15d, -2147483648
        or     rax, 0
        or     rax, 1
        or     rax, 127
        or     rax, 128
        or     rax, -128
        or     rax, -129
        or     rax, 255
        or     rax, 256
        or     rax, -1
        or     rax, 7FFFFFFFh
        or     rax, -2147483648
        or     rcx, 0
        or     rcx, 1
        or     rcx, 127
        or     rcx, 128
        or     rcx, -128
        or     rcx, -129
        or     rcx, 255
        or     rcx, 256
        or     rcx, -1
        or     rcx, 7FFFFFFFh
        or     rcx, -2147483648
        or     r8, 0
        or     r8, 1
        or     r8, 127
        or     r8, 128
        or     r8, -128
        or     r8, -129
        or     r8, 255
        or     r8, 256
        or     r8, -1
        or     r8, 7FFFFFFFh
        or     r8, -2147483648
        or     r15, 0
        or     r15, 1
        or     r15, 127
        or     r15, 128
        or     r15, -128
        or     r15, -129
        or     r15, 255
        or     r15, 256
        or     r15, -1
        or     r15, 7FFFFFFFh
        or     r15, -2147483648
        or     eax, 0
        or     eax, 1
        or     eax, 127
        or     eax, 128
        or     eax, -128
        or     eax, -129
        or     eax, 255
        or     eax, 256
        or     eax, -1
        or     eax, 7FFFFFFFh
        or     eax, -2147483648
        or     ecx, 0
        or     ecx, 1
        or     ecx, 127
        or     ecx, 128
        or     ecx, -128
        or     ecx, -129
        or     ecx, 255
        or     ecx, 256
        or     ecx, -1
        or     ecx, 7FFFFFFFh
        or     ecx, -2147483648
        or     r8d, 0
        or     r8d, 1
        or     r8d, 127
        or     r8d, 128
        or     r8d, -128
        or     r8d, -129
        or     r8d, 255
        or     r8d, 256
        or     r8d, -1
        or     r8d, 7FFFFFFFh
        or     r8d, -2147483648
        or     r15d, 0
        or     r15d, 1
        or     r15d, 127
        or     r15d, 128
        or     r15d, -128
        or     r15d, -129
        or     r15d, 255
        or     r15d, 256
        or     r15d, -1
        or     r15d, 7FFFFFFFh
        or     r15d, -2147483648
        adc     rax, 0
        adc     rax, 1
        adc     rax, 127
        adc     rax, 128
        adc     rax, -128
        adc     rax, -129
        adc     rax, 255
        adc     rax, 256
        adc     rax, -1
        adc     rax, 7FFFFFFFh
        adc     rax, -2147483648
        adc     rcx, 0
        adc     rcx, 1
        adc     rcx, 127
        adc     rcx, 128
        adc     rcx, -128
        adc     rcx, -129
        adc     rcx, 255
        adc     rcx, 256
        adc     rcx, -1
        adc     rcx, 7FFFFFFFh
        adc     rcx, -2147483648
        adc     r8, 0
        adc     r8, 1
        adc     r8, 127
        adc     r8, 128
        adc     r8, -128
        adc     r8, -129
        adc     r8, 255
        adc     r8, 256
        adc     r8, -1
        adc     r8, 7FFFFFFFh
        adc     r8, -2147483648
        adc     r15, 0
        adc     r15, 1
        adc     r15, 127
        adc     r15, 128
        adc     r15, -128
        adc     r15, -129
        adc     r15, 255
        adc     r15, 256
        adc     r15, -1
        adc     r15, 7FFFFFFFh
        adc     r15, -2147483648
        adc     eax, 0
        adc     eax, 1
        adc     eax, 127
        adc     eax, 128
        adc     eax, -128
        adc     eax, -129
        adc     eax, 255
        adc     eax, 256
        adc     eax, -1
        adc     eax, 7FFFFFFFh
        adc     eax, -2147483648
        adc     ecx, 0
        adc     ecx, 1
        adc     ecx, 127
        adc     ecx, 128
        adc     ecx, -128
        adc     ecx, -129
        adc     ecx, 255
        adc     ecx, 256
        adc     ecx, -1
        adc     ecx, 7FFFFFFFh
        adc     ecx, -2147483648
        adc     r8d, 0
        adc     r8d, 1
        adc     r8d, 127
        adc     r8d, 128
        adc     r8d, -128
        adc     r8d, -129
        adc     r8d, 255
        adc     r8d, 256
        adc     r8d, -1
        adc     r8d, 7FFFFFFFh
        adc     r8d, -2147483648
        adc     r15d, 0
        adc     r15d, 1
        adc     r15d, 127
        adc     r15d, 128
        adc     r15d, -128
        adc     r15d, -129
        adc     r15d, 255
        adc     r15d, 256
        adc     r15d, -1
        adc     r15d, 7FFFFFFFh
        adc     r15d, -2147483648
        sbb     rax, 0
        sbb     rax, 1
        sbb     rax, 127
        sbb     rax, 128
        sbb     rax, -128
        sbb     rax, -129
        sbb     rax, 255
        sbb     rax, 256
        sbb     rax, -1
        sbb     rax, 7FFFFFFFh
        sbb     rax, -2147483648
        sbb     rcx, 0
        sbb     rcx, 1
        sbb     rcx, 127
        sbb     rcx, 128
        sbb     rcx, -128
        sbb     rcx, -129
        sbb     rcx, 255
        sbb     rcx, 256
        sbb     rcx, -1
        sbb     rcx, 7FFFFFFFh
        sbb     rcx, -2147483648
        sbb     r8, 0
        sbb     r8, 1
        sbb     r8, 127
        sbb     r8, 128
        sbb     r8, -128
        sbb     r8, -129
        sbb     r8, 255
        sbb     r8, 256
        sbb     r8, -1
        sbb     r8, 7FFFFFFFh
        sbb     r8, -2147483648
        sbb     r15, 0
        sbb     r15, 1
        sbb     r15, 127
        sbb     r15, 128
        sbb     r15, -128
        sbb     r15, -129
        sbb     r15, 255
        sbb     r15, 256
        sbb     r15, -1
        sbb     r15, 7FFFFFFFh
        sbb     r15, -2147483648
        sbb     eax, 0
        sbb     eax, 1
        sbb     eax, 127
        sbb     eax, 128
        sbb     eax, -128
        sbb     eax, -129
        sbb     eax, 255
        sbb     eax, 256
        sbb     eax, -1
        sbb     eax, 7FFFFFFFh
        sbb     eax, -2147483648
        sbb     ecx, 0
        sbb     ecx, 1
        sbb     ecx, 127
        sbb     ecx, 128
        sbb     ecx, -128
        sbb     ecx, -129
        sbb     ecx, 255
        sbb     ecx, 256
        sbb     ecx, -1
        sbb     ecx, 7FFFFFFFh
        sbb     ecx, -2147483648
        sbb     r8d, 0
        sbb     r8d, 1
        sbb     r8d, 127
        sbb     r8d, 128
        sbb     r8d, -128
        sbb     r8d, -129
        sbb     r8d, 255
        sbb     r8d, 256
        sbb     r8d, -1
        sbb     r8d, 7FFFFFFFh
        sbb     r8d, -2147483648
        sbb     r15d, 0
        sbb     r15d, 1
        sbb     r15d, 127
        sbb     r15d, 128
        sbb     r15d, -128
        sbb     r15d, -129
        sbb     r15d, 255
        sbb     r15d, 256
        sbb     r15d, -1
        sbb     r15d, 7FFFFFFFh
        sbb     r15d, -2147483648
        and     rax, 0
        and     rax, 1
        and     rax, 127
        and     rax, 128
        and     rax, -128
        and     rax, -129
        and     rax, 255
        and     rax, 256
        and     rax, -1
        and     rax, 7FFFFFFFh
        and     rax, -2147483648
        and     rcx, 0
        and     rcx, 1
        and     rcx, 127
        and     rcx, 128
        and     rcx, -128
        and     rcx, -129
        and     rcx, 255
        and     rcx, 256
        and     rcx, -1
        and     rcx, 7FFFFFFFh
        and     rcx, -2147483648
        and     r8, 0
        and     r8, 1
        and     r8, 127
        and     r8, 128
        and     r8, -128
        and     r8, -129
        and     r8, 255
        and     r8, 256
        and     r8, -1
        and     r8, 7FFFFFFFh
        and     r8, -2147483648
        and     r15, 0
        and     r15, 1
        and     r15, 127
        and     r15, 128
        and     r15, -128
        and     r15, -129
        and     r15, 255
        and     r15, 256
        and     r15, -1
        and     r15, 7FFFFFFFh
        and     r15, -2147483648
        and     eax, 0
        and     eax, 1
        and     eax, 127
        and     eax, 128
        and     eax, -128
        and     eax, -129
        and     eax, 255
        and     eax, 256
        and     eax, -1
        and     eax, 7FFFFFFFh
        and     eax, -2147483648
        and     ecx, 0
        and     ecx, 1
        and     ecx, 127
        and     ecx, 128
        and     ecx, -128
        and     ecx, -129
        and     ecx, 255
        and     ecx, 256
        and     ecx, -1
        and     ecx, 7FFFFFFFh
        and     ecx, -2147483648
        and     r8d, 0
        and     r8d, 1
        and     r8d, 127
        and     r8d, 128
        and     r8d, -128
        and     r8d, -129
        and     r8d, 255
        and     r8d, 256
        and     r8d, -1
        and     r8d, 7FFFFFFFh
        and     r8d, -2147483648
        and     r15d, 0
        and     r15d, 1
        and     r15d, 127
        and     r15d, 128
        and     r15d, -128
        and     r15d, -129
        and     r15d, 255
        and     r15d, 256
        and     r15d, -1
        and     r15d, 7FFFFFFFh
        and     r15d, -2147483648
        sub     rax, 0
        sub     rax, 1
        sub     rax, 127
        sub     rax, 128
        sub     rax, -128
        sub     rax, -129
        sub     rax, 255
        sub     rax, 256
        sub     rax, -1
        sub     rax, 7FFFFFFFh
        sub     rax, -2147483648
        sub     rcx, 0
        sub     rcx, 1
        sub     rcx, 127
        sub     rcx, 128
        sub     rcx, -128
        sub     rcx, -129
        sub     rcx, 255
        sub     rcx, 256
        sub     rcx, -1
        sub     rcx, 7FFFFFFFh
        sub     rcx, -2147483648
        sub     r8, 0
        sub     r8, 1
        sub     r8, 127
        sub     r8, 128
        sub     r8, -128
        sub     r8, -129
        sub     r8, 255
        sub     r8, 256
        sub     r8, -1
        sub     r8, 7FFFFFFFh
        sub     r8, -2147483648
        sub     r15, 0
        sub     r15, 1
        sub     r15, 127
        sub     r15, 128
        sub     r15, -128
        sub     r15, -129
        sub     r15, 255
        sub     r15, 256
        sub     r15, -1
        sub     r15, 7FFFFFFFh
        sub     r15, -2147483648
        sub     eax, 0
        sub     eax, 1
        sub     eax, 127
        sub     eax, 128
        sub     eax, -128
        sub     eax, -129
        sub     eax, 255
        sub     eax, 256
        sub     eax, -1
        sub     eax, 7FFFFFFFh
        sub     eax, -2147483648
        sub     ecx, 0
        sub     ecx, 1
        sub     ecx, 127
        sub     ecx, 128
        sub     ecx, -128
        sub     ecx, -129
        sub     ecx, 255
        sub     ecx, 256
        sub     ecx, -1
        sub     ecx, 7FFFFFFFh
        sub     ecx, -2147483648
        sub     r8d, 0
        sub     r8d, 1
        sub     r8d, 127
        sub     r8d, 128
        sub     r8d, -128
        sub     r8d, -129
        sub     r8d, 255
        sub     r8d, 256
        sub     r8d, -1
        sub     r8d, 7FFFFFFFh
        sub     r8d, -2147483648
        sub     r15d, 0
        sub     r15d, 1
        sub     r15d, 127
        sub     r15d, 128
        sub     r15d, -128
        sub     r15d, -129
        sub     r15d, 255
        sub     r15d, 256
        sub     r15d, -1
        sub     r15d, 7FFFFFFFh
        sub     r15d, -2147483648
        xor     rax, 0
        xor     rax, 1
        xor     rax, 127
        xor     rax, 128
        xor     rax, -128
        xor     rax, -129
        xor     rax, 255
        xor     rax, 256
        xor     rax, -1
        xor     rax, 7FFFFFFFh
        xor     rax, -2147483648
        xor     rcx, 0
        xor     rcx, 1
        xor     rcx, 127
        xor     rcx, 128
        xor     rcx, -128
        xor     rcx, -129
        xor     rcx, 255
        xor     rcx, 256
        xor     rcx, -1
        xor     rcx, 7FFFFFFFh
        xor     rcx, -2147483648
        xor     r8, 0
        xor     r8, 1
        xor     r8, 127
        xor     r8, 128
        xor     r8, -128
        xor     r8, -129
        xor     r8, 255
        xor     r8, 256
        xor     r8, -1
        xor     r8, 7FFFFFFFh
        xor     r8, -2147483648
        xor     r15, 0
        xor     r15, 1
        xor     r15, 127
        xor     r15, 128
        xor     r15, -128
        xor     r15, -129
        xor     r15, 255
        xor     r15, 256
        xor     r15, -1
        xor     r15, 7FFFFFFFh
        xor     r15, -2147483648
        xor     eax, 0
        xor     eax, 1
        xor     eax, 127
        xor     eax, 128
        xor     eax, -128
        xor     eax, -129
        xor     eax, 255
        xor     eax, 256
        xor     eax, -1
        xor     eax, 7FFFFFFFh
        xor     eax, -2147483648
        xor     ecx, 0
        xor     ecx, 1
        xor     ecx, 127
        xor     ecx, 128
        xor     ecx, -128
        xor     ecx, -129
        xor     ecx, 255
        xor     ecx, 256
        xor     ecx, -1
        xor     ecx, 7FFFFFFFh
        xor     ecx, -2147483648
        xor     r8d, 0
        xor     r8d, 1
        xor     r8d, 127
        xor     r8d, 128
        xor     r8d, -128
        xor     r8d, -129
        xor     r8d, 255
        xor     r8d, 256
        xor     r8d, -1
        xor     r8d, 7FFFFFFFh
        xor     r8d, -2147483648
        xor     r15d, 0
        xor     r15d, 1
        xor     r15d, 127
        xor     r15d, 128
        xor     r15d, -128
        xor     r15d, -129
        xor     r15d, 255
        xor     r15d, 256
        xor     r15d, -1
        xor     r15d, 7FFFFFFFh
        xor     r15d, -2147483648
        cmp     rax, 0
        cmp     rax, 1
        cmp     rax, 127
        cmp     rax, 128
        cmp     rax, -128
        cmp     rax, -129
        cmp     rax, 255
        cmp     rax, 256
        cmp     rax, -1
        cmp     rax, 7FFFFFFFh
        cmp     rax, -2147483648
        cmp     rcx, 0
        cmp     rcx, 1
        cmp     rcx, 127
        cmp     rcx, 128
        cmp     rcx, -128
        cmp     rcx, -129
        cmp     rcx, 255
        cmp     rcx, 256
        cmp     rcx, -1
        cmp     rcx, 7FFFFFFFh
        cmp     rcx, -2147483648
        cmp     r8, 0
        cmp     r8, 1
        cmp     r8, 127
        cmp     r8, 128
        cmp     r8, -128
        cmp     r8, -129
        cmp     r8, 255
        cmp     r8, 256
        cmp     r8, -1
        cmp     r8, 7FFFFFFFh
        cmp     r8, -2147483648
        cmp     r15, 0
        cmp     r15, 1
        cmp     r15, 127
        cmp     r15, 128
        cmp     r15, -128
        cmp     r15, -129
        cmp     r15, 255
        cmp     r15, 256
        cmp     r15, -1
        cmp     r15, 7FFFFFFFh
        cmp     r15, -2147483648
        cmp     eax, 0
        cmp     eax, 1
        cmp     eax, 127
        cmp     eax, 128
        cmp     eax, -128
        cmp     eax, -129
        cmp     eax, 255
        cmp     eax, 256
        cmp     eax, -1
        cmp     eax, 7FFFFFFFh
        cmp     eax, -2147483648
        cmp     ecx, 0
        cmp     ecx, 1
        cmp     ecx, 127
        cmp     ecx, 128
        cmp     ecx, -128
        cmp     ecx, -129
        cmp     ecx, 255
        cmp     ecx, 256
        cmp     ecx, -1
        cmp     ecx, 7FFFFFFFh
        cmp     ecx, -2147483648
        cmp     r8d, 0
        cmp     r8d, 1
        cmp     r8d, 127
        cmp     r8d, 128
        cmp     r8d, -128
        cmp     r8d, -129
        cmp     r8d, 255
        cmp     r8d, 256
        cmp     r8d, -1
        cmp     r8d, 7FFFFFFFh
        cmp     r8d, -2147483648
        cmp     r15d, 0
        cmp     r15d, 1
        cmp     r15d, 127
        cmp     r15d, 128
        cmp     r15d, -128
        cmp     r15d, -129
        cmp     r15d, 255
        cmp     r15d, 256
        cmp     r15d, -1
        cmp     r15d, 7FFFFFFFh
        cmp     r15d, -2147483648
        add     eax, 80000000h
        cmp     eax, 80000000h
        and     eax, 80000000h
        add     eax, 0FFFFFFFFh
        cmp     eax, 0FFFFFFFFh
        and     eax, 0FFFFFFFFh
        add     eax, 4294967295
        cmp     eax, 4294967295
        and     eax, 4294967295
        add     ecx, 80000000h
        cmp     ecx, 80000000h
        and     ecx, 80000000h
        add     ecx, 0FFFFFFFFh
        cmp     ecx, 0FFFFFFFFh
        and     ecx, 0FFFFFFFFh
        add     ecx, 4294967295
        cmp     ecx, 4294967295
        and     ecx, 4294967295
        add     r8d, 80000000h
        cmp     r8d, 80000000h
        and     r8d, 80000000h
        add     r8d, 0FFFFFFFFh
        cmp     r8d, 0FFFFFFFFh
        and     r8d, 0FFFFFFFFh
        add     r8d, 4294967295
        cmp     r8d, 4294967295
        and     r8d, 4294967295
        add     r15d, 80000000h
        cmp     r15d, 80000000h
        and     r15d, 80000000h
        add     r15d, 0FFFFFFFFh
        cmp     r15d, 0FFFFFFFFh
        and     r15d, 0FFFFFFFFh
        add     r15d, 4294967295
        cmp     r15d, 4294967295
        and     r15d, 4294967295
        test    rax, 0
        mov     rax, 0
        test    rax, 1
        mov     rax, 1
        test    rax, 127
        mov     rax, 127
        test    rax, 128
        mov     rax, 128
        test    rax, -1
        mov     rax, -1
        test    rax, -128
        mov     rax, -128
        test    rax, -129
        mov     rax, -129
        test    rax, 7FFFFFFFh
        mov     rax, 7FFFFFFFh
        test    rax, -2147483648
        mov     rax, -2147483648
        test    rcx, 0
        mov     rcx, 0
        test    rcx, 1
        mov     rcx, 1
        test    rcx, 127
        mov     rcx, 127
        test    rcx, 128
        mov     rcx, 128
        test    rcx, -1
        mov     rcx, -1
        test    rcx, -128
        mov     rcx, -128
        test    rcx, -129
        mov     rcx, -129
        test    rcx, 7FFFFFFFh
        mov     rcx, 7FFFFFFFh
        test    rcx, -2147483648
        mov     rcx, -2147483648
        test    r8, 0
        mov     r8, 0
        test    r8, 1
        mov     r8, 1
        test    r8, 127
        mov     r8, 127
        test    r8, 128
        mov     r8, 128
        test    r8, -1
        mov     r8, -1
        test    r8, -128
        mov     r8, -128
        test    r8, -129
        mov     r8, -129
        test    r8, 7FFFFFFFh
        mov     r8, 7FFFFFFFh
        test    r8, -2147483648
        mov     r8, -2147483648
        test    r15, 0
        mov     r15, 0
        test    r15, 1
        mov     r15, 1
        test    r15, 127
        mov     r15, 127
        test    r15, 128
        mov     r15, 128
        test    r15, -1
        mov     r15, -1
        test    r15, -128
        mov     r15, -128
        test    r15, -129
        mov     r15, -129
        test    r15, 7FFFFFFFh
        mov     r15, 7FFFFFFFh
        test    r15, -2147483648
        mov     r15, -2147483648
        test    eax, 0
        mov     eax, 0
        test    eax, 1
        mov     eax, 1
        test    eax, 127
        mov     eax, 127
        test    eax, 128
        mov     eax, 128
        test    eax, -1
        mov     eax, -1
        test    eax, -128
        mov     eax, -128
        test    eax, -129
        mov     eax, -129
        test    eax, 7FFFFFFFh
        mov     eax, 7FFFFFFFh
        test    eax, -2147483648
        mov     eax, -2147483648
        test    ecx, 0
        mov     ecx, 0
        test    ecx, 1
        mov     ecx, 1
        test    ecx, 127
        mov     ecx, 127
        test    ecx, 128
        mov     ecx, 128
        test    ecx, -1
        mov     ecx, -1
        test    ecx, -128
        mov     ecx, -128
        test    ecx, -129
        mov     ecx, -129
        test    ecx, 7FFFFFFFh
        mov     ecx, 7FFFFFFFh
        test    ecx, -2147483648
        mov     ecx, -2147483648
        test    r8d, 0
        mov     r8d, 0
        test    r8d, 1
        mov     r8d, 1
        test    r8d, 127
        mov     r8d, 127
        test    r8d, 128
        mov     r8d, 128
        test    r8d, -1
        mov     r8d, -1
        test    r8d, -128
        mov     r8d, -128
        test    r8d, -129
        mov     r8d, -129
        test    r8d, 7FFFFFFFh
        mov     r8d, 7FFFFFFFh
        test    r8d, -2147483648
        mov     r8d, -2147483648
        test    r15d, 0
        mov     r15d, 0
        test    r15d, 1
        mov     r15d, 1
        test    r15d, 127
        mov     r15d, 127
        test    r15d, 128
        mov     r15d, 128
        test    r15d, -1
        mov     r15d, -1
        test    r15d, -128
        mov     r15d, -128
        test    r15d, -129
        mov     r15d, -129
        test    r15d, 7FFFFFFFh
        mov     r15d, 7FFFFFFFh
        test    r15d, -2147483648
        mov     r15d, -2147483648
        mov     eax, 80000000h
        test    eax, 80000000h
        mov     eax, 0FFFFFFFFh
        test    eax, 0FFFFFFFFh
        mov     ecx, 80000000h
        test    ecx, 80000000h
        mov     ecx, 0FFFFFFFFh
        test    ecx, 0FFFFFFFFh
        mov     r8d, 80000000h
        test    r8d, 80000000h
        mov     r8d, 0FFFFFFFFh
        test    r8d, 0FFFFFFFFh
        mov     r15d, 80000000h
        test    r15d, 80000000h
        mov     r15d, 0FFFFFFFFh
        test    r15d, 0FFFFFFFFh
        mov     rax, 80000000h
        mov     rax, 0FFFFFFFFh
        mov     rax, 100000000h
        mov     rax, 123456789012
        mov     rax, -2147483649
        mov     rax, 7FFFFFFFFFFFFFFFh
        mov     rax, 8000000000000000h
        mov     rax, 0FFFFFFFFFFFFFFFFh
        mov     rcx, 80000000h
        mov     rcx, 0FFFFFFFFh
        mov     rcx, 100000000h
        mov     rcx, 123456789012
        mov     rcx, -2147483649
        mov     rcx, 7FFFFFFFFFFFFFFFh
        mov     rcx, 8000000000000000h
        mov     rcx, 0FFFFFFFFFFFFFFFFh
        mov     r8, 80000000h
        mov     r8, 0FFFFFFFFh
        mov     r8, 100000000h
        mov     r8, 123456789012
        mov     r8, -2147483649
        mov     r8, 7FFFFFFFFFFFFFFFh
        mov     r8, 8000000000000000h
        mov     r8, 0FFFFFFFFFFFFFFFFh
        mov     r15, 80000000h
        mov     r15, 0FFFFFFFFh
        mov     r15, 100000000h
        mov     r15, 123456789012
        mov     r15, -2147483649
        mov     r15, 7FFFFFFFFFFFFFFFh
        mov     r15, 8000000000000000h
        mov     r15, 0FFFFFFFFFFFFFFFFh
        mov     qword ptr [rbx], 0
        add     qword ptr [rbx], 0
        sub     qword ptr [rbx], 0
        cmp     qword ptr [rbx], 0
        and     qword ptr [rbx], 0
        or     qword ptr [rbx], 0
        xor     qword ptr [rbx], 0
        adc     qword ptr [rbx], 0
        sbb     qword ptr [rbx], 0
        test     qword ptr [rbx], 0
        mov     qword ptr [rbx], 1
        add     qword ptr [rbx], 1
        sub     qword ptr [rbx], 1
        cmp     qword ptr [rbx], 1
        and     qword ptr [rbx], 1
        or     qword ptr [rbx], 1
        xor     qword ptr [rbx], 1
        adc     qword ptr [rbx], 1
        sbb     qword ptr [rbx], 1
        test     qword ptr [rbx], 1
        mov     qword ptr [rbx], 127
        add     qword ptr [rbx], 127
        sub     qword ptr [rbx], 127
        cmp     qword ptr [rbx], 127
        and     qword ptr [rbx], 127
        or     qword ptr [rbx], 127
        xor     qword ptr [rbx], 127
        adc     qword ptr [rbx], 127
        sbb     qword ptr [rbx], 127
        test     qword ptr [rbx], 127
        mov     qword ptr [rbx], 128
        add     qword ptr [rbx], 128
        sub     qword ptr [rbx], 128
        cmp     qword ptr [rbx], 128
        and     qword ptr [rbx], 128
        or     qword ptr [rbx], 128
        xor     qword ptr [rbx], 128
        adc     qword ptr [rbx], 128
        sbb     qword ptr [rbx], 128
        test     qword ptr [rbx], 128
        mov     qword ptr [rbx], -128
        add     qword ptr [rbx], -128
        sub     qword ptr [rbx], -128
        cmp     qword ptr [rbx], -128
        and     qword ptr [rbx], -128
        or     qword ptr [rbx], -128
        xor     qword ptr [rbx], -128
        adc     qword ptr [rbx], -128
        sbb     qword ptr [rbx], -128
        test     qword ptr [rbx], -128
        mov     qword ptr [rbx], -129
        add     qword ptr [rbx], -129
        sub     qword ptr [rbx], -129
        cmp     qword ptr [rbx], -129
        and     qword ptr [rbx], -129
        or     qword ptr [rbx], -129
        xor     qword ptr [rbx], -129
        adc     qword ptr [rbx], -129
        sbb     qword ptr [rbx], -129
        test     qword ptr [rbx], -129
        mov     qword ptr [rbx], -1
        add     qword ptr [rbx], -1
        sub     qword ptr [rbx], -1
        cmp     qword ptr [rbx], -1
        and     qword ptr [rbx], -1
        or     qword ptr [rbx], -1
        xor     qword ptr [rbx], -1
        adc     qword ptr [rbx], -1
        sbb     qword ptr [rbx], -1
        test     qword ptr [rbx], -1
        mov     qword ptr [rbx], 7FFFFFFFh
        add     qword ptr [rbx], 7FFFFFFFh
        sub     qword ptr [rbx], 7FFFFFFFh
        cmp     qword ptr [rbx], 7FFFFFFFh
        and     qword ptr [rbx], 7FFFFFFFh
        or     qword ptr [rbx], 7FFFFFFFh
        xor     qword ptr [rbx], 7FFFFFFFh
        adc     qword ptr [rbx], 7FFFFFFFh
        sbb     qword ptr [rbx], 7FFFFFFFh
        test     qword ptr [rbx], 7FFFFFFFh
        mov     qword ptr [rbx], -2147483648
        add     qword ptr [rbx], -2147483648
        sub     qword ptr [rbx], -2147483648
        cmp     qword ptr [rbx], -2147483648
        and     qword ptr [rbx], -2147483648
        or     qword ptr [rbx], -2147483648
        xor     qword ptr [rbx], -2147483648
        adc     qword ptr [rbx], -2147483648
        sbb     qword ptr [rbx], -2147483648
        test     qword ptr [rbx], -2147483648
        mov     dword ptr [rbx], 0
        add     dword ptr [rbx], 0
        sub     dword ptr [rbx], 0
        cmp     dword ptr [rbx], 0
        and     dword ptr [rbx], 0
        or     dword ptr [rbx], 0
        xor     dword ptr [rbx], 0
        adc     dword ptr [rbx], 0
        sbb     dword ptr [rbx], 0
        test     dword ptr [rbx], 0
        mov     dword ptr [rbx], 1
        add     dword ptr [rbx], 1
        sub     dword ptr [rbx], 1
        cmp     dword ptr [rbx], 1
        and     dword ptr [rbx], 1
        or     dword ptr [rbx], 1
        xor     dword ptr [rbx], 1
        adc     dword ptr [rbx], 1
        sbb     dword ptr [rbx], 1
        test     dword ptr [rbx], 1
        mov     dword ptr [rbx], 127
        add     dword ptr [rbx], 127
        sub     dword ptr [rbx], 127
        cmp     dword ptr [rbx], 127
        and     dword ptr [rbx], 127
        or     dword ptr [rbx], 127
        xor     dword ptr [rbx], 127
        adc     dword ptr [rbx], 127
        sbb     dword ptr [rbx], 127
        test     dword ptr [rbx], 127
        mov     dword ptr [rbx], 128
        add     dword ptr [rbx], 128
        sub     dword ptr [rbx], 128
        cmp     dword ptr [rbx], 128
        and     dword ptr [rbx], 128
        or     dword ptr [rbx], 128
        xor     dword ptr [rbx], 128
        adc     dword ptr [rbx], 128
        sbb     dword ptr [rbx], 128
        test     dword ptr [rbx], 128
        mov     dword ptr [rbx], -128
        add     dword ptr [rbx], -128
        sub     dword ptr [rbx], -128
        cmp     dword ptr [rbx], -128
        and     dword ptr [rbx], -128
        or     dword ptr [rbx], -128
        xor     dword ptr [rbx], -128
        adc     dword ptr [rbx], -128
        sbb     dword ptr [rbx], -128
        test     dword ptr [rbx], -128
        mov     dword ptr [rbx], -129
        add     dword ptr [rbx], -129
        sub     dword ptr [rbx], -129
        cmp     dword ptr [rbx], -129
        and     dword ptr [rbx], -129
        or     dword ptr [rbx], -129
        xor     dword ptr [rbx], -129
        adc     dword ptr [rbx], -129
        sbb     dword ptr [rbx], -129
        test     dword ptr [rbx], -129
        mov     dword ptr [rbx], -1
        add     dword ptr [rbx], -1
        sub     dword ptr [rbx], -1
        cmp     dword ptr [rbx], -1
        and     dword ptr [rbx], -1
        or     dword ptr [rbx], -1
        xor     dword ptr [rbx], -1
        adc     dword ptr [rbx], -1
        sbb     dword ptr [rbx], -1
        test     dword ptr [rbx], -1
        mov     dword ptr [rbx], 7FFFFFFFh
        add     dword ptr [rbx], 7FFFFFFFh
        sub     dword ptr [rbx], 7FFFFFFFh
        cmp     dword ptr [rbx], 7FFFFFFFh
        and     dword ptr [rbx], 7FFFFFFFh
        or     dword ptr [rbx], 7FFFFFFFh
        xor     dword ptr [rbx], 7FFFFFFFh
        adc     dword ptr [rbx], 7FFFFFFFh
        sbb     dword ptr [rbx], 7FFFFFFFh
        test     dword ptr [rbx], 7FFFFFFFh
        mov     dword ptr [rbx], -2147483648
        add     dword ptr [rbx], -2147483648
        sub     dword ptr [rbx], -2147483648
        cmp     dword ptr [rbx], -2147483648
        and     dword ptr [rbx], -2147483648
        or     dword ptr [rbx], -2147483648
        xor     dword ptr [rbx], -2147483648
        adc     dword ptr [rbx], -2147483648
        sbb     dword ptr [rbx], -2147483648
        test     dword ptr [rbx], -2147483648
        mov     qword ptr [rsp+8], 0
        add     qword ptr [rsp+8], 0
        sub     qword ptr [rsp+8], 0
        cmp     qword ptr [rsp+8], 0
        and     qword ptr [rsp+8], 0
        or     qword ptr [rsp+8], 0
        xor     qword ptr [rsp+8], 0
        adc     qword ptr [rsp+8], 0
        sbb     qword ptr [rsp+8], 0
        test     qword ptr [rsp+8], 0
        mov     qword ptr [rsp+8], 1
        add     qword ptr [rsp+8], 1
        sub     qword ptr [rsp+8], 1
        cmp     qword ptr [rsp+8], 1
        and     qword ptr [rsp+8], 1
        or     qword ptr [rsp+8], 1
        xor     qword ptr [rsp+8], 1
        adc     qword ptr [rsp+8], 1
        sbb     qword ptr [rsp+8], 1
        test     qword ptr [rsp+8], 1
        mov     qword ptr [rsp+8], 127
        add     qword ptr [rsp+8], 127
        sub     qword ptr [rsp+8], 127
        cmp     qword ptr [rsp+8], 127
        and     qword ptr [rsp+8], 127
        or     qword ptr [rsp+8], 127
        xor     qword ptr [rsp+8], 127
        adc     qword ptr [rsp+8], 127
        sbb     qword ptr [rsp+8], 127
        test     qword ptr [rsp+8], 127
        mov     qword ptr [rsp+8], 128
        add     qword ptr [rsp+8], 128
        sub     qword ptr [rsp+8], 128
        cmp     qword ptr [rsp+8], 128
        and     qword ptr [rsp+8], 128
        or     qword ptr [rsp+8], 128
        xor     qword ptr [rsp+8], 128
        adc     qword ptr [rsp+8], 128
        sbb     qword ptr [rsp+8], 128
        test     qword ptr [rsp+8], 128
        mov     qword ptr [rsp+8], -128
        add     qword ptr [rsp+8], -128
        sub     qword ptr [rsp+8], -128
        cmp     qword ptr [rsp+8], -128
        and     qword ptr [rsp+8], -128
        or     qword ptr [rsp+8], -128
        xor     qword ptr [rsp+8], -128
        adc     qword ptr [rsp+8], -128
        sbb     qword ptr [rsp+8], -128
        test     qword ptr [rsp+8], -128
        mov     qword ptr [rsp+8], -129
        add     qword ptr [rsp+8], -129
        sub     qword ptr [rsp+8], -129
        cmp     qword ptr [rsp+8], -129
        and     qword ptr [rsp+8], -129
        or     qword ptr [rsp+8], -129
        xor     qword ptr [rsp+8], -129
        adc     qword ptr [rsp+8], -129
        sbb     qword ptr [rsp+8], -129
        test     qword ptr [rsp+8], -129
        mov     qword ptr [rsp+8], -1
        add     qword ptr [rsp+8], -1
        sub     qword ptr [rsp+8], -1
        cmp     qword ptr [rsp+8], -1
        and     qword ptr [rsp+8], -1
        or     qword ptr [rsp+8], -1
        xor     qword ptr [rsp+8], -1
        adc     qword ptr [rsp+8], -1
        sbb     qword ptr [rsp+8], -1
        test     qword ptr [rsp+8], -1
        mov     qword ptr [rsp+8], 7FFFFFFFh
        add     qword ptr [rsp+8], 7FFFFFFFh
        sub     qword ptr [rsp+8], 7FFFFFFFh
        cmp     qword ptr [rsp+8], 7FFFFFFFh
        and     qword ptr [rsp+8], 7FFFFFFFh
        or     qword ptr [rsp+8], 7FFFFFFFh
        xor     qword ptr [rsp+8], 7FFFFFFFh
        adc     qword ptr [rsp+8], 7FFFFFFFh
        sbb     qword ptr [rsp+8], 7FFFFFFFh
        test     qword ptr [rsp+8], 7FFFFFFFh
        mov     qword ptr [rsp+8], -2147483648
        add     qword ptr [rsp+8], -2147483648
        sub     qword ptr [rsp+8], -2147483648
        cmp     qword ptr [rsp+8], -2147483648
        and     qword ptr [rsp+8], -2147483648
        or     qword ptr [rsp+8], -2147483648
        xor     qword ptr [rsp+8], -2147483648
        adc     qword ptr [rsp+8], -2147483648
        sbb     qword ptr [rsp+8], -2147483648
        test     qword ptr [rsp+8], -2147483648
        mov     dword ptr [rbp-4], 0
        add     dword ptr [rbp-4], 0
        sub     dword ptr [rbp-4], 0
        cmp     dword ptr [rbp-4], 0
        and     dword ptr [rbp-4], 0
        or     dword ptr [rbp-4], 0
        xor     dword ptr [rbp-4], 0
        adc     dword ptr [rbp-4], 0
        sbb     dword ptr [rbp-4], 0
        test     dword ptr [rbp-4], 0
        mov     dword ptr [rbp-4], 1
        add     dword ptr [rbp-4], 1
        sub     dword ptr [rbp-4], 1
        cmp     dword ptr [rbp-4], 1
        and     dword ptr [rbp-4], 1
        or     dword ptr [rbp-4], 1
        xor     dword ptr [rbp-4], 1
        adc     dword ptr [rbp-4], 1
        sbb     dword ptr [rbp-4], 1
        test     dword ptr [rbp-4], 1
        mov     dword ptr [rbp-4], 127
        add     dword ptr [rbp-4], 127
        sub     dword ptr [rbp-4], 127
        cmp     dword ptr [rbp-4], 127
        and     dword ptr [rbp-4], 127
        or     dword ptr [rbp-4], 127
        xor     dword ptr [rbp-4], 127
        adc     dword ptr [rbp-4], 127
        sbb     dword ptr [rbp-4], 127
        test     dword ptr [rbp-4], 127
        mov     dword ptr [rbp-4], 128
        add     dword ptr [rbp-4], 128
        sub     dword ptr [rbp-4], 128
        cmp     dword ptr [rbp-4], 128
        and     dword ptr [rbp-4], 128
        or     dword ptr [rbp-4], 128
        xor     dword ptr [rbp-4], 128
        adc     dword ptr [rbp-4], 128
        sbb     dword ptr [rbp-4], 128
        test     dword ptr [rbp-4], 128
        mov     dword ptr [rbp-4], -128
        add     dword ptr [rbp-4], -128
        sub     dword ptr [rbp-4], -128
        cmp     dword ptr [rbp-4], -128
        and     dword ptr [rbp-4], -128
        or     dword ptr [rbp-4], -128
        xor     dword ptr [rbp-4], -128
        adc     dword ptr [rbp-4], -128
        sbb     dword ptr [rbp-4], -128
        test     dword ptr [rbp-4], -128
        mov     dword ptr [rbp-4], -129
        add     dword ptr [rbp-4], -129
        sub     dword ptr [rbp-4], -129
        cmp     dword ptr [rbp-4], -129
        and     dword ptr [rbp-4], -129
        or     dword ptr [rbp-4], -129
        xor     dword ptr [rbp-4], -129
        adc     dword ptr [rbp-4], -129
        sbb     dword ptr [rbp-4], -129
        test     dword ptr [rbp-4], -129
        mov     dword ptr [rbp-4], -1
        add     dword ptr [rbp-4], -1
        sub     dword ptr [rbp-4], -1
        cmp     dword ptr [rbp-4], -1
        and     dword ptr [rbp-4], -1
        or     dword ptr [rbp-4], -1
        xor     dword ptr [rbp-4], -1
        adc     dword ptr [rbp-4], -1
        sbb     dword ptr [rbp-4], -1
        test     dword ptr [rbp-4], -1
        mov     dword ptr [rbp-4], 7FFFFFFFh
        add     dword ptr [rbp-4], 7FFFFFFFh
        sub     dword ptr [rbp-4], 7FFFFFFFh
        cmp     dword ptr [rbp-4], 7FFFFFFFh
        and     dword ptr [rbp-4], 7FFFFFFFh
        or     dword ptr [rbp-4], 7FFFFFFFh
        xor     dword ptr [rbp-4], 7FFFFFFFh
        adc     dword ptr [rbp-4], 7FFFFFFFh
        sbb     dword ptr [rbp-4], 7FFFFFFFh
        test     dword ptr [rbp-4], 7FFFFFFFh
        mov     dword ptr [rbp-4], -2147483648
        add     dword ptr [rbp-4], -2147483648
        sub     dword ptr [rbp-4], -2147483648
        cmp     dword ptr [rbp-4], -2147483648
        and     dword ptr [rbp-4], -2147483648
        or     dword ptr [rbp-4], -2147483648
        xor     dword ptr [rbp-4], -2147483648
        adc     dword ptr [rbp-4], -2147483648
        sbb     dword ptr [rbp-4], -2147483648
        test     dword ptr [rbp-4], -2147483648
        mov     qword ptr [r12+rax*8+16], 0
        add     qword ptr [r12+rax*8+16], 0
        sub     qword ptr [r12+rax*8+16], 0
        cmp     qword ptr [r12+rax*8+16], 0
        and     qword ptr [r12+rax*8+16], 0
        or     qword ptr [r12+rax*8+16], 0
        xor     qword ptr [r12+rax*8+16], 0
        adc     qword ptr [r12+rax*8+16], 0
        sbb     qword ptr [r12+rax*8+16], 0
        test     qword ptr [r12+rax*8+16], 0
        mov     qword ptr [r12+rax*8+16], 1
        add     qword ptr [r12+rax*8+16], 1
        sub     qword ptr [r12+rax*8+16], 1
        cmp     qword ptr [r12+rax*8+16], 1
        and     qword ptr [r12+rax*8+16], 1
        or     qword ptr [r12+rax*8+16], 1
        xor     qword ptr [r12+rax*8+16], 1
        adc     qword ptr [r12+rax*8+16], 1
        sbb     qword ptr [r12+rax*8+16], 1
        test     qword ptr [r12+rax*8+16], 1
        mov     qword ptr [r12+rax*8+16], 127
        add     qword ptr [r12+rax*8+16], 127
        sub     qword ptr [r12+rax*8+16], 127
        cmp     qword ptr [r12+rax*8+16], 127
        and     qword ptr [r12+rax*8+16], 127
        or     qword ptr [r12+rax*8+16], 127
        xor     qword ptr [r12+rax*8+16], 127
        adc     qword ptr [r12+rax*8+16], 127
        sbb     qword ptr [r12+rax*8+16], 127
        test     qword ptr [r12+rax*8+16], 127
        mov     qword ptr [r12+rax*8+16], 128
        add     qword ptr [r12+rax*8+16], 128
        sub     qword ptr [r12+rax*8+16], 128
        cmp     qword ptr [r12+rax*8+16], 128
        and     qword ptr [r12+rax*8+16], 128
        or     qword ptr [r12+rax*8+16], 128
        xor     qword ptr [r12+rax*8+16], 128
        adc     qword ptr [r12+rax*8+16], 128
        sbb     qword ptr [r12+rax*8+16], 128
        test     qword ptr [r12+rax*8+16], 128
        mov     qword ptr [r12+rax*8+16], -128
        add     qword ptr [r12+rax*8+16], -128
        sub     qword ptr [r12+rax*8+16], -128
        cmp     qword ptr [r12+rax*8+16], -128
        and     qword ptr [r12+rax*8+16], -128
        or     qword ptr [r12+rax*8+16], -128
        xor     qword ptr [r12+rax*8+16], -128
        adc     qword ptr [r12+rax*8+16], -128
        sbb     qword ptr [r12+rax*8+16], -128
        test     qword ptr [r12+rax*8+16], -128
        mov     qword ptr [r12+rax*8+16], -129
        add     qword ptr [r12+rax*8+16], -129
        sub     qword ptr [r12+rax*8+16], -129
        cmp     qword ptr [r12+rax*8+16], -129
        and     qword ptr [r12+rax*8+16], -129
        or     qword ptr [r12+rax*8+16], -129
        xor     qword ptr [r12+rax*8+16], -129
        adc     qword ptr [r12+rax*8+16], -129
        sbb     qword ptr [r12+rax*8+16], -129
        test     qword ptr [r12+rax*8+16], -129
        mov     qword ptr [r12+rax*8+16], -1
        add     qword ptr [r12+rax*8+16], -1
        sub     qword ptr [r12+rax*8+16], -1
        cmp     qword ptr [r12+rax*8+16], -1
        and     qword ptr [r12+rax*8+16], -1
        or     qword ptr [r12+rax*8+16], -1
        xor     qword ptr [r12+rax*8+16], -1
        adc     qword ptr [r12+rax*8+16], -1
        sbb     qword ptr [r12+rax*8+16], -1
        test     qword ptr [r12+rax*8+16], -1
        mov     qword ptr [r12+rax*8+16], 7FFFFFFFh
        add     qword ptr [r12+rax*8+16], 7FFFFFFFh
        sub     qword ptr [r12+rax*8+16], 7FFFFFFFh
        cmp     qword ptr [r12+rax*8+16], 7FFFFFFFh
        and     qword ptr [r12+rax*8+16], 7FFFFFFFh
        or     qword ptr [r12+rax*8+16], 7FFFFFFFh
        xor     qword ptr [r12+rax*8+16], 7FFFFFFFh
        adc     qword ptr [r12+rax*8+16], 7FFFFFFFh
        sbb     qword ptr [r12+rax*8+16], 7FFFFFFFh
        test     qword ptr [r12+rax*8+16], 7FFFFFFFh
        mov     qword ptr [r12+rax*8+16], -2147483648
        add     qword ptr [r12+rax*8+16], -2147483648
        sub     qword ptr [r12+rax*8+16], -2147483648
        cmp     qword ptr [r12+rax*8+16], -2147483648
        and     qword ptr [r12+rax*8+16], -2147483648
        or     qword ptr [r12+rax*8+16], -2147483648
        xor     qword ptr [r12+rax*8+16], -2147483648
        adc     qword ptr [r12+rax*8+16], -2147483648
        sbb     qword ptr [r12+rax*8+16], -2147483648
        test     qword ptr [r12+rax*8+16], -2147483648
        mov     dword ptr [r13], 0
        add     dword ptr [r13], 0
        sub     dword ptr [r13], 0
        cmp     dword ptr [r13], 0
        and     dword ptr [r13], 0
        or     dword ptr [r13], 0
        xor     dword ptr [r13], 0
        adc     dword ptr [r13], 0
        sbb     dword ptr [r13], 0
        test     dword ptr [r13], 0
        mov     dword ptr [r13], 1
        add     dword ptr [r13], 1
        sub     dword ptr [r13], 1
        cmp     dword ptr [r13], 1
        and     dword ptr [r13], 1
        or     dword ptr [r13], 1
        xor     dword ptr [r13], 1
        adc     dword ptr [r13], 1
        sbb     dword ptr [r13], 1
        test     dword ptr [r13], 1
        mov     dword ptr [r13], 127
        add     dword ptr [r13], 127
        sub     dword ptr [r13], 127
        cmp     dword ptr [r13], 127
        and     dword ptr [r13], 127
        or     dword ptr [r13], 127
        xor     dword ptr [r13], 127
        adc     dword ptr [r13], 127
        sbb     dword ptr [r13], 127
        test     dword ptr [r13], 127
        mov     dword ptr [r13], 128
        add     dword ptr [r13], 128
        sub     dword ptr [r13], 128
        cmp     dword ptr [r13], 128
        and     dword ptr [r13], 128
        or     dword ptr [r13], 128
        xor     dword ptr [r13], 128
        adc     dword ptr [r13], 128
        sbb     dword ptr [r13], 128
        test     dword ptr [r13], 128
        mov     dword ptr [r13], -128
        add     dword ptr [r13], -128
        sub     dword ptr [r13], -128
        cmp     dword ptr [r13], -128
        and     dword ptr [r13], -128
        or     dword ptr [r13], -128
        xor     dword ptr [r13], -128
        adc     dword ptr [r13], -128
        sbb     dword ptr [r13], -128
        test     dword ptr [r13], -128
        mov     dword ptr [r13], -129
        add     dword ptr [r13], -129
        sub     dword ptr [r13], -129
        cmp     dword ptr [r13], -129
        and     dword ptr [r13], -129
        or     dword ptr [r13], -129
        xor     dword ptr [r13], -129
        adc     dword ptr [r13], -129
        sbb     dword ptr [r13], -129
        test     dword ptr [r13], -129
        mov     dword ptr [r13], -1
        add     dword ptr [r13], -1
        sub     dword ptr [r13], -1
        cmp     dword ptr [r13], -1
        and     dword ptr [r13], -1
        or     dword ptr [r13], -1
        xor     dword ptr [r13], -1
        adc     dword ptr [r13], -1
        sbb     dword ptr [r13], -1
        test     dword ptr [r13], -1
        mov     dword ptr [r13], 7FFFFFFFh
        add     dword ptr [r13], 7FFFFFFFh
        sub     dword ptr [r13], 7FFFFFFFh
        cmp     dword ptr [r13], 7FFFFFFFh
        and     dword ptr [r13], 7FFFFFFFh
        or     dword ptr [r13], 7FFFFFFFh
        xor     dword ptr [r13], 7FFFFFFFh
        adc     dword ptr [r13], 7FFFFFFFh
        sbb     dword ptr [r13], 7FFFFFFFh
        test     dword ptr [r13], 7FFFFFFFh
        mov     dword ptr [r13], -2147483648
        add     dword ptr [r13], -2147483648
        sub     dword ptr [r13], -2147483648
        cmp     dword ptr [r13], -2147483648
        and     dword ptr [r13], -2147483648
        or     dword ptr [r13], -2147483648
        xor     dword ptr [r13], -2147483648
        adc     dword ptr [r13], -2147483648
        sbb     dword ptr [r13], -2147483648
        test     dword ptr [r13], -2147483648
        ret
f ENDP
END
