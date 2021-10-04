    .data		# the data segment
newline:		.asciiz	"\n"
result: 	.asciiz "The result is: "

		.text		# the code segment
		.globl main
main:
	add $t0, $0, $0
	li $t1, 0x00000005
	#ori $t2, $0, 0xffff
	addi $t2, $0, -0x1
	add $t0, $t1, $t2

	
	# print out the result message
	la $a0, result		
	li $v0, 4		
	syscall	
	
	# print out the doubled integer
	move $a0, $t0
	li $v0, 1		
	syscall	
	
	# print out the newline message
	la $a0, newline		
	li $v0, 4		
	syscall	

	jr $ra			# return to caller (__start)
