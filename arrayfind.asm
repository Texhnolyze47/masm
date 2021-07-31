.model small  
.data


arreglo1 db ?
numero db ?
sizeArreglo db ?
msj1 db 10,13,"-Ingrese el no. de elementos- ","$"
msj2 db 10,13,"Ingrese los numeros ","$"
msj3 db 10,13,"Ingrese el numero que se quiere buscar ", "$"
msj4 db 10,13,"No se encontro el numero", "$"
msj5 db 10,13,"Si se encontro el numero", "$"

 

.code
    begin proc
    mov ax, @data
    mov ds, ax
    
    ;pregunta por el size del array
    lea dx, msj1
    mov ah, 9
    int 21h
    
    mov ah,01h    ;espera el input del size del array
    int 21h
    mov sizeArreglo, al
    sub sizeArreglo, 30h  ;convierte el input  
    
    
    lea si, arreglo1   ; obtener la direccion de la variable del array
    mov cl,sizeArreglo
    
    array_input:
    
    lea dx, msj2 ; se imprime el mensaje de "Ingrese los numeros "
    mov ah, 9
    int 21h
    
    mov ah, 01h  ;espera el input del los valores del array
    int 21h     
    sub al, 30h   ;convierte el valor del input
    mov [si],al   ; mueve los datos al arreglo
    
    inc si       ;mueve las posciones dentro del array
    dec cl       ;acaba el ciclo
    
    jnz array_input
    
    
    mov ah, 09h
    lea dx, msj3  ; se imprime el mensaje de "Ingrese el numero que se quiere buscar"
    int 21h
    
    mov ah, 01h   ;espera el input del los valor del numero a buscar 
    int 21h
    sub al, 30h 
    
    mov numero, al  ; se mueve a la variable numero
     
    lea si,  arreglo1 ;obtener la direccion de la variable del array
    
    mov cl, sizeArreglo  ; inicia otra vez el ciclo

  
         
    encontrar:               ; mueve los datos del array al registro bl
        MOV BL,[SI]
        CMP numero, BL       ; comparar los numeros;
        JZ si_estaba         ; instruccion de salto si encuentra el numero
        dec SI               ;mueve la posicion del array
        dec cl               ;acaba el ciclo 
        JNZ encontrar        ;loop para encontrar el numero
        
        
    mov ah, 09h
    lea dx, msj4             ;se imprime el mensaje de "No se encontro el numero"
    int 21h
    JMP terminar_programa    ;salta y termina el programa
     
    si_estaba:
    mov ah, 09h              
    lea dx, msj5            ;se imprime el mensaje de "Si se encontro el numero"
    int 21h
     
    terminar_programa:
    mov ah, 4ch            ; termina el programa
    int 21h
    begin endp
end