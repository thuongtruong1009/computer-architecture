
# Code by github.com/thuongtruong1009

	.data		
	.text		
	.globl main
main:
	li $t1, 0xDEADBEEF
	li $t4, 0xF

	and $t3, $t1, $t4
	or $t2, $t3, $t2
	rol $t2, $t2, 4
	ror $t1, $t1, 4 
	
	and $t3, $t1, $t4
	or $t2, $t3, $t2
	rol $t2, $t2, 4
	ror $t1, $t1, 4 

	and $t3, $t1, $t4
	or $t2, $t3, $t2
	rol $t2, $t2, 4
	ror $t1, $t1, 4 

	and $t3, $t1, $t4
	or $t2, $t3, $t2
	rol $t2, $t2, 4
	ror $t1, $t1, 4 

	and $t3, $t1, $t4
	or $t2, $t3, $t2
	rol $t2, $t2, 4
	ror $t1, $t1, 4 

	and $t3, $t1, $t4
	or $t2, $t3, $t2
	rol $t2, $t2, 4
	ror $t1, $t1, 4 

	and $t3, $t1, $t4
	or $t2, $t3, $t2
	rol $t2, $t2, 4
	ror $t1, $t1, 4 

	and $t3, $t1, $t4
	or $t2, $t3, $t2
	
	jr $ra				# return to caller (__start)
