ori $18, $0, 0x7ed8
lw $16, 72($18)
mtlo $18
mflo $18
ori $11, $0, 0x7eb4
multu $11, $16
lh $16, 76($11)
mtlo $11
mflo $11
lui $22, 0x7fff
ori $22, $22, 0xffbb
multu $22, $12
jal label9
lh $12, 69($22)
label9:
mflo $22
ori $13, $0, 0x7ed3
multu $13, $18
lw $18, 77($13)
mtlo $13
mflo $13
lui $6, 0xffff
ori $6, $6, 0xffcc
multu $6, $20
jal label21
lh $20, 56($6)
label21:
mtlo $6
mflo $6
ori $13, $0, 0x7ec4
lb $4, 92($13)
mflo $13
lui $29, 0x7fff
ori $29, $29, 0xff9f
multu $29, $7
lw $7, 98($29)
mflo $29
ori $8, $0, 0x7ed2
lh $8, 94($8)
mtlo $8
mflo $8
lui $16, 0x7fff
ori $16, $16, 0xffc9
lh $1, 55($16)
mtlo $16
mflo $16
ori $28, $0, 0x2fc0
lw $9, 60($28)
mtlo $28
mflo $28
lui $18, 0x7fff
ori $18, $18, 0xffb1
multu $18, $23
jal label50
lw $23, 79($18)
label50:
mflo $18
ori $5, $0, 0x7ec6
multu $5, $7
lb $7, 73($5)
mflo $5
ori $15, $0, 0x2d83
multu $15, $10
lw $10, 73($15)
mtlo $15
mflo $15
ori $25, $0, 0x2fb9
multu $25, $6
jal label66
lb $6, 77($25)
label66:
mflo $25
ori $13, $0, 0x7edc
multu $13, $24
jal label72
lw $24, 68($13)
label72:
mflo $13
ori $16, $0, 0x2fb5
multu $16, $24
lh $24, 75($16)
mflo $16
lui $5, 0x7fff
ori $5, $5, 0xffc9
multu $5, $3
lb $3, 56($5)
mtlo $5
mflo $5
ori $17, $0, 0x22ee
multu $17, $25
jal label88
lb $25, 94($17)
label88:
mtlo $17
mflo $17
lui $11, 0xffff
ori $11, $11, 0xffb9
lb $5, 74($11)
mtlo $11
mflo $11
lui $14, 0x7fff
ori $14, $14, 0xffb9
lb $28, 72($14)
mtlo $14
mflo $14
ori $13, $0, 0x7eca
lw $17, 54($13)
mtlo $13
mflo $13
lui $10, 0xffff
ori $10, $10, 0xffc8
jal label109
lw $26, 56($10)
label109:
mflo $10
ori $8, $0, 0x2fa4
multu $8, $20
lw $20, 92($8)
mflo $8
lui $27, 0x7fff
ori $27, $27, 0xffbc
jal label119
lh $15, 69($27)
label119:
mtlo $27
mflo $27
lui $5, 0xffff
ori $5, $5, 0xffbb
multu $5, $7
lw $7, 69($5)
mflo $5
ori $1, $0, 0x7ec4
jal label131
lb $25, 57($1)
label131:
mtlo $1
mflo $1
ori $22, $0, 0x7ee7
lh $28, 61($22)
mflo $22
ori $1, $0, 0x7eba
multu $1, $23
jal label140
lb $23, 86($1)
label140:
mtlo $1
mflo $1
ori $2, $0, 0x2fa5
lb $21, 87($2)
mflo $2
ori $23, $0, 0x7eb2
jal label150
lh $20, 74($23)
label150:
mtlo $23
mflo $23
ori $26, $0, 0x7e0
multu $26, $27
lw $27, 88($26)
mflo $26
ori $28, $0, 0x7eac
jal label160
lb $28, 84($28)
label160:
mflo $28
ori $22, $0, 0x7eae
multu $22, $24
jal label165
lw $24, 98($22)
label165:
mtlo $22
mflo $22
ori $30, $0, 0x2fa5
jal label172
lh $18, 99($30)
label172:
mtlo $30
mflo $30
ori $3, $0, 0x7ee0
lh $8, 56($3)
mflo $3
lui $9, 0x7fff
ori $9, $9, 0xffb6
multu $9, $18
jal label181
lw $18, 74($9)
label181:
mtlo $9
mflo $9
ori $23, $0, 0x7ecb
multu $23, $25
jal label189
lh $25, 81($23)
label189:
mflo $23
ori $8, $0, 0x7ee0
multu $8, $15
lw $15, 60($8)
mflo $8
ori $5, $0, 0x7eca
multu $5, $25
jal label199
lh $25, 70($5)
label199:
mflo $5
lui $17, 0x7fff
ori $17, $17, 0xffad
jal label205
lh $1, 83($17)
label205:
mtlo $17
mflo $17
ori $30, $0, 0xd11
multu $30, $29
lh $29, 69($30)
mflo $30
ori $8, $0, 0x42a
multu $8, $28
jal label216
lb $28, 98($8)
label216:
mtlo $8
mflo $8
ori $29, $0, 0x7ebe
lh $18, 62($29)
mflo $29
ori $20, $0, 0x7eb9
multu $20, $4
lb $4, 81($20)
mtlo $20
mflo $20
ori $21, $0, 0x2faa
multu $21, $20
jal label231
lb $20, 85($21)
label231:
mtlo $21
mflo $21
ori $30, $0, 0x7ee8
multu $30, $9
lw $9, 56($30)
mflo $30
ori $4, $0, 0x7edc
multu $4, $18
lh $18, 58($4)
mflo $4
ori $14, $0, 0x2973
jal label246
lb $13, 57($14)
label246:
mtlo $14
mflo $14
ori $13, $0, 0x7ecc
lh $17, 68($13)
mflo $13
ori $29, $0, 0x7ee4
multu $29, $16
jal label255
lh $16, 59($29)
label255:
mtlo $29
mflo $29
ori $5, $0, 0x3d9
multu $5, $14
jal label262
lw $14, 69($5)
label262:
mtlo $5
mflo $5
lui $4, 0x7fff
ori $4, $4, 0xffb3
multu $4, $15
jal label269
lw $15, 77($4)
label269:
mtlo $4
mflo $4
ori $17, $0, 0x7ea3
lb $24, 93($17)
mtlo $17
mflo $17
ori $5, $0, 0x7ec9
jal label281
lh $3, 90($5)
label281:
mflo $5
ori $20, $0, 0x25fd
multu $20, $27
lw $27, 55($20)
mflo $20
ori $10, $0, 0x7ecc
multu $10, $7
lh $7, 84($10)
mtlo $10
mflo $10
ori $27, $0, 0x1c88
multu $27, $29
jal label295
lb $29, 80($27)
label295:
mflo $27
ori $22, $0, 0x7eda
lh $11, 71($22)
mtlo $22
mflo $22
ori $9, $0, 0x21a0
multu $9, $21
lb $21, 72($9)
mtlo $9
mflo $9
ori $20, $0, 0x7ec8
multu $20, $10
lb $10, 80($20)
mflo $20
ori $12, $0, 0x12f8
jal label314
lb $2, 92($12)
label314:
mflo $12
ori $7, $0, 0x1015
multu $7, $14
jal label319
lh $14, 99($7)
label319:
mflo $7
ori $29, $0, 0x7eb6
jal label325
lw $14, 90($29)
label325:
mflo $29
ori $20, $0, 0x2d29
lw $22, 71($20)
mtlo $20
mflo $20
lui $24, 0x7fff
ori $24, $24, 0xffa0
lw $14, 97($24)
mtlo $24
mflo $24
ori $5, $0, 0xe7c
jal label339
lw $14, 92($5)
label339:
mtlo $5
mflo $5
ori $9, $0, 0x7ebc
multu $9, $2
lh $2, 84($9)
mflo $9
ori $14, $0, 0x7ed0
lh $4, 64($14)
mtlo $14
mflo $14
ori $3, $0, 0x15c2
lb $28, 66($3)
mtlo $3
mflo $3
ori $7, $0, 0x17ac
lb $1, 68($7)
mflo $7
ori $20, $0, 0x2fac
multu $20, $12
lh $12, 76($20)
mtlo $20
mflo $20
ori $30, $0, 0x7ee0
jal label365
lh $29, 64($30)
label365:
mflo $30
ori $23, $0, 0x7eb4
multu $23, $13
jal label370
lw $13, 74($23)
label370:
mflo $23
ori $19, $0, 0x7ed8
multu $19, $10
jal label376
lb $10, 52($19)
label376:
mtlo $19
mflo $19
ori $6, $0, 0x2fa8
jal label383
lw $15, 86($6)
label383:
mtlo $6
mflo $6
ori $8, $0, 0x7ea9
multu $8, $26
lh $26, 83($8)
mflo $8
ori $30, $0, 0x7ee0
jal label393
lb $27, 67($30)
label393:
mflo $30
ori $23, $0, 0x7eb6
jal label398
lh $27, 96($23)
label398:
mtlo $23
mflo $23
ori $8, $0, 0x2faf
jal label404
lh $5, 79($8)
label404:
mflo $8
ori $18, $0, 0x2fab
multu $18, $10
lb $10, 77($18)
mflo $18
lui $27, 0xffff
ori $27, $27, 0xffa0
lw $16, 96($27)
mflo $27
ori $9, $0, 0x2fc3
jal label417
lb $16, 69($9)
label417:
mtlo $9
mflo $9
ori $11, $0, 0x7ed5
jal label423
lb $12, 73($11)
label423:
mtlo $11
mflo $11
ori $11, $0, 0x7eb9
multu $11, $2
jal label429
lw $2, 81($11)
label429:
mflo $11
ori $12, $0, 0x7ec1
jal label435
lb $9, 69($12)
label435:
mflo $12
lui $12, 0x7fff
ori $12, $12, 0xffbf
lh $18, 65($12)
mtlo $12
mflo $12
ori $19, $0, 0x7ecc
multu $19, $16
jal label445
lw $16, 68($19)
label445:
mflo $19
ori $27, $0, 0x7ec6
lw $2, 57($27)
mtlo $27
mflo $27
ori $6, $0, 0x9c1
multu $6, $21
jal label455
lw $21, 83($6)
label455:
mtlo $6
mflo $6
ori $27, $0, 0x7eda
multu $27, $2
jal label462
lh $2, 58($27)
label462:
mflo $27
ori $4, $0, 0x7ed9
multu $4, $16
lw $16, 68($4)
mflo $4
ori $24, $0, 0x4dc
multu $24, $16
jal label472
lh $16, 54($24)
label472:
mflo $24
ori $29, $0, 0x1367
lb $21, 82($29)
mtlo $29
mflo $29
ori $29, $0, 0x6e9
multu $29, $18
jal label482
lb $18, 65($29)
label482:
mflo $29
ori $22, $0, 0x7ebe
multu $22, $3
jal label488
lh $3, 66($22)
label488:
mtlo $22
mflo $22
lui $14, 0x7fff
ori $14, $14, 0xffc5
multu $14, $19
jal label495
lh $19, 59($14)
label495:
mtlo $14
mflo $14
ori $13, $0, 0x7ec6
multu $13, $17
jal label503
lw $17, 94($13)
label503:
mflo $13
ori $2, $0, 0x7ecd
jal label509
lh $28, 51($2)
label509:
mflo $2
ori $30, $0, 0x7ea9
jal label514
lb $15, 95($30)
label514:
mflo $30
lui $27, 0xffff
ori $27, $27, 0xffc9
multu $27, $13
lb $13, 55($27)
mtlo $27
mflo $27
ori $24, $0, 0x7eca
multu $24, $19
lb $19, 90($24)
mflo $24
ori $13, $0, 0x7ed5
jal label529
lh $25, 59($13)
label529:
mflo $13
ori $21, $0, 0xabe
multu $21, $17
jal label534
lb $17, 82($21)
label534:
mtlo $21
mflo $21
ori $24, $0, 0x7ec8
lb $13, 87($24)
mtlo $24
mflo $24
ori $4, $0, 0x7ec1
multu $4, $4
jal label545
lb $4, 95($4)
label545:
mtlo $4
mflo $4
ori $17, $0, 0x7ed4
jal label552
lb $13, 76($17)
label552:
mtlo $17
mflo $17
ori $15, $0, 0x7eac
lh $22, 82($15)
mflo $15
ori $17, $0, 0x7ec3
multu $17, $28
lb $28, 87($17)
mflo $17
ori $23, $0, 0x7eeb
lw $3, 53($23)
mtlo $23
mflo $23
lui $14, 0x7fff
ori $14, $14, 0xffc7
jal label569
lb $2, 58($14)
label569:
mflo $14
ori $18, $0, 0x2004
multu $18, $26
lw $26, 77($18)
mflo $18
lui $21, 0x7fff
ori $21, $21, 0xffb1
multu $21, $30
lw $30, 79($21)
mflo $21
ori $25, $0, 0x7ee7
multu $25, $16
lb $16, 67($25)
mflo $25
ori $16, $0, 0x7ee8
multu $16, $2
lb $2, 68($16)
mtlo $16
mflo $16
ori $22, $0, 0x5f2
lh $18, 64($22)
mflo $22
ori $3, $0, 0x7ec3
multu $3, $7
lb $7, 93($3)
mflo $3
lui $21, 0x7fff
ori $21, $21, 0xffa4
multu $21, $29
lw $29, 92($21)
mtlo $21
mflo $21
lui $14, 0x7fff
ori $14, $14, 0xffca
multu $14, $16
jal label606
lw $16, 54($14)
label606:
mflo $14
ori $28, $0, 0x7eda
jal label613
lh $29, 54($28)
label613:
mflo $28
ori $3, $0, 0x7eb3
jal label618
lb $17, 85($3)
label618:
mtlo $3
mflo $3
ori $3, $0, 0x12d3
multu $3, $4
jal label624
lb $4, 66($3)
label624:
mtlo $3
mflo $3
ori $9, $0, 0x7ecf
jal label631
lb $27, 65($9)
label631:
mtlo $9
mflo $9
lui $17, 0x7fff
ori $17, $17, 0xffc4
multu $17, $28
lw $28, 60($17)
mflo $17
ori $11, $0, 0x7ece
lb $26, 82($11)
mtlo $11
mflo $11
ori $1, $0, 0x2c0e
jal label646
lh $4, 85($1)
label646:
mflo $1
ori $24, $0, 0x7ee6
jal label651
lb $24, 60($24)
label651:
mflo $24
ori $24, $0, 0x7ebd
lb $5, 83($24)
mtlo $24
mflo $24
ori $27, $0, 0x7eb3
jal label660
lw $3, 77($27)
label660:
mflo $27
lui $9, 0xffff
ori $9, $9, 0xffb9
jal label665
lh $13, 67($9)
label665:
mflo $9
ori $13, $0, 0x7eb8
jal label671
lw $7, 72($13)
label671:
mflo $13
lui $20, 0x7fff
ori $20, $20, 0xffb9
lb $12, 72($20)
mflo $20
ori $30, $0, 0x7ed3
jal label680
lb $13, 60($30)
label680:
mtlo $30
mflo $30
ori $1, $0, 0xe61
multu $1, $10
jal label686
lb $10, 67($1)
label686:
mflo $1
ori $2, $0, 0x7ea0
multu $2, $2
lb $2, 96($2)
mtlo $2
mflo $2
ori $8, $0, 0x7ec2
multu $8, $10
lw $10, 70($8)
mtlo $8
mflo $8
ori $23, $0, 0x231f
multu $23, $4
lb $4, 69($23)
mflo $23
ori $8, $0, 0x7ecc
jal label706
lh $25, 68($8)
label706:
mflo $8
ori $26, $0, 0x7eda
jal label711
lb $20, 70($26)
label711:
mtlo $26
mflo $26
ori $28, $0, 0x6b7
multu $28, $6
jal label717
lb $6, 71($28)
label717:
mtlo $28
mflo $28
ori $3, $0, 0x7ec0
lw $7, 80($3)
mtlo $3
mflo $3
ori $21, $0, 0x7ed7
lw $19, 81($21)
mflo $21
ori $15, $0, 0xefd
lb $6, 75($15)
mtlo $15
mflo $15
ori $14, $0, 0x7ec3
lb $14, 93($14)
mflo $14
ori $23, $0, 0x23ba
multu $23, $9
lw $9, 86($23)
mflo $23
ori $13, $0, 0x7ec1
jal label742
lh $23, 96($13)
label742:
mflo $13
ori $21, $0, 0x7eb5
lw $3, 71($21)
mtlo $21
mflo $21
ori $29, $0, 0x7ebb
jal label751
lh $1, 69($29)
label751:
mtlo $29
mflo $29
ori $24, $0, 0x1464
multu $24, $2
lb $2, 57($24)
mtlo $24
mflo $24
ori $22, $0, 0x7edb
lw $25, 69($22)
mflo $22
lui $7, 0x7fff
ori $7, $7, 0xffb7
multu $7, $11
jal label765
lh $11, 73($7)
label765:
mtlo $7
mflo $7
ori $23, $0, 0x7ec6
lb $29, 86($23)
mflo $23
ori $11, $0, 0x7ec9
lh $7, 87($11)
mflo $11
ori $19, $0, 0x7ec8
jal label779
lb $22, 72($19)
label779:
mtlo $19
mflo $19
ori $29, $0, 0x7ec7
lw $7, 85($29)
mtlo $29
mflo $29
ori $25, $0, 0x7ecf
lh $16, 81($25)
mtlo $25
mflo $25
ori $21, $0, 0x2fa2
multu $21, $19
jal label793
lb $19, 89($21)
label793:
mflo $21
lui $3, 0xffff
ori $3, $3, 0xffc4
lw $8, 62($3)
mtlo $3
mflo $3
ori $10, $0, 0x7edc
lb $22, 51($10)
mtlo $10
mflo $10
lui $6, 0xffff
ori $6, $6, 0xffbc
jal label808
lw $13, 66($6)
label808:
mflo $6
ori $27, $0, 0x7ed3
multu $27, $29
lw $29, 77($27)
mtlo $27
mflo $27
ori $8, $0, 0x7eca
multu $8, $28
jal label819
lw $28, 86($8)
label819:
mtlo $8
mflo $8
ori $13, $0, 0x186e
lb $10, 72($13)
mtlo $13
mflo $13
ori $9, $0, 0x7ea2
multu $9, $30
jal label830
lb $30, 90($9)
label830:
mtlo $9
mflo $9
ori $2, $0, 0x2faa
lb $2, 86($2)
mflo $2
ori $6, $0, 0x7eca
multu $6, $9
lw $9, 82($6)
mtlo $6
mflo $6
ori $25, $0, 0x7eb2
lh $25, 86($25)
mflo $25
ori $17, $0, 0x2fc3
multu $17, $11
lb $11, 56($17)
mtlo $17
mflo $17
ori $6, $0, 0x7edc
jal label853
lb $29, 62($6)
label853:
mflo $6
ori $10, $0, 0x7eaa
jal label858
lb $3, 98($10)
label858:
mflo $10
ori $26, $0, 0x7ec8
jal label863
lw $4, 88($26)
label863:
mtlo $26
mflo $26
ori $1, $0, 0x7eda
multu $1, $4
jal label869
lb $4, 50($1)
label869:
mtlo $1
mflo $1
lui $23, 0xffff
ori $23, $23, 0xffbf
multu $23, $7
jal label876
lw $7, 65($23)
label876:
mflo $23
ori $7, $0, 0x26a8
lb $23, 88($7)
mflo $7
ori $13, $0, 0x7eb9
multu $13, $25
lw $25, 87($13)
mtlo $13
mflo $13
ori $23, $0, 0x7eb3
multu $23, $26
jal label891
lw $26, 79($23)
label891:
mtlo $23
mflo $23
lui $18, 0x7fff
ori $18, $18, 0xffcd
multu $18, $30
jal label898
lb $30, 51($18)
label898:
mtlo $18
mflo $18
ori $4, $0, 0x2fb1
multu $4, $9
lw $9, 83($4)
mflo $4
lui $1, 0xffff
ori $1, $1, 0xff9f
multu $1, $7
jal label910
lh $7, 95($1)
label910:
mtlo $1
mflo $1
ori $18, $0, 0x2fa8
multu $18, $4
lh $4, 80($18)
mtlo $18
mflo $18
ori $30, $0, 0x7ed7
lw $7, 73($30)
mtlo $30
mflo $30
ori $15, $0, 0x7ed0
lw $3, 82($15)
mflo $15
ori $9, $0, 0x1c50
lb $23, 64($9)
mflo $9
lui $12, 0x7fff
ori $12, $12, 0xffa4
jal label933
lh $10, 92($12)
label933:
mtlo $12
mflo $12
lui $18, 0x7fff
ori $18, $18, 0xffcb
jal label940
lh $25, 54($18)
label940:
mflo $18
ori $16, $0, 0x7ec1
jal label946
lh $4, 61($16)
label946:
mflo $16
ori $29, $0, 0x7ebf
multu $29, $10
lh $10, 65($29)
mflo $29
ori $28, $0, 0x7ee4
jal label955
lh $6, 74($28)
label955:
mtlo $28
mflo $28
ori $11, $0, 0x7ec5
lb $29, 75($11)
mtlo $11
mflo $11
ori $23, $0, 0x2fb0
lb $26, 76($23)
mflo $23
ori $2, $0, 0x24b5
jal label968
lh $26, 55($2)
label968:
mtlo $2
mflo $2
lui $29, 0xffff
ori $29, $29, 0xffb3
jal label974
lh $24, 80($29)
label974:
mtlo $29
mflo $29
ori $17, $0, 0x2142
lw $21, 62($17)
mflo $17
ori $9, $0, 0xdd
jal label984
lw $16, 59($9)
label984:
mtlo $9
mflo $9
lui $22, 0x7fff
ori $22, $22, 0xffb9
multu $22, $18
jal label990
lw $18, 71($22)
label990:
mflo $22
ori $17, $0, 0x7ed8
lw $27, 72($17)
mtlo $17
mflo $17
end:
beq $0, $0, end
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
# 主要处理PC异常
_quick_handle:
    mfc0 $k0, $13
    andi $k0, $k0, 0x00fc

    # 没有srl指令，这一步骤判断异常是否为0x0004
    ori	$k1, $0, 0x0010
    beq	$k0, $k1, adel_handler_quick
    nop

    beq $0, $0, _entry
    nop

