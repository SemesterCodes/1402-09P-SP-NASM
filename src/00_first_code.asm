section .data
    salaam: db "Assalamu Alaikum!", 10      ; string to print
    salaamLen: equ $ - salaam               ; length of string

section .text
    global _start

    _start:
        mov     rax, 1                   ; sys_write
        mov     rdi, 1                   ; stdout
        mov     rsi, salaam              ; message to write
        mov     rdx, salaamLen           ; message length
        syscall                          ; call kernel

        				 ; terminates program
        mov     rax, 60                  ; sys_exist
        mov     rdi, 0                   ; error code 0 (success)
        syscall                          ; call kernel
