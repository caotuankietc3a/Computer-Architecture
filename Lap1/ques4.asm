.data
	input1: .asciiz"Enter 5 different integer numbers:\n"
	output: .asciiz"The reverse is: "
.text
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	li $v0, 5
	syscall
	move $s3, $v0
	
	li $v0, 5
	syscall
	move $s4, $v0
	
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall