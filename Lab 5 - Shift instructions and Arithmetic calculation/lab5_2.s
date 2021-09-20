
# Code by https://github.com/thuongtruong1009

	  .data
prompt:	.asciiz "Input x: "
result: .asciiz "\nThe result is: "

	  .text
	  .globl main
main:
	  li $v0, 4
	  la $a0 , prompt		  #print String
	  syscall

	  li $v0, 5
	  move $t0, $v0		  #input x from keyboard
	  syscall

	  li 	$t1, 3		  #put $t1 = 3
	  li	$t2, 2		  #put $t2 = 2
	
	  mult	$t1, $t0	
	  mflo 	$t1		  #put 3.x
	  addi 	$t1, 7		  #put $t1 = 3x + 7

	  mult	$t2, $t0	
	  mflo	$t2		  #put 2.x
	  addi	$t2, 8		  #put 2x + 8
	
	  div 	$t1, $t2	
	  mfhi 	$t3		  #put $t3 = (3x + 7)/(2x + 8)
	  mflo	$t4		  #put $t4 = (3x + 7)%(2x + 8)

	  li $v0, 4
	  la $a0, result		  #print String 
	  syscall

	  li $v0, 1
	  move $a0, $t3		  #print result on console
	  syscall

	  jr	$ra		  #end code
