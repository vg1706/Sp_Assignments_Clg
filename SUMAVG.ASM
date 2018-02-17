;			Sum and Average of An array.
.model small
.stack 64
.data
array 	db 	04h,06h,12h,07h,08h,09h
stri1	db	'Sum:$'
stri2	db	10,13,'Average:$'
stri3	db	'.$'
reslt	db	?
numbr	db	0ah

.code
	main	proc	far
	mov	ax,@data
	mov	ds,ax
	
	lea	si,array
	mov 	cx,05h


	;Printing String1
	lea	dx,stri1
	mov	ah,09h
	int 	21h
	

	;Calculating Sum
	mov 	al,[si]
	inc	si
	clc
xxx:	adc	al,[si]
	inc	si
	loop	xxx
	
	mov	reslt,al
	

	;Printing Sum
	mov 	ah,00h
	div	numbr
	mov 	bl,ah
	add	al,30h
	mov 	ah,02h
	mov 	dl,al 
	int 	21h
	mov 	al,bl
	add 	al,30h
	mov 	ah,02h
	mov 	dl,al 
	int 	21h

	;Printing String 2
	lea	dx,stri2
	mov	ah,09h
	int 	21h

	
	;Printing Average
	mov	bh,06h
	mov	ah,00h
	mov	al,reslt
	div	bh
	mov	bl,ah
	add	al,30h
	mov	ah,02h
	mov	dl,al
	int	21h
	
	lea	dx,stri3
	mov	ah,09h
	int	21h


	mov	cx,03h
yyy:	mov 	al,bl
	mov	ah,00h
	mul	numbr
	div	bh
	mov	bl,ah
	add	al,30h
	mov	ah,02h
	mov	dl,al
	int	21h
	loop	yyy
	
		
	mov	ax,4c00h
	int	21h
main endp
end main
