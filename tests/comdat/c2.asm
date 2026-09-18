; c2: other, with its own copies of twice, helper and table - the linker must keep one of each
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
.rdata SEGMENT READONLY ALIGN(8) 'DATA' COMDAT(table)
table DD 7, 8, 9
.rdata ENDS
PUBLIC other
.CODE
other PROC
  sub rsp, 40
  mov ecx, 50
  call twice
  add eax, dword ptr [table+8]
  add rsp, 40
  ret
other ENDP
END
