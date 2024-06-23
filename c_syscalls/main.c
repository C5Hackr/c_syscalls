#include <Windows.h>
#include <stdio.h>
#include "c_syscalls.h"

//Compile in DEBUG mode.
int main()
{
	PVOID lpAddress = NULL;
	SIZE_T sDataSize = 4096;
	DoDirectSyscall(NT_ALLOCATE_VIRTUAL_MEMORY, (HANDLE)-1, &lpAddress, 0, &sDataSize, MEM_COMMIT, PAGE_READWRITE);
	printf("[Direct Syscall | NtAllocateVirtualMemory] - Allocated memory at address: 0x%p\n", lpAddress);

	PVOID lpAddress2 = NULL;
	SIZE_T sDataSize2 = 4096;
	DoIndirectSyscall(NT_ALLOCATE_VIRTUAL_MEMORY, (HANDLE)-1, &lpAddress2, 0, &sDataSize2, MEM_COMMIT, PAGE_READWRITE);
	printf("[Indirect Syscall | NtAllocateVirtualMemory] - Allocated memory at address: 0x%p\n", lpAddress2);

	system("pause");
	return 0;
}