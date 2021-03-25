%include "lib.asm"

    section .text

; void print_bool(bool DIL)
print_bool:
    cmp dil, 0
    je _print_bool_print_false
    ; print true
    mov rdi, _true_string
    call print
    ret
_print_bool_print_false:
    mov rdi, _false_string
    call print
    ret
