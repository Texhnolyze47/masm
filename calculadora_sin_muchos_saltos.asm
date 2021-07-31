.model small
.stack

.data
  num2 db 0
  num1 db 0
  res  db 0
  fin  db 0 
  cond2 db 1
  
     
  msg1 db 10,13,7,"1.Suma","$"       
  msg2 db 10,13,7,"2.Resta","$"      
  msg3 db 10,13,7,"3.Multiplicacion","$"
  msg4 db 10,13,"4.Division","$"
  msg5 db 10,13,"Ingrese el primer numero:","$"
  msg6 db 10,13,"Menu","$"
  msg7 db 10,13,"Elige una operacion","$"
  msg8 db 10,13,"Escoge otro numero:","$"
  msg9 db 10,13,"Quiere volver a inciar el programa","$"
  msg10 db 10,13,"Escribe 0 si quiere que termine y 1 si quieres que se reincie","$" 
  
  .code  
  begin proc
    ;segmentacion de datos
    mov ax, @data
    mov ds, ax 
    
    
    
        menu:
        mov ah, 09h
        lea dx, msg6    ;imprime el mensaje menu
        int 21h
    
        mov ah, 09h
        lea dx, msg1      ;imprime el mensaje suma
        int 21h

    
        mov ah, 09h       ;imprime el mensaje resta
        lea dx, msg2
        int 21h

        mov ah, 09h
        lea dx, msg3       ;imprime el mensaje multiplicacion
        int 21h
        
   
        mov ah, 09h       ;imprime el mensaje division
        lea dx, msg4
        int 21h
             
     
        mov ah, 09h
        lea dx, msg7        ;imprime el mensaje elige la operacion
        int 21h 
        
        
       ;guarda el operacion
        mov ah,0                 
        int 16h
        cmp al, 31h
        je suma
        cmp al, 32h
        je resta
        cmp al, 33h
        je multiplicacion
        cmp al, 34h
        je division 
        

    
    ;guarda el numero 1
    leerdato2:
        mov ah, 09h
        lea dx, msg5   ;pide el primer numero
        int 21h
        mov ah, 01h    ;espera el input
        int 21h
        sub al, 30h    ;transforma el input
        mov num1, al   ;lo mueve a la variable
        ret            ; regresa
        
    ;guarad el numero 2
    leerdato3:
        mov ah, 09h
        lea dx, msg8   ;pide el segundo numero
        int 21h
        mov ah, 01h    ;espera el input
        int 21h
        sub al, 30h    ;transforma el input
        mov num2, al   ;lo mueve a la variable
        ret            ; regresa
        
    
    
    suma:
    
   call leerdato2     ;llama a la funcion leerdato
   call leerdato3:
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
    jmp reinicio
    
    resta:
    call leerdato2
    call leerdato3:
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
    jmp reinicio
    
    multiplicacion:
    call leerdato2
    call leerdato3:
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
    jmp reinicio
    
    division:
    call leerdato2
     call leerdato3: 
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
    jmp reinicio
    
    reinicio: 
    ;pregunta
    mov ah, 09h
    lea dx, msg9
    int 21h
    
    mov ah, 09h
    lea dx, msg10
    int 21h

    
    ;reincio o terminar
     mov ah,0
     int 16h
     cmp al, 30h
     je fin_programa
     cmp al, 31h
     je menu
    
    
    fin_Programa: 
    mov ah, 4ch
    int 21h
    
    begin endp
    
    
    .exit
end