.data
symbol: .space 28 # int symbol[7]
array: .space 28
space: .asciiz " "
enter: .asciiz "\n"


.macro readNum(%r)
	li $v0, 5
	syscall
	move %r, $v0
.end_macro

.macro getIndex(%ans, %i)
	sll %ans, %i, 2
.end_macro

.macro printI(%r)
	move $a0, %r
	li $v0, 1
	syscall
.end_macro

.macro printC(%char)
	la $a0, %char
	li $v0, 4
	syscall
.end_macro

.macro push(%r)
	addi $sp, $sp, -4
	sw %r, 0($sp)
.end_macro

.macro pop(%r)
	lw %r, 0($sp)
	addi $sp, $sp, 4
.end_macro

.macro end
	li $v0, 10
	syscall
.end_macro

.text
readNum($s0) # s0 = n
li $s1, 1 # s1 = parameter 1
li $t0, 0 # t0 = i
li $t2, 0 # t2 = index
jal FullArray
end


FullArray:
	bge $t2, $s0, branch1 # if index >= n
	j branch2
	branch1:
		li $t0, 0
		for_1:
			beq $t0, $s0, for_1_end
			getIndex($t3, $t0)
			lw $t4, array($t3) # t4 = array[i]
			printI($t4)
			printC(space)
			addi $t0, $t0, 1 # i++
			j for_1
		for_1_end:
			printC(enter)
			jr $ra
	branch2: # else
		li $t0, 0
		for_2:
			beq $t0, $s0, for_2_end
			getIndex($t3, $t0)
			lw $t4, symbol($t3) # t4 = symbol[i]
			beqz $t4, branch3 # if symbol[i] == 0
			j branch4
			branch3:
				getIndex($t5, $t2)
				addi $t6, $t0, 1
				sw $t6, array($t5) # array[index] = i + 1
				sw $s1, symbol($t3) # symbol[i] = 1
				push($ra) # ra
				push($t2) # index
				push($t0) # i
				push($t3) # addr of symbol[i]
				addi $t2, $t2, 1
				jal FullArray
				pop($t3)
				pop($t0)
				pop($t2)
				pop($ra)
				sw $0, symbol($t3) # symbol[i] = 0
			branch4:
				addi $t0, $t0, 1
				j for_2
		for_2_end:
			jr $ra