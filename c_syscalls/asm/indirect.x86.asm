.MODEL FLAT
assume fs:nothing

extern _GetSsn:proc

.code

_GetInfo_Indirect proc
    push ebp
    mov ebp, esp
    push edx
    lea edx, [esp - 4]
    sub esp, 4
    push edx
    push eax
    call _GetSsn
    add esp, 8
    and eax, 0000FFFFh
    pop ecx
    pop edx
    mov esp, ebp
    pop ebp
    ret
_GetInfo_Indirect endp

_DoIndirectSyscall proc
    mov ecx, [esp + 8]
    not ecx
    add ecx, 1
    lea edx, [esp + ecx * 4]
    mov ecx, [esp]
    mov [edx], ecx
    mov [edx - 4], esi
    mov [edx - 8], edi
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    lea esi, [esp + 0Ch]
    lea edi, [edx + 4]
    rep movsd
    mov esi, [edx - 4]
    mov edi, [edx - 8]
    mov esp, edx
    call _GetInfo_Indirect
    mov edx, fs:[0C0h]
    test edx, edx
    mov edx, fs:[0C0h]
    jmp ecx
_DoIndirectSyscall endp

assume fs:error
end