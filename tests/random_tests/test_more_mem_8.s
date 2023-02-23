.global _start
_start:
addi x1, x1, 14352 # icount 0
addi x2, x2, 40 # icount 1
sw x2, 0(x1) # icount 2
lbu x4, 0(x1) # icount 3
j exit

exit:
li a7, 93 
ecall
