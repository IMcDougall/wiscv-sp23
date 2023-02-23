.global _start
_start:
      addi x1,x0,0xffffffff
      andi x2,x1,0xfffff800
      ori x3,x2,0x0202
      andi x4,x3,0xfffff801
      ori x5,x4,0x0303
      andi x6,x5,0xfffff802
      ori x7,x6,0x0404
      andi x8,x7,0xfffff803
      ori x9,x8,0x0505
      andi x10,x9,0xfffff804
      ori x11,x10,0x0606
      andi x12,x11,0xfffff805
      ori x13,x12,0x0707
      andi x14,x13,0xfffff806
      ori x15,x14,0x0708
      andi x16,x15,0xfffff807
      ori x17,x16,0x0709
      andi x18,x17,0xfffff808
      ori x19,x18,0x070a
      andi x20,x19,0xfffff809
      ori x21,x20,0x070b
      andi x22,x21,0xfffff80a
      ori x23,x22,0x070c
      andi x24,x23,0xfffff80b
      ori x25,x24,0x070d
      andi x26,x25,0xfffff80c
      ori x27,x26,0x070e
      andi x28,x27,0xfffff80d
      andi x29,x28,0x070f
      andi x30,x29,0xfffff80e
      andi x31,x30,0x7a0
      andi x31,x31,0x7b0
      j exit

exit: 
    li a7,93
    ecall

