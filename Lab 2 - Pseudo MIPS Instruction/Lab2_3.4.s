
# ITITIU19228 - Tran Nguyen Thuong Truong

##############################################################################
#   Code after fix to this game keep guessing until find the secret number   #
##############################################################################

.data
	string: .asciiz "Guess a number (1-1000): "
	win: .asciiz "You win!!\n"
	lose: .asciiz "You lose!!\n"
.text
.globl main

main:

	li $t0, 0x1fa	
LOOP:
	#in string
	li $v0, 4
	la $a0, string
	syscall

	#nhap input
	li $v0, 5
	li $a1, 4
	syscall
	move $t1, $v0

	bne $t0, $t1, LOSE
	#in win
	li $v0, 4
	la $a0, win
	syscall
	jr $ra
LOSE:
	#in lose
	la $a0, lose
	li $v0, 4
	syscall
	
	j LOOP
	jr $ra

