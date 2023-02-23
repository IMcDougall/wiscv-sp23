# seed 1676715742
.global _start
_start:
addi x0, x0, 205 # icount 0
addi x1, x1, 83 # icount 1
addi x2, x2, 7 # icount 2
addi x3, x3, 128 # icount 3
addi x4, x4, 22 # icount 4
addi x5, x5, 197 # icount 5
addi x6, x6, 194 # icount 6
addi x7, x7, 35 # icount 7
addi x8, x8, 94 # icount 8
addi x9, x9, 144 # icount 9
addi x10, x10, 251 # icount 10
addi x11, x11, 241 # icount 11
addi x12, x12, 55 # icount 12
addi x13, x13, 179 # icount 13
addi x14, x14, 195 # icount 14
addi x15, x15, 158 # icount 15
addi x16, x16, 79 # icount 16
addi x17, x17, 34 # icount 17
addi x18, x18, 221 # icount 18
addi x19, x19, 244 # icount 19
addi x20, x20, 245 # icount 20
addi x21, x21, 119 # icount 21
addi x22, x22, 162 # icount 22
addi x23, x23, 164 # icount 23
addi x24, x24, 168 # icount 24
addi x25, x25, 8 # icount 25
addi x26, x26, 35 # icount 26
addi x27, x27, 74 # icount 27
addi x28, x28, 218 # icount 28
addi x29, x29, 191 # icount 29
addi x30, x30, 130 # icount 30
addi x31, x31, 205 # icount 31
srai x4, x10, 5 # icount 32
srai x18, x16, 10 # icount 33
srai x3, x8, 3 # icount 34
srai x23, x16, 1 # icount 35
srai x6, x20, 10 # icount 36
srai x24, x14, 9 # icount 37
srai x3, x19, 0 # icount 38
srai x2, x10, 5 # icount 39
srai x12, x11, 14 # icount 40
srai x4, x7, 7 # icount 41
srai x21, x2, 8 # icount 42
srai x12, x6, 0 # icount 43
srai x14, x25, 10 # icount 44
srai x7, x20, 6 # icount 45
srai x20, x26, 10 # icount 46
srai x0, x12, 9 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