# 入口程序
_entry:
    mfc0 $1, $13
    ori	$k0, $0, 0x1000
    sw $sp, -4($k0)

    addi $k0, $k0, -256
    add $sp, $0, $k0

    beq $0, $0,	_save_context
    nop

# PC错误
adel_handler_quick:
    mfc0 $k0, $14
    addi $k0, $k0, -0x3000
    lui $k1, 0xffff
    ori $k1,$k1,0xe000
    and $k0,$k0,$k1
    bne $k0,$0,adel_type_2
    nop
    mfc0 $k0, $14
    andi $k0,$k0,3
    bne $k0,$0,adel_type_1
    nop
    jal _entry
    nop

# PC未对齐
adel_type_1:
    mfc0 $k0, $14
    andi $k0, $k0, 0xfffc
    addi $k0, $k0, 4
    mtc0 $k0, $14
    eret
    ori $1, $0, 0x1234

# PC超出范围
adel_type_2:
    ori $k0, $0, 0x2180
    lw $k0, 0($k0)
    mtc0 $k0,$14
    nop
    eret
    ori $1, $0, 0x1234

# 判断异常中断类型
_main_handler:
    mfc0 $k0, $13
    andi $k0, $k0, 0x00fc

    ori	$k1, $0, 0x0000
    beq	$k0, $k1, int_handler
    nop
    ori	$k1, $0, 0x0010
    beq	$k0, $k1, adel_handler
    nop
    ori	$k1, $0, 0x0014
    beq	$k0, $k1, ades_handler
    nop
    ori	$k1, $0, 0x0028
    beq	$k0, $k1, ri_handler
    nop
    ori	$k1, $0, 0x0030
    beq	$k0, $k1, ov_handler
    nop
    ori $k1, $0, 0x0020
    beq $k0, $k1, syscall_handler
    nop

