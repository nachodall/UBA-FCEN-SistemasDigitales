.text
    la a1, arr #puntero a elem de array 
    li a0, 0 #mi rta estara en a0, iniciamos en 0 
    li t0, 0 #me hara funcion de indice 
    li t1, 9 #necesito el len(arr) =4 en un registro pues cuando compare la guarda necesito ese valor
    la a2, mascara #necesito el valor de mi mascara, primero accedo a su dir, luego a su valor  
    lb a2, 0(a2) 
    li a3, 1 #necesito el numero uno para comparar con el resultado de mi and 

    ciclo:
        beq t0, t1, fin #if i == len(arr)
        lb t2, 0(a1) #me agarro mi elem del array 
        and t2, t2, a2 # performo la operacion and entre el elem del array y la mascara 0001 que me permite ver la paridad de un numero
        addi a1, a1, 1 #avanzo al sig. elem del array como es bytes voy al sig
        addi t0, t0, 1 #avanzo el indice i
        beq t2, a3, esImpar
        j ciclo

    esImpar:
        addi a0, a0, 1 #aumento mi contador de impares 
        j ciclo 

    fin:
        li a7, 10
        ecall

#alternativa
.data
arr: .byte 0x37 0xA2 0xF0 0x11 0x2 0x5 0x5 0x5 0x5
mascara: .byte 0x1

.text:
    lw s0, n #0x11F0A237
    li a0, 0 #aca viene el resultado
    li t0, 4 #cada word tiene 4 bytes 
    li t1, 0 #i
    li a1, 1 #necesito el 1 para la mascara 

    ciclo:
    beq t0, t1, epilogo
    and a2, s0, a1 #guardo en a2 0 o 1 depende el resultado
    add a0,a0,a2 #lo sumo a res 
    srli s0, s0, 8
    addi t1,t1,1
    j ciclo
    
    epilogo:
    li a7,10
    ecall
    
    
.data:
    n: .byte 0x37 0xA2 0xF0 0x11 
