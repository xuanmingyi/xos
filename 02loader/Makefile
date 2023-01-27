TARGET=build/

run:$(TARGET)hello.img
	@qemu-system-i386  -m 16m -rtc base=localtime -vga std -drive file=$(TARGET)hello.img,format=raw

$(TARGET)hello.img:$(TARGET)boot.bin $(TARGET)loader.bin
	@dd if=$(TARGET)boot.bin of=$(TARGET)hello.img bs=512 count=1
	@dd if=$(TARGET)loader.bin of=$(TARGET)hello.img bs=512 count=1 seek=1
	@dd if=/dev/zero of=$(TARGET)hello.img bs=512 count=20478 seek=1024

$(TARGET)boot.bin:boot.nas loader.nas
	@mkdir -p $(TARGET)
	@nasm boot.nas -o $(TARGET)boot.bin -f bin
	@nasm loader.nas -o $(TARGET)loader.bin -f bin

clean:$(TARGET)boot.bin $(TARGET)loader.bin $(TARGET)hello.img
	@rm -rf $(TARGET)
