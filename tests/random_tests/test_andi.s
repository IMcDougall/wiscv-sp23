# seed 1676715742
.global _start
_start:
addi x0, x0, 189 # icount 0
addi x1, x1, 42 # icount 1
addi x2, x2, 54 # icount 2
addi x3, x3, 252 # icount 3
addi x4, x4, 202 # icount 4
addi x5, x5, 21 # icount 5
addi x6, x6, 62 # icount 6
addi x7, x7, 116 # icount 7
addi x8, x8, 29 # icount 8
addi x9, x9, 228 # icount 9
addi x10, x10, 114 # icount 10
addi x11, x11, 157 # icount 11
addi x12, x12, 192 # icount 12
addi x13, x13, 41 # icount 13
addi x14, x14, 124 # icount 14
addi x15, x15, 146 # icount 15
addi x16, x16, 176 # icount 16
addi x17, x17, 110 # icount 17
addi x18, x18, 184 # icount 18
addi x19, x19, 153 # icount 19
addi x20, x20, 204 # icount 20
addi x21, x21, 31 # icount 21
addi x22, x22, 1 # icount 22
addi x23, x23, 105 # icount 23
addi x24, x24, 174 # icount 24
addi x25, x25, 223 # icount 25
addi x26, x26, 12 # icount 26
addi x27, x27, 26 # icount 27
addi x28, x28, 37 # icount 28
addi x29, x29, 167 # icount 29
addi x30, x30, 82 # icount 30
addi x31, x31, 244 # icount 31
andi x26, x29, 13 # icount 32
andi x0, x18, 2 # icount 33
andi x19, x7, 11 # icount 34
andi x4, x11, 2 # icount 35
andi x12, x20, 14 # icount 36
andi x25, x23, 10 # icount 37
andi x6, x2, 0 # icount 38
andi x15, x10, 11 # icount 39
andi x25, x19, 3 # icount 40
andi x20, x14, 11 # icount 41
andi x12, x29, 11 # icount 42
andi x11, x16, 4 # icount 43
andi x25, x14, 2 # icount 44
andi x11, x14, 3 # icount 45
andi x21, x14, 7 # icount 46
andi x8, x0, 2 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
