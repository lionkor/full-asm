%include "lib.asm"

    section .text

; void zero_buffer(byte* buffer RDI, uint64_t buffer_size RSI)
zero_buffer:
_zero_buffer_loop
    
_zero_buffer_end
    ret
