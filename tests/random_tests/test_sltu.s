# seed 1676715742
.global _start
_start:
addi x0, x0, 4 # icount 0
addi x1, x1, 163 # icount 1
addi x2, x2, 139 # icount 2
addi x3, x3, 1 # icount 3
addi x4, x4, 157 # icount 4
addi x5, x5, 154 # icount 5
addi x6, x6, 40 # icount 6
addi x7, x7, 215 # icount 7
addi x8, x8, 242 # icount 8
addi x9, x9, 125 # icount 9
addi x10, x10, 226 # icount 10
addi x11, x11, 40 # icount 11
addi x12, x12, 23 # icount 12
addi x13, x13, 73 # icount 13
addi x14, x14, 226 # icount 14
addi x15, x15, 185 # icount 15
addi x16, x16, 215 # icount 16
addi x17, x17, 206 # icount 17
addi x18, x18, 159 # icount 18
addi x19, x19, 105 # icount 19
addi x20, x20, 162 # icount 20
addi x21, x21, 122 # icount 21
addi x22, x22, 169 # icount 22
addi x23, x23, 19 # icount 23
addi x24, x24, 187 # icount 24
addi x25, x25, 253 # icount 25
addi x26, x26, 213 # icount 26
addi x27, x27, 100 # icount 27
addi x28, x28, 128 # icount 28
addi x29, x29, 86 # icount 29
addi x30, x30, 148 # icount 30
addi x31, x31, 97 # icount 31
sltu x18, x12, x20 # icount 32
sltu x9, x30, x28 # icount 33
sltu x22, x14, x25 # icount 34
sltu x5, x12, x22 # icount 35
sltu x14, x14, x16 # icount 36
sltu x5, x24, x12 # icount 37
sltu x12, x11, x27 # icount 38
sltu x4, x2, x14 # icount 39
sltu x31, x20, x15 # icount 40
sltu x14, x16, x9 # icount 41
sltu x23, x0, x28 # icount 42
sltu x22, x6, x12 # icount 43
sltu x23, x17, x2 # icount 44
sltu x0, x31, x25 # icount 45
sltu x27, x27, x6 # icount 46
sltu x11, x31, x9 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
