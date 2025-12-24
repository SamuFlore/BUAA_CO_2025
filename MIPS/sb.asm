li $s0, 0x12345678
sw $s0, 0($0)
li $t0, 0x0000ffff

sb $t0, 1($0)

lb $t2, 1($0)
