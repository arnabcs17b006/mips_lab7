.data
 n: .word 5
 r: .word 0

.text
main:
	lw $a0,n
	jal F
	
	sw $v0,r	
	addi $v0,$zero,1
	lw $a0,r
	syscall
     
        addi $v0,$zero,10
	syscall
          

F:
	addi $sp,$sp,-8
	sw $ra,0($sp)
	sw $s0,4($sp)
	addi $v0,$zero,1

       	beq $a0,$0,E
	
	addi $s0,$a0,0
	addi $a0,$a0,-1
	jal fact
	
	mult $v0,$s0
	mflo $v0


E:
	lw $ra,0($sp)
	lw $s0,4($sp)
	addi $sp,$sp,8
j $ra
