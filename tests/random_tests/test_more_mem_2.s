.global _start
_start:
sw x3, 2(x0) # icount 0
addi x0, x0, 1 # icount 1
sw x3, 2(x0) # icount 2
addi x0, x0, 1 # icount 3
sw x3, 2(x0) # icount 4
addi x0, x0, 1 # icount 5
sw x3, 2(x0) # icount 6
addi x0, x0, 1 # icount 7
sw x3, 2(x0) # icount 8
addi x0, x0, 1 # icount 9
sw x3, 2(x0) # icount 10
addi x0, x0, 1 # icount 11
sw x3, 2(x0) # icount 12
addi x0, x0, 1 # icount 13
sw x3, 2(x0) # icount 14
addi x0, x0, 1 # icount 15
sw x3, 2(x0) # icount 16
addi x0, x0, 1 # icount 17
sw x3, 2(x0) # icount 18
addi x0, x0, 1 # icount 19
j exit

exit:
li a7, 93 
ecall
