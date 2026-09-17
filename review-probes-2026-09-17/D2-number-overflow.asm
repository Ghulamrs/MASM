; D2-number-overflow - integer literals beyond 2^64
; ml64 14.44:      error A2071 (initializer magnitude too large) for 18446744073709551616
; this assembler (ffa04ad): accepted: 18446744073709551616 -> 0, 99999999999999999999 -> 0x6bc75e2d630fffff (lexer.cpp:44 wraps)
.CODE
f PROC
  mov rax, 18446744073709551615
  mov rax, 18446744073709551616
  mov rax, 99999999999999999999
  ret
f ENDP
END
