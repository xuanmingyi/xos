TARGET=build/

run:$(TARGET)hello.img
	@qemu-system-i386  -m 16m -rtc base=localtime -vga std -drive file=$(TARGET)hello.img,format=raw

$(TARGET)hello.img:$(TARGET)boot.bin $(TARGET)loader.bin
	@mkimg

$(TARGET)boot.bin:boot.S
	@mkdir -p $(TARGET)
	@as boot.S -o $(TARGET)boot.o
	@ld --oformat binary -o $(TARGET)boot.bin -T boot.ld $(TARGET)boot.o

$(TARGET)loader.bin:loader.S
	@mkdir -p $(TARGET)
	@as loader.S -o $(TARGET)loader.o
	@ld --oformat binary -o $(TARGET)loader.bin -T loader.ld $(TARGET)loader.o

clean:$(TARGET)boot.o $(TARGET)boot.bin $(TARGET)hello.img $(TARGET)loader.bin $(TARGET)loader.o
	@rm -rf $(TARGET)
