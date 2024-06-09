.text
.globl main
main:
    la t0, n 
    lw a0, 0(t0)       # Cargar el valor de n en a0
    la t0, m 
    lw a1, 0(t0)       # Cargar el valor de m en a1
    li t0, 0           # Definir el índice para contar las iteraciones
    li t1, 0           # Inicializar el resultado en t1 a 0

    multiplicacion:
    beq t0, a1, res    # Si el índice t0 es igual a m, saltar a res
    add t1, t1, a0     # Sumar n a t1
    addi t0, t0, 1     # Incrementar el índice t0
    j multiplicacion   # Repetir el ciclo

    res: 
    mv a0, t1          # Mover el resultado de t1 a a0
    li a7, 10          # Código de salida del sistema
    ecall              # Llamar al sistema para salir

.data
n: .word 0x5    
m: .word 0x4
