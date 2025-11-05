.MODEL SMALL
.STACK 100H
.DATA

msg1 DB 'Enter number:$'
msg2 DB 0DH,0AH,'Sum of squares is: $'
n DB ?
sum DW 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Show message
    MOV AH, 9
    LEA DX, msg1
    INT 21H

    ; Take user input (single digit)
    MOV AH, 1
    INT 21H
    SUB AL, 30H       ; convert ASCII to number
    MOV n, AL

    ; Initialize
    MOV CX, 1         ; counter = 1
    MOV SUM, 0

loop_start:
    MOV AX, CX
    MUL CX            ; AX = CX * CX  (square)
    ADD SUM, AX       ; SUM = SUM + i^2
    INC CX
    MOV AL, n
    CMP CL, AL
    JBE loop_start    ; if i <= n, continue loop

    ; New line
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    ; Show message
    MOV AH,9
    LEA DX,msg2
    INT 21H

    ; Print result (two digits)
    MOV AX, SUM
    MOV BL,10
    DIV BL
    MOV BH,AL
    MOV BL,AH

    ADD BH,30H
    ADD BL,30H

    MOV DL,BH
    MOV AH,2
    INT 21H

    MOV DL,BL
    MOV AH,2
    INT 21H

    ; Exit
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
