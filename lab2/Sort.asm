.data 
	myArray: .space 40
	input1: .asciiz"Enter 10 int-numbers:\n"
	input2: .asciiz"Before sorting: "
	input3: .asciiz"\nAfter sorting: "
.text
	li $v0, 4
	la $a0, input1
	syscall
	
	addi $s0, $zero, 40
	la $s1, myArray
	
	# Index
	addi $t0, $zero, 0
	
	addi $t1, $zero, 0
	# Enter input
	while:
		beq $t0, 40, exi
		
		li $v0, 5
		syscall
		move $t2, $v0
		sw $t2, myArray($t0)
		addi $t0, $t0, 4
		
		j while
	exi:
	li $v0, 4
	la $a0, input2
	syscall
	addi $t0, $zero, 0
	jal print
	
	jal sort
	
	li $v0, 4
	la $a0, input3
	syscall
	addi $t0, $zero, 0
	jal print
	
	li $v0, 10
	syscall
	
	sort:
		addi $sp, $sp, -4
		sw $s0, 0($sp) #size
		addi $t0, $zero, 0 #i = 0
		
		for:
			beq $t0, $s0, exit
			add $t7, $t0, $s1
			lw $t4, 0($t7)
			
			addi $t1, $t0, 4 # j = i+1
			for1:
				beq $t1, $s0, exit1
				
				add $t2, $t1, $s1
				lw $t3, 0($t2)
				
				slt $t5, $t4, $t3
				beq $t5, $zero, exit5
				
				move $t6, $t3
				move $t3, $t4
				move $t4, $t6
				
				sw $t4, 0($t7)
				sw $t3, 0($t2)
				
				exit5:
				addi $t1, $t1, 4
				j for1
			exit1:
		
			addi $t0, $t0, 4
			j for
		exit:
		
		lw $s0, 0($sp) #size
		addi $sp, $sp, 4
		
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