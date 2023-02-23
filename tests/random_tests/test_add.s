# seed 1676715742
.global _start
_start:
addi x0, x0, 71 # icount 0
addi x1, x1, 207 # icount 1
addi x2, x2, 108 # icount 2
addi x3, x3, 175 # icount 3
addi x4, x4, 183 # icount 4
addi x5, x5, 66 # icount 5
addi x6, x6, 65 # icount 6
addi x7, x7, 184 # icount 7
addi x8, x8, 208 # icount 8
addi x9, x9, 219 # icount 9
addi x10, x10, 3 # icount 10
addi x11, x11, 19 # icount 11
addi x12, x12, 15 # icount 12
addi x13, x13, 11 # icount 13
addi x14, x14, 143 # icount 14
addi x15, x15, 228 # icount 15
addi x16, x16, 136 # icount 16
addi x17, x17, 221 # icount 17
addi x18, x18, 111 # icount 18
addi x19, x19, 87 # icount 19
addi x20, x20, 219 # icount 20
addi x21, x21, 18 # icount 21
addi x22, x22, 12 # icount 22
addi x23, x23, 131 # icount 23
addi x24, x24, 24 # icount 24
addi x25, x25, 248 # icount 25
addi x26, x26, 174 # icount 26
addi x27, x27, 81 # icount 27
addi x28, x28, 104 # icount 28
addi x29, x29, 208 # icount 29
addi x30, x30, 10 # icount 30
addi x31, x31, 64 # icount 31
add x25, x14, x10 # icount 32
add x7, x11, x24 # icount 33
add x2, x18, x4 # icount 34
add x19, x29, x18 # icount 35
add x16, x2, x6 # icount 36
add x15, x15, x6 # icount 37
add x8, x1, x23 # icount 38
add x8, x29, x21 # icount 39
add x9, x11, x9 # icount 40
add x20, x9, x26 # icount 41
add x3, x17, x18 # icount 42
add x14, x4, x14 # icount 43
add x2, x19, x31 # icount 44
add x13, x23, x18 # icount 45
add x13, x0, x27 # icount 46
add x15, x30, x12 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
