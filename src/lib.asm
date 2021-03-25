bits 64

extern stringlength
extern exit
extern printline
extern print
extern sys_write
extern string_to_int
extern is_digit
extern print_bool
extern print_newline
extern print_char

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
