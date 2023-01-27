void io_hlt(void) {
	asm ("hlt");
}

void kernel_main() {
fin:
	io_hlt();
	goto fin;
}
