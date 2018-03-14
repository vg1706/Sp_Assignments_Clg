.model small

.stack 64


.data
str1 db "hello$","world$","apple$","catle$","bytes$"
t1 db ?
t2 db ?
t3 db ?
t4 db ?
t5 db ?
.code
main proc far

mov ax,@data
mov ds,ax

lea si,str1

mov t3,6h



xxx:
dec t3
cmp t3,00
jz print

mov di,si
mov al,t3
mov t4,al

mov cx,di
mov dx,si



loop2:

mov si,dx

dec t4
cmp t4,00
jz incr

;-->next
add di,6h
mov cx,di
;---


mov t1,0h

compare:
mov al,[si]
mov bl,[di]
cmp al,bl
jne une
inc si
inc di
inc t1

jmp compare

une:

cmp al,bl
jb loop2

mov al,5h
mov t5,al
mov si,dx
mov di,cx

swap:

mov al,[si]
mov bl,[di]
mov [si],bl
mov [di],al
inc si
inc di
dec t5
cmp t5,0h
jnz swap

mov di,cx
jmp loop2

incr:
add si,6h
jmp xxx


print:

mov cl,5h
lea si,str1

x:
mov dx,si
mov ah,09h
int 21h

mov dl,10
mov ah,02h
int 21h

add si,6h
dec cl
cmp cl,00h
jnz x


exit:
mov ax,4c00h
int 21h

main endp
end main
