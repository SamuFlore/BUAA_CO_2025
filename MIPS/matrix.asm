.data
matrix: .space 10000 # int matrix[50][50]
space: .asciiz " "
enter: .asciiz "\n"

.macro exit
	li $v0, 10
	syscall
.end_macro

.macro getindex(%ans, %i, %j) # get address of matrix[i][j]
	li $s5, 50 
	mult $t0, $s5
	mflo %ans # ans = i * 50
	add %ans, %ans, %j # ans = ans + j
	sll %ans, %ans, 2 # ans = ans * 4, address
.end_macro

.macro outputnum(%num)
	move $a0, %num
	li $v0, 1
	syscall
.end_macro

.macro outputstr(%str)
	la $a0, %str
	li $v0, 4
	syscall
.end_macro

.text
li $v0, 5
syscall
move $s0, $v0 #s0 = row
li $v0, 5
syscall
move $s1, $v0 #s1 = column
li $t0, 0 #i = 0

for_i: # for i; i < row; i++
	beq $t0, $s0, for_i_end #i == row, break
	li $t1, 0 #j = 0
for_j: #for j; j < col; j++
	beq $t1, $s1, for_j_end #j = col, break
	li $v0, 5
	syscall #read a num
	getindex($t2, $t0, $t1) #t2 = address
	sw $v0, matrix($t2) #num -> matrix[i][j]
	addi $t1, $t1, 1 #j++
	j for_j
for_j_end:
	addi $t0, $t0, 1 #i++
	j for_i
for_i_end:
	li $t0, 0 #i = 0
	
move $t0, $s0
subi $t0, $t0, 1 #i = row - 1
r_i: # for i = row - 1; i >= 0; i--
	bltz $t0, r_i_end
	move $t1, $s1
	subi $t1, $t1, 1 #j = col - 1
r_j: #for j = col - 1; j >= 0; j--
	bltz $t1, r_j_end
	getindex($t2, $t0, $t1)
	lw $t3, matrix($t2) #matrix[i][j] -> t3
	bnez $t3 branch1 #num != 0
	j end
	
	branch1:
		move $s3, $t0
		addi $s3, $s3, 1 #s3 = i + 1
		move $s4, $t1
		addi $s4, $s4, 1 #s4 = j + 1
		outputnum($s3) #output i + 1
		outputstr(space)
		outputnum($s4) #output j + 1
		outputstr(space)
		outputnum($t3)
		outputstr(enter)
		j end
	end:
		subi $t1, $t1, 1 # j--
		j r_j
r_j_end:
	subi $t0, $t0, 1 # i--
	j r_i
r_i_end:
	exit
