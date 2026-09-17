; D5-case-insensitive-ml64 - Var and var
; ml64 14.44:      error A2005: symbol redefinition : Var (ml64's default is case-insensitive for non-public names)
; this assembler (ffa04ad): assembles two symbols; README says symbols are case-sensitive
.DATA
Var DQ 1
var DQ 2
.code
F proc
        MOV     RAX, Var
        Mov     rax, var
        Ret
F endp
end
