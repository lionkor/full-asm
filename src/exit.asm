    global exit
    section .text
exit:
    mov rdi, rax ; result to rbx
    mov rax, 60  ; 60 = exit()
    syscall

