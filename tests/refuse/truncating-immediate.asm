; R20, kept by design: ml64 folds add rax, 0FFFFFFFFh to add rax, -1; here it is refused
.CODE
f PROC
  add rax, 0FFFFFFFFh
  ret
f ENDP
END
