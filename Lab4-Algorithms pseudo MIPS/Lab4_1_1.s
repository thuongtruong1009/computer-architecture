.data

prompt: 	.asciiz "please enter an interger : \n"
result:		.asciiz "hexadecimal: "
error:		.asciiz "the input has to be the number between 0 and 15\n"
hexSymbol:	.asciiz "0x"
		.text
		.globl main

main:		
		la $a0, prompt
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		move $t0, $v0
		
		la $a0, result
		li $v0, 4
		syscall

		bgt $t0, 15, errorMessage
		blt $t0, 0, errorMessage
		blt $t0, 10, printNum
		j printChar
		jr $ra
printNum:
		la $a0, hexSymbol
		li $v0, 4
		syscall

		move $a0, $t0
		li $v0, 1
		syscall
		jr $ra
printChar:
		la $a0, hexSymbol		
		li $v0, 4		
		syscall

		addi $t0, $t0, 55
		move $a0, $t0 
		li $v0, 11
		syscall
		jr $ra
errorMessage:	
		la $a0, error
		li $v0, 4		
		syscall	
		jr $ra
