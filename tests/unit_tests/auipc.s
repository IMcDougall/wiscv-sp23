.global _start
_start:
      auipc x0,0x0001
      auipc x1,0x0101
      auipc x2,0x0202
      auipc x3,0x0303
      auipc x4,0x0404
      auipc x5,0x0505
      auipc x6,0x0606
      auipc x7,0x0707
      auipc x8,0x0808
      auipc x9,0x0909
      auipc x10,0x0a0a
      auipc x11,0x0b0b
      auipc x12,0x0c0c
      auipc x13,0x0d0d
      auipc x14,0x0e0e
      auipc x15,0x0f0f
      auipc x16,0x1010
      auipc x17,0x1111
      auipc x18,0x1212
      auipc x19,0x1313
      auipc x20,0x1414
      auipc x21,0x1515
      auipc x22,0x1616
      auipc x23,0x1717
      auipc x24,0x1818
      auipc x25,0x1919
      auipc x26,0x1a1a
      auipc x27,0x1b1b
      auipc x28,0x1c1c
      auipc x29,0x1d1d
      auipc x30,0x1e1e
      auipc x31,0x1f1f
      j exit
exit: 
    li a7,93
    ecall
