bits 64

extern exit
extern fill_buffer
extern int_to_string
extern is_digit
extern print
extern print_bool
extern print_char
extern print_newline
extern printline
extern reverse_string
extern string_copy
extern string_to_int
extern stringlength
extern sys_write
extern zero_buffer

stdin equ 0
stdout equ 1
stderr equ 2

TRUE equ 1
FALSE equ 2

_char_0 equ 30
_char_9 equ 39

section .data
_newline_string: 
    db 10, 0
_true_string:
    db "true", 0
_false_string:
    db "false", 0
_version:
    db "v1.0", 0
