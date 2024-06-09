.text
    la a0, arr         # quiero el puntero al principio de mi arr 
    li a1, 0           # representa el low 
    la t1, size        # cargar la dirección de size en t1
    lw a2, 0(t1)       # cargar el valor de size en a2 (high)
    addi a2, a2, -1    # indexamos desde 0 
    la t1, tgt         # cargar la dirección de tgt en t1
    lw a3, 0(t1)       # cargar el valor de tgt en a3
    li t2, 2           # necesito tener el número 2 a mano para dividir 
    li t4, 4           # necesito el 4 para hacer los desplazamientos 

bs:
    # calculo mid en t0, esta es la rta 
    add t0, a1, a2 
    div t0, t0, t2 

    # me voy a buscar a arr[mid], para esto quiero usar un t1 para no pisar el a0 
    # hago lo siguiente: como en a0 estoy en la pos 0, sumo mid*4 para encontrar el número 
    mul t1, t0, t4     # mid*4 
    add t1, t1, a0     # obtengo la dir 
    lw t1, 0(t1)       # me quedo con el valor

    # veo si arr[mid] == tgt 
    beq t1, a3, epilogo
    bgt t1, a3, izq    # if arr[mid] > tgt then muevo a la izquierda 
    # sino a la derecha, low = mid + 1
    addi a1, t0, 1
    j bs 

izq: 
    addi a2, t0, -1    # high = mid - 1
    j bs 

epilogo:
    # t0 es mid, o sea la rta, la guardamos en a0 y se terminó 
    mv a0, t0 
    # la movida de siempre
    li a7, 10
    ecall

.data
arr: .word 1, 2, 3, 4, 5   # Example sorted array
size: .word 5              # The size of the array
tgt: .word 2               # The target value to search for
