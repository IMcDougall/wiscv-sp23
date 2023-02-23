# seed 1676715742
.global _start
_start:
addi x0, x0, 115 # icount 0
addi x1, x1, 131 # icount 1
addi x2, x2, 113 # icount 2
addi x3, x3, 210 # icount 3
addi x4, x4, 0 # icount 4
addi x5, x5, 138 # icount 5
addi x6, x6, 150 # icount 6
addi x7, x7, 233 # icount 7
addi x8, x8, 198 # icount 8
addi x9, x9, 96 # icount 9
addi x10, x10, 96 # icount 10
addi x11, x11, 105 # icount 11
addi x12, x12, 224 # icount 12
addi x13, x13, 159 # icount 13
addi x14, x14, 250 # icount 14
addi x15, x15, 193 # icount 15
addi x16, x16, 99 # icount 16
addi x17, x17, 95 # icount 17
addi x18, x18, 46 # icount 18
addi x19, x19, 208 # icount 19
addi x20, x20, 212 # icount 20
addi x21, x21, 241 # icount 21
addi x22, x22, 233 # icount 22
addi x23, x23, 145 # icount 23
addi x24, x24, 120 # icount 24
addi x25, x25, 205 # icount 25
addi x26, x26, 114 # icount 26
addi x27, x27, 30 # icount 27
addi x28, x28, 135 # icount 28
addi x29, x29, 161 # icount 29
addi x30, x30, 185 # icount 30
addi x31, x31, 96 # icount 31
ori x21, x0, 14 # icount 32
ori x11, x18, 3 # icount 33
ori x20, x6, 1 # icount 34
ori x2, x14, 8 # icount 35
ori x16, x24, 9 # icount 36
ori x0, x24, 11 # icount 37
ori x0, x30, 14 # icount 38
ori x5, x16, 2 # icount 39
ori x0, x17, 1 # icount 40
ori x25, x0, 4 # icount 41
ori x1, x1, 9 # icount 42
ori x30, x22, 12 # icount 43
ori x1, x0, 7 # icount 44
ori x9, x30, 15 # icount 45
ori x16, x10, 13 # icount 46
ori x0, x0, 6 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
