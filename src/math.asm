%macro write_string 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro check 0
    mov eax, 4
    mov ebx, 1
    mov ecx, chk
    mov edx, clen
    int 80h
%endmacro

section .data
    msg1 db "Enter a number", 0xA, 0xD
    len1 equ $- msg1

    msg2 db "The division result is ", 0xA, 0xD
    len2 equ $- msg2

    msg3 db "and the remainder is ", 0xA, 0xD
    len3 equ $- msg3

    chk db "Check", 0xA, 0xD
    clen equ $- chk

section .bss
    num resb 1

    quo resb 2
    rem resb 2

section .text
    global _start

_start:
    mov eax, 4      ; write
    mov ebx, 1      ; std out
    mov ecx, msg1
    mov edx, len1
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 2
    int 80h

    ; Divide the ax by the 3
    mov ax, [num]
    sub ax, '0'

    mov bl, '3'
    sub bl, '0'
    
    div bl

    add ax, '0'
    mov [quo], ax

    add dx, '0'
    mov [rem], dx

    ; print
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, quo
    mov edx, 2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, rem
    mov edx, 2
    int 80h


exit:
    mov eax, 1
    int 80h
