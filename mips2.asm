.data
array_space: .space 20
coma:.asciiz ", "
newline: .asciiz "\n"
.text
.globl start
start:
la $s1, array_space 
addi $t1,$0,5
sw $t1,0($s1)
addi $t1,$0,8
sw $t1,4($s1)
addi $t1,$0,7
sw $t1,8($s1)
addi $t1,$0,1
sw $t1,12($s1)
addi $t1,$0,12
sw $t1,16($s1)
#imprimir
li $v0, 1
lw $a0, 0($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1
lw $a0, 4($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1
lw $a0, 8($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1
lw $a0, 12($s1) 
syscall
#
li $t9, 5#la longitud del array
li $t0, 0 #indice i
loop_i:
	bge $t0, $t9, fin_buclei
    	# Inicializar min_ind = i
    	add $t2,$t0,$t0
    	add $t2,$t2,$t2
    	addi $t1, $t0,0 #t1 es t0 , t1 es el minimo indice
    	add $t2,$t2,$s1
 
    	# Inicializar el índice j = i + 1
    	addi $t2, $t2, 4 #t2 es el contador de loop_j
    	addi $s7,$t0,1
loop_j:
	bge $s7, $t9, fin_buclej#comparacion del bucle 
	lw $t7, 0($t2)
	add $t3,$t1,$t1 
	add $t3,$t3,$t3
	add $t3,$t3,$s1
	lw $t4, 0($t3)
	ble $t4, $t7, else
	move $t1, $s7
	addi $t2,$t2,4
	
	addi $s7,$s7,1
	j loop_j
else:
	addi $s7, $s7, 1
	addi $t2,$t2,4
	j loop_j
fin_buclej:
	add $s5,$t0,$t0
	add $s5,$s5,$s5
	add $s5,$s5,$s1
	add $s6,$t1,$t1
	add $s6,$s6,$s6
	add $s6,$s6,$s1
	
	lw $s4, 0($s5)          # Cargar A[min_ind] en $t3
	lw $s3, 0($s6)          # Cargar A[j] en $t4
	sw $s4, 0($s6)          # Guardar A[j] en A[i]
	sw $s3, 0($s5)       
	addi $t0, $t0, 1
   	j loop_i

fin_buclei:
li $v0, 4         # Imprimir nueva línea
    la $a0, newline
    syscall
	li $v0, 1
lw $a0, 0($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1
lw $a0, 4($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1
lw $a0, 8($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1
lw $a0, 12($s1) 
syscall
    li $v0, 10
    syscall 


