
WARN=-Wall -Wextra -Wno-unused-function -Wno-unused-parameter

# freestanding using any recent clang build
# CC=clang
# CFLAGS=--target=riscv64 -march=rv64gcv_zfh -O3 ${WARN} -nostdlib -fno-builtin -ffreestanding

# full cross compilation toolchain
CC		  = riscv64-unknown-linux-gnu-gcc
OBJDUMP   = riscv64-unknown-linux-gnu-objdump
OBJCOPY   = riscv64-unknown-linux-gnu-objcopy
AS		  = riscv64-unknown-linux-gnu-gcc
LD 		  = riscv64-unknown-linux-gnu-ld
CFLAGS= -march=rv64gv -mcmodel=medany -fno-builtin -nostdlib -ffreestanding\
			-O3 -MMD -Wall ${WARN}


# native build
#CC=cc
#CFLAGS=-march=rv64gcv -O3 ${WARN}

