.data
	input1: .asciiz"Enter 2 integer numbers:\n"
	output: .asciiz"The sum is = "


.text

	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall 
	move $t0, $v0
	li $v0, 5
	syscall 
	move $t1, $v0
	
	add $t0, $t0, $t1
	
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall