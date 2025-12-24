.data
puzzle: .space 324 # int puzzle[9][9]

.macro end
	li $v0, 10
	syscall
.end_macro

.macro readN(%r)
	li $v0, 5
	syscall
	move %r, $v0
.end_macro

.macro printN(%r)
	move $a0, %r
	li $v0, 1
	syscall
.end_macro

.macro getIndex(%ans, %i, %j)
	li $s1, 9
	multu $s1, %i
	mflo %ans
	addu %ans, %ans, %j
	sll %ans, %ans, 2
.end_macro

.macro push(%r)
	addi $sp, $sp, -4
	sw %r, 0($sp)
.end_macro

.macro pop(%r)
	lw %r, 0($sp)
	addi $sp, $sp, 4
.end_macro

.text
main:
li $s1, 9 # para s1 = 9
li $s2, 1 # para s2 = 1
li $t0, 0 # t0 = i 
li $a1, 0 # a1 = lines
initial_i:
	beq $t0, $s1, initial_i_end
	li $t1, 0 # t1 = j
	initial_j:
		beq $t1, $s1, initial_j_end
		getIndex($t2, $t0, $t1)
		sw $s2, puzzle($t2) # puzzle[i][j] = 1
		addi $t1, $t1, 1
		j initial_j
	initial_j_end:
		addi $t0, $t0, 1
		j initial_i
initial_i_end:

readN($s3) # s3 = n
readN($s4) # s4 = m
li $t0, 1 # i = 1
for_i:
	bgt $t0, $s3, for_i_end # for i = 1; i <= n; i++
	li $t1, 1 # j = 1
	for_j:
		bgt $t1, $s4, for_j_end # for j = 1; j <= m; j++
		readN($t2)
		getIndex($t3, $t0, $t1)
		sw $t2, puzzle($t3) # puzzle[i][j] = scanf
		addi $t1, $t1, 1
		j for_j
	for_j_end:
		addi $t0, $t0, 1
		j for_i
for_i_end:

readN($t5) # start x, x0
readN($t6) # start y, y0
readN($s5) # end x, param
readN($s6) # end y, param

jal dfs
printN($a1)
end

dfs:
	beq $t5, $s5, branch1
	j branch2
	branch1:
		beq $t6, $s6, branch3
		j branch2
	branch3:
		addi $a1, $a1, 1 # lines++
		jr $ra # return
	branch2:
	################## down
	addi $t7, $t5, 1 # t7 = tmp_x0, tmp_y0, puzzle[tmp_x0][tmp_y0]
	getIndex($t8, $t7, $t6)
	lw $t7, puzzle($t8)
	bne $t7, $s2, down # t7 != 1, go down
	j no_down
	down:
		getIndex($t8, $t5, $t6)
		sw $s2, puzzle($t8) # puzzle[x0][y0] = 1
		push($ra)
		push($t5) # x0
		push($t6) # y0
		addi $t5, $t5, 1 # dfs(x0+1, y0)
		jal dfs
		pop($t6)
		pop($t5)
		pop($ra)
		getIndex($t8, $t5, $t6)
		sw $zero, puzzle($t8) # puzzle[x0][y0] = 0
	no_down:
	
	################## right
	addi $t7, $t6, 1
	getIndex($t8, $t5, $t7)
	lw $t7, puzzle($t8)
	bne $t7, $s2, right # t7 != 1, go right
	j no_right
	right:
		getIndex($t8, $t5, $t6)
		sw $s2, puzzle($t8) # puzzle[x0][y0] = 1
		push($ra)
		push($t5) # x0
		push($t6) # y0
		addi $t6, $t6, 1 # dfs(x0, y0+1)
		jal dfs
		pop($t6)
		pop($t5)
		pop($ra)
		getIndex($t8, $t5, $t6)
		sw $zero, puzzle($t8) # puzzle[x0][y0] = 0
	no_right:
	
	################## up
	addi $t7, $t5, -1
	getIndex($t8, $t7, $t6)
	lw $t7, puzzle($t8)
	bne $t7, $s2, up # t7 != 1, go up
	j no_up
	up:
		getIndex($t8, $t5, $t6)
		sw $s2, puzzle($t8) # puzzle[x0][y0] = 1
		push($ra)
		push($t5) # x0
		push($t6) # y0
		addi $t5, $t5, -1
		jal dfs
		pop($t6)
		pop($t5)
		pop($ra)
		getIndex($t8, $t5, $t6)
		sw $zero, puzzle($t8) # puzzle[x0][y0] = 0
	no_up:
	
	################## left
	addi $t7, $t6, -1
	getIndex($t8, $t5, $t7)
	lw $t7, puzzle($t8)
	bne $t7, $s2, left # t7 != 1, go left
	j no_left
	left:
		getIndex($t8, $t5, $t6)
		sw $s2, puzzle($t8) # puzzle[x0][y0] = 1
		push($ra)
		push($t5) # x0
		push($t6) # y0
		addi $t6, $t6, -1
		jal dfs
		pop($t6)
		pop($t5)
		pop($ra)
		getIndex($t8, $t5, $t6)
		sw $zero, puzzle($t8) # puzzle[x0][y0] = 0
	no_left:
	
jr $ra # end of dfs
	