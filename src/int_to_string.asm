%include "lib.asm"

    section .text
; void int_to_string(char* buffer RDI, int64_t n RSI)
; does not handle sign
int_to_string:
    cmp rsi, 0
    jl _int_to_string_sign
    jmp _int_to_string_sign_handled
_int_to_string_sign:
    imul rsi, -1                ; signed means we need to *-1 so that it's positive
_int_to_string_sign_handled:
    xor rcx, rcx                ; i
_int_to_string_loop:
    mov rax, rsi                ; copy n into RAX
    xor rdx, rdx                ; zero remainder register RDX
    mov r8, 10
    idiv r8                     ; divide RAX by 10, leaving the remainder in RDX
    mov rax, rdx                ; move remainder to RAX
    add rax, '0'                ; add '0' to make it the char-equivalent of the digit
    mov byte [rdi + rcx], al    ; copy to buffer[i]
    ; end loop condition
    mov rax, rsi
    mov r8, 10
    xor rdx, rdx                ; zero remainder register RDX
    idiv r8
    mov rsi, rax
    inc rcx
    cmp rsi, 0
    jg _int_to_string_loop
    ; else end
_int_to_string_end:
    call reverse_string
    ret
