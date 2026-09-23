; a23: forward short jumps behind jumps that grow between passes - each je must stay rel8
; while the jmp to the end becomes rel32 (shalimar's if_chain: ml64 keeps the je short). It
; takes fifty widened jumps ahead of a je before the stale distance leaves rel8's range
EXTERN shm_line:PROC
EXTERN shm_int_eq:PROC
.CODE
f PROC
        mov     ecx, 0
        call    shm_line
        cmp     eax, 0
        je      L0
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L0:
        nop
        mov     ecx, 1
        call    shm_line
        cmp     eax, 1
        je      L1
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L1:
        nop
        mov     ecx, 2
        call    shm_line
        cmp     eax, 2
        je      L2
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L2:
        nop
        mov     ecx, 3
        call    shm_line
        cmp     eax, 3
        je      L3
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L3:
        nop
        mov     ecx, 4
        call    shm_line
        cmp     eax, 4
        je      L4
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L4:
        nop
        mov     ecx, 5
        call    shm_line
        cmp     eax, 5
        je      L5
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L5:
        nop
        mov     ecx, 6
        call    shm_line
        cmp     eax, 6
        je      L6
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L6:
        nop
        mov     ecx, 7
        call    shm_line
        cmp     eax, 7
        je      L7
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L7:
        nop
        mov     ecx, 8
        call    shm_line
        cmp     eax, 8
        je      L8
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L8:
        nop
        mov     ecx, 9
        call    shm_line
        cmp     eax, 9
        je      L9
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L9:
        nop
        mov     ecx, 10
        call    shm_line
        cmp     eax, 10
        je      L10
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L10:
        nop
        mov     ecx, 11
        call    shm_line
        cmp     eax, 11
        je      L11
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L11:
        nop
        mov     ecx, 12
        call    shm_line
        cmp     eax, 12
        je      L12
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L12:
        nop
        mov     ecx, 13
        call    shm_line
        cmp     eax, 13
        je      L13
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L13:
        nop
        mov     ecx, 14
        call    shm_line
        cmp     eax, 14
        je      L14
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L14:
        nop
        mov     ecx, 15
        call    shm_line
        cmp     eax, 15
        je      L15
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L15:
        nop
        mov     ecx, 16
        call    shm_line
        cmp     eax, 16
        je      L16
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L16:
        nop
        mov     ecx, 17
        call    shm_line
        cmp     eax, 17
        je      L17
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L17:
        nop
        mov     ecx, 18
        call    shm_line
        cmp     eax, 18
        je      L18
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L18:
        nop
        mov     ecx, 19
        call    shm_line
        cmp     eax, 19
        je      L19
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L19:
        nop
        mov     ecx, 20
        call    shm_line
        cmp     eax, 20
        je      L20
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L20:
        nop
        mov     ecx, 21
        call    shm_line
        cmp     eax, 21
        je      L21
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L21:
        nop
        mov     ecx, 22
        call    shm_line
        cmp     eax, 22
        je      L22
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L22:
        nop
        mov     ecx, 23
        call    shm_line
        cmp     eax, 23
        je      L23
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L23:
        nop
        mov     ecx, 24
        call    shm_line
        cmp     eax, 24
        je      L24
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L24:
        nop
        mov     ecx, 25
        call    shm_line
        cmp     eax, 25
        je      L25
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L25:
        nop
        mov     ecx, 26
        call    shm_line
        cmp     eax, 26
        je      L26
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L26:
        nop
        mov     ecx, 27
        call    shm_line
        cmp     eax, 27
        je      L27
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L27:
        nop
        mov     ecx, 28
        call    shm_line
        cmp     eax, 28
        je      L28
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L28:
        nop
        mov     ecx, 29
        call    shm_line
        cmp     eax, 29
        je      L29
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L29:
        nop
        mov     ecx, 30
        call    shm_line
        cmp     eax, 30
        je      L30
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L30:
        nop
        mov     ecx, 31
        call    shm_line
        cmp     eax, 31
        je      L31
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L31:
        nop
        mov     ecx, 32
        call    shm_line
        cmp     eax, 32
        je      L32
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L32:
        nop
        mov     ecx, 33
        call    shm_line
        cmp     eax, 33
        je      L33
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L33:
        nop
        mov     ecx, 34
        call    shm_line
        cmp     eax, 34
        je      L34
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L34:
        nop
        mov     ecx, 35
        call    shm_line
        cmp     eax, 35
        je      L35
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L35:
        nop
        mov     ecx, 36
        call    shm_line
        cmp     eax, 36
        je      L36
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L36:
        nop
        mov     ecx, 37
        call    shm_line
        cmp     eax, 37
        je      L37
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L37:
        nop
        mov     ecx, 38
        call    shm_line
        cmp     eax, 38
        je      L38
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L38:
        nop
        mov     ecx, 39
        call    shm_line
        cmp     eax, 39
        je      L39
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L39:
        nop
        mov     ecx, 40
        call    shm_line
        cmp     eax, 40
        je      L40
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L40:
        nop
        mov     ecx, 41
        call    shm_line
        cmp     eax, 41
        je      L41
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L41:
        nop
        mov     ecx, 42
        call    shm_line
        cmp     eax, 42
        je      L42
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L42:
        nop
        mov     ecx, 43
        call    shm_line
        cmp     eax, 43
        je      L43
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L43:
        nop
        mov     ecx, 44
        call    shm_line
        cmp     eax, 44
        je      L44
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L44:
        nop
        mov     ecx, 45
        call    shm_line
        cmp     eax, 45
        je      L45
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L45:
        nop
        mov     ecx, 46
        call    shm_line
        cmp     eax, 46
        je      L46
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L46:
        nop
        mov     ecx, 47
        call    shm_line
        cmp     eax, 47
        je      L47
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L47:
        nop
        mov     ecx, 48
        call    shm_line
        cmp     eax, 48
        je      L48
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L48:
        nop
        mov     ecx, 49
        call    shm_line
        cmp     eax, 49
        je      L49
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L49:
        nop
        mov     ecx, 50
        call    shm_line
        cmp     eax, 50
        je      L50
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L50:
        nop
        mov     ecx, 51
        call    shm_line
        cmp     eax, 51
        je      L51
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L51:
        nop
        mov     ecx, 52
        call    shm_line
        cmp     eax, 52
        je      L52
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L52:
        nop
        mov     ecx, 53
        call    shm_line
        cmp     eax, 53
        je      L53
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L53:
        nop
        mov     ecx, 54
        call    shm_line
        cmp     eax, 54
        je      L54
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L54:
        nop
        mov     ecx, 55
        call    shm_line
        cmp     eax, 55
        je      L55
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L55:
        nop
        mov     ecx, 56
        call    shm_line
        cmp     eax, 56
        je      L56
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L56:
        nop
        mov     ecx, 57
        call    shm_line
        cmp     eax, 57
        je      L57
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L57:
        nop
        mov     ecx, 58
        call    shm_line
        cmp     eax, 58
        je      L58
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L58:
        nop
        mov     ecx, 59
        call    shm_line
        cmp     eax, 59
        je      L59
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L59:
        nop
        mov     ecx, 60
        call    shm_line
        cmp     eax, 60
        je      L60
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L60:
        nop
        mov     ecx, 61
        call    shm_line
        cmp     eax, 61
        je      L61
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L61:
        nop
        mov     ecx, 62
        call    shm_line
        cmp     eax, 62
        je      L62
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L62:
        nop
        mov     ecx, 63
        call    shm_line
        cmp     eax, 63
        je      L63
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L63:
        nop
        mov     ecx, 64
        call    shm_line
        cmp     eax, 64
        je      L64
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L64:
        nop
        mov     ecx, 65
        call    shm_line
        cmp     eax, 65
        je      L65
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L65:
        nop
        mov     ecx, 66
        call    shm_line
        cmp     eax, 66
        je      L66
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L66:
        nop
        mov     ecx, 67
        call    shm_line
        cmp     eax, 67
        je      L67
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L67:
        nop
        mov     ecx, 68
        call    shm_line
        cmp     eax, 68
        je      L68
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L68:
        nop
        mov     ecx, 69
        call    shm_line
        cmp     eax, 69
        je      L69
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L69:
        nop
        mov     ecx, 70
        call    shm_line
        cmp     eax, 70
        je      L70
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L70:
        nop
        mov     ecx, 71
        call    shm_line
        cmp     eax, 71
        je      L71
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L71:
        nop
        mov     ecx, 72
        call    shm_line
        cmp     eax, 72
        je      L72
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L72:
        nop
        mov     ecx, 73
        call    shm_line
        cmp     eax, 73
        je      L73
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L73:
        nop
        mov     ecx, 74
        call    shm_line
        cmp     eax, 74
        je      L74
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L74:
        nop
        mov     ecx, 75
        call    shm_line
        cmp     eax, 75
        je      L75
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L75:
        nop
        mov     ecx, 76
        call    shm_line
        cmp     eax, 76
        je      L76
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L76:
        nop
        mov     ecx, 77
        call    shm_line
        cmp     eax, 77
        je      L77
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L77:
        nop
        mov     ecx, 78
        call    shm_line
        cmp     eax, 78
        je      L78
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L78:
        nop
        mov     ecx, 79
        call    shm_line
        cmp     eax, 79
        je      L79
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L79:
        nop
        mov     ecx, 80
        call    shm_line
        cmp     eax, 80
        je      L80
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L80:
        nop
        mov     ecx, 81
        call    shm_line
        cmp     eax, 81
        je      L81
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L81:
        nop
        mov     ecx, 82
        call    shm_line
        cmp     eax, 82
        je      L82
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L82:
        nop
        mov     ecx, 83
        call    shm_line
        cmp     eax, 83
        je      L83
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L83:
        nop
        mov     ecx, 84
        call    shm_line
        cmp     eax, 84
        je      L84
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L84:
        nop
        mov     ecx, 85
        call    shm_line
        cmp     eax, 85
        je      L85
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L85:
        nop
        mov     ecx, 86
        call    shm_line
        cmp     eax, 86
        je      L86
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L86:
        nop
        mov     ecx, 87
        call    shm_line
        cmp     eax, 87
        je      L87
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L87:
        nop
        mov     ecx, 88
        call    shm_line
        cmp     eax, 88
        je      L88
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L88:
        nop
        mov     ecx, 89
        call    shm_line
        cmp     eax, 89
        je      L89
        mov     ecx, 1
        call    shm_int_eq
        mov     rax, rcx
        mov     rcx, rax
        jmp     Lend
L89:
        nop
Lend:
        ret
f ENDP
END
