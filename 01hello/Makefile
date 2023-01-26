TARGET=build/

run:$(TARGET)hello.img
	@qemu-system-i386  -m 16m -rtc base=localtime -vga std -drive file=$(TARGET)hello.img,format=raw

$(TARGET)hello.img:$(TARGET)boot.bin
	@mkimg

$(TARGET)boot.bin:boot.S
	@mkdir -p $(TARGET)
	@as boot.S -o $(TARGET)boot.o
	@ld --oformat binary -o $(TARGET)boot.bin -T boot.ld $(TARGET)boot.o

clean:$(TARGET)boot.o $(TARGET)boot.bin $(TARGET)hello.img
	@rm -rf $(TARGET)
