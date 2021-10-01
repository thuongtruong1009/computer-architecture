
#Code of https://github.com/thuongtruong1009

    .data		# the data segment
prompt:	.asciiz	"Input String: "
result: .asciiz "Result: "
newline:.asciiz	"\n"
buffer: .space 100
    .text		# the code segment
    .globl main
main:
promtInput:
	la    $a0, prompt	   # load the argument string
	li 	  $v0, 4		   # set the system call to 4 (print String)
	syscall				   # print the string

	li    $v0, 8		   
	la    $a0, buffer	   # now input string in buffer
	syscall
process:
	la    $t0, buffer       # *t0 = buffer
	li    $t3, 0
push:
	addi  $t3, $t3, 1
	lb    $t1, 0($t0)         # t1 = &t0 = t0[0]
	beq   $t1, 0, printResult # if t1 = null character -> pop process
	addi  $t0, $t0, 1         # move to next character
	addi  $sp, $sp, -1        # push t1 to stack
	sb    $t1, 0($sp)
	j push
printResult:
	la    $a0, result	   # load the argument string
	li 	  $v0, 4		   # set the system call to 4 (print)
	syscall				   # print the string
pop:
	addi  $t3, $t3, -1
	lb    $t1, 0($sp)      # pop to t1
	beq   $t3, 0, out
	addi  $a0, $t1, 0      # a0 = t1[0]
	li    $v0, 11
	syscall
	addi  $sp, $sp, 1
	j pop
out:
	jr    $ra
