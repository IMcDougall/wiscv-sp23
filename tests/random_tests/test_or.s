# seed 1676715742
.global _start
_start:
addi x0, x0, 92 # icount 0
addi x1, x1, 142 # icount 1
addi x2, x2, 124 # icount 2
addi x3, x3, 179 # icount 3
addi x4, x4, 78 # icount 4
addi x5, x5, 80 # icount 5
addi x6, x6, 16 # icount 6
addi x7, x7, 225 # icount 7
addi x8, x8, 110 # icount 8
addi x9, x9, 66 # icount 9
addi x10, x10, 138 # icount 10
addi x11, x11, 98 # icount 11
addi x12, x12, 3 # icount 12
addi x13, x13, 69 # icount 13
addi x14, x14, 22 # icount 14
addi x15, x15, 211 # icount 15
addi x16, x16, 120 # icount 16
addi x17, x17, 185 # icount 17
addi x18, x18, 34 # icount 18
addi x19, x19, 25 # icount 19
addi x20, x20, 56 # icount 20
addi x21, x21, 231 # icount 21
addi x22, x22, 25 # icount 22
addi x23, x23, 121 # icount 23
addi x24, x24, 222 # icount 24
addi x25, x25, 42 # icount 25
addi x26, x26, 206 # icount 26
addi x27, x27, 220 # icount 27
addi x28, x28, 24 # icount 28
addi x29, x29, 38 # icount 29
addi x30, x30, 254 # icount 30
addi x31, x31, 253 # icount 31
or x15, x25, x20 # icount 32
or x3, x11, x6 # icount 33
or x6, x7, x26 # icount 34
or x10, x22, x2 # icount 35
or x31, x20, x22 # icount 36
or x8, x2, x6 # icount 37
or x3, x7, x23 # icount 38
or x3, x5, x7 # icount 39
or x8, x13, x5 # icount 40
or x14, x31, x19 # icount 41
or x18, x14, x4 # icount 42
or x14, x14, x18 # icount 43
or x6, x7, x4 # icount 44
or x4, x2, x24 # icount 45
or x22, x8, x30 # icount 46
or x25, x29, x31 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
