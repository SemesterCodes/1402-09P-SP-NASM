section .bss
	userName: resb 1

section .data
    message: db "Enter your name: "      ; string to print
    messageLen: equ $ - message          ; length of string

section .text
    global _start

    _start:
	; write message
        mov     rax, 1                   ; sys_write
        mov     rdi, 1                   ; stdout
        mov     rsi, message             ; message to write
        mov     rdx, messageLen          ; message length
        syscall                          ; call kernel

	; get name
	mov	rax, 3
	mov	rbx, 2
	mov	rcx, userName
	mov	rdx, 5
	int 80h
	
	; print username
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, userName
	mov	rdx, 5
	syscall;
                                         ; terminates program
        mov     rax, 60                  ; sys_exist
        mov     rdi, 0                   ; error code 0 (success)
        syscall                          ; call kernel
