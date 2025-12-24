.data
matrix: .space 484 # int matrix[11][11]
kernel: .space 484 # int kernel[11][11]
ans: .space 484 # int ans[11][11]
space: .asciiz " "
enter: .asciiz "\n"

.macro getIndex(%ans, %i, %j)
	li $s4, 11
	mult %i, $s4
	mflo %ans
	add %ans, %ans, %j
	sll %ans, %ans, 2
.end_macro

.macro exit
	li $v0, 10
	syscall
.end_macro

.macro readnum(%r)
	li $v0, 5
	syscall
	move %r, $v0
.end_macro

.macro outputNum(%r)
	li $v0, 1
	move $a0, %r
	syscall
.end_macro

.macro outputStr(%r)
	li $v0, 4
	la $a0, %r
	syscall
.end_macro

.text
readnum($s0) # s0 = line of matrix
readnum($s1) # s1 = col of matrix
readnum($s2) # s2 = line of kernel
readnum($s3) # s3 = col of kernel

li $t0, 0 # t0 = i
for_i:
	beq $t0, $s0, for_i_end
	li $t1, 0 # ti = j, col
	for_j:
		beq $t1, $s1, for_j_end
		readnum($t2) # t2 = input num
		getIndex($t3, $t0, $t1) # t3 = address
		sw $t2, matrix($t3)
		addi $t1, $t1, 1
		j for_j
	for_j_end:
		addi $t0, $t0, 1
		j for_i
for_i_end:
	li $t0, 0
	li $t1, 0
	
r_i:
	beq $t0, $s2, r_i_end
	li $t1, 0 # ti = j, col
	r_j:
		beq $t1, $s3, r_j_end
		readnum($t2) # t2 = input num
		getIndex($t3, $t0, $t1) # t3 = address
		sw $t2, kernel($t3)
		addi $t1, $t1, 1
		j r_j
	r_j_end:
		addi $t0, $t0, 1
		j r_i
r_i_end:
	li $t0, 0
	li $t1, 0

sub $s0, $s0, $s2 
addi $s0, $s0, 1 # ans's line = M - K + 1
sub $s1, $s1, $s3
addi $s1, $s1, 1 # ans's col = M - K + 1

li $t0, 0 # t0 = i

loop_i:
	beq $t0, $s0, loop_i_end
	li $t1, 0 # t1 = j
	loop_j:
		beq $t1, $s1, loop_j_end
		li $t2, 0 # t2 = x
		li $s5, 0 # s5 = tmp_sum
		loop_x:
			beq $t2, $s2, loop_x_end
			li $t3, 0 # t3 = y
			loop_y:
				beq $t3, $s3, loop_y_end
				add $t4, $t0, $t2 # t4 = i + x
				add $t5, $t1, $t3 # t5 = j + y
				getIndex($t6, $t4, $t5) # t6 = addr of matrix[i+x][j+y]
				lw $t7, matrix($t6) # t7 = matrix[i+x][j+y]
				getIndex($t6, $t2, $t3)
				lw $t8, kernel($t6) # t8 = kernel[x][y]
				mult $t7, $t8
				mflo $t9 # t9 = ans[i][j]
				add $s5, $s5, $t9 # tmp_sum += tmp_ans
				addi $t3, $t3, 1
				j loop_y
			loop_y_end:
				addi $t2, $t2, 1
				j loop_x
		loop_x_end:
			getIndex($t6, $t0, $t1)
			sw $s5, ans($t6)
			addi $t1, $t1, 1
			j loop_j
	loop_j_end:
		addi $t0, $t0, 1
		j loop_i
loop_i_end:
	li $t0, 0
	
	
out_i:
	beq $t0, $s0, out_i_end
	li $t1, 0
	out_j:
		beq $t1, $s1, out_j_end
		getIndex($t3, $t0, $t1)
		lw $t4, ans($t3)
		outputNum($t4)
		outputStr(space)
		addi $t1, $t1, 1
		j out_j
	out_j_end:
		outputStr(enter)
		addi $t0, $t0, 1
		j out_i
out_i_end:
	exit
	
