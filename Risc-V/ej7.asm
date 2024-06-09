.text:
    la t0, n
    lw a0, 0(t0)
    jal ra sum 
    li a7, 10
    ecall 

    sum:
        beq a0, zero, base 
        addi sp, sp, -16
        sw a0, 0(sp)
        sw ra, 4(sp)
        addi a0, a0, -1 
        jal ra sum 

        lw a1, 0(sp) #me voy a buscar el n que guarde, porque en a0 viene sum(n-1)
        addi a0, a0, a1 # n + sum(n-1)
        lw ra, 4(sp)
        addi sp, sp, 16 
        ret

        base: 
        li a0, 0
        ret

.data:
    n: .word 0x5
  
