.global _start
_start:
      addi x1,x0,0x678
      lui x1,0x12345
      srli x2,x1,0x0
      srli x3,x1,0x1
      srli x4,x1,0x2
      srli x5,x1,0x3
      srli x6,x1,0x4
      srli x7,x1,0x5
      srli x8,x1,0x6
      srli x9,x1,0x7
      srli x10,x1,0x8
      srli x11,x1,0x9
      srli x12,x1,0xa
      srli x13,x1,0xb
      srli x14,x1,0xc
      srli x15,x1,0xd
      srli x16,x1,0xe
      srli x17,x1,0xf
      srli x18,x1,0x10
      srli x19,x1,0x11
      srli x20,x1,0x12
      srli x21,x1,0x13
      srli x22,x1,0x14
      srli x23,x1,0x15
      srli x24,x1,0x16
      srli x25,x1,0x17
      srli x26,x1,0x18
      srli x27,x1,0x19
      srli x28,x1,0x1a
      srli x29,x1,0x1b
      srli x30,x1,0x1c
      srli x31,x1,0x1d
      srli x31,x1,0x1e
      srli x31,x1,0x1f
      j exit

exit: 
    li a7,93
    ecall

