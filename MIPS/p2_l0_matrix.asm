.data
matrix1: .space 256 # int m1[8][8]
matrix2: .space 256 # int m2[8][8]
ans: .space 256 # int ans[8][8]
space: .asciiz " "
enter: .asciiz "\n"

.macro exit
	li $v0, 10
	syscall
.end_macro

.macro readnum(%r)
	li $v0, 5
	syscall
	move %r, $v0
.end_macro

.macro getIndex(%ans, %i, %j)
	sll %ans, %i, 3
	add %ans, %ans, %j
	sll %ans, %ans, 2
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
readnum($s0) # s0 = n
li $t0, 0 # t0 = i, line


for_i:
	beq $t0, $s0, for_i_end
	li $t1, 0 # ti = j, col
	for_j:
		beq $t1, $s0, for_j_end
		readnum($t2) # t2 = input num
		getIndex($t3, $t0, $t1) # t3 = address
		sw $t2, matrix1($t3)
		addi $t1, $t1, 1
		j for_j
	for_j_end:
		addi $t0, $t0, 1
		j for_i
for_i_end:
	li $t0, 0
	li $t1, 0
	
r_i:
	beq $t0, $s0, r_i_end
	li $t1, 0 # ti = j, col
	r_j:
		beq $t1, $s0, r_j_end
		readnum($t2) # t2 = input num
		getIndex($t3, $t0, $t1) # t3 = address
		sw $t2, matrix2($t3)
		addi $t1, $t1, 1
		j r_j
	r_j_end:
		addi $t0, $t0, 1
		j r_i
r_i_end:
	li $t0, 0
	li $t1, 0
	
loop_i:
	beq $t0, $s0, loop_i_end #t0 = i, t1 = j
	li $t1, 0
	loop_j:
		beq $t1, $s0, loop_j_end
		li $t2, 0 # t2 = index of a line or a col
		li $t9, 0 #t9 = tmp_sum
		loop:
			beq $t2, $s0, loop_end
			getIndex($t3, $t0, $t2) #t3 = address of matrix1 elements
			getIndex($t4, $t2, $t1) #t4 = addr of matrix2 elems
			lw $t5, matrix1($t3)
			lw $t6, matrix2($t4)
			mult $t5, $t6
			mflo $t7
			add $t9, $t9, $t7
			addi $t2, $t2, 1
			j loop
		loop_end:
			getIndex($t8, $t0, $t1) # t8 = addr of ans elems
			sw $t9, ans($t8)
			addi $t1, $t1, 1 # j++
			j loop_j
	loop_j_end:
		addi $t0, $t0, 1
		j loop_i
loop_i_end:
	li $t0, 0
	li $t1, 0

out_i:
	beq $t0, $s0, out_i_end
	li $t1, 0
	out_j:
		beq $t1, $s0, out_j_end
		getIndex($t8, $t0, $t1)
		lw $t2, ans($t8)
		outputNum($t2)
		outputStr(space)
		addi $t1, $t1, 1
		j out_j
	out_j_end:
		outputStr(enter)
		addi $t0, $t0, 1
		j out_i
out_i_end:
	exit

		
		