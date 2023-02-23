.global _start
_start:
lw x2, 2(x1) # icount 0
addi x1, x1, 1 # icount 1
lw x2, 2(x1) # icount 2
addi x1, x1, 1 # icount 3
lw x2, 2(x1) # icount 4
addi x1, x1, 1 # icount 5
lbu x2, 2(x1) # icount 6
addi x1, x1, 1 # icount 7
lbu x2, 2(x1) # icount 8
addi x1, x1, 1 # icount 9
lw x2, 2(x1) # icount 10
addi x1, x1, 1 # icount 11
lw x2, 2(x1) # icount 12
addi x1, x1, 1 # icount 13
lh x2, 2(x1) # icount 14
addi x1, x1, 1 # icount 15
lw x2, 2(x1) # icount 16
addi x1, x1, 1 # icount 17
j exit

exit:
li a7, 93 
ecall
