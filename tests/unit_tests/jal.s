.global _start
_start:
      jal x0,target_x0
      jal x1,target_x1
      jal x2,target_x2
      jal x3,target_x3
      jal x4,target_x4
      jal x5,target_x5
      jal x6,target_x6
      jal x7,target_x7
      jal x8,target_x8
      jal x9,target_x9
      jal x10,target_x10
      jal x11,target_x11
      jal x12,target_x12
      jal x13,target_x13
      jal x14,target_x14
      jal x15,target_x15
      jal x16,target_x16
      jal x17,target_x17
      jal x18,target_x18
      jal x19,target_x19
      jal x20,target_x20
      jal x21,target_x21
      jal x22,target_x22
      jal x23,target_x23
      jal x24,target_x24
      jal x25,target_x25
      jal x26,target_x26
      jal x27,target_x27
      jal x28,target_x28
      jal x29,target_x29
      jal x30,target_x30
      jal x31,target_x31
      j exit
exit: 
    li a7,93
    ecall

target_x0:
     j _start+4
target_x1:
     addi x1,x1,0
     ret
target_x2:
     addi x1,x2,0
     ret
target_x3:
     addi x1,x3,0
     ret
target_x4:
     addi x1,x4,0
     ret
target_x5:
     addi x1,x5,0
     ret
target_x6:
     addi x1,x6,0
     ret
target_x7:
     addi x1,x7,0
     ret
target_x8:
     addi x1,x8,0
     ret
target_x9:
     addi x1,x9,0
     ret
target_x10:
     addi x1,x10,0
     ret
target_x11:
     addi x1,x11,0
     ret
target_x12:
     addi x1,x12,0
     ret
target_x13:
     addi x1,x13,0
     ret
target_x14:
     addi x1,x14,0
     ret
target_x15:
     addi x1,x15,0
     ret
target_x16:
     addi x1,x16,0
     ret
target_x17:
     addi x1,x17,0
     ret
target_x18:
     addi x1,x18,0
     ret
target_x19:
     addi x1,x19,0
     ret
target_x20:
     addi x1,x20,0
     ret
target_x21:
     addi x1,x21,0
     ret
target_x22:
     addi x1,x22,0
     ret
target_x23:
     addi x1,x23,0
     ret
target_x24:
     addi x1,x24,0
     ret
target_x25:
     addi x1,x25,0
     ret
target_x26:
     addi x1,x26,0
     ret
target_x27:
     addi x1,x27,0
     ret
target_x28:
     addi x1,x28,0
     ret
target_x29:
     addi x1,x29,0
     ret
target_x30:
     addi x1,x30,0
     ret
target_x31:
     addi x1,x31,0
     ret
