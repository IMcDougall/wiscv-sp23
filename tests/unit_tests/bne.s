.global _start
_start:
      addi x1,x0,1
      addi x2,x0,2
      addi x3,x0,1
      bne x1,x2,target_bne_pass
      j exit

exit: 
    li a7,93
    ecall

target_bne_pass:
    addi x4,x0,1
    bne x1,x3,target_bne_fail
    j exit

target_bne_fail:
    addi x5,x0,1
    j exit
