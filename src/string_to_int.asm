%include "lib.asm"

    section .text

; int64_t RAX string_to_int(char* RDI)
string_to_int:
    xor rax, rax
_string_to_int_loop:
    movsx rdx, byte [rdi]
    inc rdi
    test dl, dl
    je _string_to_int_return_0
    imul rax, 10
    sub rax, 48
    add rax, rdx
    jmp _string_to_int_loop

_string_to_int_return_0:
    ret
