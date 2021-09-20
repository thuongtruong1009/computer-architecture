
# Code by https://github.com/thuongtruong1009

	  .data
p1: .asciiz "The result of (x/z) is: "
p2: .asciiz "\n"
p3: .asciiz "The result of (x/z)*y is: "
	  .text
	  .globl main
main:
    ori $t1, $0, 0x186A		#put 186A to t1 (x)
    sll $t1, $t1, 8			  #shift left 8 bits of t1 to creat 186A00

    ori $t2, $0, 0x1388		#put 1388 to t2 (y)
    sll $t2, $t2, 4			  #shift left 4 bits of t2 to creat 1388

    ori $t3, $0, 0x61A8		#put 186A to t3 (z)
    sll $t3, $t3, 4			  #shift left 4 bits of t3 to creat 61A8

    div $t1, $t3			#x/z
    mflo $t4			    #store lo to $t4

    li $v0, 4
    la $a0, p1
    syscall

    li $v0, 1
    move $a0, $t4			#show the result of x/z
    syscall

    li $v0, 4
    la $a0, p2			#new line
    syscall

    li $v0, 4
    la $a0, p3			#mess: the result of (x/z)*y
    syscall

    mult $t4, $t2			#(x/z)*y
    mflo $t5			    #store result to t5

    li $v0, 1
    move $a0, $t5
    syscall
    li $v0, 10
    syscall
