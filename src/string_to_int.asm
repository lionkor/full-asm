%include "lib.asm"

    section .text

; int64_t RAX string_to_int(char* RDI)
string_to_int:
    mov rax, 2
    ret

