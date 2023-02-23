# seed 1676715742
.global _start
_start:
addi x0, x0, 67 # icount 0
addi x1, x1, 58 # icount 1
addi x2, x2, 182 # icount 2
addi x3, x3, 157 # icount 3
addi x4, x4, 150 # icount 4
addi x5, x5, 136 # icount 5
addi x6, x6, 96 # icount 6
addi x7, x7, 132 # icount 7
addi x8, x8, 30 # icount 8
addi x9, x9, 211 # icount 9
addi x10, x10, 63 # icount 10
addi x11, x11, 135 # icount 11
addi x12, x12, 16 # icount 12
addi x13, x13, 204 # icount 13
addi x14, x14, 246 # icount 14
addi x15, x15, 100 # icount 15
addi x16, x16, 121 # icount 16
addi x17, x17, 194 # icount 17
addi x18, x18, 156 # icount 18
addi x19, x19, 141 # icount 19
addi x20, x20, 192 # icount 20
addi x21, x21, 23 # icount 21
addi x22, x22, 46 # icount 22
addi x23, x23, 60 # icount 23
addi x24, x24, 175 # icount 24
addi x25, x25, 32 # icount 25
addi x26, x26, 7 # icount 26
addi x27, x27, 149 # icount 27
addi x28, x28, 55 # icount 28
addi x29, x29, 118 # icount 29
addi x30, x30, 74 # icount 30
addi x31, x31, 132 # icount 31
xor x16, x10, x4 # icount 32
xor x19, x15, x25 # icount 33
xor x15, x9, x20 # icount 34
xor x24, x20, x5 # icount 35
xor x12, x21, x12 # icount 36
xor x12, x16, x19 # icount 37
xor x19, x6, x1 # icount 38
xor x14, x4, x15 # icount 39
xor x23, x11, x9 # icount 40
xor x1, x27, x23 # icount 41
xor x7, x14, x8 # icount 42
xor x22, x29, x9 # icount 43
xor x24, x3, x21 # icount 44
xor x17, x10, x16 # icount 45
xor x18, x9, x0 # icount 46
xor x9, x2, x17 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
