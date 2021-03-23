OBJS := $(addprefix bin/objs/,$(notdir $(patsubst %.asm,%.o,$(wildcard src/*.asm))))
ASM=nasm
LD=ld
ASMFLAGS = -felf64 -i src
LDFLAGS = 
EXE = test

.PHONY: all clean

all: bin bin/objs bin/$(EXE)

bin/$(EXE): $(OBJS)
	pushd bin/objs; $(LD) $(LDFLAGS) $(^F) -o ../$(EXE); popd

bin/objs/%.o: src/%.asm
	$(ASM) $(ASMFLAGS) $^ -o $@

bin:
	mkdir bin

bin/objs:
	mkdir bin/objs

clean:
	rm -rvf bin
