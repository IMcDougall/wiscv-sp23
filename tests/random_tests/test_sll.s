# seed 1676715742
.global _start
_start:
addi x0, x0, 96 # icount 0
addi x1, x1, 59 # icount 1
addi x2, x2, 241 # icount 2
addi x3, x3, 52 # icount 3
addi x4, x4, 161 # icount 4
addi x5, x5, 117 # icount 5
addi x6, x6, 167 # icount 6
addi x7, x7, 123 # icount 7
addi x8, x8, 74 # icount 8
addi x9, x9, 71 # icount 9
addi x10, x10, 105 # icount 10
addi x11, x11, 29 # icount 11
addi x12, x12, 0 # icount 12
addi x13, x13, 202 # icount 13
addi x14, x14, 0 # icount 14
addi x15, x15, 63 # icount 15
addi x16, x16, 199 # icount 16
addi x17, x17, 217 # icount 17
addi x18, x18, 5 # icount 18
addi x19, x19, 23 # icount 19
addi x20, x20, 84 # icount 20
addi x21, x21, 89 # icount 21
addi x22, x22, 233 # icount 22
addi x23, x23, 86 # icount 23
addi x24, x24, 94 # icount 24
addi x25, x25, 11 # icount 25
addi x26, x26, 151 # icount 26
addi x27, x27, 129 # icount 27
addi x28, x28, 115 # icount 28
addi x29, x29, 199 # icount 29
addi x30, x30, 192 # icount 30
addi x31, x31, 158 # icount 31
sll x31, x13, x14 # icount 32
sll x13, x8, x13 # icount 33
sll x30, x18, x5 # icount 34
sll x26, x2, x18 # icount 35
sll x2, x20, x22 # icount 36
sll x0, x5, x13 # icount 37
sll x7, x10, x3 # icount 38
sll x27, x27, x6 # icount 39
sll x15, x11, x5 # icount 40
sll x28, x24, x24 # icount 41
sll x24, x15, x2 # icount 42
sll x9, x31, x9 # icount 43
sll x6, x5, x21 # icount 44
sll x15, x12, x14 # icount 45
sll x31, x0, x20 # icount 46
sll x30, x15, x15 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
