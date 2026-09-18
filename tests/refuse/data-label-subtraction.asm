; two labels in different sections cannot be subtracted
.DATA
d DB 0
.CODE
f PROC
  ret
c:
f ENDP
.DATA
x DD c - d
END
