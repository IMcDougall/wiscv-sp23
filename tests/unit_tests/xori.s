.global _start
_start:
      xori x1,x0,0x0101
      xori x2,x1,0xfffff800
      xori x3,x2,0x0202
      xori x4,x3,0xfffff801
      xori x5,x4,0x0303
      xori x6,x5,0xfffff802
      xori x7,x6,0x0404
      xori x8,x7,0xfffff803
      xori x9,x8,0x0505
      xori x10,x9,0xfffff804
      xori x11,x10,0x0606
      xori x12,x11,0xfffff805
      xori x13,x12,0x0707
      xori x14,x13,0xfffff806
      xori x15,x14,0x0708
      xori x16,x15,0xfffff807
      xori x17,x16,0x0709
      xori x18,x17,0xfffff808
      xori x19,x18,0x070a
      xori x20,x19,0xfffff809
      xori x21,x20,0x070b
      xori x22,x21,0xfffff80a
      xori x23,x22,0x070c
      xori x24,x23,0xfffff80b
      xori x25,x24,0x070d
      xori x26,x25,0xfffff80c
      xori x27,x26,0x070e
      xori x28,x27,0xfffff80d
      xori x29,x28,0x070f
      xori x30,x29,0xfffff80e
      xori x31,x30,0x7a0
      xori x31,x31,0x7b0
      j exit

exit: 
    li a7,93
    ecall

