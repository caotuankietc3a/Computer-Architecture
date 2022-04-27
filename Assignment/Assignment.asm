.data
	input1: .asciiz"The first player selects a number(from 1 - 9): "
	input2: .asciiz"The second player selects a number(from 1 - 9): "
	input5: .asciiz"The first player is the winner!!!!!"
	input7: .asciiz"The second player is the winner!!!!"
	input3: .asciiz" | "
	input6: .asciiz" |"
	input4: .asciiz"  --- --- ---"
	input8: .asciiz"Please enter a different number that show in the table.!!!\n"
	input9: .asciiz"Who do you want to become?\n1. The first player: O\n2. The second player: X\n"
	input10: .asciiz"Please select the correct option!!!!!\n"
	input11: .asciiz"The result is draw!!!"
	input12: .asciiz"Enter your selection: "
	myArray: .space 36
.text
	main:
	
	# index $t1 is set to 0
	addi $t1, $zero, 0
	
	# Assign value for myArray
	# myArray will store '1', '2', '3', '4', '5', '6', '7', '8', '9'
	la $t0, '1'
	sb $t0 , myArray($t1)
	addi $t1, $t1, 4
	
	la $t0, '2'
	sb $t0 , myArray($t1)
	addi $t1, $t1, 4
	
	la $t0, '3'
	sb $t0 , myArray($t1)
	addi $t1, $t1, 4
	
	la $t0, '4'
	sb $t0 , myArray($t1)
	addi $t1, $t1, 4
	
	la $t0, '5'
	sb $t0 , myArray($t1)
	addi $t1, $t1, 4
	
	la $t0, '6'
	sb $t0 , myArray($t1)
	addi $t1, $t1, 4
	
	la $t0, '7'
	sb $t0 , myArray($t1)
	addi $t1, $t1, 4
	
	la $t0, '8'
	sb $t0 , myArray($t1)
	addi $t1, $t1, 4
	
	la $t0, '9'
	sb $t0 , myArray($t1)
	
	# set index $t1 = 0
	addi $t1, $zero, 0
	
	# count variable $t0 is set to 1 and use for printCharacter function
	addi $t0, $zero, 1
	
	
	# create count variable $s1 is set to 0 and use for printMarker function
	addi $s1, $zero, 0
	
	addi $s3, $zero, 0
	
	addi $s4, $zero, 2 # store value 2 to $s4
	
	
	Again:
	li $v0, 4
	la $a0, input9
	syscall
	li $v0, 4
	la $a0, input12
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	slti $s5, $s0, 3
	beq $s5, $zero, again1
	slt $s5, $zero, $s0
	beq $s5, $zero, again1
	bne $s5, $zero, while 
	
	again1:
	li $v0, 4
	la $a0, input10
	syscall
	j Again
	
	
	while:
		
		# check X or O win
		jal checkXorOWin
		la $s2, 'X'
		beq $v1, $s2, exitX
		la $s2, 'O'
		beq $v1, $s2, exitO
		
		
		# Print table
		jal printCharacter
		
		# count 9 times to exit 
		beq $s1, 9, exit
		
		div $s1, $s4 # $s1 / 2
		mfhi $s3
		# whenever $s1 is odd then ask player 2 for entering a number, else if $s1 is even then ask player 1 for entering a number
		bne $s3, 0, moveto
		li $v0, 4
		la $a0, input1
		syscall
		j here
		moveto:
		li $v0, 4
		la $a0, input2
		syscall
		# player enters a number
		here:
		li $v0, 5
		syscall
		move $s0, $v0
		# check whether or not that selected number is less than 10 
		# if not move to hack1 lable to force player enter a different number again
		slti $s5, $s0, 10
		beq $s5, $zero, hack1
		slt $s5, $zero, $s0
		beq $s5, $zero, hack1
		jal printMarker
		bne $v1, $zero, hack1
		
		addi $s1, $s1, 1
		
		jal checkXorOWin
		la $s2, 'X'
		beq $v1, $s2, exitX
		la $s2, 'O'
		beq $v1, $s2, exitO
		
		j while
			
		hack1:
			
			li $v0, 4
			la $a0, input8
			syscall
			addi $v1, $zero, 0
			j while
		
	exitX:
	addi $t1, $zero, 0
	jal printCharacter
	li $v0, 4
	la $a0, input7
	syscall
	j down
	
	exitO:
	addi $t1, $zero, 0
	jal printCharacter
	li $v0, 4
	la $a0, input5
	syscall
	j down
	
	exit:
	li $v0, 4
	la $a0, input11
	syscall
	
	down:
	#  Tell the system the program is done
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	printCharacter:
		# print string "  --- --- ---"
		li $v0, 4
		la $a0, input4
		syscall
		
		# print character '\n'
		li $v0, 11
		la $a0, '\n'
		syscall
		
		# create stack space and store value $t0, $t1
		addi $sp, $sp, -8
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		
		addi $t1, $t1, 0
		while1:
			beq $t1, 36, exit1
			
			# print string " | "
			li $v0, 4
			la $a0, input3
			syscall
			
			# print character '\n'
			li $v0, 11
			lb $a0, myArray($t1)
			syscall
		
		
			
			beq $t0, 3, jump1 # conpare count variable with 3 move to 
			addi $t1, $t1, 4
			addi $t0, $t0, 1
			j while1
			jump1: 
				li $v0, 4
				la $a0, input6
				syscall
			
				li $v0, 11
				la $a0, '\n'
				syscall
			
				li $v0, 4
				la $a0, input4
				syscall
			
				li $v0, 11
				la $a0, '\n'
				syscall
			
				addi $t1, $t1, 4
				addi $t0, $zero, 1
				j while1
		exit1:	
		# restore value in $t1, $t0 before and close the stack
		lw $t1, 4($sp)
		lw $t0, 0($sp)
		addi $sp, $sp, 8
		jr $ra
		
	printMarker: 
	
		addi $sp, $sp, -28
		sw $s0, 0($sp)
		sw $t2, 4($sp)
		sw $s1, 8($sp)
		sw $t3, 12($sp)
		sw $t1, 16($sp)
		sw $t0, 20($sp)
		sw $s3, 24($sp)
		
		addi $t2, $zero, 2 # store 2 into $t2
		
		# get target index address 
		#	myArray 1 2 3 4 5 6 7 8 9  
		#	index   0 1 2 3 4 5 6 7 8 
		subi $s0, $s0, 1 # to get index and multiply by 4 to get address
		mul $s0, $s0, 4
		
		# check if $s1 is even or odd , if $s1 is even then store 'O' into myArray else store 'X' into myArray
		# divide value in $t2 by $s1
		div $s1, $t2
		
		# get remainder value in hi-register to $s1
		mfhi $s1
		
		beq $s1, 0, even
			
			# check if there exists charater 'X' or 'O'
			# if there exist charater 'X' or 'O',then tell user enter a different number
			lb $s3, myArray($s0)
			la $t3, 'O'
			beq $t3, $s3, ext
			la $t3, 'X'
			beq $t3, $s3, ext
			
			# if not, store character 'X' to myArray at correspoding index 
			# store charater 'X' to myArray 
			la $t3, 'X'
			sb  $t3, myArray($s0)
			j exit2
		even:
			# check if there exists charater 'X' or 'O'
			# if there exists charater 'X' or 'O',then tell user enter a different number
			lb $s3, myArray($s0)
			la $t3, 'O'
			beq $t3, $s3, ext
			la $t3, 'X'
			beq $t3, $s3, ext
			
			# if not, store character 'O' to myArray at correspoding index 
			# store charater 'O' to myArray
			la $t3, 'O'
			sb  $t3, myArray($s0)
		exit2:
		# return value before computing
		lw $s3, 24($sp)
		lw $t0, 20($sp)
		lw $t1, 16($sp)
		lw $t3, 12($sp)
		lw $s1, 8($sp)
		lw $t2, 4($sp)
		lw $s0, 0($sp)
		addi $sp, $sp, 28
		jr $ra
		
		ext: 
			# return $v1 = 1 to know the charater 'X' or 'O' has already existed
			addi $v1, $zero, 1
			lw $s3, 24($sp)
			lw $t0, 20($sp)
			lw $t1, 16($sp)
			lw $t3, 12($sp)
			lw $s1, 8($sp)
			lw $t2, 4($sp)
			lw $s0, 0($sp)
			addi $sp, $sp, 28
			jr $ra
	
	checkXorOWin: 
		addi $sp, $sp, -36
		sw $t1, 0($sp)
		sw $t2, 4($sp)
		sw $t3, 8($sp)
		sw $t4, 12($sp) 
		sw $t5, 16($sp) # 'X' count
		sw $t6, 20($sp) # use for count 3 times 
		sw $t7, 24($sp)
		sw $t8, 28($sp)	# 'O' count
		sw $t9, 32($sp)
		
		addi $t4, $zero, 0
		addi $t5, $zero, 0
		addi $t8, $zero, 0
		addi $t6, $zero, 0
		addi $t1, $zero, -4
		
		# check X or O horizontally
		for3:		
				# when $t6= 3 then move to the next row to check
				beq $t6, 3, check
				# increase $t1 to 4 to get corresponding index and $t6 to count
				addi $t1, $t1, 4
				addi $t6, $t6, 1
				
				# when $t1 >= 36 then move to exit3 lable to check vertically
				slti $t4, $t1, 36
				beq $t4, $zero, exit3   
				
				# check myArray contains 'X' or not, if not move to chek lable
				la $t3, 'X'
				lb $t2, myArray($t1)
				bne $t2, $t3, chek
				
				# if a row contains 'X' then increase $t5 to 1 
				addi $t5, $t5, 1
				
				
				j for3
				
				chek:
				# to check myArray contains 'O' or not
				la $t3, 'O'
				lb $t2, myArray($t1)
				
				# if myArray does not contain 'O' then move to for3 label
				bne $t2, $t3, for3
				# if a row contains 'X' then increase $t8 to 1 
				addi $t8, $t8, 1
				
				
				j for3
			
				
			check:
				# check if contains enough 3 'X' or 3 'O' characters then go to out and out10 lable store 'X' and 'O' character to $v1 respectively
				beq $t5, 3, out
				beq $t8, 3, out10
				# reset $t5, $t8, $t6 to 0 if myArray does not contain enough 3 'X' or 3 'O' characters
				addi $t5, $zero, 0
				addi $t8, $zero, 0
				addi $t6, $zero, 0
				
				j for3
				
		out:
			la $v1, 'X'
			lw $t9, 32($sp)
			lw $t8, 28($sp)
			lw $t7, 24($sp)
			lw $t6, 20($sp)
			lw $t5, 16($sp)
			lw $t4, 12($sp) 
			lw $t3, 8($sp)
			lw $t2, 4($sp)
			lw $t1, 0($sp)
			addi $sp, $sp, 36
			jr $ra
		out10:
			la $v1, 'O'
			lw $t9, 32($sp)
			lw $t8, 28($sp)
			lw $t7, 24($sp)
			lw $t6, 20($sp)
			lw $t5, 16($sp)
			lw $t4, 12($sp) 
			lw $t3, 8($sp)
			lw $t2, 4($sp)
			lw $t1, 0($sp)
			addi $sp, $sp, 36
			jr $ra
		exit3: 
			# reset all value to 0
			addi $t1, $zero, 0
			addi $t5, $zero, 0 # count variable for 'X'
			addi $t6, $zero, 0 # check for moving to the next colunm when $t6 = 3
			addi $t8, $zero, 0 # count variable for 'O'
			
			# $t4, $t7 to compute some value
			addi $t4, $zero, 0
			addi $t7, $zero, 0
			
			# check X or O vertically
			for4:	
				beq $t6, 3, check1 # similar above when check for horizontally
				
				# when $t1 < 33 
				slti $t9, $t1, 33
				beq $t9, $zero, exit4
				
				 # check for moving to the next colunm when $t6 = 3
				
				# similar when check for horizontal
				la $t3, 'X'
				lb $t2, myArray($t1)
				bne $t2, $t3, chek1
				addi $t5, $t5, 1
				addi $t6, $t6, 1
				beq $t6, 3, check1
				
				# compute to get corresponding index of myArray 
				addi $t4, $t4, 3
				mul $t4, $t4, 4
				add $t1, $zero, $t4
				div $t4, $t4, 4
				j for4
				
				chek1:
				
				la $t3, 'O'
				lb $t2, myArray($t1)
				bne $t2, $t3, check1
				addi $t8, $t8, 1
				addi $t6, $t6, 1
				beq $t6, 3, check1
				
				# compute to get corresponding index of myArray 
				addi $t4, $t4, 3
				mul $t4, $t4, 4
				add $t1, $zero, $t4
				div $t4, $t4, 4
				
				j for4
				
			check1:
				beq $t5, 3, out1
				beq $t8, 3, out11
				addi $t7, $t7, 1
				mul $t7, $t7, 4
				move $t1, $t7
				div $t7, $t7, 4
				
				addi $t8, $zero, 0
				addi $t5, $zero, 0
				addi $t6, $zero, 0
				addi $t4, $t7, 0
				j for4
				
		out1:
			la $v1, 'X'
			lw $t9, 32($sp)
			lw $t8, 28($sp)
			lw $t7, 24($sp)
			lw $t6, 20($sp)
			lw $t5, 16($sp)
			lw $t4, 12($sp) 
			lw $t3, 8($sp)
			lw $t2, 4($sp)
			lw $t1, 0($sp)
			addi $sp, $sp, 36
			jr $ra
		out11:
			la $v1, 'O'
			lw $t9, 32($sp)
			lw $t8, 28($sp)
			lw $t7, 24($sp)
			lw $t6, 20($sp)
			lw $t5, 16($sp)
			lw $t4, 12($sp) 
			lw $t3, 8($sp)
			lw $t2, 4($sp)
			lw $t1, 0($sp)
			addi $sp, $sp, 36
			jr $ra
		exit4:
		
			# check diagnolize for 'X'
			addi $t1, $zero, 0
			addi $t5, $zero, 0
			addi $t4, $zero, 0
			addi $t7, $zero, 0
			
			la $t3, 'X'
			lb $t2, myArray($t1)
			bne $t2, $t3, exit5
			addi $t5, $t5, 1
			addi $t7, $t7, 4
			mul $t7, $t7, 4
			move $t1, $t7
			div $t7, $t7, 4
			
			lb $t2, myArray($t1)
			bne $t2, $t3, exit5
			addi $t5, $t5, 1
			addi $t7, $t7, 4
			mul $t7, $t7, 4
			move $t1, $t7
			div $t7, $t7, 4
			
			lb $t2, myArray($t1)
			bne $t2, $t3, exit5
			beq $t5, 3, out2
			   
		out2:
			la $v1, 'X'
			lw $t9, 32($sp)
			lw $t8, 28($sp)
			lw $t7, 24($sp)
			lw $t6, 20($sp)
			lw $t5, 16($sp)
			lw $t4, 12($sp) 
			lw $t3, 8($sp)
			lw $t2, 4($sp)
			lw $t1, 0($sp)
			addi $sp, $sp, 36
			jr $ra
		exit5: 
		
			# check diagnolize for 'X'
			addi $t1, $zero, 8
			addi $t5, $zero, 0
			addi $t7, $zero, 2
			
			la $t3, 'X'
			lb $t2, myArray($t1)
			bne $t2, $t3, exit6
			addi $t5, $t5, 1
			addi $t7, $t7, 2
			mul $t7, $t7, 4
			move $t1, $t7
			div $t7, $t7, 4
			
			lb $t2, myArray($t1)
			bne $t2, $t3, exit6
			addi $t5, $t5, 1
			addi $t7, $t7, 2
			mul $t7, $t7, 4
			move $t1, $t7
			div $t7, $t7, 4
			
			lb $t2, myArray($t1)
			bne $t2, $t3, exit6
			beq $t5, 3, out3
		out3:
			la $v1, 'X'
			lw $t9, 32($sp)
			lw $t8, 28($sp)
			lw $t7, 24($sp)
			lw $t6, 20($sp)
			lw $t5, 16($sp)
			lw $t4, 12($sp) 
			lw $t3, 8($sp)
			lw $t2, 4($sp)
			lw $t1, 0($sp)
			addi $sp, $sp, 36
			jr $ra
		exit6:
		
			# check diagnolize for 'O'
			addi $t1, $zero, 0
			addi $t8, $zero, 0
			addi $t6, $zero, 1
			addi $t4, $zero, 0
			addi $t7, $zero, 0
			
			la $t3, 'O'
			lb $t2, myArray($t1)
			bne $t2, $t3, exit7
			addi $t8, $t8, 1
			addi $t7, $t7, 4
			mul $t7, $t7, 4
			move $t1, $t7
			div $t7, $t7, 4
			
			lb $t2, myArray($t1)
			bne $t2, $t3, exit7
			addi $t8, $t8, 1
			addi $t7, $t7, 4
			mul $t7, $t7, 4
			move $t1, $t7
			div $t7, $t7, 4
			
			lb $t2, myArray($t1)
			bne $t2, $t3, exit7
			beq $t8, 3, out4
			   
		out4:
			la $v1, 'O'
			lw $t9, 32($sp)
			lw $t8, 28($sp)
			lw $t7, 24($sp)
			lw $t6, 20($sp)
			lw $t5, 16($sp)
			lw $t4, 12($sp) 
			lw $t3, 8($sp)
			lw $t2, 4($sp)
			lw $t1, 0($sp)
			addi $sp, $sp, 36
			jr $ra
		exit7: 
			# check diagnolize for 'O'
			addi $t1, $zero, 8
			addi $t8, $zero, 0
			addi $t7, $zero, 2
			
			lb $t2, myArray($t1)
			bne $t2, $t3, exit8
			addi $t8, $t8, 1
			addi $t7, $t7, 2
			mul $t7, $t7, 4
			move $t1, $t7
			div $t7, $t7, 4
			
			lb $t2, myArray($t1)
			bne $t2, $t3, exit8
			addi $t8, $t8, 1
			addi $t7, $t7, 2
			mul $t7, $t7, 4
			move $t1, $t7
			div $t7, $t7, 4
			
			lb $t2, myArray($t1)
			bne $t2, $t3, exit8
			beq $t8, 3, out5
		out5:
			la $v1, 'O'
			lw $t9, 32($sp)
			lw $t8, 28($sp)
			lw $t7, 24($sp)
			lw $t6, 20($sp)
			lw $t5, 16($sp)
			lw $t4, 12($sp) 
			lw $t3, 8($sp)
			lw $t2, 4($sp)
			lw $t1, 0($sp)
			addi $sp, $sp, 36
			jr $ra
		exit8:
		lw $t9, 32($sp)
		lw $t8, 28($sp)
		lw $t7, 24($sp)
		lw $t6, 20($sp)
		lw $t5, 16($sp)
		lw $t4, 12($sp) 
		lw $t3, 8($sp)
		lw $t2, 4($sp)
		lw $t1, 0($sp)
		addi $sp, $sp, 36
		jr $ra
		
