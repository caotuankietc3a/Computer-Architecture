.data
	input1: .asciiz"Enter a integer number a = "
	input2: .asciiz"Enter a integer number b = "
	input3: .asciiz"Enter a integer number c = "
	input5: .asciiz"Enter a integer number d = "
	output1: .asciiz"f = (a+b) - (c-d-2) = "
	output2: .asciiz"\ng = (a+b)*3 - (c+d)*2 = "
.text
	# Input a = ?
	li $v0, 4
	la $a0, input1
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	# Input b = ?
	li $v0, 4
	la $a0, input2
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	
	# Input c = ?
	li $v0, 4
	la $a0, input3
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	
	# Input d = ?
	li $v0, 4
	la $a0, input5
	syscall
	li $v0, 5
	syscall
	move $s3, $v0
	
	add $t0, $s0, $s1
	sub $t1, $s2, $s3
	subi $t1, $t1, 2
	sub $t2, $t0, $t1
	
	mul $t0, $t0, 3
	add $t1, $s2, $s3
	mul $t1, $t1, 2
	sub $t3, $t0, $t1
	
	li $v0, 4
	la $a0, output1
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, output2
	syscall
	li $v0, 1
	move $a0, $t3
	syscall