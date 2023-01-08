.data
	str: .asciiz "Introduceti numarul"
	sp: .asciiz " "
.text

main:
	la $a0, str #afisare string
	li $v0, 4
	syscall
	
	li $v0, 5 #citire int
	syscall
	
	move $t0, $v0 #mutam in registrul t0 numarul citit
	div $t1, $t0, 2 
	addi $t1, $t1, 1 #stocam in registrul t1 (nr/2 + 1)
	
	li $t2, 1 #registrul t2 va juca rolul de contor
	
loop:
	beq $t2, $t1, exit #in momentul in care t2 e egal cu t1 nu mai exista divizori deci iesim din loop
	
	rem $t3, $t0, $t2 # stocam in t3 restul impartirii numarului la contor
	
	beq $t3, 0 ,afisare
	
	addi $t2, $t2, 1 #incrementare contor
	
	j loop
afisare:
	li $v0, 1	#afisare divizor
	move $a0, $t2
	syscall
	
	li $v0, 4	#afisare spatiu
	la $a0, sp
	syscall
	
	addi $t2, $t2, 1 #incrementare contor
	
	j loop

exit:
	li $v0, 10
	syscall	