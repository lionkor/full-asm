%include "lib.asm"

    section .text

; int64_t RAX string_to_int(char* RDI)
; nonvolatile
;   RBX: result int
;   R12: string
;   R13: multiplier
;   R14: length
; volatile
;   RAX: temp, return value
;   RDX: temp
string_to_int:
    push rbx
    push r12
    push r13
    push r14
    mov rbx, 0                          ; store result here
    mov r12, rdi                        ; input ptr
    mov r13, 1                          ; multiplier, starts at 1
    mov r14, 0                          ; length
_string_to_int_loop_until_null:
    xor rdi, rdi
    mov dil, byte [r12 + r14]
    call is_digit
    cmp al, 0                           ; is a digit?
    je _string_to_int_conversion_loop   ; stop if it's not
    mov dil, byte [r12 + r14]
    call print_char
    call print_newline
    inc r14                             ; length
    jmp _string_to_int_loop_until_null

_string_to_int_conversion_loop:
    ; now actually do the conversion
    cmp r14, -1                         ; if r14 == 0 -> break
    je _string_to_int_loop_end_ok       
    mov dil, byte [r12 + r14]
    call print_char
    call print_newline
    mov rdx, '0'                        ; grab '0' ASCII char
    movsx rax, byte [r12 + r14]         ; grab current char
    sub rax, rdx                        ; current_char - '0' => value of the digit
                                        ; value of the digit is now in rdx
    mul r13                             ; now multiply by place value
    add rbx, rax                        ; add to result
    mov rax, r13
    mov rdx, 10
    mul rdx                             ; decimal system means we increment place value each time by +10
    mov r13, rax
    dec r14                             ; --r14
    jmp _string_to_int_conversion_loop  ; loop!

_string_to_int_loop_end_ok:
    mov rax, rbx                        ; move result to RAX
    jmp _string_to_int_return
    
_string_to_int_return:
    pop r14
    pop r13
    pop r12
    pop rbx
    ret
