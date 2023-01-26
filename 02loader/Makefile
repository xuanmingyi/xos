run:build/hello.img
	@qemu-system-i386  -m 16m -rtc base=localtime -vga std -drive file=build/hello.img,format=raw

build/hello.img:build/boot.bin
	@mkimg

build/boot.bin:boot.S
	@mkdir -p build
	@as boot.S -o build/boot.o
	@ld --oformat binary -o build/boot.bin -T boot.ld build/boot.o


clean:build/boot.o
	@rm -rf build/boot.o build/boot.bin build/hello.img
