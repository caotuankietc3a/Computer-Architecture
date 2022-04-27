.data 
	myArray: .space 40
	input: .asciiz"myArray is: "
	output: .asciiz"\nThe max number in myArray is: "
	k: .word 10
.text	
	# Index 
	addi $t0, $zero, 0
	
	addi $t1, $zero, 3452	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 2	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 456	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 4
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 678	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 6
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 0
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 8	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 16	
	sw $t1, myArray($t0)
	addi $t0, $t0, 4
	
	addi $t1, $zero, 10	
	sw $t1, myArray($t0)
	
	addi $t0, $zero, 0
	
	li $v0, 4
	la $a0, input
	syscall 
	
	jal print
	
	lw $s0, k
	
	la $a0, myArray
	add $s1, $a0, 36
	
	jal recursiveMax
	move $s2, $v0
	
	li $v0, 4
	la $a0, output
	syscall 
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 10
	syscall
	
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
		
	recursiveMax:
		addi $sp, $sp, -12
		sw $ra, 0($sp)
		sw $s0 4($sp) # k
		sw $s3, 8($sp) # temp
		
		lw $v0, 0($a0)
		beq $s0, 1, return # k = 1
		
		subi $s0, $s0, 1 # k = k - 1
		lw $s3, 0($s1)
		subi $s1, $s1, 4
		
		jal recursiveMax
		
		slt $t3, $v0, $s3
		beq $t3, $zero, return
		
		move $v0, $s3
		
		return:
			
			lw $ra, 0($sp)
			lw $s0 4($sp)
			lw $s3, 8($sp)
			addi $sp, $sp, 12
			jr $ra
		
		
		
