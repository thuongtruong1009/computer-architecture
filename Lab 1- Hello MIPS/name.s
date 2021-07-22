# Code by github.com/thuongtruong1009
	
	.data  
str: 	.asciiz "Hello, I'm Tran Nguyen Thuong Truong - ITITIU19228 !" 

	.text  
	.globl main 

main:
           la $a0, str 

           li $v0, 4	

	   syscall	
	   jr $ra
