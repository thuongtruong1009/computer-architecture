
# Code by github.com/thuongtruong1009
	.data		
	.text		
	.globl main
main:	
	lui $t1, 0xDEAD   
        ori $t1, $t1, 0xBEEF
        
        jr $ra
