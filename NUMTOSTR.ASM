	;Number To String.

.model small

.stack	64

.data

number	db	123
string	db	?
divisr	db	0ah
resstr db  	?

.code
	
main	proc	far
	mov	ax,@data
	mov	ds,ax

	;number to string
	mov	al,number
	mov 	cx,0h
	lea 	si,string
xxx:	mov	ah,00h
	div 	divisr
	add	ah,30h
	mov	[si],ah
	INC	SI	
	inc 	cx
	cmp	al,00h
	JNE	xxx
	
	mov	al,'$'
	MOV	[si],al
	
	;string to number
	mov si,cx
	lea di,resstr
	dec si

yyy:	mov al,string[si]
	mov [di],al
	inc di
	dec si
	dec cx
	jnz yyy

	mov	al,'$'
	MOV	[di],al	
	lea	dx,resstr	
	mov	ah,09h
	int 21h
	
	
	mov	ax,4c00h
	int	21h

main	endp
end	main
