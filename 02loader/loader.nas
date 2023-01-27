LOADSEG equ 0x07e0

	jmp LOADSEG:go
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
	db "loader loaded!!!"
	db 0x0
