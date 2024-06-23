.MODEL FLAT
assume fs:nothing

extern _GetSsn:proc

.code

_GetInfo_Direct proc
    push ebp
    mov ebp, esp
    mov eax, [esp + 0Ch]
    push 0
    push eax
    call _GetSsn
    and eax, 0000FFFFh
    mov esp, ebp
    pop ebp
    ret
_GetInfo_Direct endp

_DoDirectSyscall proc
    call _GetInfo_Direct
    mov [esp - 4], esi
    mov [esp - 8], edi
    mov ecx, [esp + 8]
    lea esi, [esp + 12]
    lea edi, [esp + 4]
    rep movsd
    mov esi, [esp - 4]
    mov edi, [esp - 8]
    mov edx, fs:[0C0h]
    test edx, edx
    call edx
    ret
_DoDirectSyscall endp

assume fs:error
end