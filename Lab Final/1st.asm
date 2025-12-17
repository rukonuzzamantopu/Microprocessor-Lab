.MODEL SMALL
.STACK 100H
.DATA
NUM DB ?
STR DB "ENTER THE NUMBER: $"
STR1 DB "RESULT: $"
 NEWLINE DB 13, 10, '$'
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
   
    LEA DX, STR
    MOV AH,9
    INT 21H
   
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV NUM,AL
     
   
    CMP NUM,5
    JB MULTIPLICATION
    JAE END_CODE
   
    MULTIPLICATION:
    MOV AL,NUM
    MOV BL,2
    MUL BL
    MOV NUM,AL
   
    END_CODE:
   
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
   
    LEA DX, STR1
    MOV AH,9
    INT 21H
   
    MOV DL,NUM
    ADD DL,48
    MOV AH,2
    INT 21H
   
   
   
   
    MOV AH,4CH
    INT 21H
   
    MAIN ENDP
END MAIN
