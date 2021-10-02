
#Code by https://github.com/thuongtruong1009

# Evaluate 1/1 + 1/2 + 1/3 + 1/4 +....
# Register used:
# $t0: num of terms
# $t1: counter, init to 1
# $f2: numberator, always = 1
# $f4: sum of series
# $f6: double value of counter
######################################################
	  .data
prompt: .asciiz "Enter number of terms: "
answer: .asciiz "Value of series is: "
numerator: .double 1.0

	  .text
	  .globl main
main:
	la $a0, prompt		#answer string    
	li $v0, 4
	syscall

	li $v0, 5		  # read int
	syscall

	move $t0, $v0		  #store num of term in $t0

	li $t1, 1		    #init counter to 1
	l.d $f2, numerator	  #init numberator to 1
	
	mtc1.d $zero, $f4	  #init sum to 0
	cvt.d.w $f4, $f4
	
loop:
	mtc1.d $t1, $f6		#store denominator = counter
	cvt.d.w $f6, $f6
	div.d $f6, $f2, $f6	    #$f6 = 1.0/counter
	add.d $f4, $f4, $f6	    #add to sum

continue:
	addi $t1, $t1, 1	  #update counter
	blt $t0, $t1, return	  #num of terms < counter -> return
	j loop			  # else loop back

return:
	la $a0, answer		  # print answer string
	li $v0, 4
	syscall

	mov.d $f12, $f4		#store redult in $f12
	li $v0, 3		#print result
	syscall

	jr $ra
