
#Code by https://github.com/thuongtruong1009

# $t2: store G code
# $t3: store B code
# $t4: store hex char extracted
# $t5: store input string index
# $t6: store conditions
# $t7: store shift bits
	  .data
input: .space 8
max: .float 255.0
prompt: .asciiz " Enter 6 digits hex code of the color: "
answer: .asciiz " color in code in fraction is:\n"
error: .asciiz " error, invalid input!"
R: .asciiz "R:"
G: .asciiz "\nG:"
B: .asciiz "\nB:"	
	
	  .text		
	  .globl main
main:
	#const f0 = 255
	#lw $t0, color
	l.s $f0, max		

	la $a0,prompt		#prompt input
	li $v0,4
	syscall

	li $a1,8   		#read hex input string
	la $a0,input
	li $v0,8
	syscall

	#RRGGBB= 6 digits hex*4 bits/1digits =24 bits/1digits
	move $t5,$zero 		# init counter
	li $t7, 20     		# init shift bit
	move $t0,$zero		#int $t0 to store color code

loop:
	lb $t4,input($t5)	#read char
	beqz $t4,convert   	# null-> start convert

	li $t6, 0x61 		#char "A"->"Z"
	bge $t4,$t6, charLowerCase 
	li $t6, 0x41 		#char" a" to "f"
	bge $t4,$t6, charUpperCase
	li $t6,0x30
	bge $t4,$t6, digit
	li $t6,0x39
	ble $t4,$t6, digit
	li $t6, 0x46 
	ble $t4,$t6, charUpperCase
	li $t6, 0x66 		#"B"
	ble $t4,$t6, charLowerCase

exception:
	la $a0,error 		# print error message
	li $v0,4
	syscall
	
	jr $ra
digit: 
	addi $t4,$t4, -48
	j continue

charUpperCase:
	addi $t4,$t4,-55
	j continue

charLowerCase:
	addi $t4,$t4,-87
	j continue

continue:
	sllv $t4,$t4,$t7 	#shift digit left by value in $t7
	or $t0,$t0,$t4   	#place the shifted bits in $t0
	addi $t5,$t5,1		#update counter
	addi $t7,$t7,-4		#update shift bits
	j loop			#loop back

convert:
	and $t0,$t0,0x00FFFFFF    #remove 2 first char in hex code

	and $t1,$t0,0x00FF0000		#t1=0x00RR0000
	srl $t1,$t1,16    		#RR 000000RR

	and $t2,$t0,0x0000FF00
	srl $t2,$t2,8 			#GG

	and $t3,$t0,0x000000FF 		#BB

	la $a0,answer 			# answer print 
	li $v0,4
	syscall

	la $a0,R		#R:
	li $v0,4
	syscall

	mtc1 $t1,$f12		  #actual converting for R
	cvt.s.w $f12,$f12	  #RR/255.0 = 45/255.0
	div.s $f12,$f12,$f0

	li $v0,2
	syscall

	la $a0,G		#G:
	li $v0,4
	syscall

	mtc1 $t2,$f12
	cvt.s.w $f12,$f12	#actual converting for B
	div.s $f12,$f12,$f0	#G/255

	li $v0,2
	syscall

	la $a0,B		#B:
	li $v0,4
	syscall

	mtc1 $t3,$f12
	cvt.s.w $f12,$f12	  #actual converting for B
	div.s $f12,$f12,$f0	  #B/255

	li $v0,2
	syscall

	jr    $ra
