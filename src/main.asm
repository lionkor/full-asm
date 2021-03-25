%include "lib.asm"
    global _start

extern do_thing
    section .bss
argc: 
    resq 1
argv: ; char*[argc]
    resq 1

    section .text 
_start:
    mov rdi, message
    call string_to_int
    mov rdi, rax
    call exit
    ret

    section .data
message:
    db "123a", 0
