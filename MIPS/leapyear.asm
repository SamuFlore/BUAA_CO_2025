.macro exit
	li $v0, 10
	syscall
.end_macro

.macro true
	li $t4, 1
	move $a0, $t4
	li $v0, 1
	syscall
.end_macro

.macro false
	li $t4, 0
	move $a0, $t4
	li $v0, 1
	syscall
.end_macro

.text
li $v0, 5
syscall #read n
move $s0, $v0 #the year
li $t1, 4
li $t2, 100
li $t3, 400
div $s0, $t1 # year / 4
mfhi $s1 #year % 4
div $s0, $t2
mfhi $s2 #year % 100
div $s0, $t3
mfhi $s3 #year % 400

beqz $s3 branch1 #year % 400 == 0
j branch2 #year % 400 != 0

branch1:
	true #output 1
	j end
branch2:
	beqz $s1 branch3 #year % 4 == 0
	j branch4
branch3:
	bnez $s2 branch1 #year % 100 != 0, true
	j branch4
branch4:
	false #output 0
	j end
end:
	exit