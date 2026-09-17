; A1-test-operand-order - TEST reg,reg ModRM operand order
; ml64 14.44:      test rax,rcx = 48 85 C1; test r8,rax = 49 85 C0; test eax,ecx = 85 C1 (first operand in reg field)
; this assembler (ffa04ad): 48 85 C8; 4C 85 C0; 85 C8 (first operand in r/m) - same semantics, different bytes (x64_encode.cpp:243-245)
.CODE
f PROC
        test    rax, rcx
        test    r8, rax
        test    eax, ecx
        ret
f ENDP
END
