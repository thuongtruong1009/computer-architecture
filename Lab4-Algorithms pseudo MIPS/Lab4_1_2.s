		.data
prompt: 	.asciiz "Input interger: "
output:		.asciiz "Hexadecimal: "
error:		.asciiz "Input must be in range (0-15)\n"
annotation:	.asciiz "0x"
		.text
		.globl main

main:	
		jal printHex
		li $v0, 10
		syscall

printHex:
		la $a0, prompt
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		move $t0, $v0
		
		la $a0, output
		li $v0, 4
		syscall

		addi $sp, $sp, -4
		sw $ra, 0($sp)

		bgt $t0, 15, printError
		blt $t0, 0, printError
		blt $t0, 10, printNum
		j printChar

		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra
printNum:
		la $a0, annotation
		li $v0, 4
		syscall
		move $a0, $t0
		li $v0, 1
		syscall
		jr $ra
printChar:
		la $a0, annotation		
		li $v0, 4		
		syscall
		addi $t0, $t0, 55
		move $a0, $t0 
		li $v0, 11
		syscall
		jr $ra
printError:	
		la $a0, error
		li $v0, 4		
		syscall	
		jr $ra


		
