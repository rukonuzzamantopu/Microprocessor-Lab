PRINT MACRO MSG
    MOV DX, OFFSET MSG
    MOV AH, 9
    INT 21H
ENDM


SQU_NUM MACRO A, RESULT
    MOV AL, A
    MUL AL             
    MOV RESULT, AL      
ENDM


.MODEL SMALL
.STACK 100H

.DATA
MSG1     DB "Enter your number (0-9): $"
MSG_SQU DB "SQUARE: $"

NUM1 DB ?
RES  DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

   
    PRINT MSG1
    CALL NEWLINE

    
    MOV AH, 1
    INT 21H
    SUB AL, 30H         
    MOV NUM1, AL

    CALL NEWLINE

   
    SQU_NUM NUM1, RES

   
    PRINT MSG_SQU

   
    MOV AL, RES
    MOV AH, 0
    MOV BL, 10
    DIV BL              

    MOV BH, AH          

   
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    
    MOV AL, BH
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    CALL NEWLINE

   
    MOV AH, 4CH
    INT 21H
MAIN ENDP


NEWLINE PROC
    MOV AH, 2
    MOV DL, 13         
    INT 21H
    MOV DL, 10          
    INT 21H
    RET
NEWLINE ENDP

END MAIN

