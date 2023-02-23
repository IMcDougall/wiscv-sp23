# seed 1676715742
.global _start
_start:
addi x0, x0, 10 # icount 0
addi x1, x1, 220 # icount 1
addi x2, x2, 127 # icount 2
addi x3, x3, 25 # icount 3
addi x4, x4, 93 # icount 4
addi x5, x5, 122 # icount 5
addi x6, x6, 7 # icount 6
addi x7, x7, 143 # icount 7
addi x8, x8, 59 # icount 8
addi x9, x9, 59 # icount 9
addi x10, x10, 22 # icount 10
addi x11, x11, 166 # icount 11
addi x12, x12, 150 # icount 12
addi x13, x13, 234 # icount 13
addi x14, x14, 237 # icount 14
addi x15, x15, 214 # icount 15
addi x16, x16, 164 # icount 16
addi x17, x17, 27 # icount 17
addi x18, x18, 31 # icount 18
addi x19, x19, 41 # icount 19
addi x20, x20, 224 # icount 20
addi x21, x21, 134 # icount 21
addi x22, x22, 190 # icount 22
addi x23, x23, 11 # icount 23
addi x24, x24, 227 # icount 24
addi x25, x25, 23 # icount 25
addi x26, x26, 231 # icount 26
addi x27, x27, 111 # icount 27
addi x28, x28, 69 # icount 28
addi x29, x29, 75 # icount 29
addi x30, x30, 157 # icount 30
addi x31, x31, 36 # icount 31
slti x5, x14, 13 # icount 32
slti x8, x29, 11 # icount 33
slti x2, x27, 7 # icount 34
slti x14, x5, 11 # icount 35
slti x24, x21, 3 # icount 36
slti x17, x20, 5 # icount 37
slti x21, x23, 3 # icount 38
slti x16, x14, 10 # icount 39
slti x0, x8, 9 # icount 40
slti x25, x7, 15 # icount 41
slti x29, x7, 7 # icount 42
slti x8, x8, 3 # icount 43
slti x22, x17, 9 # icount 44
slti x23, x19, 1 # icount 45
slti x8, x27, 11 # icount 46
slti x0, x13, 1 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
