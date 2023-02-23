# seed 1676715742
.global _start
_start:
addi x0, x0, 100 # icount 0
addi x1, x1, 254 # icount 1
addi x2, x2, 179 # icount 2
addi x3, x3, 58 # icount 3
addi x4, x4, 18 # icount 4
addi x5, x5, 61 # icount 5
addi x6, x6, 194 # icount 6
addi x7, x7, 4 # icount 7
addi x8, x8, 208 # icount 8
addi x9, x9, 194 # icount 9
addi x10, x10, 190 # icount 10
addi x11, x11, 45 # icount 11
addi x12, x12, 185 # icount 12
addi x13, x13, 94 # icount 13
addi x14, x14, 13 # icount 14
addi x15, x15, 194 # icount 15
addi x16, x16, 227 # icount 16
addi x17, x17, 199 # icount 17
addi x18, x18, 120 # icount 18
addi x19, x19, 251 # icount 19
addi x20, x20, 245 # icount 20
addi x21, x21, 127 # icount 21
addi x22, x22, 164 # icount 22
addi x23, x23, 0 # icount 23
addi x24, x24, 213 # icount 24
addi x25, x25, 159 # icount 25
addi x26, x26, 103 # icount 26
addi x27, x27, 10 # icount 27
addi x28, x28, 64 # icount 28
addi x29, x29, 97 # icount 29
addi x30, x30, 190 # icount 30
addi x31, x31, 244 # icount 31
srli x12, x12, 11 # icount 32
srli x9, x25, 12 # icount 33
srli x6, x21, 6 # icount 34
srli x12, x3, 5 # icount 35
srli x11, x27, 11 # icount 36
srli x19, x3, 10 # icount 37
srli x4, x20, 14 # icount 38
srli x10, x14, 5 # icount 39
srli x6, x17, 10 # icount 40
srli x11, x0, 1 # icount 41
srli x8, x24, 9 # icount 42
srli x15, x9, 8 # icount 43
srli x10, x3, 12 # icount 44
srli x17, x19, 3 # icount 45
srli x19, x27, 5 # icount 46
srli x22, x10, 1 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
