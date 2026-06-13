		lw $t0, 1024($s0)        
Inicio: 	beq $t0, $zero, Out
        		add $t2, $t1, $t1
        		add $t2, $t2, $t2
        		add $t3, $t2, $s0
        		sw $s1, 0($t3)        
        		sub $t0, $t0, $s2
        		add $t1, $t1, $s2
        		j Inicio
Out:
