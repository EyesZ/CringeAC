	.text
main:	li	$v0, 5		# read integer from input. The read integer will be stroed in $v0
	syscall
 
	beq	$v0, 0, is0
	beq	$v0, 1,	is1	
 
	li	$s4, 1		# the counter which has to equal to $v0	
 
	li	$s0, 0
	li	$s1, 1
 
loop:	add	$s2, $s0, $s1
	addi	$s4, $s4, 1
	beq	$v0, $s4, iss2
 
	add	$s0, $s1, $s2
	addi	$s4, $s4, 1
	beq	$v0, $s4, iss0
 
	add	$s1, $s2, $s0
	addi	$s4, $s4, 1
	beq	$v0, $s4, iss1
 
	b 	loop
 
iss0:	move	$a0, $s0	
	b	print
 
iss1:	move	$a0, $s1	
	b	print
 
iss2:	move	$a0, $s2	
	b	print

is0:	li	$a0, 0
	b 	print 
 
is1:	li	$a0, 1
	b 	print
 
print:	li	$v0, 1
	syscall
	li	$v0, 10
	syscall