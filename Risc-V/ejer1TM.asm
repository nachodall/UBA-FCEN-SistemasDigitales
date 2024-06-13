.text: 
    lw s0, datos 
    li a0, 0 #inicio mi acumulador en 0 
    #mascara para solo quedarme con el ultimo byte
    andi t1, s0, 0x000000FF
    add a0, a0, t1  #lo sumo a mi acc 
    srli s0, s0, 8 #me muevo al byte siguiente 
    andi t1, s0, 0x000000FF
    add a0, a0, t1 
    srli s0, s0, 8 #ya voy dos numeros 
    andi t1, s0, 0x000000FF
    add a0, a0, t1 
    srli s0, s0, 8 #me falta el ultimo 
    andi t1, s0, 0x000000FF
    add a0, a0, t1
    

.data:
    datos: .word 0x901A0002