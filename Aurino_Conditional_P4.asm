section .data
    upperMsg db "Uppercase letter.", 10
    upperLen equ $ - upperMsg

    lowerMsg db "Lowercase letter.", 10
    lowerLen equ $ - lowerMsg

section .text
    global _start

_start:
    mov al, 'm'                ; Store the character in al

    cmp al, 'A'                ; Compare the character with 'A'
    jl check_lowercase         ; Jump if the character is below 'A'

    cmp al, 'Z'                ; Compare the character with 'Z'
    jg check_lowercase         ; Jump if the character is above 'Z'

    jmp uppercase              ; Jump if the character is uppercase

check_lowercase:
    cmp al, 'a'                ; Compare the character with 'a'
    jl exit                    ; Exit if the character is below 'a'

    cmp al, 'z'                ; Compare the character with 'z'
    jg exit                    ; Exit if the character is above 'z'

    jmp lowercase              ; Jump if the character is lowercase

uppercase:
    mov eax, 4                 ; Set eax to 4 for the sys_write system call
    mov ebx, 1                 ; Set ebx to 1 for standard output
    mov ecx, upperMsg          ; Store the uppercase message address in ecx
    mov edx, upperLen          ; Store the message length in edx
    int 0x80                   ; Display the uppercase message
    jmp exit                   ; Jump to the exit section

lowercase:
    mov eax, 4                 ; Set eax to 4 for the sys_write system call
    mov ebx, 1                 ; Set ebx to 1 for standard output
    mov ecx, lowerMsg          ; Store the lowercase message address in ecx
    mov edx, lowerLen          ; Store the message length in edx
    int 0x80                   ; Display the lowercase message

exit:
    mov eax, 1                 ; Set eax to 1 for the sys_exit system call
    mov ebx, 0                 ; Set the exit status to 0
    int 0x80                   ; Exit the program