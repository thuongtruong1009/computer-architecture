
# Code by https://github.com/thuongtruong1009

	  .data		
	  .text		
	  .globl main
main:
    li	$t0, 0xFFF		# Operand 1
    li 	$t1, 0xFFF		# Operand 2

    mult	$t0, $t1		# $t0 * $t1 = Hi and Lo registers
    mflo	$t2			    # copy Lo to $t2

    li $v0, 1
    move $a0, $t2
    syscall

    jr 	$ra
