%include "lib.asm"

    section .text
; void printline(char* message RDI)
printline:
    call print
    push rdi
    sub rsp, 8 ; align stack
    mov rdi, _newline_string
    call print
    add rsp, 8 ; un-align stack
    pop rdi
    ret

