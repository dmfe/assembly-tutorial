%include "linux64.inc"

section .data
        text db "Hello, World!",10,0
        goodbye db "Goodby!",10,0

section .text
        global _start

_start:
        print text
        print goodbye
        exit
