ASM_OBJS := $(addprefix bin/objs/,$(notdir $(patsubst %.asm,%.asm.o,$(wildcard src/*.asm))))
C_OBJS := $(addprefix bin/objs/,$(notdir $(patsubst %.c,%.c.o,$(wildcard src/*.c))))
ASM=nasm
LD=ld
CC=gcc
ASMFLAGS = -felf64 -i src -Wall
CFLAGS = -Wall -Wextra -nostdlib -c -m64 -Os -ffunction-sections -fdata-sections -fno-unwind-tables -fno-asynchronous-unwind-tables
LDFLAGS = -static -O1 --as-needed -N --relax --gc-sections -z norelro --hash-style=sysv 
STRIPFLAGS = -R .comment -R .gnu.version -R .note -R .eh_frame -R .eh_frame_hdr
ARFLAGS = 
EXE = test
TARGET = elf64-x86-64

.PHONY: all clean

all: bin bin/objs bin/$(EXE) bin/$(EXE)_stripped

bin/$(EXE): $(ASM_OBJS) $(C_OBJS)
	pushd bin/objs; $(LD) $(LDFLAGS) $(^F) -o ../$(EXE) -b $(TARGET); popd
	pushd bin/objs; $(AR) $(ARFLAGS) -cr ../libasm.a $(^F) ; popd

bin/$(EXE)_stripped: bin/$(EXE)
	cp bin/$(EXE) bin/$(EXE)_stripped
	strip -s $(STRIPFLAGS) bin/$(EXE)_stripped

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
