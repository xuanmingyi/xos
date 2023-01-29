LOADSEG  equ 0x07e0
STACKSEG equ 0x07c0
STACKSP  equ 0x200

	jmp LOADSEG:go

gdt_addr:

GDT_BASE:
	dd 0x00000000
	dd 0x00000000
CODE_DESC:
	dd 0x0000ffff
	dd 
	
go:
	mov ax, cs
	mov ds, ax
	mov es, ax

	mov ax, STACKSEG
	mov ss, ax
	mov sp, STACKSP

	mov ax, msg
	call output_str 

	; 打开a20
	in al, 0x92
	or al, 0x02
	out 0x92, al

	; 加载GDT
	lgdt [gdt_addr]
	
	; 进入保护模式
	mov eax, cr0
	or eax, 0x00000001
	mov cr0, eax
	
	jmp  $

output_str:
	cli
	mov si, ax
	mov ah, 0x0e
loop:
	lodsb
	or al, al
	jz fin
	int 0x10
	jmp loop
fin:
	sti
	ret



msg:
	db "loader loaded!!!"
	db 0x0

[bits 32]
p_mode_start:
	jmp $	
