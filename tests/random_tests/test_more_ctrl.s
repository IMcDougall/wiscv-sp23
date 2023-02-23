# seed 1676715742
.global _start
_start:
addi x0, x0, 128 # icount 0
addi x1, x1, 128 # icount 1
addi x2, x2, 128 # icount 2
addi x3, x3, 128 # icount 3
addi x4, x4, 128 # icount 4
addi x5, x5, 128 # icount 5
addi x6, x6, 128 # icount 6
addi x7, x7, 128 # icount 7
addi x6, x6, 0 # icount 8
addi x6, x6, 0 # icount 9
nop # to align branch icount 10
blt x28, x7, 12 # icount 11
and x13, x21, x16 # icount 12
sub x25, x16, x26 # icount 13
lui x28, x7, 1 # icount 14
sra x9, x15, x0 # icount 15
sll x19, x31, x8 # icount 16
srli x14, x18, 6 # icount 17
addi x24, x14, 0 # icount 18
lui x25, x15, 3 # icount 19
sub x19, x31, x2 # icount 20
and x27, x0, x2 # icount 21
andi x23, x14, 6 # icount 22
sltiu x19, x1, 7 # icount 23
jal x0, 0 # icount 24
lbu x2, 12(x0) # icount 25
jal x0, 4 # icount 26
nop # icount 27
nop # icount 28
nop # icount 29
nop # icount 30
sw x6, 14(x1) # icount 31
jal x0, 28 # icount 32
nop # icount 33
nop # icount 34
nop # icount 35
nop # icount 36
nop # icount 37
nop # icount 38
nop # icount 39
nop # icount 40
nop # icount 41
nop # icount 42
nop # icount 43
nop # icount 44
nop # icount 45
nop # icount 46
nop # icount 47
nop # icount 48
nop # icount 49
nop # icount 50
nop # icount 51
nop # icount 52
nop # icount 53
nop # icount 54
nop # icount 55
nop # icount 56
nop # icount 57
nop # icount 58
nop # icount 59
nop # icount 60
addi x5, x5, 0 # icount 61
addi x4, x4, 0 # icount 62
bgeu x4, x23, 12 # icount 63
sra x12, x23, x2 # icount 64
slt x24, x17, x19 # icount 65
sll x31, x2, x26 # icount 66
sub x10, x10, x11 # icount 67
srli x2, x5, 2 # icount 68
lui x24, x28, 12 # icount 69
or x22, x3, x17 # icount 70
slti x2, x12, 11 # icount 71
slli x19, x8, 8 # icount 72
add x20, x6, x11 # icount 73
srai x25, x1, 6 # icount 74
sub x30, x25, x28 # icount 75
jal x0, 16 # icount 76
nop # icount 77
nop # icount 78
nop # icount 79
nop # icount 80
nop # icount 81
nop # icount 82
nop # icount 83
nop # icount 84
nop # icount 85
nop # icount 86
nop # icount 87
nop # icount 88
nop # icount 89
nop # icount 90
nop # icount 91
nop # icount 92
lh x3, 6(x1) # icount 93
jal x0, 12 # icount 94
nop # icount 95
nop # icount 96
nop # icount 97
nop # icount 98
nop # icount 99
nop # icount 100
nop # icount 101
nop # icount 102
nop # icount 103
nop # icount 104
nop # icount 105
nop # icount 106
sw x3, -10(x1) # icount 107
jal x0, 28 # icount 108
nop # icount 109
nop # icount 110
nop # icount 111
nop # icount 112
nop # icount 113
nop # icount 114
nop # icount 115
nop # icount 116
nop # icount 117
nop # icount 118
nop # icount 119
nop # icount 120
nop # icount 121
nop # icount 122
nop # icount 123
nop # icount 124
nop # icount 125
nop # icount 126
nop # icount 127
nop # icount 128
nop # icount 129
nop # icount 130
nop # icount 131
nop # icount 132
nop # icount 133
nop # icount 134
nop # icount 135
nop # icount 136
addi x4, x4, 0 # icount 137
addi x7, x7, 0 # icount 138
bgeu x30, x7, 28 # icount 139
andi x28, x4, 14 # icount 140
srai x9, x11, 14 # icount 141
slti x18, x10, 6 # icount 142
or x25, x19, x25 # icount 143
and x22, x23, x25 # icount 144
slli x19, x23, 15 # icount 145
xor x16, x10, x8 # icount 146
andi x9, x18, 11 # icount 147
sltiu x15, x30, 13 # icount 148
xor x16, x31, x3 # icount 149
sll x23, x8, x17 # icount 150
slt x7, x30, x12 # icount 151
lui x14, x19, 5 # icount 152
lui x8, x13, 13 # icount 153
ori x16, x6, 13 # icount 154
xori x2, x16, 13 # icount 155
sll x18, x18, x1 # icount 156
sub x28, x27, x18 # icount 157
ori x13, x11, 3 # icount 158
sltiu x29, x22, 1 # icount 159
srli x30, x9, 4 # icount 160
srli x4, x6, 11 # icount 161
sltu x12, x3, x22 # icount 162
slti x17, x18, 13 # icount 163
srai x22, x11, 12 # icount 164
slt x18, x29, x28 # icount 165
sltu x18, x2, x27 # icount 166
sra x17, x13, x3 # icount 167
jal x0, 20 # icount 168
nop # icount 169
nop # icount 170
nop # icount 171
nop # icount 172
nop # icount 173
nop # icount 174
nop # icount 175
nop # icount 176
nop # icount 177
nop # icount 178
nop # icount 179
nop # icount 180
nop # icount 181
nop # icount 182
nop # icount 183
nop # icount 184
nop # icount 185
nop # icount 186
nop # icount 187
nop # icount 188
lbu x2, 10(x1) # icount 189
jal x0, 0 # icount 190
sw x6, -10(x1) # icount 191
jal x0, 0 # icount 192
addi x4, x4, 0 # icount 193
addi x3, x3, 0 # icount 194
blt x27, x7, 0 # icount 195
jal x0, 20 # icount 196
nop # icount 197
nop # icount 198
nop # icount 199
nop # icount 200
nop # icount 201
nop # icount 202
nop # icount 203
nop # icount 204
nop # icount 205
nop # icount 206
nop # icount 207
nop # icount 208
nop # icount 209
nop # icount 210
nop # icount 211
nop # icount 212
nop # icount 213
nop # icount 214
nop # icount 215
nop # icount 216
lw x2, -4(x0) # icount 217
jal x0, 4 # icount 218
nop # icount 219
nop # icount 220
nop # icount 221
nop # icount 222
sw x4, 8(x0) # icount 223
jal x0, 24 # icount 224
nop # icount 225
nop # icount 226
nop # icount 227
nop # icount 228
nop # icount 229
nop # icount 230
nop # icount 231
nop # icount 232
nop # icount 233
nop # icount 234
nop # icount 235
nop # icount 236
nop # icount 237
nop # icount 238
nop # icount 239
nop # icount 240
nop # icount 241
nop # icount 242
nop # icount 243
nop # icount 244
nop # icount 245
nop # icount 246
nop # icount 247
nop # icount 248
addi x6, x6, 0 # icount 249
addi x5, x5, 0 # icount 250
bge x27, x19, 16 # icount 251
srl x11, x6, x9 # icount 252
ori x7, x1, 11 # icount 253
sra x20, x13, x9 # icount 254
add x7, x12, x11 # icount 255
lui x24, x28, 15 # icount 256
slli x11, x26, 11 # icount 257
sll x22, x27, x18 # icount 258
srl x9, x24, x12 # icount 259
xor x18, x18, x0 # icount 260
srl x29, x30, x5 # icount 261
srai x17, x19, 14 # icount 262
slti x14, x25, 6 # icount 263
srl x28, x20, x16 # icount 264
or x19, x28, x21 # icount 265
xor x11, x10, x11 # icount 266
srl x28, x19, x8 # icount 267
jal x0, 16 # icount 268
nop # icount 269
nop # icount 270
nop # icount 271
nop # icount 272
nop # icount 273
nop # icount 274
nop # icount 275
nop # icount 276
nop # icount 277
nop # icount 278
nop # icount 279
nop # icount 280
nop # icount 281
nop # icount 282
nop # icount 283
nop # icount 284
lb x6, -14(x1) # icount 285
jal x0, 4 # icount 286
nop # icount 287
nop # icount 288
nop # icount 289
nop # icount 290
sw x4, -14(x0) # icount 291
jal x0, 12 # icount 292
nop # icount 293
nop # icount 294
nop # icount 295
nop # icount 296
nop # icount 297
nop # icount 298
nop # icount 299
nop # icount 300
nop # icount 301
nop # icount 302
nop # icount 303
nop # icount 304
addi x7, x7, 0 # icount 305
addi x2, x2, 0 # icount 306
bltu x29, x6, 28 # icount 307
xor x20, x31, x30 # icount 308
srl x18, x29, x8 # icount 309
slli x21, x22, 12 # icount 310
srai x4, x8, 12 # icount 311
xori x30, x18, 1 # icount 312
srl x20, x12, x7 # icount 313
srai x24, x22, 14 # icount 314
sub x22, x2, x29 # icount 315
slti x22, x30, 10 # icount 316
sra x29, x24, x27 # icount 317
ori x29, x6, 3 # icount 318
sltiu x27, x1, 14 # icount 319
add x31, x21, x3 # icount 320
xori x27, x15, 0 # icount 321
srl x8, x6, x26 # icount 322
ori x21, x27, 15 # icount 323
or x26, x8, x4 # icount 324
xor x24, x11, x22 # icount 325
srli x8, x0, 15 # icount 326
sra x16, x15, x9 # icount 327
slt x2, x12, x16 # icount 328
sll x9, x10, x26 # icount 329
andi x21, x31, 2 # icount 330
xori x21, x14, 0 # icount 331
sll x6, x11, x31 # icount 332
sltu x10, x28, x11 # icount 333
addi x10, x2, 3 # icount 334
xori x28, x18, 11 # icount 335
jal x0, 4 # icount 336
nop # icount 337
nop # icount 338
nop # icount 339
nop # icount 340
lbu x4, 12(x0) # icount 341
jal x0, 28 # icount 342
nop # icount 343
nop # icount 344
nop # icount 345
nop # icount 346
nop # icount 347
nop # icount 348
nop # icount 349
nop # icount 350
nop # icount 351
nop # icount 352
nop # icount 353
nop # icount 354
nop # icount 355
nop # icount 356
nop # icount 357
nop # icount 358
nop # icount 359
nop # icount 360
nop # icount 361
nop # icount 362
nop # icount 363
nop # icount 364
nop # icount 365
nop # icount 366
nop # icount 367
nop # icount 368
nop # icount 369
nop # icount 370
sw x6, -14(x1) # icount 371
jal x0, 24 # icount 372
nop # icount 373
nop # icount 374
nop # icount 375
nop # icount 376
nop # icount 377
nop # icount 378
nop # icount 379
nop # icount 380
nop # icount 381
nop # icount 382
nop # icount 383
nop # icount 384
nop # icount 385
nop # icount 386
nop # icount 387
nop # icount 388
nop # icount 389
nop # icount 390
nop # icount 391
nop # icount 392
nop # icount 393
nop # icount 394
nop # icount 395
nop # icount 396
addi x4, x4, 0 # icount 397
addi x2, x2, 0 # icount 398
beq x27, x23, 24 # icount 399
srai x24, x27, 2 # icount 400
ori x8, x23, 5 # icount 401
sltu x7, x26, x5 # icount 402
slt x11, x23, x13 # icount 403
sll x5, x20, x26 # icount 404
sll x14, x4, x13 # icount 405
and x14, x22, x30 # icount 406
slti x7, x20, 12 # icount 407
or x28, x3, x28 # icount 408
or x24, x21, x7 # icount 409
sra x10, x25, x0 # icount 410
and x5, x25, x0 # icount 411
xori x19, x27, 0 # icount 412
srl x28, x23, x11 # icount 413
slli x23, x11, 13 # icount 414
sltiu x12, x19, 12 # icount 415
and x9, x23, x7 # icount 416
or x31, x26, x14 # icount 417
sltu x25, x6, x29 # icount 418
xori x24, x0, 10 # icount 419
sub x19, x27, x27 # icount 420
sltu x26, x19, x13 # icount 421
slti x10, x26, 5 # icount 422
xori x11, x4, 14 # icount 423
jal x0, 4 # icount 424
nop # icount 425
nop # icount 426
nop # icount 427
nop # icount 428
lw x4, 12(x1) # icount 429
jal x0, 4 # icount 430
nop # icount 431
nop # icount 432
nop # icount 433
nop # icount 434
sw x5, -10(x0) # icount 435
jal x0, 12 # icount 436
nop # icount 437
nop # icount 438
nop # icount 439
nop # icount 440
nop # icount 441
nop # icount 442
nop # icount 443
nop # icount 444
nop # icount 445
nop # icount 446
nop # icount 447
nop # icount 448
addi x5, x5, 0 # icount 449
addi x6, x6, 0 # icount 450
bge x26, x19, 12 # icount 451
slti x12, x19, 0 # icount 452
slti x22, x0, 13 # icount 453
andi x29, x28, 1 # icount 454
srl x7, x7, x23 # icount 455
srli x23, x20, 13 # icount 456
slli x24, x8, 13 # icount 457
xori x17, x27, 0 # icount 458
or x19, x8, x10 # icount 459
sub x26, x1, x11 # icount 460
srl x25, x28, x17 # icount 461
or x11, x3, x17 # icount 462
srl x13, x13, x15 # icount 463
jal x0, 4 # icount 464
nop # icount 465
nop # icount 466
nop # icount 467
nop # icount 468
lh x5, -6(x0) # icount 469
jal x0, 0 # icount 470
sw x2, 10(x1) # icount 471
jal x0, 0 # icount 472
addi x7, x7, 0 # icount 473
addi x2, x2, 0 # icount 474
bltu x26, x13, 4 # icount 475
srai x20, x18, 7 # icount 476
add x13, x13, x23 # icount 477
sra x18, x9, x1 # icount 478
xor x24, x5, x6 # icount 479
jal x0, 12 # icount 480
nop # icount 481
nop # icount 482
nop # icount 483
nop # icount 484
nop # icount 485
nop # icount 486
nop # icount 487
nop # icount 488
nop # icount 489
nop # icount 490
nop # icount 491
nop # icount 492
lb x5, 2(x0) # icount 493
jal x0, 12 # icount 494
nop # icount 495
nop # icount 496
nop # icount 497
nop # icount 498
nop # icount 499
nop # icount 500
nop # icount 501
nop # icount 502
nop # icount 503
nop # icount 504
nop # icount 505
nop # icount 506
sw x2, 12(x1) # icount 507
jal x0, 0 # icount 508
addi x7, x7, 0 # icount 509
addi x7, x7, 0 # icount 510
beq x20, x23, 16 # icount 511
sub x30, x9, x5 # icount 512
and x13, x30, x13 # icount 513
slti x21, x27, 4 # icount 514
sra x16, x25, x6 # icount 515
slli x18, x2, 6 # icount 516
or x3, x17, x13 # icount 517
slt x8, x25, x21 # icount 518
and x12, x31, x14 # icount 519
sltu x30, x20, x20 # icount 520
lui x10, x9, 8 # icount 521
slti x18, x1, 6 # icount 522
lui x12, x14, 6 # icount 523
sll x5, x21, x19 # icount 524
srli x25, x29, 3 # icount 525
sll x18, x26, x21 # icount 526
srai x23, x24, 0 # icount 527
jal x0, 4 # icount 528
nop # icount 529
nop # icount 530
nop # icount 531
nop # icount 532
lbu x2, 8(x0) # icount 533
jal x0, 24 # icount 534
nop # icount 535
nop # icount 536
nop # icount 537
nop # icount 538
nop # icount 539
nop # icount 540
nop # icount 541
nop # icount 542
nop # icount 543
nop # icount 544
nop # icount 545
nop # icount 546
nop # icount 547
nop # icount 548
nop # icount 549
nop # icount 550
nop # icount 551
nop # icount 552
nop # icount 553
nop # icount 554
nop # icount 555
nop # icount 556
nop # icount 557
nop # icount 558
sw x4, 4(x0) # icount 559
jal x0, 16 # icount 560
nop # icount 561
nop # icount 562
nop # icount 563
nop # icount 564
nop # icount 565
nop # icount 566
nop # icount 567
nop # icount 568
nop # icount 569
nop # icount 570
nop # icount 571
nop # icount 572
nop # icount 573
nop # icount 574
nop # icount 575
nop # icount 576
j exit # icount 577

exit: # icount 578
li a7, 93 # icount 579
ecall # icount 580
