
section .data
        text1 db "Please enter your name: "
        text2 db "Hello, "

section .bss
        name resb 16

section .text
        global _start

_start:
        call _printPrompt
        call _getName
        call _printHello
        call _printName

        mov rax, 60
        mov rdi, 0
        syscall

_getName:
        mov rax, 0
        mov rdi, 0
        mov rsi, name
        mov rdx, 16
        syscall
        ret

_printPrompt:
        mov rax, 1
        mov rdi, 1
        mov rsi, text1
        mov rdx, 24
        syscall
        ret

_printHello:
        mov rax, 1
        mov rdi, 1
        mov rsi, text2
        mov rdx, 7
        syscall
        ret

_printName:
        mov rax, 1
        mov rdi, 1
        mov rsi, name
        mov rdx, 16
        syscall
        ret
