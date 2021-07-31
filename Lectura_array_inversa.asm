.model small  

.data
msj1 db 10,13, "El resultado de derecha a izquierda: ","$" 
msj2 db 10,13, "El resultado de izquierda a derecha: ","$"

arg db 1,2,3,4,5,6,7,8,9,2

.code  

begin proc
    mov cx,9
    mov ax, @data
    mov ds, ax 
    
    
    mov si, 0   
    
    
    lea dx, msj1
    mov ah, 9
    int 21h
    
lectura_normal:
    
 
    mov dl, arg[si]
    mov bl, dl
    
    add bl, 48 
    
    mov ah, 02h
    mov dl, bl
    int 21h
      
    inc si
    dec cl
 
    
    jnz lectura_normal  
    
    sub si, 1
    mov cx,9  
    
    lea dx, msj2
    mov ah, 9
    int 21h 
    
lectura_inversa:  

 
    mov dl, arg[si]
    mov bl, dl
    
    add bl, 48    
    
    mov ah, 02h
    mov dl, bl
    int 21h
    
    dec si
    dec cl
    
    
    
    jnz lectura_inversa 
    
    mov ah, 4ch
    int 21h 
    
    begin endp
end
    
 