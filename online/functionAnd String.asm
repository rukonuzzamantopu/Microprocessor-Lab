.model small
.stack 100h  
.data
m db 'writ down a number:$'


.code 
 main proc 
    ;1->single key input
    ;2->single chareact input
    ;9->character string input
    
    mov ax,@data
    mov ds,ax 
    
    
  ;string output
  mov ah,9
  lea dx,m
  int 21h
  
  
           
    ;usear input        
    mov ah,1
    int 21h
    mov bl,al
    
    
    ;new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ;output user input
    mov ah,2
    mov dl,bl
    int 21h
    
  
    exit:
    mov ah,4ch
    int 21h
    main endp
 end main
    
               
               
               
    
    
    