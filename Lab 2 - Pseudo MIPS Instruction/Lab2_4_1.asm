
	.data
buffer: .space 128 # character
input: .asciiz "Input: "
output: .asciiz "Output: "
newline: asciiz "\n"
 
	.text
	.globl main
main:
	#print out the input
	li  $v0, 4
	la $a0, input
	syscall
	
	#read a keyboard
	li $v0, 8
	la $a0, buffer
	li $a1, 100
	move $t0, $v0
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

	
