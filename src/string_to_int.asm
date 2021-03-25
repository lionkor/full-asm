%include "lib.asm"

    section .text

; int64_t RAX string_to_int(char* RDI)
; nonvolatile
;   RBX: result int
;   R12: string
;   R13: multiplier
; volatile
;   RAX: temp, return value
;   RDX: temp
string_to_int:
    push rbx
    push r12
    push r13
    mov rbx, 0                          ; store result here
    mov r12, rdi                        ; input ptr
    mov r13, 1                          ; multiplier, starts at 1
_string_to_int_loop_until_null:
    cmp byte [r12], 0                          ; reached \0 yet?
    je _string_to_int_loop_end_ok 
    call is_digit
    cmp rax, 0                          ; is a digit?
    je _string_to_int_loop_end_fail     ; fail if not
    ; now actually do the conversion
    mov rdx, '0'                        ; grab '0'
    mov rax, [r12]
    sub rax, rdx                        ; current_char - '0' -> value of the digit
                                        ; value of the digit is now in rdx
    mul r13                             ; now multiply by place value
    add rbx, rax                        ; add to result
    mov rax, r13
    mov rdx, 10
    mul rdx                             ; decimal system means we increment place value each time by +10
    mov r13, rax
    inc r12                             ; increment pointer -> go to the next char
    jmp _string_to_int_loop_until_null  ; loop!
_string_to_int_loop_end_ok:
    mov rax, rbx                        ; move result to RAX
    jmp _string_to_int_return
_string_to_int_loop_end_fail:
    xor rax, rax
    jmp _string_to_int_return
    
_string_to_int_return:
    pop r13
    pop r12
    pop rbx
    ret
