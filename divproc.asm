.data
	x: .word 20
	y: .word 10
.text
suma:
	subu $sp, 4
	sw $fp, 0($sp) 
	addi $fp, $sp, 4
	subu $sp, 4
	sw $s0, 0($sp)
	subu $sp, 4
	sw $s1, 0($sp)
	
	lw $s0, 0($fp)
	lw $s1, 4($fp)
	div $v0, $s0, $s1
	
	sw $s0, -8($fp)
	sw $s1, -12($fp)
	sw $fp, -4($fp)
	addu $sp, 12
	jr $ra
main:
	lw $t0,	y
	subu $sp, 4
	sw $t0, 0($sp)
	
	lw $t0, x
	subu $sp, 4
	sw $t0, 0($sp)
	
	jal suma
	
	addu $sp, 8
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	