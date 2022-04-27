.data
	Array: .asciiz"Ho Chi Minh City - University of Technology"
	output: .asciiz"\nThe reversed string is: "
	input: .asciiz"Before reverse: "
.text
	la $a0,	Array 
	addi $a1, $zero, 43 # size\
	
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 4
	la $a0, Array
	syscall
	
	jal reverse
	
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 4
	la $a0, Array
	syscall
	
	li $v0, 10
	syscall
	
	reverse:
		addi $sp, $sp, -28
		sw $a1, 0($sp) # size
		sw $t0, 4($sp) 
		sb $t1, 8($sp)	
		sw $t2, 12($sp)
		sb $t3, 16($sp)
		sw $t4, 20($sp)
		sw $s0, 24($sp)
		addi $t0, $zero, 0
		
		
		for:	
			addi $t2, $zero, 2
			div $a1, $t2
			mflo $t2
			slt $t2, $t0, $t2
			beq $t2, $zero, exit 
			add $s0, $t0, $a0 
			
			lb $t3 ,0($s0)
			move $t1, $t3 
			subi $t4, $a1, 1
			sub $t4, $t4, $t0
			add $t4, $t4, $a0 
			lb $t3, 0($t4)
			
			sb $t3, 0($s0)
			sb $t1, 0($t4)
			
			sub $t4, $t4, $a0 
			
			addi $t0, $t0, 1
			j for
			
		exit:
			lw $s0, 24($sp)
			lw $t4, 20($sp)
			lb $t3, 16($sp)
			lw $t2, 12($sp)
			lb $t1, 8($sp)
			lw $t0, 4($sp)
			lw $a1, 0($sp)
			addi $sp, $sp, 28
			jr $ra
