main:
	addi $a0,$zero,5
	jal F

	add $t4,$v0,$0
	addi $v0,$zero,10
	syscall
F:
	addi $sp,$sp,-12
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	add $s0,$a0,$0
  addi $t0,$zero,1
	beq $s0,$0,E1
	beq $s0,$t0,E2
  addi $a0,$a0,-1
	jal F

	add $s1,$0,$v0
	addi $a0,$s0,-2
	jal F

	add $v0,$v0,$s1

F_end:
        lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addi $sp,$sp,12
	j $ra

E1:
	addi $v0,$zero,0
	j F_end
E2: 
	addi $v0,$zero,1
  j F_end
