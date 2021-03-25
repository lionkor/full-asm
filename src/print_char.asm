%include "lib.asm"

    section .bss
    _print_char_buffer resb 1

    section .text
; void print_char(char c DIL)
print_char:
    mov byte [_print_char_buffer], dil
    mov rsi, _print_char_buffer
    mov rdi, stdout
    mov rdx, 1
    call sys_write
    ret

