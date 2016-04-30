CSRCS	   = $(wildcard *.c)
ASRCS      = $(wildcard *.asm)

COBJS      = $(CSRCS:%.c=%.o)
AOBJS      = $(ASRCS:%.asm=%.o)

OUTPUT     = AKT.exe

NASMFLAGS = -Wall -g -f elf32
CFLAGS    = -Wall -c -m32
GCCFLAGS  = -Wall -g -m32

all: $(AOBJS) $(COBJS) 
	gcc $(GCCFLAGS) $(AOBJS) $(COBJS) -o $(OUTPUT)

clean:
	rm -rf $(COBJS) $(AOBJS) $(OUTPUT) *.txt

%.o: %.asm macro.inc
	nasm $(NASMFLAGS) -E $*.asm > $*.txt
	nasm $(NASMFLAGS) $*.asm -o $*.o

%.o: %.c
	gcc $(CFLAGS) $*.c -o $*.o

%.exe: %.o 
	gcc $(GCCFLAGS) $(COBJS) $(AOBJS) -o $*.exe

