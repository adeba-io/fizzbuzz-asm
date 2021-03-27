; Pro/g/ramming Challenges 4.0 - 44 FizzBuzz in Assembly

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
    fizz db 'fizz', 3H
    fizzLen equ $ - fizz

    buzz db 'buzz', 3H
    buzzLen equ $ - buzz

section .bss
    num resw 5

section .text
    global _start

_start:
    ; Read input
    mov eax, SYS_READ
    mov ebx, 2
    mov ecx, num
    mov edx, 5
    int 80h

    ; Print input
    mov eax, SYS_WRITE
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 80h

   ; Exit code
   mov eax, SYS_EXIT
   int 80h
