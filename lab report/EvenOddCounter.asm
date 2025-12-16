.MODEL SMALL 
.STACK 100H 
.DATA 
 ARRAY DB 20 DUP(?)   
    N DB ? 
    EVEN_COUNT DB 0 
    ODD_COUNT DB 0 
 
    STR1 DB 'Enter the size of array: $' 
    STR2 DB 0DH,0AH,'Enter array element: $' 
    STR3 DB 0DH,0AH,'Even numbers: $' 
    STR4 DB 0DH,0AH,'Odd numbers: $' 
 
.CODE 
MAIN PROC 
    MOV AX, @DATA 
    MOV DS, AX 
 
    
     
    LEA DX, STR1 
    MOV AH, 9 
    INT 21H 
 
    MOV AH, 1 
    INT 21H 
    SUB AL, 30H 
    MOV N, AL 
 
    MOV EVEN_COUNT, 0 
    MOV ODD_COUNT, 0 
 
     
     
    XOR SI, SI          
 
INPUT_LOOP: 
    MOV BL, N 
    CMP SI, BX          
    JAE COUNT_LOOP 
 
    LEA DX, STR2 
    MOV AH, 9 
    INT 21H 
 
    MOV AH, 1 
    INT 21H 
    SUB AL, 30H 
    MOV ARRAY[SI], AL 
 
    INC SI 
    JMP INPUT_LOOP 
 
 
; Count even and odd 
 
COUNT_LOOP:

  XOR SI, SI 
 
COUNT_NEXT: 
    MOV BL, N 
    CMP SI, BX 
    JAE DISPLAY_RESULT 
 
    MOV AL, ARRAY[SI] 
    AND AL, 1 
    CMP AL, 0 
    JE IS_EVEN 
 
    INC ODD_COUNT 
    JMP NEXT_INDEX 
 
IS_EVEN: 
    INC EVEN_COUNT 
 
NEXT_INDEX: 
    INC SI 
    JMP COUNT_NEXT 
 
 
 
; Display results 
 
DISPLAY_RESULT: 
    LEA DX, STR3 
    MOV AH, 9 
    INT 21H 
 
    MOV DL, EVEN_COUNT 
    ADD DL, 30H 
    MOV AH, 2 
    INT 21H 
 
    LEA DX, STR4 
    MOV AH, 9 
    INT 21H 
 
    MOV DL, ODD_COUNT 
    ADD DL, 30H 
    MOV AH, 2 
    INT 21H 
 
    MOV AH, 4CH 
    INT 21H 
 
MAIN ENDP 
END MAIN