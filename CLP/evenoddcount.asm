.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "Enter how many numbers: $"
MSG2 DB 0DH,0AH,"Enter a number: $"
MSG3 DB 0DH,0AH,"Even number count: $"
MSG4 DB 0DH,0AH,"Odd number count: $"

COUNT DB ?        ; total numbers
NUM DB ?          ; each input number
EVEN DB 0         ; even count
ODD DB 0          ; odd count

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Ask total numbers
    MOV AH, 9
    LEA DX, MSG1
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV COUNT, AL

    MOV CL, COUNT   ; loop count
    MOV CH, 0

LOOP_START:
    ; Ask each number
    MOV AH, 9
    LEA DX, MSG2
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM, AL

    MOV AL, NUM
    MOV AH, 0
    MOV BL, 2
    DIV BL          ; AL / 2, remainder -> AH
    CMP AH, 0
    JE EVEN_LABEL

    ; Odd
    INC ODD
    JMP NEXT

EVEN_LABEL:
    INC EVEN

NEXT:
    LOOP LOOP_START

    ; Display even count
    MOV AH, 9
    LEA DX, MSG3
    INT 21H

    MOV AL, EVEN
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Display odd count
    MOV AH, 9
    LEA DX, MSG4
    INT 21H

    MOV AL, ODD
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
