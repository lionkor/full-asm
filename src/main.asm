%include "lib.asm"
    global _start

extern do_thing

    section .text 
_start:
    mov rdi, message
    call printline
    xor rdi, rdi
    call exit
    ret

    section .data
message:
    db "Hello, World!", 0
version:
    db "v1.0", 0
author:
    db "@lionkor", 0
