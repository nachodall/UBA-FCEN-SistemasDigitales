.text:
    la a0, s 
    la a1, q 
    la a2, size 
    lw a2, 0(a2) 

    loop: 
    beq a2, zero, epilogo
    lw t0, 0(a1) #me guardo el elem de q en t0 
    andi t1, t0, 0x1 #hago un and bit a bit entre t0 y el 00000001 eso es para ver si es par un numero

    addi a0, a0, 4
    addi a1, a1, 4
    addi a2, a2, -1 

    bne t1, zero, loop #si el numero no es par entonces vuelvo a entrar sin hacer nada
    sw t0, 0(a0) #guardo en s
    j loop

   

    epilogo:
    li a7, 10
    ecall

.data:
    s: .word 0x5 0x2 0x4 0x9 
    q: .word 0xA 0x1 0xB 0x8
    size: .word 0x4