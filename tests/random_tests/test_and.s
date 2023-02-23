# seed 1676715742
.global _start
_start:
addi x0, x0, 191 # icount 0
addi x1, x1, 193 # icount 1
addi x2, x2, 149 # icount 2
addi x3, x3, 221 # icount 3
addi x4, x4, 250 # icount 4
addi x5, x5, 62 # icount 5
addi x6, x6, 70 # icount 6
addi x7, x7, 91 # icount 7
addi x8, x8, 105 # icount 8
addi x9, x9, 153 # icount 9
addi x10, x10, 109 # icount 10
addi x11, x11, 175 # icount 11
addi x12, x12, 64 # icount 12
addi x13, x13, 169 # icount 13
addi x14, x14, 150 # icount 14
addi x15, x15, 234 # icount 15
addi x16, x16, 154 # icount 16
addi x17, x17, 129 # icount 17
addi x18, x18, 59 # icount 18
addi x19, x19, 104 # icount 19
addi x20, x20, 14 # icount 20
addi x21, x21, 178 # icount 21
addi x22, x22, 168 # icount 22
addi x23, x23, 169 # icount 23
addi x24, x24, 183 # icount 24
addi x25, x25, 244 # icount 25
addi x26, x26, 186 # icount 26
addi x27, x27, 24 # icount 27
addi x28, x28, 58 # icount 28
addi x29, x29, 244 # icount 29
addi x30, x30, 220 # icount 30
addi x31, x31, 42 # icount 31
and x18, x7, x23 # icount 32
and x7, x19, x3 # icount 33
and x25, x3, x5 # icount 34
and x2, x18, x14 # icount 35
and x7, x7, x9 # icount 36
and x21, x9, x16 # icount 37
and x16, x26, x14 # icount 38
and x17, x13, x15 # icount 39
and x6, x7, x8 # icount 40
and x6, x12, x3 # icount 41
and x7, x22, x1 # icount 42
and x25, x10, x2 # icount 43
and x17, x30, x1 # icount 44
and x19, x18, x30 # icount 45
and x25, x29, x0 # icount 46
and x9, x28, x14 # icount 47
j exit # icount 48

exit: # icount 49
li a7, 93 # icount 50
ecall # icount 51
