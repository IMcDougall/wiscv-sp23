.global _start
_start:
      addi x1,x0,0x0101
      slti x2,x1,0xfffff800
      addi x4,x0,0xfffff801
      slti x5,x4,0x0303
      j exit

exit: 
    li a7,93
    ecall

