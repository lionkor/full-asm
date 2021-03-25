%include "lib.asm"

    section .text

; int RAX is_digit(char c RDI)
; it's a digit if it's between '0' and '9' ASCII.
is_digit:
    cmp BYTE rdi, '0'
    jge _is_digit_geq_0     ; >= '0' -> maybe a digit
    jmp _is_digit_return_false       ; < '0' -> not a digit
_is_digit_geq_0:
    cmp BYTE rdi, '9'
    jb _is_digit_return_false
    mov rax, 1
    ret
_is_digit_return_false:
    mov rax, 0
    ret

