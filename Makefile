.POSIX:
.SUFFIXES:

include config.mk

cpuid: main.o cpuid.o
	$(CC) -o $@ $^

main.o: main.c
	$(CC) -c -o $@ $(CFLAGS) $<

cpuid.o: cpuid.asm
	$(NASM) -o $@ $(ASFLAGS) $<

clean:
	rm -rf cpuid main.o cpuid.o

.PHONY: clean
