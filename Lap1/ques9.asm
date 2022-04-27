.data 
	myArray: .space 40
	input1: .asciiz"Enter 10 int-numbers:\n"
	output: .asciiz"The reverse array is: "
	output1: .asciiz" "
.text
	# Index 
	addi $t0, $zero, 0
	
	addi $t1, $zero, 1	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 3	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 5	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 7
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 9	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 11
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 13	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 15	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 17	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 19	
	sw $t1, myArray($t0)
	
	addi $t0, $zero, 36
	addi $t1, $zero, 0
	
	while:
		beq $t0, 16 , exit
		
		lw $s0, myArray($t0)
		lw $s1, myArray($t1)
		sw $s1, myArray($t0)
		sw $s0, myArray($t1)
		
		subi $t0, $t0, 4
		addi $t1, $t1, 4
		j while
		
	exit:
	
	li $v0, 4
	la $a0, output
	syscall 
	
	addi $t0, $zero, 0
	while1:
		beq $t0, 40 , exit1
		
		lw $s0, myArray($t0)
		
		li $v0, 1
		move $a0, $s0
		syscall
		
		li $v0, 4
		la $a0, output1
		syscall 
		
		addi $t0, $t0, 4
		
		j while1
	
	exit1:
	
	