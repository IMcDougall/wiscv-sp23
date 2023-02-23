# seed 1676715742
.global _start
_start:
addi x0, x0, 20 # icount 0
addi x1, x1, 206 # icount 1
addi x2, x2, 80 # icount 2
addi x3, x3, 78 # icount 3
addi x4, x4, 254 # icount 4
addi x5, x5, 113 # icount 5
addi x6, x6, 138 # icount 6
addi x7, x7, 224 # icount 7
addi x8, x8, 249 # icount 8
addi x9, x9, 1 # icount 9
addi x10, x10, 12 # icount 10
addi x11, x11, 159 # icount 11
addi x12, x12, 33 # icount 12
addi x13, x13, 118 # icount 13
addi x14, x14, 119 # icount 14
addi x15, x15, 202 # icount 15
addi x16, x16, 153 # icount 16
addi x17, x17, 152 # icount 17
addi x18, x18, 111 # icount 18
addi x19, x19, 121 # icount 19
addi x20, x20, 58 # icount 20
addi x21, x21, 136 # icount 21
addi x22, x22, 156 # icount 22
addi x23, x23, 29 # icount 23
addi x24, x24, 198 # icount 24
addi x25, x25, 137 # icount 25
addi x26, x26, 25 # icount 26
addi x27, x27, 210 # icount 27
addi x28, x28, 232 # icount 28
addi x29, x29, 83 # icount 29
addi x30, x30, 50 # icount 30
addi x31, x31, 138 # icount 31
xori x6, x9, 11 # icount 32
xori x13, x15, 12 # icount 33
xori x11, x10, 5 # icount 34
xori x0, x14, 2 # icount 35
xori x24, x6, 15 # icount 36
xori x16, x5, 12 # icount 37
xori x27, x10, 9 # icount 38
xori x27, x28, 8 # icount 39
xori x29, x18, 10 # icount 40
xori x3, x27, 7 # icount 41
xori x12, x13, 8 # icount 42
xori x16, x1, 2 # icount 43
xori x30, x3, 15 # icount 44
xori x11, x26, 6 # icount 45
xori x18, x10, 7 # icount 46
xori x11, x30, 12 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
