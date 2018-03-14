	;Number To String.

.model small

.stack	64

.data

number	db	123
string	db	?
resstr	db	?
divisr	db	0ah
string1 db  	?

.code
	
main	proc	far
mov	ax,@data
mov	ds,ax
	
	
;number to string
	
mov 	si,0h
mov	al,number
mov 	cx,0h
xxx:	
mov	ah,00h
div 	divisr
add	ah,30h
mov	string[si],ah
INC	SI	
inc 	cl
cmp	al,00h
JNE	xxx

MOV	string[SI],'$'	
lea	dx,string
mov	ah,09h	
int 21h

mov dl,0ah
mov ah,02h
int 21h

mov si,cx
mov di,0h
dec si

rev:
mov al,string[si]
mov string1[di],al
inc di
dec si
dec cx
jnz rev

MOV	string1[di],'$'	
lea	dx,string1	
mov	ah,09h
int 21h

	

mov	ax,4c00h
	
int	21h

main	endp

end	main
