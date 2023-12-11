.POSIX:

include ../../config.mk

CUR_DIR = $(shell pwd)
BUILD = $(CUR_DIR)/build

LIBS    += $(AM_HOME)/am/libs/klib
LINK_LIBS  = $(sort $(LIBS))
LDFLAGS += -nolibc -static -nostdlib  -ffreestanding -O3
LDFLAGS += -T ../../thirdparty/link.ld  ../../thirdparty/am-riscv64-xs.a ../../thirdparty/klib-riscv64-xs.a

all: rvv-1.0

rvv-1.0: main.c main.S config.h
	mkdir -p $(BUILD)
	$(CC) ${CFLAGS}  ${LDFLAGS} main.c main.S -o $(BUILD)/$@
	$(OBJDUMP) -d $(BUILD)/$@ > $(BUILD)/$@.txt
	$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary $(BUILD)/$@ $(BUILD)/benchmark.bin

clean:
	rm -rf build

run: rvv-1.0
	../../run.sh ./rvv-1.0
