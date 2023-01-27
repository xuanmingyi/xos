.code16
.global _start
_start:
	cli
	mov $msg, %si
	mov $0x0e, %ah
loop:
	lodsb
	or %al, %al
	jz fin
	int $0x10
	jmp loop

fin:
# A20
	

# load GDT register
	lgdt []

# set PE
	mov %cr0, %eax
	or $0x01, %al
	mov %eax, %cr0

	jmp $0x08

msg:
	.asciz "loader loaded!"
