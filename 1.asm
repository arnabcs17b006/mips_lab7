main:
	li $t0,5
	li $a0,6
	li $a1,2
	li $t3,10
	jal L
	div $a3,$t3
	mflo $s1
	add $s2,$t0,$s1
	sw $s2,r
	li $a2,10
	syscall
  
L:
	mult $a0,$a1
	mflo $a3
	jr $ra
	
