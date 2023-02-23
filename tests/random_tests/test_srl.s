# seed 1676715742
.global _start
_start:
addi x0, x0, 202 # icount 0
addi x1, x1, 226 # icount 1
addi x2, x2, 90 # icount 2
addi x3, x3, 106 # icount 3
addi x4, x4, 233 # icount 4
addi x5, x5, 109 # icount 5
addi x6, x6, 235 # icount 6
addi x7, x7, 255 # icount 7
addi x8, x8, 10 # icount 8
addi x9, x9, 33 # icount 9
addi x10, x10, 131 # icount 10
addi x11, x11, 83 # icount 11
addi x12, x12, 116 # icount 12
addi x13, x13, 206 # icount 13
addi x14, x14, 93 # icount 14
addi x15, x15, 43 # icount 15
addi x16, x16, 30 # icount 16
addi x17, x17, 119 # icount 17
addi x18, x18, 191 # icount 18
addi x19, x19, 193 # icount 19
addi x20, x20, 210 # icount 20
addi x21, x21, 93 # icount 21
addi x22, x22, 53 # icount 22
addi x23, x23, 166 # icount 23
addi x24, x24, 40 # icount 24
addi x25, x25, 9 # icount 25
addi x26, x26, 198 # icount 26
addi x27, x27, 50 # icount 27
addi x28, x28, 141 # icount 28
addi x29, x29, 57 # icount 29
addi x30, x30, 160 # icount 30
addi x31, x31, 131 # icount 31
srl x8, x7, x16 # icount 32
srl x15, x19, x3 # icount 33
srl x5, x24, x1 # icount 34
srl x4, x9, x26 # icount 35
srl x2, x13, x1 # icount 36
srl x14, x2, x21 # icount 37
srl x30, x27, x4 # icount 38
srl x12, x5, x13 # icount 39
srl x15, x12, x3 # icount 40
srl x4, x13, x21 # icount 41
srl x13, x1, x9 # icount 42
srl x15, x25, x18 # icount 43
srl x2, x12, x25 # icount 44
srl x28, x29, x4 # icount 45
srl x25, x16, x29 # icount 46
srl x7, x26, x5 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
