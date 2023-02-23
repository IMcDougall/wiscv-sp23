
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	67800093          	li	ra,1656
   4:	123450b7          	lui	ra,0x12345
   8:	00100f93          	li	t6,1
   c:	4000d133          	sra	sp,ra,zero
  10:	00200f13          	li	t5,2
  14:	41f0d1b3          	sra	gp,ra,t6
  18:	00300e93          	li	t4,3
  1c:	41e0d233          	sra	tp,ra,t5
  20:	00400e13          	li	t3,4
  24:	41d0d2b3          	sra	t0,ra,t4
  28:	00500d93          	li	s11,5
  2c:	41c0d333          	sra	t1,ra,t3
  30:	00600d13          	li	s10,6
  34:	41b0d3b3          	sra	t2,ra,s11
  38:	00700c93          	li	s9,7
  3c:	41a0d433          	sra	s0,ra,s10
  40:	00800c13          	li	s8,8
  44:	4190d4b3          	sra	s1,ra,s9
  48:	00900b93          	li	s7,9
  4c:	4180d533          	sra	a0,ra,s8
  50:	00a00b13          	li	s6,10
  54:	4170d5b3          	sra	a1,ra,s7
  58:	00b00a93          	li	s5,11
  5c:	4160d633          	sra	a2,ra,s6
  60:	00c00a13          	li	s4,12
  64:	4150d6b3          	sra	a3,ra,s5
  68:	00d00993          	li	s3,13
  6c:	4140d733          	sra	a4,ra,s4
  70:	00e00913          	li	s2,14
  74:	4130d7b3          	sra	a5,ra,s3
  78:	00f00893          	li	a7,15
  7c:	4120d833          	sra	a6,ra,s2
  80:	01000813          	li	a6,16
  84:	4110d8b3          	sra	a7,ra,a7
  88:	01100793          	li	a5,17
  8c:	4100d933          	sra	s2,ra,a6
  90:	01200713          	li	a4,18
  94:	40f0d9b3          	sra	s3,ra,a5
  98:	01300693          	li	a3,19
  9c:	40e0da33          	sra	s4,ra,a4
  a0:	01400613          	li	a2,20
  a4:	40d0dab3          	sra	s5,ra,a3
  a8:	01500593          	li	a1,21
  ac:	40c0db33          	sra	s6,ra,a2
  b0:	01600513          	li	a0,22
  b4:	40b0dbb3          	sra	s7,ra,a1
  b8:	01700493          	li	s1,23
  bc:	40a0dc33          	sra	s8,ra,a0
  c0:	01800413          	li	s0,24
  c4:	4090dcb3          	sra	s9,ra,s1
  c8:	01900393          	li	t2,25
  cc:	4080dd33          	sra	s10,ra,s0
  d0:	01a00313          	li	t1,26
  d4:	4070ddb3          	sra	s11,ra,t2
  d8:	01b00293          	li	t0,27
  dc:	4060de33          	sra	t3,ra,t1
  e0:	01c00213          	li	tp,28
  e4:	4050deb3          	sra	t4,ra,t0
  e8:	01d00193          	li	gp,29
  ec:	4040df33          	sra	t5,ra,tp
  f0:	01e00113          	li	sp,30
  f4:	4030dfb3          	sra	t6,ra,gp
  f8:	00f00f93          	li	t6,15
  fc:	41f0dfb3          	sra	t6,ra,t6
 100:	4020dfb3          	sra	t6,ra,sp
 104:	00400f93          	li	t6,4
 108:	41f0dfb3          	sra	t6,ra,t6
 10c:	0040006f          	j	110 <exit>

00000110 <exit>:
 110:	05d00893          	li	a7,93
 114:	00000073          	ecall

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	1941                	.2byte	0x1941
   2:	0000                	.2byte	0x0
   4:	7200                	.2byte	0x7200
   6:	7369                	.2byte	0x7369
   8:	01007663          	bgeu	zero,a6,14 <_start+0x14>
   c:	0000000f          	fence	unknown,unknown
  10:	7205                	.2byte	0x7205
  12:	3376                	.2byte	0x3376
  14:	6932                	.2byte	0x6932
  16:	7032                	.2byte	0x7032
  18:	0030                	.2byte	0x30
