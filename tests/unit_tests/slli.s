.global _start
_start:
      addi x1,x0,0x678
      lui x1,0x12345
      slli x2,x1,0x0
      slli x3,x1,0x1
      slli x4,x1,0x2
      slli x5,x1,0x3
      slli x6,x1,0x4
      slli x7,x1,0x5
      slli x8,x1,0x6
      slli x9,x1,0x7
      slli x10,x1,0x8
      slli x11,x1,0x9
      slli x12,x1,0xa
      slli x13,x1,0xb
      slli x14,x1,0xc
      slli x15,x1,0xd
      slli x16,x1,0xe
      slli x17,x1,0xf
      slli x18,x1,0x10
      slli x19,x1,0x11
      slli x20,x1,0x12
      slli x21,x1,0x13
      slli x22,x1,0x14
      slli x23,x1,0x15
      slli x24,x1,0x16
      slli x25,x1,0x17
      slli x26,x1,0x18
      slli x27,x1,0x19
      slli x28,x1,0x1a
      slli x29,x1,0x1b
      slli x30,x1,0x1c
      slli x31,x1,0x1d
      slli x31,x1,0x1e
      slli x31,x1,0x1f
      j exit

exit: 
    li a7,93
    ecall

