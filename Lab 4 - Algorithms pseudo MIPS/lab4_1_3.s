
#Code by https://github.com/thuongtruong1009

		.data
prompt: 	.asciiz "Input interger: "
output:		.asciiz "Hexadecimal: "
error:		.asciiz "Input must be in range (0-15)\n"
annotation:	.asciiz "0x"
		.text
		.globl main
main:	
		la $a0, prompt
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		move $t0, $v0
		
		la $a0, output
		li $v0, 4
		syscall

		move $a3, $t0
		jal printHex32

printHex32If:
		blt $t1, 8, printHex32Loop
		li $v0, 10
		syscall
printHex32:
		la $a0, annotation		
		li $v0, 4		
		syscall	
		li $t1, 0

printHex32Loop:
		rol $a3, $a3, 4 
		andi $t2, $a3, 0xF 
	
		move $a1, $t2 
		jal printHex
		addi $t1, $t1, 1
		j printHex32If
printHex:
		bgt $a1, 15, printError
		blt $a1, 0, printError
		blt $a1, 10, printNum
		j printChar
		jr $ra

printNum:
		move $a0, $a1
		li $v0, 1
		syscall
		jr $ra
printChar:
		addi $a1, $a1, 55
		move $a0, $a1 
		li $v0, 11
		syscall
		jr $ra
printError:	
		la $a0, error
		li $v0, 4		
		syscall	
		jr $ra
