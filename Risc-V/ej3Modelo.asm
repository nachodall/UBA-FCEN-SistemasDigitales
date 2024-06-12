#Escriba un programa que cuente la cantidad de mediciones que se encuentran por sobre el valor
#0x0F00. Si la cantidad de valores que superan este limite es mayor a la mitad del largo debemos
#poner un 1 en el registro a0, en caso contrario debemos poner un 0.

text:
    li a0, 0 #contador 
    la a1,info #puntero memo 
    lb a3, largo #quiero el largo, siempre va a ser positivo no me preocupo por desplazamiento
    li a4, 0 #quiero un indice i
    li a5, 0x0F00 #es positivo entonces no hago desplazamiento 
    li t0, 0x0000FFFF #mascara para limpiar la parte alta de la halfword
    
    ciclo:
        beq a4, a3, verMitad
        #aplico la mascara 
        lw t1,0(a1)
        and t1, t1, t0
        #veo si supera el umbral, antes muevo el i y el puntero
        addi a1, a1, 2
        addi a4, a4, 1
        bge t1, t0, esMayor
        j ciclo
        
    esMayor:
        #sumo el contador
        addi a0, a0, 1
        j ciclo
        
    verMitad:
        #veo si a0 es mayor a la mitad
        #divido la long por la mitad
        li t3, 2
        div a3, a3, t3
        bge a0, a3, gane
        li a0, 0
        j epilogo
        
    gane:
       li a0, 1
            
    epilogo:
        li a7, 10 
        ecall
    
data:
    info: .half 0xFFFF 0xFFFF 0xFFFF 0x5555
    largo: .byte 0x4