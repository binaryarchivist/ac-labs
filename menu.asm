default rel

global _main_menu: function
global _ex0: function
global _ex1: function
global _ex2: function
global _ex3: function
global _ex4: function
global _ex5: function
global _ex6: function
global _ex7: function
global _ex8: function
global _ex9: function
global _main

extern _system
extern _scanf
extern _printf

_main_menu:
        push    rbp                                     
        mov     rbp, rsp                                
        lea     rdi, main_menu              ;print all the main menu lines                  
        mov     al, 0                       ;separated into different strings to avoid            
        call    _printf                     ;new line variables within the string            
        lea     rdi, case0
        mov     al, 0                                   
        call    _printf                                 
        lea     rdi, case1
        mov     al, 0
        call    _printf
        lea     rdi, case2
        mov     al, 0
        call    _printf
        lea     rdi, case3
        mov     al, 0
       call    _printf
       lea     rdi, case4
        mov     al, 0
        call    _printf
        lea     rdi, case5
        mov     al, 0
        call    _printf
        lea     rdi, case6
        mov     al, 0
        call    _printf
        lea     rdi, case7
        mov     al, 0
       call    _printf
        lea     rdi, case8
        mov     al, 0
        call    _printf
        lea     rdi, case9
        mov     al, 0
        call    _printf
        pop     rbp
        ret                                             


_ex0:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rdi, ex0_prompt
        mov     al, 0
        call    _printf
        lea     rdi, digit2
        lea     rsi, [rbp-4H]
        lea     rdx, [rbp-8H]
        mov     al, 0
        call    _scanf
        mov     eax, dword [rbp-4H]
        cdq
        idiv    dword [rbp-8H]
        mov     esi, eax
        lea     rdi, digit
        mov     al, 0
        call    _printf
        add     rsp, 16
        pop     rbp
        ret
_ex1:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rdi, ex1_prompt
        mov     al, 0
        call    _printf
        lea     rdi, digit2
        lea     rsi, [rbp-4H]
        lea     rdx, [rbp-8H]
        mov     al, 0
        call    _scanf
        mov     eax, dword [rbp-4H]
        cdq
        imul    dword [rbp-8H]
        mov     esi, eax
        lea     rdi, digit
        mov     al, 0
        call    _printf
        add     rsp, 16
        pop     rbp
        ret

_ex2: ; odd,even
    push    rbp
    mov     rbp, rsp
    sub     rsp, 16
    lea     rdi, get_number
    mov     al, 0
    call    _printf
    lea     rdi, digit
    lea     rsi, [rbp-4H]
    mov     al, 0
    call    _scanf
    mov     eax, dword [rbp-4H]
    cdq
    mov     ecx, 2
    idiv    ecx
    cmp     edx, 0
    je      if_even
    lea     rdi, ex2odd
    mov     al, 0
    call    _printf
    jmp     ex2_res

if_even:
        lea     rdi, ex2even
        mov     al, 0
        call    _printf
ex2_res:
        add     rsp, 16
        pop     rbp
        ret

_ex3:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rdi, get_number
        mov     al, 0
        call    _printf
        lea     rdi, digit2
        lea     rsi, [rbp-4H]
        lea     rdx, [rbp-8H]
        mov     al, 0
        call    _scanf
        mov     eax, dword [rbp-4H]
        cmp     eax, dword [rbp-8H]
        jle     if_first_larger
        mov     esi, dword [rbp-4H]
        lea     rdi, ex3_prompt
        mov     al, 0
        call    _printf
        jmp     ex3_res
if_first_larger:
        mov     esi, dword [rbp-8H]
        lea     rdi, ex3_prompt
        mov     al, 0
        call    _printf
ex3_res:
        add     rsp, 16
        pop     rbp
        ret
ret
_ex4:
ret
_ex5:
ret

_ex6:   
ret

_ex7:
ret
_ex8:
ret
_ex9:
ret


_main:  
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     dword [rbp-4H], 0                       
main_while:
        call    _main_menu                              
        lea     rdi, digit
        xor     eax, eax                                
        lea     rsi, [rbp-8H]                           
        call    _scanf                                  
        lea     rdi, clr              
        call    _system                                 
        mov     eax, dword [rbp-8H]                     
        mov     qword [rbp-18H], rax                    
        sub     rax, 9                                  
        ja      end_process                                   
        mov     rax, qword [rbp-18H]                    
        lea     rcx, [rel option]
        movsxd  rax, dword [rcx+rax*4]                  
        add     rax, rcx                                
        jmp     rax                                     

if_case0:  call    _ex0
        jmp     end_process                                   

if_case1:  call    _ex1                                    
        jmp     end_process                                   

if_case2:  call    _ex2                                    
        jmp     end_process                                   

if_case3:  call    _ex3                                    
        jmp     end_process                                   

if_case4:  call    _ex4                                    
        jmp     end_process                                   

if_case5:  call    _ex5                                    
        jmp     end_process                                   

if_case6:  call    _ex6
        jmp     end_process                                   

if_case7:  call    _ex7
        jmp     end_process                                   

if_case8:  call    _ex8
        jmp     end_process                                   

if_case9:  call    _ex9

end_process:
        lea     rdi, chr              
        lea     rsi, [rbp-9H]                           
        mov     al, 0                                   
        call    _scanf                                  
        lea     rdi, chr              
        lea     rsi, [rbp-9H]                           
        mov     al, 0                                   
        call    _scanf                                  
        lea     rdi, clr              
        call    _system                                 
        jmp     main_while                                                                             

option:
        dd if_case0-option
        dd if_case1-option
        dd if_case2-option
        dd if_case3-option
        dd if_case4-option
        dd if_case5-option
        dd if_case6-option
        dd if_case7-option
        dd if_case8-option
        dd if_case9-option

section         .data
input_string: db 100,
output_string: db 100,           ; Reserve space for output string

main_menu:      db      "Type a digit for the respective process:",10,0
case0:     db      "0. Divide 2 numbers.",10,0
case1:     db      "1. Multiply 2 numbers.",10,0
case2:     db      "2. Number is odd/even",10,0
case3:     db      "3. Which number is larger",10,0
case4:     db      "4. Multiply 2 numbers.",10,0
case5:     db      "5. Multiply 2 numbers.",10,0
case6:     db      "6. Multiply 2 numbers.",10,0
case7:     db      "7. Multiply 2 numbers.",10,0
case8:     db      "8. Multiply 2 numbers.",10,0
case9:     db      "9. Multiply 2 numbers.",10,0

ex2odd:           db      "Odd",10,0
ex2even:           db      "Even",10,0
ex3result:         db   "The number %d is larger",10,0

get_string:  db      "Input your string:",10,0
get_number:  db      "Input your number:",10,0
ex0_prompt:           db      "Enter two numbers: ",10,0
ex1_prompt:            db      "Enter two numbers: ",10,0
ex3_prompt:            db      "The number %d is larger",10,0

string:            db      "%s",0
string2:           db      "%s %s",0
chr:            db      "%c",0
digit:            db      "%d",0
digit2:           db      "%d %d",0
flt:            db      "%f",0
clr:            db      "clear",0
number: dd 10
