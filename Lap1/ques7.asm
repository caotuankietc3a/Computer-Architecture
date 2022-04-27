.data 
	myArray: .space 40
	input1: .asciiz"Enter 10 int-numbers:\n"
	output: .asciiz"The sum is: "
.text
	li $v0, 4
	la $a0, input1
	syscall
	
	
	# Index
	addi $t0, $zero, 0
	addi $s0, $zero, 0
	# Enter input
	while:
		beq $t0, 40, exit
		
		li $v0, 5
		syscall
		move $t2, $v0
		sw $t2, myArray($t0)
		addi $t0, $t0, 4
		add $s0, $s0, $t2
		j while
	exit:
	
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 1
	move $a0, $s0
	syscall