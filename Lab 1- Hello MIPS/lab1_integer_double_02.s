# Code by github.com/thuongtruong1009 
##	This program read in an integer and double and print newline

	.data			# the data segment
prompt:	.asciiz	"Enter an integer: "
result: .asciiz "The result is: "
byte: 	.asciiz "First byte of your result is: "  

	.text			# the code segment
	.globl main
main:
	
	la $a0, prompt		# print out the prompt	
	li $v0, 4		
	syscall		
		
	li $v0, 5		# read in an integer	
	syscall
	move $t0, $v0
		
	sll $t0, $t0, 1		# double the input
		
	la $a0, result		# print out the result message
	li $v0, 4		
	syscall	
		
	move $a0, $t0 		# print out the doubled integer
	li $v0, 1		
	syscall	
	      
	la $a0, byte		# print out the newline 
	li $v0, 4		
	syscall
	
	lb $a0, 1($t1)  
    	addi $v0, $zero, 34 	#print in hexadecimal
    	syscall

	jr $ra			# return to caller (__start)
