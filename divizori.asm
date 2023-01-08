.data
	str: .asciiz "Introduceti numarul n: "
	sp: .asciiz "Suma este: "
.text

main:
	li $v0, 4	#afisare mesaj start
	la $a0, str
	syscall
	
	li $v0, 5	#citire numar n
	syscall
	
	move $t0, $v0 	#il mutam pe n in t0
	
	addi $t1, $t0, 1 #in t1 stocam valoarea lui t0 + 1
	
	mul $t1, $t1, $t0 #stocam in t1 rezultatul operatiei $t1 * $t0
	div $t1, $t1, 2 #impartim t1 la 2
	
	li $v0, 4
	la $a0, sp
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall
	