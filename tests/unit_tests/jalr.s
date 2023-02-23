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
     jalr x0,x1,0
target_x2:
     jalr x0,x2,0
target_x3:
     jalr x0,x3,0
target_x4:
     jalr x0,x4,0
target_x5:
     jalr x0,x5,0
target_x6:
     jalr x0,x6,0
target_x7:
     jalr x0,x7,0
target_x8:
     jalr x0,x8,0
target_x9:
     jalr x0,x9,0
target_x10:
     jalr x0,x10,0
target_x11:
     jalr x0,x11,0
target_x12:
     jalr x0,x12,0
target_x13:
     jalr x0,x13,0
target_x14:
     jalr x0,x14,0
target_x15:
     jalr x0,x15,0
target_x16:
     jalr x0,x16,0
target_x17:
     jalr x0,x17,0
target_x18:
     jalr x0,x18,0
target_x19:
     jalr x0,x19,0
target_x20:
     jalr x0,x20,0
target_x21:
     jalr x0,x21,0
target_x22:
     jalr x0,x22,0
target_x23:
     jalr x0,x23,0
target_x24:
     jalr x0,x24,0
target_x25:
     jalr x0,x25,0
target_x26:
     jalr x0,x26,0
target_x27:
     jalr x0,x27,0
target_x28:
     jalr x0,x28,0
target_x29:
     jalr x0,x29,0
target_x30:
     jalr x0,x30,0
target_x31:
     jalr x0,x31,0
