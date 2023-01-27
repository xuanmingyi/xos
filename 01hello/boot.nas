BOOTSEG equ 0x07c0

_start:
	jmp BOOTSEG:go
go:
	mov ax, cs
	mov ds, ax
	mov es, ax

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
	
msg:
	db "hello world!!"
	times 510-($-$$) db 0
	dw 0xaa55
