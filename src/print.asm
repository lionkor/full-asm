%include "lib.asm"
    
    section .text

; void print(char* message RDI)
print:
    call stringlength
    mov rdx, rax        ; message's length to RDX
    mov rsi, rdi        ; message into RSI
    mov rdi, stdout
    call sys_write
    ret
