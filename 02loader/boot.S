.code16
.global _boot
_boot:
	mov $0x07e0, %ax
	mov %ax, %es
	mov $0x0, %ch
	mov $0x0, %dh
	mov $0x2, %cl
	mov $0x02, %ah
	mov $0x01, %al
	mov $0x0, %bx
        int $0x13
	jnc fin

	cli
	mov $msg, %si
	mov $0x0e, %ah
loop:
	lodsb
	or %al, %al
	jz halt
	int $0x10
	jmp loop
halt:
	hlt
fin:
	
	ljmp $0x07e0, $0x0000
msg:
	.asciz "error load loader!"
.org 510
.word 0xaa55
