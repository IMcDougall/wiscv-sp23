.global _start
_start:
      addi x1,x0,0xffffffff
      addi x2,x0,2
      addi x3,x0,1
      addi x7,x0,1
      blt x1,x3,target_blt_pass
      j exit

exit: 
    li a7,93
    ecall

target_blt_pass:
    addi x4,x0,1
    blt x2,x1,target_blt_fail
    blt x7,x3,target_blt_fail
    j exit

target_blt_fail:
    addi x5,x0,1
    j exit
