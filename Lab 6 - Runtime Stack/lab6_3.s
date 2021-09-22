
#Code by https://github.com/thuongtruong1009

.data		# the data segment
prompt:	.asciiz	"Input String: "
result: .asciiz "Result: "
newline:.asciiz	"\n"
buffer: .space 100
resultBuffer: .space 100
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
	la    $t3, resultBuffer
	addi  $sp, $sp, -1
	sb    $zero, 0($sp)
push:
	lb    $t1, 0($t0)         # t1 = &t0 = t0[0]
	beq   $t1, 0, pop         # if t1 = null character -> pop process
	addi  $t0, $t0, 1         # move to next character
	beq   $t1, 'A', push 
	beq   $t1, 'I', push 
	beq   $t1, 'U', push 
	beq   $t1, 'E', push 
	beq   $t1, 'O', push 
	beq   $t1, 'a', push 
	beq   $t1, 'i', push 
	beq   $t1, 'u', push 
	beq   $t1, 'e', push 
	beq   $t1, 'o', push
	addi  $sp, $sp, -1        # push t1 to stack
	sb    $t1, 0($sp)
	j push

pop:
	lb    $t1, 0($sp)      # pop to t1
	beq   $t1, 0, printResult
	sb    $t1, 0($t3)
	addi  $t3, $t3, 1
	addi  $sp, $sp, 1
	j pop

printResult:
	la    $a0, result	   # load the argument string
	li 	  $v0, 4		   # set the system call to 4 (print)
	syscall				   # print the string

printAntiReverse:          # t3 now point to last character of result buffer

pop2:
	lb    $t1, -1($t3)      # pop to t1
	beq   $t1, 0, out
	addi  $a0, $t1, 0      # a0 = t1[0]
	li    $v0, 11
	syscall
	addi  $t3, $t3, -1
	j pop2

out:
	jr    $ra
