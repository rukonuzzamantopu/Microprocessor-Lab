.MODEL SMALL
.STACK 100H
.DATA
A DB ?
B DB 2
RES DB ?
REM DB ?
STR1 DB "Input a number(0-9): $"
STR2 DB 0DH,0AH,"Result: $"
STR3 DB 0DH,0AH,"Reminder: $"
str4 db 0DH,0AH,"The number is even. $"  
str5 db 0DH,0AH,"The number is odd. $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS,AX
   
    MOV DX,0
    MOV DL,OFFSET STR1
    MOV AH,9
    INT 21H
   
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV A,AL
   
    MOV AX,0
    MOV AL,A
    DIV B
    MOV RES,AL
    MOV REM,AH
   
    MOV DX,0  
    MOV AH,9
    LEA DX,STR2
    INT 21H
   
    MOV DX,0
    MOV DL,RES
    ADD DL,48
    MOV AH,2
    INT 21H
   
    MOV DX,0
    MOV AH,9
    LEA DX,STR3
    INT 21H
   
    MOV DX,0
    MOV DL,REM
    ADD DL,48
    MOV AH,2
    INT 21H  
   
    CMP REM,0
    JE even
    JNE odd
   
   
    even:
    lea dx,str4  
    MOV AH,9
    INT 21H
    jmp blank
   
    odd:
    lea dx,str5  
    MOV AH,9
    INT 21H
     
    blank:
   
    MAIN ENDP
END MAIN