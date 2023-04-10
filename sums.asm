; ----------------------------------------------------------------------------------------
;     nasm -f macho64 -o sums.o sums.asm && ld -v -macosx_version_min 10.13 -e _start -static sums.o && ./a.out
; ----------------------------------------------------------------------------------------


section .data
    prompt db "Enter a value: ", 0
    .len   equ $ - prompt

    message db "Sum: "
    msglen equ $ - message

    zero equ '0'

    SYSCALL_WRITE equ       0x2000004
    SYSCALL_EXIT  equ       0x2000001
    SYSCALL_READ  equ       0x2000003

section .bss
    firstNum resb 32
    secondNum resb 32
    sum       resq 64


section .text
    global _start

_start:
    mov       rax, SYSCALL_WRITE          ; system call for write
    mov       rdi, 1                  ; file handle 1 is stdout
    mov       rsi, prompt             ; address the string message
    mov       rdx, prompt.len         ; number of bytes
    syscall                           ; invoke operating system to do the write

    mov     rax, SYSCALL_READ
    mov     rdi, 0
    mov     rsi, firstNum
    mov     rdx, 32
    syscall

    mov       rax, SYSCALL_WRITE       ; system call for write
    mov       rdi, 1                  ; file handle 1 is stdout
    mov       rsi, prompt             ; address the string message
    mov       rdx, prompt.len         ; number of bytes
    syscall                           ; invoke operating system to do the write

    mov     rax, SYSCALL_READ
    mov     rdi, 0
    mov     rsi, secondNum
    mov     rdx, 32
    syscall

    mov r8, [rel firstNum]
    sub r8, '0'

    mov r9, [rel secondNum]
    sub r9, '0'

    add r8, r9
    add r8, '0'

    mov [rel sum], r8

    mov rax, SYSCALL_WRITE
    mov rdi, 1
    mov rsi, message
    mov rdx, msglen
    syscall

    mov rax, SYSCALL_WRITE
    mov rdi, 1
    mov rsi, sum
    mov rdx, 64
    syscall

    mov       rax, SYSCALL_EXIT          ; system call for exit
    mov       rdi, 0                  ; exit code 0
    syscall                           ; invoke operating system to exit
    ret