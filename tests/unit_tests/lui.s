.global _start
_start:
      lui x0,0x0001
      lui x1,0x0101
      lui x2,0x0202
      lui x3,0x0303
      lui x4,0x0404
      lui x5,0x0505
      lui x6,0x0606
      lui x7,0x0707
      lui x8,0x0808
      lui x9,0x0909
      lui x10,0x0a0a
      lui x11,0x0b0b
      lui x12,0x0c0c
      lui x13,0x0d0d
      lui x14,0x0e0e
      lui x15,0x0f0f
      lui x16,0x1010
      lui x17,0x1111
      lui x18,0x1212
      lui x19,0x1313
      lui x20,0x1414
      lui x21,0x1515
      lui x22,0x1616
      lui x23,0x1717
      lui x24,0x1818
      lui x25,0x1919
      lui x26,0x1a1a
      lui x27,0x1b1b
      lui x28,0x1c1c
      lui x29,0x1d1d
      lui x30,0x1e1e
      lui x31,0x1f1f
      j exit
exit: 
    li a7,93
    ecall
