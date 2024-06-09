.text
.globl main
main:
    la t0, n 
    lw a0, 0(t0) 
    la t0, m 
    lw a1, 0(t0) 
    li t0, 0 #defino un indice de cuantas veces voy restando dividendo y cociente que sera mi res
    

    division:
    beq a0, zero, res  #while i != m
    addi t0, t0, 1 
    sub a0, a0, a1 
    j division

    res: 
    mv a0, t0
    li a7, 10
    ecall

.data
n: .word 0xA   
m: .word 0x5
