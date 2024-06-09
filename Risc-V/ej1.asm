.text:
    la a0, size #me guardo en a0 la dir del el tamaño del arreglo 
    lw a0, 0(a0) #ahora si tengo a0
    la a1, arr #me guardo la dir. de memo del primer elem. de arr 
    li a2, -2147483648 #uso a2 para el maximo, lo inicializo con el mínimo valor

    loop:
    beq a0, zero, epilogo  #si el tamaño es igual a 0, termine
    #cuerpo del ciclo
    lw t0, 0(a1) #cargo el valor que hay en la dir. guardada en a1 en t0
    blt a2, t0, actualizo #si lo que hay en el max es menor que lo que hay en pos del array, actualizo
    addi a0, a0, -1
    addi a1, a1, 4
    j loop 

    actualizo: 
    mv a2, t0
    addi a0, a0, -1
    addi a1, a1, 4
    j loop 

    epilogo:
        ecall

.data:
    arr: .word 0x3 0x1 0x4 0x1 0x5 0x9 0x2 0x6
    size: .word 0x8