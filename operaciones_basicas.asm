.model small
.stack

.data

  num1 db 0
  num2 db 0
  res db 0 
     
  msg1 db 10,13,"Suma:","$"       
  msg2 db 10,13,"Resta:","$"      
  msg3 db 10,13,"Multiplicacion:","$"
  msg4 db 10,13,"Division:","$"
  msg5 db 10,13,"Ingresa un numero:","$"
  
.code
    ;segmentacion de datos
    mov ax, @data
    mov ds, ax
    
    ;impresion de mensaje 5
    mov ah, 09h
    lea dx, msg5
    int 21h
    
    ;guarda el numero 1
    mov ah, 01h
    int 21h
    sub al, 30h
    mov num1, al
    ;impresion de mensaje 5   
    mov ah, 09h
    lea dx, msg5
    int 21h
    
    ;guarda el numero 2
    mov ah, 01h
    int 21h
    sub al, 30h
    mov num2, al
    
    
    ;suma
    mov al, num1
    add al, num2
    mov res, al
    
    mov ah, 09h
    lea dx, msg1
    int 21h
    
    mov al, res
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h
    
    mov ah, 02h
    mov dl,bl
    add dl, 30h
    int 21h
    
    ;resta
    mov al, num1
    sub al, num2
    mov res, al
    
    mov ah, 09h
    lea dx, msg2
    int 21h 
    
    mov al, res
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h
    
    mov ah, 02h
    mov dl,bl
    add dl, 30h
    int 21h
    
    ;multiplicacion
    mov al, num1
    mov bl, num2
    mul bl
    mov res, al
    
    mov ah, 09h
    lea dx, msg3
    int 21h 
    
    mov al, res
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h
    
    mov ah, 02h
    mov dl,bl
    add dl, 30h
    int 21h
    
    ;division 
    xor ax, ax
    mov al,num1
    mov bl,num2
    div bl
    mov res,al
   
    
    mov ah, 09h
    lea dx, msg4
    int 21h 
    
    mov al, res
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h
    
    mov ah, 02h
    mov dl,bl
    add dl, 30h
    int 21h
    
    .exit
end
    
    
    
