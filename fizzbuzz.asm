; Pro/g/ramming Challenges 4.0 - 44 FizzBuzz in Assembly

section.text
    global _start

_start:
    ; Read input
    mov eax, 3
    mov ebx, 2


   ; Exit code
   mov eax, 1
   int 80h


section.data
fizz db 'fizz', 3H
fizzLen equ $ - fizz

buzz db 'buzz', 3H
buzzLen equ $ - buzz
