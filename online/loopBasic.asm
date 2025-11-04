.model small
.stack 100h  
.data

a db 'loop concept:$'


.code 
 main proc 
    mov ax,@data
    mov ds,ax 
    
  ;string output
  mov ah,9
  lea dx,a
  int 21h
  
    ;new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    ;loop condition
    mov cx,26 ;->condition 26 bar colbe
    mov ah,2
    mov dl,'A' ;->start hobe a theke
    
    
    ;loop output 
    level1:
    int 21h
    inc dl
    loop level1
    
  
    exit:
    mov ah,4ch
    int 21h
    main endp
 end main
    
               
               
               
    
    
    
