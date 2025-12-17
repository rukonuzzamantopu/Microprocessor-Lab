.model small
.stack 100h

.data
    str1 db "How many numbers (1-9): $"
    str2 db 0Dh,0Ah, "Enter number: $"
    str3 db 0Dh,0Ah, "Sum of Even numbers: $"
    str4 db 0Dh,0Ah, "Sum of Odd numbers: $"

    arr db 20 dup(?)

    n    db ?
    even db 0
    odd  db 0

.code
main proc
    mov ax, @data
    mov ds, ax

   
    mov ah, 9h
    mov dx, offset str1
    int 21h

    mov ah, 1h
    int 21h
    sub al, 30h
    mov n, al

   
    mov si, 0
    mov cx, 0
    mov cl, n

input_loop:
    mov ah, 9h
    mov dx, offset str2
    int 21h

    mov ah, 1h
    int 21h
    sub al, 30h

    mov arr[si], al
    inc si
    loop input_loop

    ; initialize sums
    mov si, 0
    mov cx, 0
    mov cl, n
    mov even, 0
    mov odd, 0

sum_loop:
    mov al, arr[si]
    inc si

    mov bl, al
    and al, 1
    jz even_num

    add odd, bl
    jmp next_num

even_num:
    add even, bl

next_num:
    loop sum_loop

    ; print even sum
    mov ah, 9h
    mov dx, offset str3
    int 21h

    mov al, even
    call print_2digit

    ; print odd sum
    mov ah, 9h
    mov dx, offset str4
    int 21h

    mov al, odd
    call print_2digit

   
    mov ah, 4Ch
    int 21h
main endp


; Print 2-digit number


print_2digit proc
    xor ah, ah
    mov bl, 10
    div bl          

    mov bh, ah      

    add al, 30h
    mov dl, al
    mov ah, 2h
    int 21h

    mov al, bh
    add al, 30h
    mov dl, al
    mov ah, 2h
    int 21h

    ret
print_2digit endp

end main
