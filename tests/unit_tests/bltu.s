.global _start
_start:
      addi x11,x0,0xffffffff
      addi x12,x0,2
      addi x13,x0,1
      addi x17,x0,1
      bltu x13,x11,target_bltu_pass
      j exit

exit: 
    li a7,93
    ecall

target_bltu_pass:
    addi x14,x0,1
    bltu x12,x13,target_bltu_fail
    bltu x17,x13,target_bltu_fail
    j exit

target_bltu_fail:
    addi x15,x0,1
    j exit
