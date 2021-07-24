
# Code by github.com/thuongtruong1009

	.data		
	.text		
	.globl main

main:	
	#trỏ vị trí 1 vào t1, trỏ trước t1 1 đơn vị vào t2....	

	ori $t1, $t1, 1
	sll $t2, $t1, 1
	sll $t3, $t2, 1
	sll $t4, $t3, 1
	sll $t5, $t4, 1
	sll $t6, $t5, 1
	sll $t7, $t6, 1
	sll $t8, $t7, 1

	jr $ra
