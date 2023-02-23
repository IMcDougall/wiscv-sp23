.global _start
_start:
      addi x1,x0,0x0101
      addi x2,x1,0xfffff800
      addi x3,x2,0x0202
      addi x4,x3,0xfffff801
      addi x5,x4,0x0303
      addi x6,x5,0xfffff802
      addi x7,x6,0x0404
      addi x8,x7,0xfffff803
      addi x9,x8,0x0505
      addi x10,x9,0xfffff804
      addi x11,x10,0x0606
      addi x12,x11,0xfffff805
      addi x13,x12,0x0707
      addi x14,x13,0xfffff806
      addi x15,x14,0x0708
      addi x16,x15,0xfffff807
      addi x17,x16,0x0709
      addi x18,x17,0xfffff808
      addi x19,x18,0x070a
      addi x20,x19,0xfffff809
      addi x21,x20,0x070b
      addi x22,x21,0xfffff80a
      addi x23,x22,0x070c
      addi x24,x23,0xfffff80b
      addi x25,x24,0x070d
      addi x26,x25,0xfffff80c
      addi x27,x26,0x070e
      addi x28,x27,0xfffff80d
      addi x29,x28,0x070f
      addi x30,x29,0xfffff80e
      addi x31,x30,0x7a0
      addi x31,x31,0x7b0
      j exit

exit: 
    li a7,93
    ecall

