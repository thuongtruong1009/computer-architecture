
#Code by https://github.com/thuongtruong1009

# Evaluate 5.4xy - 12.3y + 18.23x - 8.23
# register used:
# $f2: x
# $f4: y
# $f6: store coefficients
# $f8: result
#####################################################
	  .data
a: 	.double 5.4
bb: 	.double -12.3
c: 	.double 18.23
d: 	.double -8.23
promptX: .asciiz "Enter x: "
promptY: .asciiz "Enter y: "
answer: .asciiz "5.4xy - 12.3y + 18.23x - 8.23 = "
	  .text
	  .globl main
main: 
	la $a0, promptX   	#prompt input X
	li $v0, 4      
	syscall

	li $v0, 7		#input float, default it stored in f0
	syscall

	mov.d $f2, $f0		#store x in $f2

	la $a0, promptY		#prompt input Y
	li $v0, 4
	syscall

	li $v0, 7		#input float, default it stored in f0
	syscall  

	mov.d $f4, $f0		#store y in $f4
               
	mul.d $f8, $f2, $f4	    # $f8 = x*y
	l.d $f6, a		    # $f6 = 5.4
	mul.d $f8, $f8, $f6	    # $f8 = 5.4xy - 12.3y

	l.d $f6, bb		    # $f6 = -12.3
	mul.d $f6, $f6, $f4	    # $f6 = -12.3y
	add.d $f8, $f8, $f6	    # $f8 = 5.4xy - 12.3y

	l.d $f6, c		    # $f6 = 18.23
	mul.d $f6, $f6, $f2	    # $f6 = 18.23 * x
	add.d $f8, $f8, $f6	    # $f8 = 5.4xy - 12.3y + 18.23x

	l.d $f6, d		    # $f6 = -8.23
	add.d $f8, $f8, $f6	    # $f8 = 5.4xy - 12.3y + 18.23x - 8.23

	la $a0, answer		# print answer string
	li $v0, 4
	syscall
	
	mov.d $f12, $f8		#store result in $f12
	li $v0, 3		#print result
	syscall
		
	jr $ra
