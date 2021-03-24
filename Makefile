ASM_OBJS := $(addprefix bin/objs/,$(notdir $(patsubst %.asm,%.asm.o,$(wildcard src/*.asm))))
C_OBJS := $(addprefix bin/objs/,$(notdir $(patsubst %.c,%.c.o,$(wildcard src/*.c))))
ASM=nasm
LD=ld
CC=gcc
ASMFLAGS = -felf64 -i src
CFLAGS = -g -Wall -Wextra -nostdlib -c -m64
LDFLAGS =
EXE = test

.PHONY: all clean

all: bin bin/objs bin/$(EXE)

bin/$(EXE): $(ASM_OBJS) $(C_OBJS)
	pushd bin/objs; $(LD) $(LDFLAGS) $(^F) -o ../$(EXE); popd

bin/objs/%.c.o: src/%.c
	$(CC) $(CFLAGS) $^ -o $@

bin/objs/%.asm.o: src/%.asm
	$(ASM) $(ASMFLAGS) $^ -o $@


bin:
	mkdir bin

bin/objs:
	mkdir bin/objs

clean:
	rm -rvf bin
