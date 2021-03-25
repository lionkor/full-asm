%include "lib.asm"

    section .text

; bool AL is_digit(char c DIL)
; it's a digit if it's between '0' and '9' ASCII.
; returns 0 if not, 1 if it is
is_digit:
    sub edi, 48     ; 48 -> '0'
    xor eax, eax
    cmp dil, 9
    setbe al
    ret
