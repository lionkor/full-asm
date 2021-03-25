%include "lib.asm"
    global _start

extern do_thing
    section .bss
argc: 
    resq 1
argv: ; char*[argc]
    resq 1
    buffer resb 10

    section .text 
_start:
    mov rdi, buffer
    mov rsi, 9
    mov dl, 'x'
    call fill_buffer
    mov byte [buffer + 9], 0
    mov rdi, buffer
    call printline
    xor rdi, rdi
    call exit
    ret

    section .data
message:
    db "123a", 0
