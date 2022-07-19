	ifndef	??version
?debug	macro
	endm
$comm	macro	name,dist,size,count
	comm	dist name:BYTE:count*size
	endm
	else
$comm	macro	name,dist,size,count
	comm	dist name[size]:BYTE:count
	endm
	endif
	?debug	S "param.c"
	?debug	C E9FBB4841C07706172616D2E63
	?debug	C E920083A1515433A5C54435C494E434C5544455C737464696F2E68
_TEXT	segment byte public 'CODE'
_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	main(int argc, char *argv[])
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int cont;
   ;		for (cont = 0; cont < argc; cont++)
   ;	
	xor	si,si
	jmp	short @1@98
@1@50:
   ;	
   ;			printf("%s ",argv[cont]);
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr [bp+6]
	add	bx,ax
	push	word ptr [bx]
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
	inc	si
@1@98:
	cmp	si,word ptr [bp+4]
	jl	short @1@50
   ;	
   ;		printf("\n");
   ;	
	mov	ax,offset DGROUP:s@+4
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'%s '
	db	0
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_printf:near
	public	_main
	extrn	__setargv__:far
	end
