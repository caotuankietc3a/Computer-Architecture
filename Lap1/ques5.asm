.data 
	myArray: .space 40
	output: .asciiz"The sum from 1 to 10 is: "
.text	
	# Index 
	addi $t0, $zero, 0
	# Sum
	addi $s0, $zero, 0
	
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
	
	while:
	 	beq $t0, 40, exit
	 	
	 	lw $t2, myArray($t0)
	 	add $s0, $t2, $s0
	 	addi $t0, $t0, 4
	 	j while
	 	
	 exit:
	
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 1
	move $a0, $s0
	syscall