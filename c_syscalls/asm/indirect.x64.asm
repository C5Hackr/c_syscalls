extern GetSsn:proc

.code

GetInfo_Indirect proc
    push rdx
    lea rdx, [rsp - 8]
    sub rsp, 38h
    call GetSsn
    add rsp, 38h
    mov rcx, [rsp - 8]
    pop rdx
    ret
GetInfo_Indirect endp

DoIndirectSyscall proc
    call GetInfo_Indirect
    mov [rsp - 8], rsi
    mov [rsp - 10h], rdi
    mov [rsp - 18h], r12
    mov r12, rcx
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
    mov rcx, r12
    mov rsi, [rsp - 8]
    mov rdi, [rsp - 10h]
    mov r12, [rsp - 18h]
    jmp rcx
DoIndirectSyscall endp

end