; a05: RIP-relative label operands, bare and bracketed, both sections, data labels in DD/DQ
EXTERN fp:QWORD
EXTERN ext:PROC
EXTERN dext:DWORD
.DATA
var8    DQ 0
var4    DD 0
tbl     DQ var8, var4, f, ext
tbl4    DD var8, var4, f
.CODE
f PROC
        mov     rax, var8
        mov     var8, rax
        mov     r9, var8
        mov     var8, r10
        mov     eax, var4
        mov     var4, eax
        mov     r11d, var4
        mov     eax, dword ptr var8
        mov     rax, [var8]
        mov     [var8], rax
        mov     eax, [var4]
        mov     eax, [var4+4]
        mov     rax, [var8+8]
        mov     rax, [var8-8]
        mov     rax, qword ptr [var8 + 8]
        mov     eax, dext
        mov     dext, eax
        mov     rax, fp
        lea     rcx, var8
        lea     rcx, [var8]
        lea     rcx, [var8+8]
        lea     r8, var4
        lea     rax, f
        lea     rax, back
        lea     rax, fwd
        lea     rax, [fwd]
        lea     rax, ext
        inc     qword ptr var8
        dec     dword ptr var4
        neg     qword ptr var8
        push    var8
        pop     var8
        push    qword ptr var8
        push    fp
        call    qword ptr fp
        call    qword ptr [fp]
        call    fp
        jmp     qword ptr fp
        jmp     fp
        imul    rax, qword ptr var8
        imul    rax, var8
        imul    ecx, var4
        add     rax, var8
        add     var8, rax
        sub     ecx, var4
        cmp     rax, [var8]
        cmp     var4, r8d
        test    rax, var8
        test    var8, rax
        xor     ecx, dword ptr [var4]
        and     r15, qword ptr [var8]
        mul     qword ptr var8
        idiv    dword ptr var4
        call    ext
        call    f
        jmp     ext
back:   nop
        jmp     back
        je      back
        jne     fwd
        jmp     fwd
        call    fwd
        call    back
        mov     rax, qword ptr [f]
        mov     rax, [back]
        mov     eax, dword ptr [fwd + 4]
fwd:    ret
f ENDP
END
