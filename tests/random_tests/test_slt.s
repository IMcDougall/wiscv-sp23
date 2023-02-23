# seed 1676715742
.global _start
_start:
addi x0, x0, 61 # icount 0
addi x1, x1, 166 # icount 1
addi x2, x2, 139 # icount 2
addi x3, x3, 104 # icount 3
addi x4, x4, 53 # icount 4
addi x5, x5, 224 # icount 5
addi x6, x6, 241 # icount 6
addi x7, x7, 197 # icount 7
addi x8, x8, 104 # icount 8
addi x9, x9, 20 # icount 9
addi x10, x10, 40 # icount 10
addi x11, x11, 87 # icount 11
addi x12, x12, 21 # icount 12
addi x13, x13, 52 # icount 13
addi x14, x14, 57 # icount 14
addi x15, x15, 65 # icount 15
addi x16, x16, 241 # icount 16
addi x17, x17, 226 # icount 17
addi x18, x18, 144 # icount 18
addi x19, x19, 50 # icount 19
addi x20, x20, 133 # icount 20
addi x21, x21, 41 # icount 21
addi x22, x22, 131 # icount 22
addi x23, x23, 252 # icount 23
addi x24, x24, 172 # icount 24
addi x25, x25, 121 # icount 25
addi x26, x26, 173 # icount 26
addi x27, x27, 195 # icount 27
addi x28, x28, 10 # icount 28
addi x29, x29, 80 # icount 29
addi x30, x30, 250 # icount 30
addi x31, x31, 184 # icount 31
slt x7, x15, x2 # icount 32
slt x16, x6, x3 # icount 33
slt x26, x15, x27 # icount 34
slt x7, x9, x2 # icount 35
slt x24, x18, x26 # icount 36
slt x9, x17, x10 # icount 37
slt x5, x13, x7 # icount 38
slt x21, x21, x15 # icount 39
slt x1, x10, x11 # icount 40
slt x29, x21, x21 # icount 41
slt x3, x31, x26 # icount 42
slt x7, x31, x9 # icount 43
slt x23, x16, x5 # icount 44
slt x28, x21, x24 # icount 45
slt x25, x17, x17 # icount 46
slt x9, x1, x31 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
