section .data
    equalMsg db "The numbers are equal.", 10
    equalLen equ $ - equalMsg

    notEqualMsg db "The numbers are not equal.", 10
    notEqualLen equ $ - notEqualMsg

section .text
    global _start

_start:
    mov eax, 20              ; Store the first number in eax
    mov ebx, 20              ; Store the second number in ebx

    cmp eax, ebx              ; Compare eax and ebx
    je equal                  ; Jump to 'equal' if they are equal
    jne not_equal             ; Jump to 'not_equal' if they are different

equal:
    mov eax, 4                ; Set eax to 4 for the sys_write system call
    mov ebx, 1                ; Set ebx to 1 for standard output
    mov ecx, equalMsg         ; Store the equal message address in ecx
    mov edx, equalLen         ; Store the message length in edx
    int 0x80                  ; Display the equal message
    jmp exit                  ; Jump to the exit section

not_equal:
    mov eax, 4                ; Set eax to 4 for the sys_write system call
    mov ebx, 1                ; Set ebx to 1 for standard output
    mov ecx, notEqualMsg      ; Store the not-equal message address in ecx
    mov edx, notEqualLen      ; Store the message length in edx
    int 0x80                  ; Display the not-equal message

exit:
    mov eax, 1                ; Set eax to 1 for the sys_exit system call
    mov ebx, 0                ; Set the exit status to 0
    int 0x80                  ; Exit the program