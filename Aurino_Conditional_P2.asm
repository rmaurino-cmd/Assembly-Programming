section .data
    smallerMsg db "First number is smaller.", 10
    smallerLen equ $ - smallerMsg

    secondMsg db "Second number is smaller or equal.", 10
    secondLen equ $ - secondMsg

section .text
    global _start

_start:
    mov eax, 15                ; Store the first number in eax
    mov ebx, 9                 ; Store the second number in ebx

    cmp eax, ebx               ; Compare eax and ebx
    jl first_smaller           ; Jump if the first number is smaller
    jmp second_smaller         ; Otherwise, jump to the second message

first_smaller:
    mov eax, 4                 ; Set eax to 4 for the sys_write system call
    mov ebx, 1                 ; Set ebx to 1 for standard output
    mov ecx, smallerMsg        ; Store the first message address in ecx
    mov edx, smallerLen        ; Store the message length in edx
    int 0x80                   ; Display the first message
    jmp exit                    ; Jump to the exit section

second_smaller:
    mov eax, 4                 ; Set eax to 4 for the sys_write system call
    mov ebx, 1                 ; Set ebx to 1 for standard output
    mov ecx, secondMsg         ; Store the second message address in ecx
    mov edx, secondLen         ; Store the message length in edx
    int 0x80                   ; Display the second message

exit:
    mov eax, 1                 ; Set eax to 1 for the sys_exit system call
    mov ebx, 0                 ; Set the exit status to 0
    int 0x80                   ; Exit the program