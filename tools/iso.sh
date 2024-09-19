i686-elf-as boot/boot.s -o tmp/boot.o
i686-elf-gcc -c kernel/core/enter.c -o tmp/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -T comp/linker.ld -o vdk.bin -ffreestanding -O2 -nostdlib tmp/boot.o tmp/kernel.o -lgcc
grub-file --is-x86-multiboot vdk.bin
mkdir -p isodir/boot/grub
cp vdk.bin isodir/boot/vdk.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o ./build/iso/vdk.iso isodir
