.data 
	myArray: .space 40
	input1: .asciiz"Enter your number from 1 to 9: "
	output1: .asciiz"The value at index "
	output2: .asciiz" is: "
.text	
	# Index 
	addi $t0, $zero, 0
	
	addi $t1, $zero, 1	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 2	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 3	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 4
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 5	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 6
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 7	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 8	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 9	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 10	
	sw $t1, myArray($t0)
	
	addi $t0, $zero, 0
	
	li $v0, 4
	la $a0, input1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	mul $t1, $t0, 4
	lw $s0, myArray($t1)
	
	li $v0, 4
	la $a0, output1
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, output2
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	