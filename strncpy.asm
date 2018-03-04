;			Copying a String into another one from index n.

.model small
.stack	64
.data
string	db	'abcdefg$'
strin2	db	'Enter the index:$'
strin3	db	'Result of copy operation:$'
strcre	db	?
number	db	03h

.code
main 	proc	far
	mov	ax,@data
	mov	ds,ax

	
	mov	al,number
	mov	ah,00h
	


	;Copy Operation
	mov	si,ax
	lea	di,strcre
	mov	cx,04h
xxx:	mov	al,string[si]
	mov	[di],al
	inc	si
	inc	di
	loop	xxx
	
	;Delimeter
	mov	al,24h
	mov	[di],al



	mov	ah,09h
	lea	dx,strin3
	int 	21h
	


	;printing the result	
	mov	ah,09h
	lea	dx,strcre
	int 	21h
	

	mov	ah,00h
	mov	dx,ax
	mov	ah,02h
	int 	21h
	mov	ax,4c00h
	int	21h
main	endp
end	main
