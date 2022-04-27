.data 
	myArray: .space 40
	output1: .asciiz"The sum of all odd elements = "
	output2: .asciiz"\nThe sum of all even elements = "
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
	addi $s0, $zero, 0
	while1:
	 	beq $t0, 40, exit1
	 	
	 	lw $t2, myArray($t0)
	 	add $s0, $t2, $s0
	 	addi $t0, $t0, 8
	 	j while1
	 	
	 exit1:
	 
	 addi $t0, $zero, 4
	 addi $s1, $zero, 0
	 while2:
	 	slti $t4, $t0, 40
	 	beq $t4, $zero, exit2
	 	
	 	lw $t3, myArray($t0)
	 	add $s1, $t3, $s1
	 	addi $t0, $t0, 8
	 	j while2
	 	
	 exit2:
	 
	li $v0, 4
	la $a0, output1
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	 
	 li $v0, 4
	la $a0, output2
	syscall
	li $v0, 1
	move $a0, $s1
	syscall