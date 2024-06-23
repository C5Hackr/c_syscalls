# C_SYSCALLS

Single stub direct and indirect syscalling with runtime SSN resolving for windows.

---

## Included writeup PDF link: [https://redops.at/en/blog/direct-syscalls-vs-indirect-syscalls](https://redops.at/en/blog/direct-syscalls-vs-indirect-syscalls)

---

## Features:
* Single stub
* One single line for all your syscalls
* Direct or Indirect sycalls
* x86_64, WOW64 and x86 native support
  
---

## How to use:
* Call `Syscall(<function>, <args>)`
    > `NTSTATUS status = Syscall(NT_CLOSE, handle);`

---

## Notes:
* Reimplementation of the ssn fetching method used here is recommended, the one showed in this repo is really simple and can present problems with certains AV/EDRs, more complex methods has been showed before, and implementing them is out of the scope of this project.
* For doing this, modifications to the GetSsn() function is needed, maintining its definition.

---

**Thanks to [SysWhispers3](https://github.com/klezVirus/SysWhispers3) for being a strong pilar on the development of this library, and [Foliage](https://github.com/SecIdiot/FOLIAGE) for the implementation of the dbj2 hash, module/function addr resolving implementation and types definitions**
