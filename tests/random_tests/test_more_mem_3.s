.global _start
_start:
addi x0, x0, 0x08 # icount 0
addi x4, x4, 0x02 # icount 1
addi x5, x5, 0x04 # icount 2
sw x3, 2(x0) # icount 3
sw x4, 2(x0) # icount 4
sw x5, 2(x0) # icount 5
sw x3, 2(x0) # icount 6
sw x4, 2(x0) # icount 7
sw x5, 2(x0) # icount 8
sw x3, 2(x0) # icount 9
sw x4, 2(x0) # icount 10
sw x5, 2(x0) # icount 11
sw x3, 2(x0) # icount 12
sw x4, 2(x0) # icount 13
sw x5, 2(x0) # icount 14
sw x3, 2(x0) # icount 15
sw x4, 2(x0) # icount 16
sw x5, 2(x0) # icount 17
sw x3, 2(x0) # icount 18
sw x4, 2(x0) # icount 19
sw x5, 2(x0) # icount 20
j exit

exit:
li a7, 93 
ecall
