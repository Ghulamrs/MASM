; c1: main, with its own copies of the mergeable twice and helper, and a shared table -
; the same three are in c2, and the linker must fold each pair (a COMDAT) rather than refuse
EXTERN printf:PROC
EXTERN other:PROC
.CONST
fmt DB "twice(20)=%d helper=%d table=%d other=%d", 10, 0
.rdata SEGMENT READONLY ALIGN(8) 'DATA' COMDAT(table)
table DD 7, 8, 9
.rdata ENDS
.text$mn SEGMENT ALIGN(16) 'CODE' COMDAT(twice)
twice PROC
  lea eax, [rcx+rcx]
  ret
twice ENDP
.text$mn ENDS
.text$mn SEGMENT ALIGN(16) 'CODE' COMDAT(helper)
helper PROC
$LNbeg$helper:
  push rbp
$LNpush$helper:
  mov rbp, rsp
$LNprolog$helper:
  mov eax, 3
  pop rbp
  ret
$LNend$helper:
helper ENDP
.text$mn ENDS
.pdata SEGMENT READONLY ALIGN(4) 'DATA' ASSOCIATIVE(helper)
$pdata$helper DD imagerel $LNbeg$helper
  DD imagerel $LNend$helper
  DD imagerel $unwind$helper
.pdata ENDS
.xdata SEGMENT READONLY ALIGN(8) 'DATA' ASSOCIATIVE(helper)
$unwind$helper DB 01H
  DB $LNprolog$helper-$LNbeg$helper
  DB 1
  DB 05H
  DB $LNpush$helper-$LNbeg$helper
  DB 050H
.xdata ENDS
.CODE
main PROC
  sub rsp, 56
  mov ecx, 20
  call twice
  mov dword ptr [rsp+40], eax
  call helper
  mov dword ptr [rsp+44], eax
  call other
  mov dword ptr [rsp+32], eax
  mov r9d, dword ptr [table+4]
  mov r8d, dword ptr [rsp+44]
  mov edx, dword ptr [rsp+40]
  lea rcx, fmt
  call printf
  mov eax, 5
  add rsp, 56
  ret
main ENDP
END
