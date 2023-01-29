nasm -f elf32 -o boot.o boot.nas
gcc -m32 -std=gnu99 -ffreestanding -O2  -c kernel.c -o kernel.o
ld -m elf_i386 -T link.ld -o kernel kernel.o boot.o

