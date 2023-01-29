BOOTSEG equ 0x07c0
LOADSEG equ 0x07e0

_start:
	jmp BOOTSEG:go   ; 加载 cs 段寄存器
go:
	mov ax, cs
	mov ds, ax
	mov es, ax       ; 设置ds es寄存器

	; 使用CHS模式 读取10个扇区 读取loader
	mov ax, LOADSEG
	mov es, ax
	mov bx, 0x0       ; 加载内存地址 es:bx

	mov ch, 0x0       ; Cylinder号
	mov dh, 0x0       ; Head号
	mov cl, 0x2       ; Sector号
	mov ah, 0x2       ; 读取扇区到内存
	mov al, 0x0a      ; 读取10个扇区
	int 0x13
	jnc fin           ; 读取书否成功?

	; 打印错误信息 
	mov si, msg
	mov ah, 0x0e

loop:
	lodsb
	or al, al
	jz halt
	int 0x10
	jmp loop

	; 宕机
halt:
	hlt

	; 转跳到loader
fin:
	jmp LOADSEG:0x0
	
msg:
	db "error load loader!"
	times 510-($-$$) db 0
	dw 0xaa55
