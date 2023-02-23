.global _start
_start:
      addi x1,x0,0xffffffff
      addi x2,x0,2
      addi x3,x0,1
      addi x7,x0,1
      bge x3,x1,target_bge_pass
      j exit

exit: 
    li a7,93
    ecall

target_bge_pass:
    addi x4,x0,1
    bge x1,x2,target_bge_fail
    bge x7,x3,target_bge_pass2
    j exit

target_bge_pass2:
    addi x10,x0,1
    j exit

target_bge_fail:
    addi x5,x0,1
    j exit
