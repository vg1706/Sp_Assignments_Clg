;			DOUBLE WORD TO DOUBLE WORD ARITHMETICAL OPERATION



.model flate,c
.386
.stack	100h

.data
one	dd	00000173h
dat	dd	?
two	dd	000000a7h
sum1	dd	?
sub1	dd	?
mul1	dd	?
div1	dd	?
remain	dd	?

.code
main	proc	far
	mov	ax,@data
	mov	ds,ax
	
	mov	eax,one
	mov	ebx,two
	
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
;sum1=021ah
;sub1=cch
;mul1=f205h
;div1=02h
;remain=25h
;-----------------------------------------------------------------------------------


sum	proc	near
	mov	dat,eax
	add	eax,ebx
	mov	sum1,eax
	mov	eax,dat

	ret
	sum	endp


;-----------------------------------------------------------------------------------


subproc	proc	near
	mov	dat,eax
	sub	eax,ebx
	mov	sub1,eax
	mov	eax,dat

	ret
	subproc	endp


;-----------------------------------------------------------------------------------
mulproc	proc	near
	mov	dat,eax
	mul	ebx
	mov	mul1,eax
	mov	eax,dat
	
	ret
	mulproc	endp


;-----------------------------------------------------------------------------------

divproc	proc	near
	mov	dat,eax
	mov	edx,00h
	div	ebx
	mov	div1,eax
	mov	remain,edx
	
	ret
	divproc	endp


;-----------------------------------------------------------------------------------
end	main


