.MODEL SMALL
.STACK 100H
.DATA
N DB 5
STR DB "Input value of N: $"
STR1 DB "Summation of natural numbers upto N: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
   
    ;string output
    MOV DX,OFFSET STR
    MOV AH,9
    INT 21H  
   
    ;int input  1
    MOV AX,0
    MOV AH,1
    INT 21H
    SUB AX,30H  
    MOV N,AL  
     
    ;NEWLINE  
    MOV AH,2
    MOV DX,13  
    INT 21H
    MOV DX,10
    INT 21H
     
    ;string output
    MOV DX,OFFSET STR1
    MOV AH,9
    INT 21H  
   
    MOV CX,0
    MOV CL,N
    MOV BX,0
    SUM: ADD BX,CX
    LOOP SUM
   
    MOV AX,0
    MOV AL,BL
    MOV BL,10
    DIV BL
   
    MOV BX,AX
   
    MOV DX,0
    MOV DL,BL
    ADD DX,48
    MOV AH,2
    INT 21H
   
    MOV DX,0
    MOV DL,BH
    ADD DX,48
    MOV AH,2
    INT 21H  
   
   
    MAIN ENDP
END MAIN