; R20-truncating-immediates - immediates ml64 silently truncates to 32 bits and sign-extends (corpus: 0)
; ml64 14.44:      add rax,0FFFFFFFFh = 48 83 C0 FF (adds -1!); push 80000000h = 68 00 00 00 80; mov qword ptr [rbx],80000000h = 48 C7 03 00 00 00 80 (stores -2^31)
; this assembler (ffa04ad): 'immediate does not fit in 32 bits' - the refusal is the safer behaviour
.CODE
f PROC
        add     rax, 0FFFFFFFFh
        ret
f ENDP
END
.CODE
f PROC
        push    80000000h
        push    0FFFFFFFFh
        ret
f ENDP
END
.CODE
f PROC
        mov     qword ptr [rbx], 7FFFFFFFh
        mov     qword ptr [rbx], -2147483648
        mov     qword ptr [rbx], 80000000h
        ret
f ENDP
END
