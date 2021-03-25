%include "lib.asm"

    section .text

; void zero_buffer(byte* buffer RDI, uint64_t buffer_size RSI)
zero_buffer:
    mov dl, 0
    call fill_buffer
    ret
