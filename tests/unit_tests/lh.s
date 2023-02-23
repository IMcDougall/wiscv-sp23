.global _start
_start:
      addi x1,x0,0x678
      lui x1,0x12345
      addi x28,x0, 0x700
      sw x1,0(x28)
      lh x24,0(x28)
      lh x25,2(x28)
      j exit

exit: 
    li a7,93
    ecall

