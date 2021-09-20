
# Code by github.com/thuongtruong1009

    .data        # the data segment
promt: .asciiz "Enter x: "
    .text        # the code segment
    .globl main
main:
    
    la $a0, promt
    li $v0, 4
    syscall
    
    li $v0 ,5
    syscall
    move $t0,$v0 #put x in $t0
    
    ori $t2,$zero, 5 #put 5 into $t2
    mult $t0, $t2
    mflo $t3 #t3 = 5*x
    
    addiu $t1, $t3, -12 #t1 = 5 * x - 12
    
    mult $t0, $t0 #x*x
    mflo $t5 #t5=x*x
    ori $t4, $zero,3
    
    mult $t4, $t5
    
    mflo $t6
    addu $t1,$t6,$t1
    
    li $v0, 1
    move $a0,$t1
    syscall
    
    jr         $ra
