%include "lib.asm"

    section .text

; void fill_buffer(byte* buffer RDI, uint64_t buffer_size RSI, byte what DL)
fill_buffer:
    xor r8, r8
    lea r8, [rdi + rsi]
_fill_buffer_loop:
    cmp rdi, r8
    je _fill_buffer_end
    mov byte [rdi], dl
    inc rdi
    jmp _fill_buffer_loop
_fill_buffer_end:
    ret
