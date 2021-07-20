
# Code by github.com/thuongtruong1009

	.data
	.text
	.globl main
main:
	li $t1, 0xDEADBEEF

	andi $t3, $t1, 0xF
	or $t2, $t3, $t2
	sll $t2, $t2, 4
	srl $t1, $t1, 4 
	
	andi $t3, $t1, 0xF
	or $t2, $t3, $t2
	sll $t2, $t2, 4
	srl $t1, $t1, 4

	andi $t3, $t1, 0xF
	or $t2, $t3, $t2
	sll $t2, $t2, 4
	srl $t1, $t1, 4

	andi $t3, $t1, 0xF
	or $t2, $t3, $t2
	sll $t2, $t2, 4
	srl $t1, $t1, 4

	andi $t3, $t1, 0xF
	or $t2, $t3, $t2
	sll $t2, $t2, 4
	srl $t1, $t1, 4

	andi $t3, $t1, 0xF
	or $t2, $t3, $t2
	sll $t2, $t2, 4
	srl $t1, $t1, 4

	# t3 = t1 AND 0xF = E
	andi $t3, $t1, 0xF
	or $t2, $t3, $t2
	sll $t2, $t2, 4
	srl $t1, $t1, 4

	andi $t3, $t1, 0xF
	or $t2, $t3, $t2

	jr $ra		
