section .data
    hello: db "Hello World", 10
    helloLength: equ $-hello
section .text
    global _start

    _start:
        mov rax, 1 ; sys_write
        mov rdi, 1 ; stdout
        mov rsi, hello ; string to write
        mov rdx, helloLength ; string length
        syscall

        ;endprogram
        mov rax, 60 ; sys_exit
        mov rdi, 0 ; error code 0 for success
        syscall ; call kernel