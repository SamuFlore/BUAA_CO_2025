.data
matrix: .space 256 # int matrix[8][8]
book: .space 32 # int book[8]

.macro exit
	li $v0, 10
	syscall
.end_macro

.macro negate(%r)
	beqz %r, zero
	j one
	zero:
		li %r, 1
		j end
	one:
		li %r, 0
	end:
.end_macro

.macro getIndex(%ans, %i, %j)
	sll %ans, %i, 3
	add %ans, %ans, %j
	sll %ans, %ans, 2
.end_macro

.macro getIndex2(%ans, %i)
	sll %ans, %i, 2
.end_macro

.macro push(%r) # stack in
	addi $sp, $sp, -4
	sw %r, 0($sp)
.end_macro

.macro pop(%r) # stack out
	lw %r, 0($sp)
	addi $sp, $sp, 4
.end_macro

.text
li $v0, 5 # num of vertex
syscall
move $s0, $v0 # line, line = col = n = s0
li $v0, 5
syscall 
move $s2, $v0  # num of edge, m
sll $s2, $s2, 1 # 2 * m
li $s3, 1 # s3 = parameter = 1

li $t4, 0 # t4 = index of book = x
li $t0, 0 # cnt = 0
li $t7, 0 # t7 = ans
while: # while cnt < 2 * s2
	beq $t0, $s2, while_end
	li $v0, 5
	syscall 
	move $t1, $v0 # t1 = vertex 1
	addi $t1, $t1, -1
	li $v0, 5
	syscall
	move $t2, $v0 # t2 = vertex 2
	addi $t2, $t2, -1
	getIndex($t3, $t1, $t2) # t3 = index of the edge
	sw $s3, matrix($t3)
	getIndex($t3, $t2, $t1) # undirected graph!!!
	sw $s3, matrix($t3)
	addi $t0, $t0, 2 # cnt += 2
	j while
while_end:
	jal dfs
	move $a0, $t7
	li $v0, 1
	syscall
	exit


	
dfs:
		li $s4, 1 # s4 = flag
		li $t5, 0 # t5 = i
		getIndex2($t8, $t4)
		sw $s3, book($t8) # book[x] = 1
		for_check:
			beq $t5, $s0, for_check_end # i == n, break
			getIndex2($t8, $t5) # t8 = index of book
			lw $t6, book($t8) # t6 = book[i]
			and $s4, $s4, $t6 # flag &= book[i]
			addi $t5, $t5, 1 # i++
			j for_check
		for_check_end:
		getIndex($t3, $t4, $0)
		lw $s1, matrix($t3) # s1 = matrix[x][0]
		beq $s4, $s3, branch1 # flag == 1
		j branch2
		branch1:
			beq $s1, $s3, branch3 # and matrix[x][0] == 1
			j branch2
		branch3:
			li $t7, 1 # ans = 1
			jr $ra
		branch2:
		li $t5, 0
		for_search:
			beq $t5, $s0, for_search_end # for i = 0; i < n; i++
			getIndex2($t8, $t5)
			lw $t6, book($t8) # t6 = book[i]
			negate($t6) # t6 = !t6
			getIndex($t3, $t4, $t5) 
			lw $s1, matrix($t3) # s1 = matrix[x][i]
			beq $t6, $s3, branch4 # if !book[i] == 1
			j branch5
			branch4:
				beq $s1, $s3, branch6 # and matrix[x][i] == 1
				j branch5
			branch6:
				push($ra)
				push($t4) # stack in x
				push($t5) # stack in i
				push($s4) # stack in flag
				move $t4, $t5 # dfs(i)
				jal dfs
				pop($s4)
				pop($t5)
				pop($t4)
				pop($ra)
				addi $t5, $t5, 1
				j for_search
			branch5:
				addi $t5, $t5, 1
				j for_search
		for_search_end:
			getIndex2($t8, $t4)
			sw $0, book($t8)
			jr $ra


	
