%include "lib.asm"
    global _start

    section .text 
_start:
    mov rdi, message
    call printline
    mov rdi, rax
    call exit
    ret

    section .data
message:
    db "Hello, World!", 0
