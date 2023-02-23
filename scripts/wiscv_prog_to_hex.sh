#! /bin/bash
if [ -f "$1.c" ]; then #Checking whether its a c file or asm(.s) file
    riscv32-unknown-elf-gcc  -nostartfiles -Wl,-T,./riscv32.ld crt0.s $1.c -o wiscv.o
    riscv32-unknown-elf-run -t --memory-region 0x00000000,0x8000000 wiscv.o 2> wiscv.golden_run 
else
    riscv32-unknown-elf-gcc  -nostartfiles -Wl,-T,./riscv32.ld $1.s -o wiscv.o
    riscv32-unknown-elf-run -t wiscv.o 2> wiscv.golden_run
fi
if [ -f "wiscv.o" ]; then
    echo "Program Compilation Success" > ${1}_run.log
else
    echo "Program Compilation Failed"  > ${1}_run.log
    exit 1
fi
riscv32-unknown-elf-objdump  -D wiscv.o > wiscv.s
riscv32-unknown-elf-objcopy -O binary wiscv.o wiscv.bin
od -t x4 -v -An -w4 wiscv.bin  > wiscv.dump
cut -c2- wiscv.dump > wiscv.hex
perl ./extract_regs.pl -elf_run_out wiscv.golden_run
rm -rf wiscv.bin wiscv.dump wiscv.o
#awk '{print $2}' add_sum_with_printf_golden_run  > add_sum_with_printf_instr_pc_golden.hex
#awk '{print $4}' add_sum_with_printf_golden_run  > add_sum_with_printf_instr_funct_golden.hex
