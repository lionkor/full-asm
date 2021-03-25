%include "lib.asm"

    section .text
print_newline:
    mov rdi, _newline_string
    call print
    ret
