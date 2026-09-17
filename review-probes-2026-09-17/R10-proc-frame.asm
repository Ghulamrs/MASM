; R10-proc-frame - PROC FRAME and .PUSHREG/.ALLOCSTACK/.SETFRAME/.ENDPROLOG (corpus: 424 cc1 files)
; ml64 14.44:      assembles and emits .pdata (0xC) and .xdata (0x10)
; this assembler (ffa04ad): 'PROC attributes are not supported in this version'; unknown instruction '.PUSHREG' ...
.CODE
f PROC FRAME
        push    rbp
        .pushreg rbp
        sub     rsp, 32
        .allocstack 32
        lea     rbp, [rsp+32]
        .setframe rbp, 32
        .endprolog
        lea     rsp, [rbp]
        pop     rbp
        ret
f ENDP
END
