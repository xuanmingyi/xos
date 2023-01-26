run:hello.img
	@qemu-system-i386  -m 16m -rtc base=localtime -vga std -drive file=hello.img,format=raw

hello.img:boot.bin
	@mkimg

boot.bin:boot.S
	@as boot.S -o boot.o
	@ld --oformat binary -o boot.bin -Ttext 0x7c00 boot.o


clean:boot.o
	@rm -rf boot.o boot.bin hello.img
