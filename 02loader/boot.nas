BOOTSEG equ 0x07c0
LOADSEG equ 0x07e0

_start:
	jmp BOOTSEG:go
go:
	mov ax, cs
	mov ds, ax
	mov es, ax

	mov ax, LOADSEG
	mov es, ax
	mov ch, 0x0
	mov dh, 0x0
	mov cl, 0x2
	mov ah, 0x2
	mov al, 0x1
	mov bx, 0x0
	int 0x13
	jnc fin

	cli
	mov si, msg
	mov ah, 0x0e

loop:
	lodsb
	or al, al
	jz halt
	int 0x10
	jmp loop

halt:
	hlt

fin:
	jmp LOADSEG:0x0
	
msg:
	db "error load loader!"
	times 510-($-$$) db 0
	dw 0xaa55
