.data
	input1: .asciiz"Enter an integer number: "
	output: .asciiz"The output is = "


.text
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall 
	
	move $t0, $v0
	
	
	addi $t0, $t0, 1
	
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	