.text:
    la a0, s #puntero a s
    la a1, q #puntero a q 
    la a2, size #traeme la dir de memoria donde esta el size
    lw a2, 0(a2) #guardame el size entrando a la dir de memoria

    loop:
    beq a2, zero, epilogo
    lw t0, 0(a1) #usamos t0 como intermediario para poner ahi la info de la dir de memo guardada en a1
    sw t0, 0(a0) #la guardamos en la dir de memoria que tiene guardada a0
    addi a0, a0, 4 
    addi a1, a1, 4
    addi a2, a2, -1
    j loop 

    epilogo:
        li a7, 10 #magia para que no rompa el simulador
        ecall

.data: 
    s: .word 0x1 0x4 0x7 0xA
    q: .word 0x2 0x6 0xA 0xE 
    size: .word 0x4