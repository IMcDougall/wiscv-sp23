# seed 1676715742
.global _start
_start:
addi x0, x0, 201 # icount 0
addi x1, x1, 101 # icount 1
addi x2, x2, 63 # icount 2
addi x3, x3, 250 # icount 3
addi x4, x4, 90 # icount 4
addi x5, x5, 124 # icount 5
addi x6, x6, 83 # icount 6
addi x7, x7, 136 # icount 7
addi x8, x8, 100 # icount 8
addi x9, x9, 240 # icount 9
addi x10, x10, 103 # icount 10
addi x11, x11, 199 # icount 11
addi x12, x12, 56 # icount 12
addi x13, x13, 105 # icount 13
addi x14, x14, 161 # icount 14
addi x15, x15, 104 # icount 15
addi x16, x16, 223 # icount 16
addi x17, x17, 37 # icount 17
addi x18, x18, 142 # icount 18
addi x19, x19, 212 # icount 19
addi x20, x20, 232 # icount 20
addi x21, x21, 170 # icount 21
addi x22, x22, 107 # icount 22
addi x23, x23, 131 # icount 23
addi x24, x24, 98 # icount 24
addi x25, x25, 41 # icount 25
addi x26, x26, 158 # icount 26
addi x27, x27, 101 # icount 27
addi x28, x28, 61 # icount 28
addi x29, x29, 222 # icount 29
addi x30, x30, 42 # icount 30
addi x31, x31, 46 # icount 31
sltiu x20, x4, 8 # icount 32
sltiu x7, x28, 8 # icount 33
sltiu x22, x0, 14 # icount 34
sltiu x24, x21, 15 # icount 35
sltiu x22, x24, 4 # icount 36
sltiu x12, x3, 12 # icount 37
sltiu x6, x0, 3 # icount 38
sltiu x27, x18, 11 # icount 39
sltiu x13, x9, 4 # icount 40
sltiu x5, x20, 2 # icount 41
sltiu x4, x1, 3 # icount 42
sltiu x25, x4, 9 # icount 43
sltiu x2, x10, 15 # icount 44
sltiu x15, x15, 15 # icount 45
sltiu x26, x16, 15 # icount 46
sltiu x12, x2, 4 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
