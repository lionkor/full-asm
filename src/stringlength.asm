%include "lib.asm"
    
    section .text

; uint64 RAX stringlength(char* msg RDI)
stringlength:
    mov rax, rdi ; incrementing pointer
    mov rdx, rdi ; begin pointer
_stringlength_loop:
    cmp byte [rax], 0     ; 0-terminated strings will have a 0 at the end
    je _stringlength_done       ; break when we find 0
    inc rax                     ; advance the pointer by 1 byte
    jmp _stringlength_loop      ; loop!
_stringlength_done:
    sub rax, rdx                ; iter = iter - base => length
    ret