# 判断中断类型
int_handler:
    sw $ra, 0($sp)
    addi $sp, $sp, -16
    mfc0 $v0, $12
    sw $v0, 0($sp)
    mfc0 $v0, $13
    sw $v0, 4($sp)

    # check INT[3]
    lw $v0, 0($sp)
    lw $v1, 4($sp)
    and	$v0, $v1, $v0
    andi $v0, $v0, 0x800
    bne	$v0, $0, timer1_handler
    nop

    # check INT[2]
    lw	$v0, 0($sp)
    lw	$v1, 4($sp)
    and	$v0, $v1, $v0
    andi $v0, $v0, 0x400
    bne	$v0, $0, timer0_handler
    nop
    jal interrupt_handler
    nop

# 外部中断
interrupt_handler:
    lui $k0, 0xffff
    ori $k0, $k0, 0xffff
    addi $k1, $0, 0x2180
    lw $k1, 0($k1)
    addi $k0, $0, 0x7f20
    sb $0, 0($k0)
    jal _restore_context
    nop

# Timer0中断
timer0_handler:
    lui $k0, 0xffff
    addi $k1, $0, 0x2180
    lw $k1, 0($k1)
    addi $k0, $0, 0x7f00
    sw $0, 0($k0)
    jal _restore_context
    nop

