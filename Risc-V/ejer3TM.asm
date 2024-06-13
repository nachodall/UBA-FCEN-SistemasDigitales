.text: 
    la a0, arr
    li a2, 0xA0 #la cte a comparar 
    li a3, 0 #contador inicializado en 0
    la a4, largo
    lw a4, 0(a4) #me quedo con el largo 
    li a5, 0 #indice i 
    
    ciclo:
        lbu a1, 0(a0) # me cargo el dato
        beq a5, a4, verMayoria
        #actualizo mi indice
        addi a5, a5, 1
        #actualizo mi dato 
        addi a0, a0, 1
        #veo mi dato actual
        bge a1, a2, sumoContador #si a1 >= a2
        #sino simplemente vuelvo a iterar
        j ciclo
        
    sumoContador:
        addi a3, a3, 1
        j ciclo
        
    verMayoria:
        #veo si mas de la mitad 
        #calculo la mitad, largo / 2 
        srli a4, a4, 1
        bgt a3, a4, gane
        li a0, 0
        j epilogo
        
    gane:
        li a0, 1
        
    epilogo:
        li a7,10 
        ecall
        

.data:
    arr: .byte 0xA1 0xB0 0xF1 0x07
    largo: .word 0x4