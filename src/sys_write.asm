%include "lib.asm"

    section .text
; int64 sys_write(int fd RDI, byte* buf RSI, uint64 n RDX)
sys_write:
    mov rax, 1
    syscall
    ret
