%include "lib.asm"

    section .text
; void string_copy(char* to RDI, char* from RSI)
string_copy:
    xor r11, r11                    ; now r11 can be our loop variable, set to 0
    xor rax, rax                    ; zero out temp register
_string_copy_loop:
    cmp byte [rsi + r11], 0
    je _string_copy_end             ; break if r11 == r10
    ; loop body
    mov al, byte [rsi + r11]
    mov byte [rdi + r11], al
    ; end loop body
    inc r11
    jmp _string_copy_loop

_string_copy_end:
