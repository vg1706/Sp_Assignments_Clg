;				Even and Count In an Array.

.model small
.stack 100h
.data
array db 15,12,65,98,46,22,60,79,55,56
one db 02h
two db 0ah
eve db 0
odd db 0
st1 db "Even:$"
str db 10,13,"Odd:$"
.code 
main proc far
mov ax,@data
mov ds,ax
mov cx,0ah
lea si,array
xxx: mov al,[si]
     mov ah,00h
     div one
     cmp ah,0
     jz yyy
      inc odd
	jmp zzz
yyy: inc eve
zzz: inc si
     loop xxx

lea dx,st1
mov ah,09h
int 21h

mov al,eve
add al,30h
mov ah,02h
mov dl,al 
int 21h

lea dx,str
mov ah,09h
int 21h

mov al,odd
add al,30h
mov ah,02h
mov dl,al 
int 21h

mov ah,4ch
int 21h

main endp
end main     
