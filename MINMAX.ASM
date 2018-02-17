	;Minimum and Maximum of an Array.
.model small

.stack 64

.data
array	db	25h,62h,28h,12h,0ah,0ch,06h
minim	db	?
maxim	db	?
stri1	db	'Minimum element of the array:$'
stri2	db	10,13,'Maximum element of the array:$'

.code
	main	proc	far
	mov	ax,@data
	mov	ds,ax
	lea	si,array
	

	;Initialize minim, maxim
	mov	al,[si]
	mov	minim,al
	mov	maxim,al


	;calculating minimum and maxium
	inc	si
	mov	cx,06h
xxx:	mov	al,[si]
	cmp	al,maxim
	ja	yyy
zzz:	cmp	al,minim
	jb	www

ppp:	inc	si
	loop	xxx
	jmp	print

yyy:	mov	maxim,al
	jmp	zzz

www:	mov	minim,al
	jmp	ppp

print:
	
	;Printing Minimum	
	lea	dx,stri1
	mov	ah,09h
	int	21h
	
	mov	al,minim
	mov	ah,00h
	mov	bh,0ah
	div	bh
	mov	bl,ah
	add	al,30h
	mov	ah,02h
	mov	dl,al
	int	21h
	mov	al,bl
	add	al,30h
	mov	ah,02h
	mov	dl,al
	int	21h

	;Printing Maximum
	lea	dx,stri2
	mov	ah,09h
	int	21h
	
	mov	al,maxim
	mov	ah,00h
	mov	bh,0ah
	div	bh
	mov	bl,ah
	add	al,30h
	mov	ah,02h
	mov	dl,al
	int	21h
	mov	al,bl
	add	al,30h
	mov	ah,02h
	mov	dl,al
	int	21h


	mov	ax,4c00h
	int	21h
main	endp
end	main
