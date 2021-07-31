.model small

.data
msj1 db 10,13,"-size de la pila- ",'$'
msj2 db 10,13,7,"1.Suma","$"       
msj3 db 10,13,7,"2.Resta","$"
msj7 db 10,13,"Elige una operacion","$"   
.code

    begin proc
        
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h
        lea dx, msj2    ;mensaje de "suma" 
        int 21h
        
        mov ah, 09h
        lea dx, msj3    ;mensaje de "resta"
        int 21h
        
        mov ah, 09h
        lea dx, msg7    ;mensaje de "tipo de operacion"
        int 21h
        
        ;mov ah, 09
        ;lea dx, msj1
        ;int 21h
        
        
                       ;aqui se elige la operacion 
        mov ah,0        
        int 16h
        cmp al, 31h
        je suma        ;
        cmp al, 32h
        je resta       ;
        
        
        suma:
        
        mov ah, 01h  ;espera el input  de valor del ciclo
        int 21h
        
        sub al, 30h  ;convierte el valor del input
        mov bl, al 
        
        
        mov cx, bx   ; muevo el valor del input al valor del ciclo   
        
        mov ah, 01h
        int 21h      ;se guarda el primer valor
        sub al, 30h
        mov num1, al
        
        resta: 