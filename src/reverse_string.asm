%include "lib.asm"

    section .text
; void reverse_string(char* str RDI)
reverse_string:
    push rdi
    call stringlength
    pop rdi
    mov rdx, rax                ; k
    sub rdx, 1
    mov rcx, 0                  ; i
    xor r8, r8                  ; c
    xor r9, r9                  
_reverse_string_loop:
    cmp rcx, rdx                ; i >= k => break
    jge _reverse_string_end
    mov r8b, byte [rdi + rcx]   ; c = str[i]
    mov r9b, byte [rdi + rdx]   ; t = str[k]
    mov byte [rdi + rcx], r9b   ; str[i] = t
    mov byte [rdi + rdx], r8b   ; str[k] = c
    inc rcx                     ; ++i
    dec rdx                     ; --k
    jmp _reverse_string_loop
    
_reverse_string_end:
    ret
