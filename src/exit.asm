%include "lib.asm"

    section .text
; void exit(int exit_code RDI)
exit:
    mov rax, 60  ; 60 = exit()
    syscall

