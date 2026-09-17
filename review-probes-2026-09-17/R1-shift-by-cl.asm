; R1-shift-by-cl - shift by CL (corpus: 28 lines, 16 files)
; ml64 14.44:      48 D3 E0; D3 F9; 48 D3 2B
; this assembler (ffa04ad): 'SHL needs a destination and a constant count in this version'
.CODE
f PROC
        shl     rax, cl
        sar     ecx, cl
        shr     qword ptr [rbx], cl
        ret
f ENDP
END
