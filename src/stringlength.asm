    global stringlength
    section .text

stringlength:
    push rbx        ; RBX is nonvolatile, preserve since we use it
    xor rbx, rbx    ; set RBX to 0, this will be our length-counter
_stringlength_loop:
    cmp byte [rax + rbx], 0     ; 0-terminated strings will have a 0 at the end
    je _stringlength_done       ; break when we find 0
    inc rbx                     ; increment the counter
    jmp _stringlength_loop      ; loop!
_stringlength_done:
    mov rax, rbx                ; move result to RAX
    pop rbx                     ; restore nonvolatile RBX
    ret
