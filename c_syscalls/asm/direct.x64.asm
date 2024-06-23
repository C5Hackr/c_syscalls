extern GetSsn:proc

.code

GetInfo_Direct proc
    push rdx
    mov rdx, 0
    sub rsp, 28h
    call GetSsn
    add rsp, 28h
    pop rdx
    ret
GetInfo_Direct endp

DoDirectSyscall proc
    call GetInfo_Direct
    mov [rsp - 8], rsi
    mov [rsp - 10h], rdi
    mov rcx, rdx
    mov r10, r8
    mov rdx, r9
    mov  r8, [rsp + 28h]
    mov  r9, [rsp + 30h]
    sub rcx, 4
    jle skip
    lea rsi, [rsp + 38h]
    lea rdi, [rsp + 28h]
    rep movsq
skip:
    syscall
    mov rsi, [rsp - 8]
    mov rdi, [rsp - 10h]
    ret
DoDirectSyscall endp

end