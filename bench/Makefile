.POSIX:

include ../config.mk

CUR_DIR = $(shell pwd)
BUILD = $(CUR_DIR)/build

LINK_LIBS  = $(sort $(LIBS))
LDFLAGS += -nolibc -static -nostdlib  -ffreestanding -O3
LDFLAGS += -T ../thirdparty/link.ld  ../thirdparty/am-riscv64-xs.a ../thirdparty/klib-riscv64-xs.a

EXECS=memcpy memset utf8_count strlen mergelines mandelbrot chacha20 poly1305 ascii_to_utf16 ascii_to_utf32 byteswap

all: ${EXECS}

.c: $@.S template.S config.h bench.h
	mkdir -p $(BUILD)
	${CC} ${CFLAGS} ${LDFLAGS} -o $(BUILD)/$@ $< -DINC=$@.S template.S
	$(OBJDUMP) -d $(BUILD)/$@ > $(BUILD)/$@.txt
	$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary $(BUILD)/$@ $(BUILD)/$@.bin

clean:
	rm -f ${EXECS}
	rm -rf ${BUILD}

run: all
	for i in ${EXECS}; do ../run.sh ./$$i; done

