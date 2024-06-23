#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#include <windows.h>
#include "apidef.h"
#include "nt_functions.h"

#ifdef _WIN64

#define SYSCALL_SSN_DIST  0x4
#define SYSCALL_INST_DIST 0x12
#define SYSCALL_INST_DIST_WOW64 0x0

#else

#define SYSCALL_SSN_DIST  0x1
#define SYSCALL_INST_DIST 0x0F
#define SYSCALL_INST_DIST_WOW64 0x0A
#endif

USHORT GetSsn(int hash, PVOID* addr);
extern NTSTATUS DoDirectSyscall(int ssn, int n_args, ...);
extern NTSTATUS DoIndirectSyscall(int ssn, int n_args, ...);

#endif