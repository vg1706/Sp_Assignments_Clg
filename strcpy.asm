;			Copying a String into another one.

.model small
.stack	64
.data
string	db	'abcdefg$'
strin3	db	'Result of copy operation:$'
strcre	db	?

.code
main 	proc	far
	mov	ax,@data
	mov	ds,ax



	;Copy Operation
	lea 	si,string
	lea	di,strcre
	mov	cx,07h
xxx:	mov	al,[si]
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
	
	mov	ax,4c00h
	int	21h
main	endp
end	main
