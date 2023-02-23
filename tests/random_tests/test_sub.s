# seed 1676715742
.global _start
_start:
addi x0, x0, 121 # icount 0
addi x1, x1, 222 # icount 1
addi x2, x2, 238 # icount 2
addi x3, x3, 27 # icount 3
addi x4, x4, 53 # icount 4
addi x5, x5, 236 # icount 5
addi x6, x6, 111 # icount 6
addi x7, x7, 233 # icount 7
addi x8, x8, 102 # icount 8
addi x9, x9, 123 # icount 9
addi x10, x10, 4 # icount 10
addi x11, x11, 145 # icount 11
addi x12, x12, 91 # icount 12
addi x13, x13, 225 # icount 13
addi x14, x14, 33 # icount 14
addi x15, x15, 168 # icount 15
addi x16, x16, 177 # icount 16
addi x17, x17, 219 # icount 17
addi x18, x18, 245 # icount 18
addi x19, x19, 47 # icount 19
addi x20, x20, 81 # icount 20
addi x21, x21, 239 # icount 21
addi x22, x22, 92 # icount 22
addi x23, x23, 235 # icount 23
addi x24, x24, 91 # icount 24
addi x25, x25, 202 # icount 25
addi x26, x26, 255 # icount 26
addi x27, x27, 186 # icount 27
addi x28, x28, 188 # icount 28
addi x29, x29, 135 # icount 29
addi x30, x30, 192 # icount 30
addi x31, x31, 74 # icount 31
sub x22, x4, x0 # icount 32
sub x2, x11, x4 # icount 33
sub x15, x0, x13 # icount 34
sub x8, x26, x3 # icount 35
sub x17, x19, x22 # icount 36
sub x13, x3, x27 # icount 37
sub x29, x11, x12 # icount 38
sub x23, x2, x27 # icount 39
sub x3, x18, x20 # icount 40
sub x4, x30, x23 # icount 41
sub x8, x13, x28 # icount 42
sub x31, x0, x9 # icount 43
sub x24, x8, x12 # icount 44
sub x6, x18, x15 # icount 45
sub x3, x12, x28 # icount 46
sub x5, x3, x7 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
