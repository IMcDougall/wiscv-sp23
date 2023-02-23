.global _start
_start:
      addi x16,x0,0x7cd
      lui x16,0xfedcb
      addi x19,x0,0xffffffff
      addi x28,x19, 0x700
      addi x29,x0, 0x700
      sw x16,1(x28)
      lw x24,0(x29)
      j exit

exit: 
    li a7,93
    ecall

