.intel_syntax noprefix
push rbp
{load} mov rbp, rsp
sub rsp, 32
push r12
mov eax, 5
mov rcx, 1000
mov r8, 123456789012
mov rax, -1
{load} add rax, rcx
add rax, 1000
sub r9, 7
cmp r10d, 70000
{load} xor eax, eax
{load} and rbx, r14
test rcx, rdx
mov rax, qword ptr [rbx]
mov rax, [rsp + 8]
mov rdx, [rbp - 16]
mov [r12 + rcx*8 + 24], r15
mov eax, dword ptr [r13]
lea rdx, [rax + rbx*4 - 3]
mov dword ptr [rbx + 4], 99
lea rcx, [rip+0]
mov rax, qword ptr [rip+0]
inc qword ptr [rbp - 8]
imul rax, rbx
cqo
idiv rcx
neg r11
shl rax, 1
sar rdx, 8
