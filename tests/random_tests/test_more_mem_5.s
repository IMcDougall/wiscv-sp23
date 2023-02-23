.global _start
_start:
addi x0, x0, 22572 # icount 0
addi x2, x2, 20 # icount 1
lh x2, 0(x0) # icount 2
addi x0, x0, 22572 # icount 3
lh x2, 0(x0) # icount 4
addi x0, x0, 22572 # icount 5
lb x2, 0(x0) # icount 6
j exit

exit:
li a7, 93 
ecall
