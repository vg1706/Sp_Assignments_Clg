;			WORD TO WORD ARITHMETICAL OPERATION


.model small

.stack	64

.data
one	dw	0173h
dat	dw	?
two	dw	00a7h
sum1	dw	?
sub1	dw	?
mul1	dw	?
div1	dw	?
remain	dw	?

.code
main	proc	far
	mov	ax,@data
	mov	ds,ax
	
	mov	ax,one
	mov	bx,two
	
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


;answers for the above data
;sum1=21ah
;sub1=cch
;mul1=f205h
;div1=02h
;remain=25h
;-----------------------------------------------------------------------------------


sum	proc	near
	mov	dat,ax
	add	ax,bx
	mov	sum1,ax
	mov	ax,dat

	ret
	sum	endp


;-----------------------------------------------------------------------------------


subproc	proc	near
	mov	dat,ax
	sub	ax,bx
	mov	sub1,ax
	mov	ax,dat

	ret
	subproc	endp


;-----------------------------------------------------------------------------------
mulproc	proc	near
	mov	dat,ax
	mul	bx
	mov	mul1,ax
	mov	ax,dat
	
	ret
	mulproc	endp


;-----------------------------------------------------------------------------------

divproc	proc	near
	mov	dat,ax
	mov	dx,00h
	div	bx
	mov	div1,ax
	mov	remain,dx
	
	ret
	divproc	endp


;-----------------------------------------------------------------------------------
end	main


