# Code by github.com/thuongtruong1009
	
	.data
    n1: .asciiz "Ennter your first number: "
    n2: .asciiz "Enter your second number: "
    result: .asciiz "result is "

	.text
main:  
    la $a0, n1		#getting first input.
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    
    la $a0, n2		#getting second input.
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t1, $v0
    
    la $a0, result		#calculate and print out the result.
    li $v0, 4
    syscall
    add $t3, $t0, $t1
    move $a0, $t3
    li $v0, 1
    syscall
   
    li $v0, 10		#end program.
    syscall