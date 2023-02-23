.global _start
_start:
      addi x21,x0,0xffffffff
      addi x22,x0,2
      addi x23,x0,1
      addi x27,x0,1
      bgeu x21,x23,target_bgeu_pass
      j exit

exit: 
    li a7,93
    ecall

target_bgeu_pass:
    addi x24,x0,1
    bgeu x22,x21,target_bgeu_fail
    bgeu x27,x23,target_bgeu_pass2
    j exit

target_bgeu_pass2:
    addi x30,x0,1
    j exit

target_bgeu_fail:
    addi x25,x0,1
    j exit
