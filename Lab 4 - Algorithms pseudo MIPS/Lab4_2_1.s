.data
description: .asciiz "100 first number is:\n"
comma: .asciiz ", "
		.text
		.globl main

main:

	# print description
	li $v0, 4               
	la $a0, description
	syscall
  
	# loop from $t0 = 0 until 100
	addi $t0, $zero,1   
	loop: beq $t0, 11, exit
	#jump to fibonacci
	jal fibonacci
	#jump to print_output
	jal print_output
    
	addi $t0, $t0, 1
	j loop

#exit the program
exit:
	li $v0, 10
	syscall


#print the output
print_output:
  
	li $v0, 1
	move $a0, $t1
	syscall
 
  
	li $v0, 4
	la $a0, comma
	syscall
	jr $31

#compute fibonacci series
fibonacci:
  
	move $t1, $0
	move $t2, $sp
	li $t3, 1
    addi $sp, $sp, -4           # push initial $t0 on stack
	sw $t0, 0($sp)
 
 #perform recursive
 recursive:
    beq $sp, $t2, fib_exit       # if stack is empty, exit
  
    lw $t4, 0($sp)               # pop next $t4 off stack
    addi $sp, $sp, 4
    
    bleu $t4, $t3, early_return
    
    sub $t4, $t4, 1            # push $t4 - 1 on stack
    addi $sp, $sp, -4
    sw $t4, 0($sp)
    sub $t4, $t4, 1            # push $t4 - 2 on stack
    addi $sp, $sp, -4
    sw $t4, 0($sp)
    j recursive
      
early_return:
    
    add $t1, $t1, $t4
    j recursive
      
 fib_exit:
jr $31



		
