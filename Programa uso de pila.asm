.model small
.stack 64
.data

msj1 db 10,13,"-size de la pila- ",'$'  
msj2 db 10,13,"Dato a guardar en la pila: ",'$'
msj3 db 10,13,"Ingrese el numero a comparar :",'$'
menMayor db 10,13,"El numero ingresado es mayor",'$'
menMenor db 10,13,"El numero ingresado es menor",'$'
menIgual db 10,13,"El numero ingresado es igual",'$'   


numero db 0

.code

    begin proc
        
        mov ax, @data
        mov ds, ax
        
      
        mov ah, 09
        lea dx, msj1
        int 21h
        
        mov ah, 01h  ;espera el input  de valor del ciclo
        int 21h
        
        sub al, 30h  ;convierte el valor del input
        mov bl, al 
        
        
        mov cx, bx   ; muevo el valor del input al valor del ciclo 
        
        
        
l1:     

        mov ah, 09
        lea dx, msj2  ;mensaje
        int 21h
        
        mov ah, 01h  ;espera el input del los valores de la pila
        int 21h
        
        sub al, 30h   ;convierte el valor del input
        
        push ax       ;lo meto dentro de la pila

        loop l1  
        
     
           
        mov ah, 09
        lea dx, msj3  ;mensaje para pedir el numero a comparar  
        int 21h      
        
        mov ah, 01h   ;espera el input del los valores de la pila
        int 21h
        
        sub al, 30h   ;convierte el valor del input
        
        mov numero,al ;lo mueve a una variable aparte
        

   
        mov cx,bx   ;inicio otra vez el ciclo
          
l2:      

        pop bx        ;saco el dato de la pila

    
        cmp numero,bl    ; compara 
                 
        
        jg mayor
        jl menor      ;saltos
        je igual 
         
       
        
        
mayor:   

        mov ah, 09
        lea dx, menMayor
        int 21h 
        dec cx         ;decremento el ciclo de forma manual ya que no puede acabar
        cmp cx,0       ;el ciclo por si solo y comparar constantemente si el cicio
        je finalizar   ;es cero para saltar directamente a finalizar el programa
       
        jmp l2

        
menor:   

        mov ah, 09
        lea dx, menMenor ;mensaje para indicar que el numero es menor
        int 21h
        dec cx
        cmp cx,0
        je finalizar 
       
        jmp l2
        
             
                       
igual:  

        mov ah, 09
        lea dx, menIgual  ;mensaje para indicar que el numero es igual
        int 21h
        dec cx
        cmp cx,0
        je finalizar 
       
        jmp l2

        
finalizar:
        
        mov ah, 4ch
        int 21h
        
        begin endp    
end