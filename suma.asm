.model small
.stack stack 64

.data       

msjn1 db 10,13,"Programa: suma de dos numeros",'$'
msjn2 db 10,13,"Dato uno",'$'
msjn3 db 10,13,"Dato dos",'$'
msjn4 db 10,13,"El resultado de la suma es:",'$'

.code
begin proc
    
    mov cx,2
    
l1:
; dirrecionamiento del procedimiento
mov ax, @data
mov ds, ax
;imprimir mensaje
mov ah,09
lea dx, msjn1
int 21h
;imprimir mensaje

mov ah,09
lea dx,msjn2
int 21h
;lee de teclado y lo manda
mov ah,01h
int 21h

sub al, 48
add bl,al

; imprimir mensaje
mov ah, 09
lea dx, msjn3
int 21h
;lee de teclado y lo manda
mov ah,01h
int 21h  
sub al,48
add bl,al
add bl,48

;imprimir mensaje
mov ah,09
lea dx, msjn4
int 21h

;caracter a salida
mov ah, 02h
mov d


loop l1
;cierre del programa
mov ah,4ch
int 21h

begin endp
end
       