section .data
    evenMsg db "Even number.", 10
    evenLen equ $ - evenMsg

    oddMsg db "Odd number.", 10
    oddLen equ $ - oddMsg

section .text
    global _start

_start:
    mov eax, 17                ; Store the number in eax
    mov ebx, 2                 ; Store the divisor 2 in ebx
    xor edx, edx               ; Clear edx before division

    div ebx                    ; Divide eax by ebx
                               ; Quotient is stored in eax
                               ; Remainder is stored in edx

    cmp edx, 0                 ; Compare the remainder with 0
    je even_number             ; Jump if the remainder is 0
    jmp odd_number             ; Otherwise, jump to the odd section

even_number:
    mov eax, 4                 ; Set eax to 4 for the sys_write system call
    mov ebx, 1                 ; Set ebx to 1 for standard output
    mov ecx, evenMsg           ; Store the even message address in ecx
    mov edx, evenLen           ; Store the message length in edx
    int 0x80                   ; Display the even message
    jmp exit                   ; Jump to the exit section

odd_number:
    mov eax, 4                 ; Set eax to 4 for the sys_write system call
    mov ebx, 1                 ; Set ebx to 1 for standard output
    mov ecx, oddMsg            ; Store the odd message address in ecx
    mov edx, oddLen            ; Store the message length in edx
    int 0x80                   ; Display the odd message

exit:
    mov eax, 1                 ; Set eax to 1 for the sys_exit system call
    mov ebx, 0                 ; Set the exit status to 0
    int 0x80                   ; Exit the program