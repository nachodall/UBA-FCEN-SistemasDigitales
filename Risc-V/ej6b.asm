.text:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial   
    li a7, 10 
    ecall 
    factorial:
        beq a0, zero, base
        addi sp, sp, -16
        sw a0, 0(sp)
        sw ra, 4(sp)
        addi a0, a0, -1
        jal ra factorial 
        
        lw a1, 0(sp)
        mv t1, zero
        mv t0, zero
        jal ra, multiplicacion
        lw ra, 4(sp)
        addi sp, sp, 16
        ret

        multiplicacion:
        beq t0, a1, res    # Si el índice t0 es igual a m, saltar a res
        add t1, t1, a0     # Sumar n a t1
        addi t0, t0, 1     # Incrementar el índice t0
        j multiplicacion   # Repetir el ciclo

        res: 
        mv a0, t1          # Mover el resultado de t1 a a0
        ret 

        base:
        addi a0, zero, 1
        ret
.data:
    n: .word 0x00000005
  
