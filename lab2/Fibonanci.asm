.data
	output: .asciiz" first elements of the Fibonacci Sequence: "
	input: .asciiz"Enter a positive number: "
	input1: .asciiz" "
	input2: .asciiz"Please enter a positive number: "
.text
	li $v0, 4
	la $a0, input
	syscall
	
	again1:
	li $v0, 5
	syscall
	move $s0, $v0
	
	slti $t2, $s0, 1
	bne $t2, $zero, again
	j move1
	
	again:
		li $v0, 4
		la $a0, input2
		syscall
		j again1
	
	move1:
	addi $t0, $zero, 1
	bne $s0, $t0, here
	addi $t0, $zero, 0
	
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	j out
	
	here:
	addi $t0, $zero, 2
	bne $s0, $t0, here1
	addi $t0, $zero, 0
	
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	addi $t0, $zero, 1
	
	li $v0, 11
	la $a0,' '
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	j out
	
	here1:
	
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, output
	syscall
	
	
	addi $t0, $zero, 0
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, input1
	syscall
	addi $t0, $zero, 1
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, input1
	syscall
	
	jal Fibonacci
	
	
	
	out:
	li $v0, 10
	syscall
	
	Fibonacci:
		addi $sp, $sp, -24
		sw $s0, 0($sp) 
		sw $t0, 4($sp) # a
		sw $t1, 8($sp)	# b
		sw $t2, 12($sp)	#sum
		sw $t3, 16($sp)	# count
		sw $t4, 20($sp)
		
		addi $t3, $zero, 2
		addi $t0, $zero, 1
		addi $t1, $zero, 0
		while:
			slt $t4, $t3, $s0
			beq $t4, $zero, exit
			
			addi $t3, $t3, 1
			
			add $t2, $t0, $t1
			
			addi $t1, $t0, 0
			addi $t0, $t2, 0
			
			li $v0, 1
			move $a0, $t2
			syscall
			li $v0, 4
			la $a0, input1
			syscall
			
			j while
		exit:
			
			
			
			
		
			lw $t4, 20($sp)
			lw $t3, 16($sp)	# count
			lw $t2, 12($sp)	#sum
			lw $t1, 8($sp)	# b
			lw $t0, 4($sp) # a
			lw $s0, 0($sp) 
			addi $sp, $sp, 24
			jr $ra
