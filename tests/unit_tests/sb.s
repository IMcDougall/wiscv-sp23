.global _start
_start:
      addi x16,x0,0xab
      addi x17,x0,0xcd
      addi x18,x0,0xef
      addi x19,x0,0x10
      addi x28,x0, 0x700
      sb x16,0(x28)
      sb x17,1(x28)
      sb x18,2(x28)
      sb x19,3(x28)
      lw x24,0(x28)
      j exit

exit: 
    li a7,93
    ecall

