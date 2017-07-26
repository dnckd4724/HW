all: star
star: star.o
		ld -o star star.o
star.o: star.s
		nasm -f elf64 star.s
clear:
		rm *.o star
