section .data
    random_number db 0    ; Reserve space for the random number

section .text
global _start
_start:
    ; Generate a random number
    mov rax, qword 0x2000006     ; sys_getentropy
    mov rdi, random_number       ; buffer address
    mov rsi, 8                   ; buffer size
    syscall                      ; system call

    ; Extract the random number
    movzx eax, byte [rel random_number]   ; Load the byte into EAX
    movzx edx, byte [rel random_number + 1] ; Load the byte into EDX

    ; Combine the two bytes into a 16-bit random number
    shl edx, 8                   ; Shift the second byte to the left by 8 bits
    or eax, edx                  ; Combine the two bytes using logical OR

    ; Exit the program
    mov rax, 0x2000001           ; sys_exit
    xor rdi, rdi                 ; exit code 0
    syscall                      ; system call

section .bss
