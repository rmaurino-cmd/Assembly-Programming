section .data
    withinMsg db "Number is within the range.", 10
    withinLen equ $ - withinMsg

    outsideMsg db "Number is outside the range.", 10
    outsideLen equ $ - outsideMsg

section .text
    global _start

_start:
    mov eax, 7                 ; Store the number in eax

    cmp eax, 1                 ; Compare the number with 1
    jl outside_range           ; Jump if the number is less than 1

    cmp eax, 10                ; Compare the number with 10
    jg outside_range           ; Jump if the number is greater than 10

within_range:
    mov eax, 4                 ; Set eax to 4 for the sys_write system call
    mov ebx, 1                 ; Set ebx to 1 for standard output
    mov ecx, withinMsg         ; Store the within-range message address in ecx
    mov edx, withinLen         ; Store the message length in edx
    int 0x80                   ; Display the within-range message
    jmp exit                   ; Jump to the exit section

outside_range:
    mov eax, 4                 ; Set eax to 4 for the sys_write system call
    mov ebx, 1                 ; Set ebx to 1 for standard output
    mov ecx, outsideMsg        ; Store the outside-range message address in ecx
    mov edx, outsideLen        ; Store the message length in edx
    int 0x80                   ; Display the outside-range message

exit:
    mov eax, 1                 ; Set eax to 1 for the sys_exit system call
    mov ebx, 0                 ; Set the exit status to 0
    int 0x80                   ; Exit the program