; Defining values with EQU
; EQU is used for defining constants for future use.
STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60

section .data
        digit db 0,10

section .text
        global _start

%macro exit 0
        mov rax, SYS_EXIT
        mov rdi, 0
        syscall
%endmacro

%macro printDigit 1
        mov rax, %1
        call _printRAXDigit
%endmacro

%macro printDigitSum 2
        mov rax, %1
        add rax, %2
        call _printRAXDigit
%endmacro

_start:
        printDigit 3
        printDigit 4

        printDigitSum 3, 2

        exit

_printRAXDigit:
        add rax, 48
        mov [digit], al
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, digit
        mov rdx, 2
        syscall
        xor rdx, rdx
        ret
