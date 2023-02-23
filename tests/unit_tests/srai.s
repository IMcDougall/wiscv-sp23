.global _start
_start:
      addi x1,x0,0x678
      lui x1,0x12345
      srai x2,x1,0x0
      srai x3,x1,0x1
      srai x4,x1,0x2
      srai x5,x1,0x3
      srai x6,x1,0x4
      srai x7,x1,0x5
      srai x8,x1,0x6
      srai x9,x1,0x7
      srai x10,x1,0x8
      srai x11,x1,0x9
      srai x12,x1,0xa
      srai x13,x1,0xb
      srai x14,x1,0xc
      srai x15,x1,0xd
      srai x16,x1,0xe
      srai x17,x1,0xf
      srai x18,x1,0x10
      srai x19,x1,0x11
      srai x20,x1,0x12
      srai x21,x1,0x13
      srai x22,x1,0x14
      srai x23,x1,0x15
      srai x24,x1,0x16
      srai x25,x1,0x17
      srai x26,x1,0x18
      srai x27,x1,0x19
      srai x28,x1,0x1a
      srai x29,x1,0x1b
      srai x30,x1,0x1c
      srai x31,x1,0x1d
      srai x31,x1,0x1e
      srai x31,x1,0x1f
      j exit

exit: 
    li a7,93
    ecall

