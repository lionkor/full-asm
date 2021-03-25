%include "lib.asm"
    global _start

    section .bss
    buffer resb 10

    section .text 
_start:
;    mov rdi, buffer
;    mov rsi, 10
;    mov rdx, n
;    call int_to_string
;    mov rdi, buffer
;    call printline
    mov rdi, buffer
    mov rsi, message
    call string_copy
    mov rdi, buffer
    call reverse_string
    mov rdi, buffer
    call printline
    xor rdi, rdi
    call exit
    ret

    section .data
n:
    db 123
message:
    db "oh hello there", 0
