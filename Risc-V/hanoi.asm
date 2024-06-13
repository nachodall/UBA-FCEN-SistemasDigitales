.text: 
    lw a0, n 
    li t1, 1
    jal ra hanoi
    li a7, 10
    ecall 

    hanoi:
    beq a0, t1, base 
    #pido lugar a la pila para la direc de retorno 
    addi sp, sp, -16
    sw ra, 0(sp)
    #actualizo n en n-1
    addi a0, a0, -1
    jal ra hanoi #llamo a hanoi(n-1)

    #en a0 ahora viene hanoi(n-1)
    #me pide hacer 2 * hanoi(n-1) + 1 entonces multiplico por dos con el shift izq y luego addi 1 
    slli a0, a0, 1 
    addi a0, a0, 1 
    lw ra, 0(sp)
    addi sp, sp, 16
    ret

    base:
    addi a0, x0, 1
    ret 
    
.data:
    n: .word 0x5