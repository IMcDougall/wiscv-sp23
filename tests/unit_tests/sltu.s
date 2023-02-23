.global _start
_start:
      addi x1,x0,0x0101
      addi x3,x0,0xfffff800
      sltu x2,x1,x3
      addi x4,x0,0xfffff801
      addi x6,x0,0x0303
      sltu x5,x4,x6
      j exit

exit: 
    li a7,93
    ecall

