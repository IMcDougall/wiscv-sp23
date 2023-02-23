#.section .init, "ax"
.global _start
_start:
    .cfi_startproc
    .cfi_undefined ra
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop
    la sp, __stack_top
    add s0, sp, zero
    jal ra, main
    jal  _exit
    .cfi_endproc

#.section .fini, "ax"
.global _exit
_exit:
    .cfi_startproc
    li a7,93
    ecall
    .cfi_endproc
.end