# Timer1中断
timer1_handler:
    lui $k0, 0xffff
    ori $k0, $k0, 0x1
    addi $k1, $0, 0x2180
    lw $k1, 0($k1)
    addi $k0, $0, 0x7f10
    sw $0, 0($k0)
    jal _restore_context
    nop

# 其他AdEL异常直接跳过
adel_handler:
    mfc0 $t0, $14
    mfc0 $k0, $13
    lui	$t2, 0x8000
    and	$t3, $k0, $t2
    addi $t0, $t0, 4
    bne	$t3, $t2, adel_nxt
    nop
    addi $t0, $t0, 4
    adel_nxt:
    mtc0 $t0, $14
    jal	_restore_context
    nop

# AdES异常直接跳过
ades_handler:
    mfc0 $t0, $14
    mfc0 $k0, $13
    lui	$t2, 0x8000
    and	$t3, $k0, $t2
    addi $t0, $t0, 4
    bne	$t3, $t2, ades_nxt
    nop
    addi $t0, $t0, 4
    ades_nxt:
    mtc0 $t0, $14
    jal	_restore_context
    nop

# 未知指令直接跳过
ri_handler:
    mfc0 $t0, $14
    mfc0 $k0, $13
    lui	$t2, 0x8000
    and	$t3, $k0, $t2
    addi $t0, $t0, 4
    bne	$t3, $t2, ri_nxt
    nop
    addi $t0, $t0, 4
    ri_nxt:
    mtc0 $t0, $14
    jal	_restore_context
    nop

