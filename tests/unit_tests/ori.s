.global _start
_start:
      ori x1,x0,0x0101
      ori x2,x1,0xfffff800
      ori x3,x2,0x0202
      ori x4,x3,0xfffff801
      ori x5,x4,0x0303
      ori x6,x5,0xfffff802
      ori x7,x6,0x0404
      ori x8,x7,0xfffff803
      ori x9,x8,0x0505
      ori x10,x9,0xfffff804
      ori x11,x10,0x0606
      ori x12,x11,0xfffff805
      ori x13,x12,0x0707
      ori x14,x13,0xfffff806
      ori x15,x14,0x0708
      ori x16,x15,0xfffff807
      ori x17,x16,0x0709
      ori x18,x17,0xfffff808
      ori x19,x18,0x070a
      ori x20,x19,0xfffff809
      ori x21,x20,0x070b
      ori x22,x21,0xfffff80a
      ori x23,x22,0x070c
      ori x24,x23,0xfffff80b
      ori x25,x24,0x070d
      ori x26,x25,0xfffff80c
      ori x27,x26,0x070e
      ori x28,x27,0xfffff80d
      ori x29,x28,0x070f
      ori x30,x29,0xfffff80e
      ori x31,x30,0x7a0
      ori x31,x31,0x7b0
      j exit

exit: 
    li a7,93
    ecall

