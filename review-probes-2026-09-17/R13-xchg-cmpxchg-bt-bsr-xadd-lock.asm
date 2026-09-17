; R13-xchg-cmpxchg-bt-bsr-xadd-lock - XCHG CMPXCHG LOCK BT BSR BSF XADD (corpus: 0)
; ml64 14.44:      48 91; 48 0F B1 0B; F0 48 0F B1 0B; 48 0F BA E0 03; 48 0F BD C1; 0F BC C1; 48 0F C1 03
; this assembler (ffa04ad): unknown instruction
.CODE
f PROC
        xchg    rax, rcx
        cmpxchg qword ptr [rbx], rcx
        lock cmpxchg qword ptr [rbx], rcx
        bt      rax, 3
        bsr     rax, rcx
        bsf     eax, ecx
        xadd    qword ptr [rbx], rax
        ret
f ENDP
END
