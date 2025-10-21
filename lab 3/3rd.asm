.MODEL SMALL 
.STACK 100H
.DATA 
A DW ?
B DW ?
RESULT DW ?
STR1 DW "ENTER YOU FIRST NUM: $" 
STR2 DW "ENTER YOU FIRST NUM: $" 
STR3 DW "SUM $"    
                                  
                                  
 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS ,AX   
      
      
    ;STRING OUTPUT  
    MOV DX ,OFFSET STR1
    MOV AH,9
    INT 21H   
    
    ;STRING INPUT
    MOV AH ,1
    INT 21H
    SUB AX,48   
    
    
      
    MOV A,AX
    
          
    ;STRING OUTPUT  
    MOV DX ,OFFSET STR2
    MOV AH,9
    INT 21H   
    
    ;STRING INPUT
    MOV AH ,1
    INT 21H
    SUB AX,48
    
    
    MOV B,AX
    MOV AX,A
    ADD AX,B                          
    MOV RESULT,AX  
    
     
    ;STRING OUTPUT   
    MOV DX ,OFFSET STR3
    MOV AH,9
    INT 21H   
    
    
    
    
   ;OUTPUT
   MOV DX,0
   MOV DX,RESULT
   ADD DX,48
   MOV AH,2
   INT 21H
    
    
    
    
    MAIN ENDP
END MAIN





