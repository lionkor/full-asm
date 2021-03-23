%include "lib.asm"

    section .text
; void printline(char* message RDI)
printline:
    call print
    push rdi
    mov rdi, _newline
    call print
    pop rdi
    ret

    section .data
_newline: db 10
