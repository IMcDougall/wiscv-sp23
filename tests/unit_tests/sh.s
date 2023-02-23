.global _start
_start:
      addi x16,x0,0x7cd
      addi x17,x0,0x6ab
      addi x28,x0, 0x700
      sh x16,0(x28)
      sh x17,2(x28)
      lw x24,0(x28)
      j exit

exit: 
    li a7,93
    ecall

