%include "lib.asm"
    global _start

    section .bss
    buffer resb 10

    section .text 
_start:
    mov rdi, buffer
    mov rsi, 11223322
    call int_to_string
    mov rdi, message1
    call print
    mov rdi, buffer
    call print
    call print_newline
    xor rdi, rdi
    call exit
    ret

    section .data
n:
    db 123
message1:
    db "my number is ", 0
message:
    db "oh hello there", 0
