.data
input: .asciiz"Enter u = "
input1: .asciiz"Enter v = "
input2: .asciiz"Enter a = "
input3: .asciiz"Enter b = "
input4: .asciiz"Enter c = "
output: .asciiz"The integeral of f(u,v,a,b,c) = "
zero: .float 0
three: .float 3
two: .float 2
.text
	lwc1 $f10, zero
	lwc1 $f11, two
	lwc1 $f9, three
	
	li $v0, 4
	la $a0, input
	syscall
		
	li $v0, 6
	syscall
	add.s $f1, $f10, $f0 # $f1 = u
	
	li $v0, 4
	la $a0, input1
	syscall
		
	li $v0, 6
	syscall
	add.s $f2, $f10, $f0 # $f2 = v
	
	li $v0, 4
	la $a0, input2
	syscall
		
	li $v0, 6
	syscall
	add.s $f3, $f10, $f0 # $f3 = a
	
	li $v0, 4
	la $a0, input3
	syscall
		
	li $v0, 6
	syscall
	add.s $f4, $f10, $f0 # $f4 = b
	
	li $v0, 4
	la $a0, input4
	syscall
		
	li $v0, 6
	syscall
	add.s $f5, $f10, $f0 # $f5 = c
	
	sub.s $f6, $f2, $f1 # $f6 = v - u
	add.s $f8, $f2, $f1 # $f8 = v + u
	
	div.s $f4, $f4, $f11 # b/2
	div.s $f3, $f3, $f9 # a/3
	
	mul.s $f7, $f8, $f8
	mul.s $f13, $f1, $f2
	sub.s $f13, $f7, $f13
	mul.s $f13, $f13, $f3
	
	mul.s $f4, $f4, $f8
	add.s $f13, $f13, $f4
	add.s $f13, $f13, $f5
	mul.s $f13, $f13, $f6
	
	li $v0, 4
	la $a0, output
	syscall
		
	li $v0, 2
	add.s $f12, $f10, $f13
	syscall
