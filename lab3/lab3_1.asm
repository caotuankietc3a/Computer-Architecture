.data
	input9: .asciiz"Which area of th shape do you want to compute ?\n1. Triangle\n2. Circle\n3. Rectangle\n4. Square\n"
	input12: .asciiz"Enter your selection: "
	input10: .asciiz"Please select the correct option!!!!!\n"
	input: .asciiz"Enter the height of Triangle: "
	output: .asciiz"Area of the Triangle: "
	output1: .asciiz"Area of the Circle: "
	output2: .asciiz"Area of the Rectangle: "
	output3: .asciiz"Area of the Square: "
	input1: .asciiz"Enter the bottom edge: "
	input2: .asciiz"Enter r = "
	input5: .asciiz"Enter a = "
	input3: .asciiz"Enter a width edge: "
	input4: .asciiz"Enter a long edge: "
	number: .float 0.5
	zeroF: .float 0
	pi: .float 3.14
.text

Again:
	li $v0, 4
	la $a0, input9
	syscall
	li $v0, 4
	la $a0, input12
	syscall
	li $v0, 5
	syscall
	move $s0, $v0 # input
	
	slti $s5, $s0, 5
	beq $s5, $zero, again1
	slt $s5, $zero, $s0
	beq $s5, $zero, again1
	bne $s5, $zero, Main
	
	again1:
	li $v0, 4
	la $a0, input10
	syscall
	j Again
	
	Main:
		lwc1 $f9, number	# $f9 = 0.5
		lwc1 $f10, zeroF	# $f10 = 0.0
		
		bne $s0, 1, Circle
		
		li $v0, 4
		la $a0, input
		syscall
		
		li $v0, 6
		syscall
		add.s $f1, $f10, $f0
		
		li $v0, 4
		la $a0, input1
		syscall
		
		li $v0, 6
		syscall
		add.s $f2, $f10, $f0		
		
		mul.s $f3, $f1, $f2
		mul.s $f3, $f3, $f9
		
		li $v0, 4
		la $a0, output
		syscall
		
		li $v0, 2
		add.s $f12, $f10, $f3
		syscall
		
		j exit
	Circle:
		bne $s0, 2, Rectangle
		
		lwc1 $f8, pi
		
		li $v0, 4
		la $a0, input2
		syscall
		
		li $v0, 6
		syscall
		add.s $f1, $f10, $f0
		
		mul.s $f1, $f1, $f1
		mul.s $f1, $f1, $f8
		
		li $v0, 4
		la $a0, output1
		syscall
		
		li $v0, 2
		add.s $f12, $f10, $f1
		syscall
		
		j exit
		
		
		
	Rectangle:	
		bne $s0, 3, Square
		
		li $v0, 4
		la $a0, input3
		syscall
		
		li $v0, 6
		syscall
		add.s $f1, $f10, $f0
		
		li $v0, 4
		la $a0, input4
		syscall
		
		li $v0, 6
		syscall
		add.s $f2, $f10, $f0
		
		mul.s $f3, $f2, $f1
		
		li $v0, 4
		la $a0, output2
		syscall
		
		li $v0, 2
		add.s $f12, $f10, $f3
		syscall
		
		j exit
		
	Square:
		
		li $v0, 4
		la $a0, input5
		syscall
		
		li $v0, 6
		syscall
		add.s $f1, $f10, $f0
		
		mul.s $f1, $f1, $f1
		
		li $v0, 4
		la $a0, output3
		syscall
		
		li $v0, 2
		add.s $f12, $f10, $f1
		syscall
	exit:	
