global    _start

section   .text
_start:
        mov       rax, 0x2000004          ; system call for write
        mov       rdi, 1                  ; file handle 1 is stdout
        mov       rsi, msg                ; address the string message
        mov       rdx, msg.len            ; number of bytes
        syscall                           ; invoke operating system to do the write

        mov       rax, 0x2000001          ; system call for exit
        mov       rdi, 0                  ; exit code 0
        syscall                           ; invoke operating system to exit

section   .data
         msg:     db        "Hello, World!", 10      ; note the newline at the end
        .len:     equ        $ - msg