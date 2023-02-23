# seed 1676715742
.global _start
_start:
addi x0, x0, 198 # icount 0
addi x1, x1, 178 # icount 1
addi x2, x2, 106 # icount 2
addi x3, x3, 160 # icount 3
addi x4, x4, 74 # icount 4
addi x5, x5, 213 # icount 5
addi x6, x6, 59 # icount 6
addi x7, x7, 178 # icount 7
addi x8, x8, 59 # icount 8
addi x9, x9, 51 # icount 9
addi x10, x10, 142 # icount 10
addi x11, x11, 220 # icount 11
addi x12, x12, 148 # icount 12
addi x13, x13, 204 # icount 13
addi x14, x14, 191 # icount 14
addi x15, x15, 50 # icount 15
addi x16, x16, 44 # icount 16
addi x17, x17, 143 # icount 17
addi x18, x18, 195 # icount 18
addi x19, x19, 92 # icount 19
addi x20, x20, 205 # icount 20
addi x21, x21, 111 # icount 21
addi x22, x22, 138 # icount 22
addi x23, x23, 24 # icount 23
addi x24, x24, 36 # icount 24
addi x25, x25, 30 # icount 25
addi x26, x26, 183 # icount 26
addi x27, x27, 145 # icount 27
addi x28, x28, 112 # icount 28
addi x29, x29, 227 # icount 29
addi x30, x30, 136 # icount 30
addi x31, x31, 106 # icount 31
addi x21, x11, 12 # icount 32
addi x7, x22, 15 # icount 33
addi x3, x20, 14 # icount 34
addi x27, x10, 12 # icount 35
addi x16, x4, 10 # icount 36
addi x19, x20, 6 # icount 37
addi x11, x7, 9 # icount 38
addi x11, x5, 4 # icount 39
addi x21, x28, 10 # icount 40
addi x4, x18, 6 # icount 41
addi x26, x19, 4 # icount 42
addi x12, x27, 13 # icount 43
addi x12, x28, 3 # icount 44
addi x12, x31, 1 # icount 45
addi x5, x3, 0 # icount 46
addi x7, x17, 14 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
