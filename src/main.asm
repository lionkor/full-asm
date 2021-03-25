%include "lib.asm"
    global _start

    section .bss
    buffer resb 10

    section .text 
_start:
    xor rdi, rdi
    call exit
    ret

    section .data
n:
    db 123
message:
    db "oh hello there", 0
