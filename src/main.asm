%include "lib.asm"
    global _start

extern do_thing
    section .bss
argc: 
    resq 1
argv: ; char*[argc]
    resq 1

    section .text 
_start:
    mov rax, [rsp]      ; rsp holds argc
    mov [argc], rax     ; so we save it
    mov rax, [rsp + 8]  ; rsp + 8 is argv,
    mov [argv], rax     ; so we save that, too
    ; IGNORE ABOVE FOR NOW
    mov rdi, message
    call string_to_int
    mov rdi, rax
    call exit
    ret

    section .data
message:
    db "123", 0
