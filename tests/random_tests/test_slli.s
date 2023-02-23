# seed 1676715742
.global _start
_start:
addi x0, x0, 92 # icount 0
addi x1, x1, 125 # icount 1
addi x2, x2, 207 # icount 2
addi x3, x3, 153 # icount 3
addi x4, x4, 235 # icount 4
addi x5, x5, 210 # icount 5
addi x6, x6, 0 # icount 6
addi x7, x7, 178 # icount 7
addi x8, x8, 154 # icount 8
addi x9, x9, 99 # icount 9
addi x10, x10, 255 # icount 10
addi x11, x11, 17 # icount 11
addi x12, x12, 159 # icount 12
addi x13, x13, 26 # icount 13
addi x14, x14, 22 # icount 14
addi x15, x15, 130 # icount 15
addi x16, x16, 65 # icount 16
addi x17, x17, 84 # icount 17
addi x18, x18, 133 # icount 18
addi x19, x19, 132 # icount 19
addi x20, x20, 58 # icount 20
addi x21, x21, 152 # icount 21
addi x22, x22, 114 # icount 22
addi x23, x23, 121 # icount 23
addi x24, x24, 182 # icount 24
addi x25, x25, 5 # icount 25
addi x26, x26, 195 # icount 26
addi x27, x27, 62 # icount 27
addi x28, x28, 120 # icount 28
addi x29, x29, 18 # icount 29
addi x30, x30, 5 # icount 30
addi x31, x31, 33 # icount 31
slli x23, x4, 3 # icount 32
slli x9, x19, 8 # icount 33
slli x18, x11, 5 # icount 34
slli x15, x17, 12 # icount 35
slli x18, x9, 11 # icount 36
slli x9, x19, 1 # icount 37
slli x2, x31, 13 # icount 38
slli x5, x20, 3 # icount 39
slli x18, x10, 0 # icount 40
slli x6, x30, 0 # icount 41
slli x20, x22, 10 # icount 42
slli x29, x25, 9 # icount 43
slli x20, x14, 14 # icount 44
slli x21, x16, 10 # icount 45
slli x12, x25, 4 # icount 46
slli x18, x25, 14 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