# 算术溢出直接跳过
ov_handler:
    mfc0 $t0, $14
    mfc0 $k0, $13
    lui	$t2, 0x8000
    and	$t3, $k0, $t2
    addi $t0, $t0, 4
    bne	$t3, $t2, ov_nxt
    nop
    addi $t0, $t0, 4
    ov_nxt:
    mtc0 $t0, $14
    jal	_restore_context
    nop

# 处理一下syscall直接跳过
syscall_handler:
    mfc0 $t0, $14
    mfc0 $k0, $13
    lui	$t2, 0x8000
    and	$t3, $k0, $t2
    addi $t0, $t0, 4
    bne	$t3, $t2, syscall_nxt
    nop
    addi $t0, $t0, 4
    syscall_nxt:
    mtc0 $t0, $14
    jal	_restore_context
    nop

# 返回
_restore:
    eret
    ori $1, $0, 0x1234

# 保存上下文
_save_context:
    sw $2, 8($sp)
    sw $3, 12($sp)
    sw $4, 16($sp)
    sw $5, 20($sp)
    sw $6, 24($sp)
    sw $7, 28($sp)
    sw $8, 32($sp)
    sw $9, 36($sp)
    sw $10, 40($sp)
    sw $11, 44($sp)
    sw $12, 48($sp)
    sw $13, 52($sp)
    sw $14, 56($sp)
    sw $15, 60($sp)
    sw $16, 64($sp)
    sw $17, 68($sp)
    sw $18, 72($sp)
    sw $19, 76($sp)
    sw $20, 80($sp)
    sw $21, 84($sp)
    sw $22, 88($sp)
    sw $23, 92($sp)
    sw $24, 96($sp)
    sw $25, 100($sp)
    sw $28, 112($sp)
    sw $29, 116($sp)
    sw $30, 120($sp)
    sw $31, 124($sp)
    mfhi $k0
    sw $k0, 128($sp)
    mflo $k0
    sw $k0, 132($sp)
    jal	_main_handler
    nop

# 恢复上下文
_restore_context:
    addi $sp, $0, 0x1000
    addi $sp, $sp, -256
    lw $2, 8($sp)
    lw $3, 12($sp)
    lw $4, 16($sp)
    lw $5, 20($sp)
    lw $6, 24($sp)
    lw $7, 28($sp)
    lw $8, 32($sp)
    lw $9, 36($sp)
    lw $10, 40($sp)
    lw $11, 44($sp)
    lw $12, 48($sp)
    lw $13, 52($sp)
    lw $14, 56($sp)
    lw $15, 60($sp)
    lw $16, 64($sp)
    lw $17, 68($sp)
    lw $18, 72($sp)
    lw $19, 76($sp)
    lw $20, 80($sp)
    lw $21, 84($sp)
    lw $22, 88($sp)
    lw $23, 92($sp)
    lw $24, 96($sp)
    lw $25, 100($sp)
    lw $28, 112($sp)
    lw $30, 120($sp)
    lw $31, 124($sp)
    lw $k0, 128($sp)
    mthi $k0
    lw $k0, 132($sp)
    mtlo $k0
    lw $29, 116($sp)
    ori $1,$0,1
    beq $0, $0, _restore
    nop
