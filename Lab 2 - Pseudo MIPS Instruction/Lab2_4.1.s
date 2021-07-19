		.data		# the data segment
prompt: .asciiz "Input: "
output: .asciiz "Output: "
buffer: .space 100
newline: .asciiz "\n"

		.text		# the code segment
		.globl main
main:
	
	# print out the prompt
	la $a0, prompt		
	li $v0, 4		
	syscall
	
	# read a string
	li $v0,8
    	la $a0, buffer
    	li $a1, 100
    	syscall
    
    	# print out the result
	la $a0, output
	li $v0, 4		
	syscall
	
	la $a0, buffer
	li $v0, 4		
	syscall
	
	la $a0, newline
	li $v0, 4		
	syscall
	
	jr $ra				# return to caller (__start)
