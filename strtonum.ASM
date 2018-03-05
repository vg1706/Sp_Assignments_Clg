	;String To Number and Number To String
.model small
.stack	64

.data
string	db	'123$'
resnum	db	?
multip	db	0ah

.code
	main	proc	far
	mov	ax,@data
	mov	ds,ax
	
	;number to string
	lea 	si,string
	mov	cx,03h
	mov	ax,00h
xxx:	mul	multip
	mov	bh,[si]
	sub	bh,30h
	add	al,bh
	INC	SI
	loop	xxx

	mov	resnum,al
	
	
	mov	ax,4c00h
	int	21h
main	endp
end	main
