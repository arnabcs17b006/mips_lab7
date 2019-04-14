.data
	r: .float 2.0
	n: .float 4.0
	p: .float 0.0
	q: .float 1.0
	res: .float 0.0
.text

main:
	l.s $f4,n
	l.s $f5,p
	l.s $f6,q

	li $t1,1
	li $t2,2
	li $t3,3
	li $t4,4
	li $t5,1
	jal L

	

	li $v0,10
	syscall
        
L:
	addi $sp,$sp,-8
	sw $ra,0($sp)
	s.s $f0,4($sp)
	
	c.lt.s $f5,$f4
	bc1f E
	
	l.s $f0,r
	
	sub.s $f4,$f4,$f6
	
	jal L
	
  beq $t5,$t1,L1
	beq $t5,$t2,L2
	beq $t5,$t3,L3
	beq $t5,$t4,L4


E:
	lw $ra,0($sp)
	l.s $f0,4($sp)
	addi $sp,$sp,8
	j $ra

L1:
  li.s $f1,1.4142 
	mul.s $f7,$f0,$f1	
	addi $t5,$t5,1
	j E
L2:
	mul.s $f8,$f7,$f7       
	addi $t5,$t5,1
	j E
L3:
	add.s $f4,$f6,$f6
	div.s $f1,$f7,$f4
	sub.s $f1,$f0,$f1	
	mul.s $f9,$f1,$f7
	div.s $f4,$f6,$f4
	mul.s $f9,$f9,$f4       
	addi $t5,$t5,1
	j E
L4:
	add.s $f4,$f6,$f6
	mul.s $f4,$f4,$f4
	mul.s $f9,$f9,$f4
	add.s $f10,$f9,$f8
	s.s $f10,res
	addi $t5,$t5,1
	j E
