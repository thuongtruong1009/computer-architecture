.data
input: .asciiz "Enter n terms: "
comma: .asciiz ", "
		.text
		.globl main

main:

	# print input

	li $v0, 4               
	la $a0, input
	syscall
  
	#load n times
	
	li  $v0, 5
	syscall
	move $t5,$v0
	addi $t5,$t5,1
	# loop from $t0 = 0 until n 

	addi $t0,$zero,1     
	loop: beq $t0, $t5, exit
  
	jal fibonacci
	jal print_output
    
	addi $t0, $t0, 1
	j loop

exit:
	li $v0, 10
	syscall

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



		
