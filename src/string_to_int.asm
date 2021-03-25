%include "lib.asm"

    section .text

; int64_t RAX string_to_int(char* RDI)
string_to_int:
    xor rax, rax
_string_to_int_loop:
    movsx rdx, byte [rdi]
    mov cl, byte [rdi]              ; cl is current char
    inc rdi
    ; check if the current character (cl) is a digit. 
    ; if it is, continue. once it's not, return
    xor sil, sil                    ; sil is result of local is_digit
    sub cl, 48                      ; '0'
    cmp cl, 9
    setbe sil
    cmp sil, 0
    je _string_to_int_return
    imul rax, 10
    sub rax, 48
    add rax, rdx
    jmp _string_to_int_loop

_string_to_int_return:
    ret
