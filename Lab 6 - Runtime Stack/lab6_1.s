
#Code by https://github.com/thuongtruong1009

#Calculate: 3ab-2bc-5a+20ac-16

	  .data
prompt: .asciiz "Enter next value: "
answer: .asciiz "The answer is: "
	  .text
	  .globl main
main:
	la $a0, prompt		#prompt a
	li $v0, 4
	syscall
	
	li $v0, 5		  #input a
	syscall	
	or $t0, $v0, $zero	  #a-> $t0
	
	la $a0, prompt		#prompt b
	li $v0, 4
	syscall
	
	li $v0, 5		#input b
	syscall	
	or $t1, $v0, $zero	  #b-> $t1
	
	la $a0, prompt		#prompt c
	li $v0, 4
	syscall
	
	li $v0, 5		#input c
	syscall
	or $t2, $v0, $zero	#c-> $t2
	
	mult $t0, $t1		#a*b
	mflo $t3		#ab-> $t3
	ori $t4, $zero, 3	#3-> $t4
	mult $t3, $t4		#3*ab
	mflo $t3		#3ab-> $t3
	addi $sp, $sp, -4	#push 3ab to stack
	sw $t3, ($sp)
	
	mult $t1, $t2		#b*c
	mflo $t3		#bc-> $t3
	addi $t4, $zero, -2	#-2-> $t4
	mult $t3, $t4		#-2*bc
	mflo $t3		#-2bc-> $t3
	addi $sp, $sp, -4	#push -2bc to stack
	sw $t3 ($sp)
	
	addi $t4, $zero, -5	  #-5-> $t4
	mult $t0, $t4		  #-5*a
	mflo $t3		  #-5a-> $t3
	addi $sp, $sp, -4	  #push -5a to stack
	sw $t3, ($sp)
	
	mult $t0, $t2		  #a*c
	mflo $t3		  #ac-> $t3
	addi $t4, $zero, 20	  #20-> $t4
	mult $t3, $t4		  #20*ac
	mflo $t3		  #20ac-> $t3
	addi $sp, $sp, -4	  #push 20ac to stack
	sw $t3, ($sp)
	
	addi $t3, $zero, -16	  #-16-> $t3
	lw $t4, ($sp)		  #pop 20ac-> $t4
	addi $sp, $sp, 4
	
	add $t3, $t3, $t4	  #20ac-16-> $t3
	
	lw $t4, ($sp)		  #pop -5a-> $t4
	addi $sp, $sp, 4
	
	add $t3, $t3, $t4	  #-5a+20ac-16-> $t3
	
	lw $t4, ($sp)		  #pop -2bc-> $t4
	addi $sp, $sp, 4
	
	add $t3, $t3, $t4	  #-2bc-5a+20ac-16-> $t3	
	
	lw $t4, ($sp)		#pop 3ab-> $t4
	addi $sp, $sp, 4
	
	add $t3, $t3, $t4	  #3ab-2bc-5a+20ac-16-> $t3
	
	la $a0, answer		#print answer string
	li $v0, 4
	syscall
	
	or $a0, $t3, $zero	#print result
	li $v0, 1
	syscall
	
	jr $ra
