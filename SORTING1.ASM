;			SORTING OF AN ARRAY OF INTEGERS (BUBBLE SORT).
.model small
.stack 64
.data
array 	db 	02h,56h,60h,34h,50h,16h,6h,10h,14h,03h
reslt	db	?
.code
	main	proc	far
	mov	ax,@data
	mov	ds,ax
	
	;Increasing Order
	mov	bh,9
xxx:	mov	si,0
	mov	di,1
	mov 	cl,bh
zzz:	mov	al,array[si]
	cmp	al,array[di]
	ja	yyy
www:	inc 	si
	inc	di
	dec	cl
	jnz	zzz
	dec	bh
	jnz	xxx

	jmp	exit	
	


yyy:	mov	bl,array[di]
	mov	array[di],al
	mov	array[si],bl
	jmp	www

exit:
	;Decreasing Order
	lea	di,reslt
	mov	si,09h
	mov	cx,0ah
ppp:	mov	al,array[si]
	mov	[di],al
	inc	di
	dec	si
	loop	ppp


	mov	ax,4c00h
	int	21h
main endp
end main
