;			BYTE TO BYTE ARITHMETICAL OPERATION


.model small

.stack	64

.data
one	db	11h
two	db	07h
sum1	db	?
sub1	db	?
mul1	db	?
div1	db	?
remain	db	?

.code
main	proc	far
	mov	ax,@data
	mov	ds,ax
	
	mov	bl,one
	mov	bh,two
	
	;addition
	call sum
	
	;subtraction
	call	subproc
	
	;multiplication
	call	mulproc
	
	;division
	call	divproc
	
	mov	ax,4c00h
	int	21h	
	main	endp



;-----------------------------------------------------------------------------------


sum	proc	near
	mov	al,bl
	add	al,bh
	mov	sum1,al
	
	ret
	sum	endp


;-----------------------------------------------------------------------------------


subproc	proc	near
	mov	al,bl
	sub	al,bh
	mov	sub1,al
	
	ret
	subproc	endp


;-----------------------------------------------------------------------------------
mulproc	proc	near
	mov	al,bl
	mul	bh
	mov	mul1,al
	
	ret
	mulproc	endp


;-----------------------------------------------------------------------------------

divproc	proc	near
	mov	al,bl
	mov	ah,00h
	div	bh
	mov	div1,al
	mov	remain,ah
	
	ret
	divproc	endp


;-----------------------------------------------------------------------------------
end	main

	
