; R14-sse-scalar - SSE scalar float (corpus: 3368 lines, 122 files; movsd 2295, movq 411, ucomisd 121, cvtsi2sd 90, movss 78, addsd 64, pxor 60, cvttsd2si 54, mulsd 36, movd 29, cvtss2sd 28, xorpd 27, divsd 24, subsd 12, ...)
; ml64 14.44:      F2 0F 10 03; F2 0F 11 0B; F2 0F 10 05 rel32; F2 0F 58 C1; F3 0F 59 D3; F2 48 0F 2A C0; F2 48 0F 2C C0; 0F 57 C0; 66 48 0F 7E C0; 66 0F 6E C9; 66 0F 2E C1; 0F 28 F7
; this assembler (ffa04ad): unknown instruction
.DATA
d DQ 0
.CODE
f PROC
        movsd   xmm0, qword ptr [rbx]
        movsd   qword ptr [rbx], xmm1
        movsd   xmm0, d
        addsd   xmm0, xmm1
        mulss   xmm2, xmm3
        cvtsi2sd xmm0, rax
        cvttsd2si rax, xmm0
        xorps   xmm0, xmm0
        movq    rax, xmm0
        movd    xmm1, ecx
        ucomisd xmm0, xmm1
        movaps  xmm6, xmm7
        ret
f ENDP
END
