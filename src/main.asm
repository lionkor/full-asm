%include "lib.asm"
    global _start

    section .text 
_start:
    mov rax, message
    call stringlength
    call exit

    section .data
message:
    db "Hello, World!", 10 ; with newline
