
# ITITIU19228 - Tran Nguyen Thuong Truong

###############################################################
#   Code after fix to appear anouncement when input integer   #
###############################################################

.data
	string: .asciiz "Guess a number (1 - 1000): "
	bigger: .asciiz "Your number is bigger than the secret!!\nYou lose!!\n"
	smaller: .asciiz "Your number is smaller than the secret!!\nYou lose!!\n"
	newline: .asciiz "\n"
.text
.globl main

main:

	li $t0, 0x1fa	

	#in string
	li $v0, 4
	la $a0, string
	syscall

	#nhap input
	li $v0, 5
	li $a1, 4
	syscall
	move $t1, $v0

	bgt $t0, $t1, SMALLER
	#in bigger
	li $v0, 4
	la $a0, bigger
	syscall
	jr $ra
SMALLER:
	#in smaller
	la $a0, smaller
	li $v0, 4
	syscall
	
	jr $ra
