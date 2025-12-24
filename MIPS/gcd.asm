.macro inputNum(%r)
	li $v0, 5
	syscall
	move %r, $v0
.end_macro

.macro push(%r)
	addi $sp, $sp, -4
	sw %r, 0($sp)
.end_macro

.macro pop(%r)
	lw %r, 0($sp)
	addi $sp, $sp, 4
.end_macro

inputNum($t0) #num1
inputNum($t1) #num2

jal gcd

li $v0, 1
syscall
li $v0, 10
syscall

gcd:
	push($ra)
	beqz $t1 iszero #if b == 0
	div $t0, $t1 #HI = a % b
	move $t0, $t1 #a = b
	mfhi $t1 #b = HI
	jal gcd
	pop($ra)
	jr $ra
	
iszero:
	move $a0, $t0 #a0 = a
	pop($ra)
	jr $ra