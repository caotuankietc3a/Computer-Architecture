.data
fout: .asciiz "testout.txt" 
dataFromfile: ""
.text

li $v0, 13 # system call for open file
la $a0, fout # input file name
li $a1, 0 # Open for reading (flags are 0: read, 1: write)
li $a2, 0 # mode is ignored
syscall # open a file (file descriptor returned in $v0)
move $s6, $v0 # save the file descriptor

li $v0, 14 # system call for read
move $a0, $s6 # file descriptor
la $a1, dataFromfile # address of buffer read
li $a2, 100 # hardcoded buffer length
syscall # read file


li $v0, 9 # system call code for dynamic allocation
li $a0, 100 # $a0 contains number of bytes to allocate
syscall
move $s0, $v0
add $t2, $s0, $zero

addi $t0, $zero, 0
while:
	beq $t0, 100, exit
	
	lb $t1, dataFromfile($t0)
	sb $t1, 0($t2)
	
	addi $t0, $t0, 1
	addi $t2, $t2, 1
	j while
exit:

li $v0, 4
la $a0, dataFromfile
syscall
