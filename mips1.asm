.data
_numfibs: .word 0, 1, 1
	.word 0: 1024
.text

#todo

_main:
	li $v0, 5
	syscall 
	move $a0, $v0 
	jal _fib
	move $a0, $v0
	li $v0 ,1
	syscall
	li $v0 ,10
	syscall
	
_fib:
	bge $a0, 2, _fibrec
	move $v0, $a0
	jr $ra
	
_fibrec:
	addi $sp, $sp, -12
	sw  $s0,0($sp)
	sw  $s1,4($sp)
	sw  $ra,8($sp)	
	move $s0 , $a0
	
	addi $a0, $a0, -1	#n-1        -> $a0
	jal _fib
	move $s1, $v0		#fib(n-1)   -> $v0
	addi $a0, $s0, -2 	#n-2        -> $a0
	jal _fib		#fib(n-2)   -> $v0
	add $v0, $s1, $v0
	lw $s0 0($sp)
	lw $s1 4($sp)
	lw $ra 8($sp)
	addi $sp, $sp, 12
									
	jr $ra						
	