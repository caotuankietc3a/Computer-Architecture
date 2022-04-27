.data 
	myArray: .space 40
	input: .asciiz"myArray is: "
	output: .asciiz"\nThe sum is: "
	k: .word 10
.text	
	
	addi $t0, $zero, 0
	
	addi $t1, $zero, 10	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 20	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 30	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 40
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 50	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 60
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 70
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 80
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 90	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 100	
	sw $t1, myArray($t0)
	
	addi $t0, $zero, 0
	
	li $v0, 4
	la $a0, input
	syscall 
	
	jal print
	
	la $a0, myArray
	add $s3, $a0, 36
	
	lw $s0, k
	
	jal recursiveSum
	move $s3, $v0
	
	li $v0, 4
	la $a0, output
	syscall 
	
	li $v0, 1
	move $a0, $s3
	syscall 
	
	li $v0, 10
	syscall
	
	recursiveSum:
		addi $sp, $sp, -12
		sw $ra, 0($sp)
		sw $s0 4($sp)
		sw $t5, 8($sp)
		
		
		lw $v0, 0($a0)
		beq $s0, 1, return
		
		subi $s0, $s0, 1 
		lw $t5, 0($s3)
		subi $s3, $s3, 4
		
		jal recursiveSum
		
		add $v0, $v0, $t5
		
		return:
			lw $ra, 0($sp)
			lw $s0 4($sp)
			lw $t5, 8($sp)
			addi $sp, $sp, 12
			jr $ra
	
	print:
		addi $sp, $sp, -4
		sw $t0, 0($sp)
		
		addi $t0, $zero, 0
	while2:
		beq $t0, 40, exit2
		
		lw $t2, myArray($t0)
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		li $v0, 11
		la $a0, ' '
		syscall
		
		addi $t0, $t0, 4
		
		j while2
	exit2:
		
		lw $t0, 0($sp)
		addi $sp, $sp, 4
		jr $ra
