.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter the first number: $'
    MSG2 DB 13,10,'Enter the second number: $'
    MSG3 DB 13,10,'The result of subtraction is: $'
    NEWLINE DB 13, 10, '$'
    NUM1 DB ?
    NUM2 DB ?
    RESULT DB ?

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Print prompt for the first number
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; Input first number
    MOV AH, 1
    INT 21H
    SUB AL, 48      ; Convert ASCII to integer
    MOV NUM1, AL

    ; Print prompt for the second number
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; Input second number
    MOV AH, 1
    INT 21H
    SUB AL, 48      ; Convert ASCII to integer
    MOV NUM2, AL

    ; Subtract the second number from the first number
    MOV AL, NUM1
    SUB AL, NUM2
    MOV RESULT, AL

    ; Print the result message
    LEA DX, MSG3
    MOV AH, 9
    INT 21H

    ; Print the result
    MOV AL, RESULT
    ADD AL, 48      ; Convert back to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Print a newline
    LEA DX, NEWLINE
    MOV AH, 9
    INT 21H

    ; Exit program
    MOV AH, 4Ch
    INT 21H
MAIN ENDP
END MAIN
