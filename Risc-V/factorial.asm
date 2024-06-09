.text:
    li a0, 3
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
        mul a0, a0, a1
        lw ra, 4(sp)
        addi sp, sp, 16
        ret
        
        base:
            addi a0, zero, 1
            ret
.data:
    input_adress: .word 0x00000003
  
