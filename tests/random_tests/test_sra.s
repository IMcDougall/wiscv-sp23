# seed 1676715742
.global _start
_start:
addi x0, x0, 227 # icount 0
addi x1, x1, 165 # icount 1
addi x2, x2, 11 # icount 2
addi x3, x3, 3 # icount 3
addi x4, x4, 39 # icount 4
addi x5, x5, 186 # icount 5
addi x6, x6, 173 # icount 6
addi x7, x7, 94 # icount 7
addi x8, x8, 225 # icount 8
addi x9, x9, 82 # icount 9
addi x10, x10, 24 # icount 10
addi x11, x11, 119 # icount 11
addi x12, x12, 201 # icount 12
addi x13, x13, 179 # icount 13
addi x14, x14, 21 # icount 14
addi x15, x15, 252 # icount 15
addi x16, x16, 22 # icount 16
addi x17, x17, 218 # icount 17
addi x18, x18, 77 # icount 18
addi x19, x19, 169 # icount 19
addi x20, x20, 85 # icount 20
addi x21, x21, 25 # icount 21
addi x22, x22, 144 # icount 22
addi x23, x23, 62 # icount 23
addi x24, x24, 144 # icount 24
addi x25, x25, 97 # icount 25
addi x26, x26, 135 # icount 26
addi x27, x27, 8 # icount 27
addi x28, x28, 241 # icount 28
addi x29, x29, 206 # icount 29
addi x30, x30, 146 # icount 30
addi x31, x31, 116 # icount 31
sra x0, x4, x29 # icount 32
sra x10, x20, x22 # icount 33
sra x6, x16, x29 # icount 34
sra x16, x25, x8 # icount 35
sra x3, x25, x4 # icount 36
sra x8, x4, x16 # icount 37
sra x9, x4, x7 # icount 38
sra x6, x31, x20 # icount 39
sra x10, x29, x3 # icount 40
sra x13, x11, x21 # icount 41
sra x2, x30, x13 # icount 42
sra x13, x10, x18 # icount 43
sra x11, x1, x13 # icount 44
sra x15, x6, x4 # icount 45
sra x20, x4, x22 # icount 46
sra x22, x22, x12 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
