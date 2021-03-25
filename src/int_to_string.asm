%include "lib.asm"

    section .text
; bool AL int_to_string(char* buffer RDI, uint64_t buffer_size RSI, int64_t i RDX)
int_to_string:
    push rdi
    push rsi
    call zero_buffer
    pop rsi
    pop rdi

    ret
