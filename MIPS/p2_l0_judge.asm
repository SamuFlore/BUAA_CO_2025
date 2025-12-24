.data
array: .space 80 # char arr[20]


.macro exit
	li $v0, 10
	syscall
.end_macro

.macro readNum(%r)
	li $v0, 5
	syscall
	move %r, $v0
.end_macro

.macro readChar(%r)
	li $v0, 12
	syscall
	move %r, $v0
.end_macro

.macro outputNum(%r)
	move $a0, %r
	li $v0, 1
	syscall
.end_macro

.macro getIndex(%ans, %i)
	sll %ans, %i, 2
.end_macro

.text
readNum($s0) # s0 = num of char
li $t0, 0 # t0 = i
for:
	beq $t0, $s0, for_end
	readChar($t2) # t2 = char
	getIndex($t1, $t0) # t1 = index of arr
	sw $t2, array($t1)
	addi $t0, $t0, 1
	j for
for_end:
li $t0, 0
move $t3, $s0
addi $t3, $t3, -1 # t3 = n - 1
li $t4, 1 # t4 = isTrue


for_2:
	bge $t0, $t3, for_2_end # if t0 >= t3, break
	getIndex($t1, $t0)
	lw $t5, array($t1) # t5 = arr[t0]
	getIndex($t2, $t3)
	lw $t6, array($t2) # t6 = arr[t3]
	bne $t5, $t6, branch1 # if (t5 != t6) t4 = 0; break;
	j branch2
	branch1:
		li $t4, 0
		j for_2_end
	branch2:
	addi $t0, $t0, 1 # t0++
	addi $t3, $t3, -1 # t3--
	j for_2
for_2_end:
	outputNum($t4)
	exit
	
	
	