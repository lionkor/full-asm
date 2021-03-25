bits 64

extern stringlength
extern exit
extern printline
extern print
extern sys_write
extern string_to_int
extern is_digit

stdin equ 0
stdout equ 1
stderr equ 2

section .data
_version:
    db "v1.0", 0
