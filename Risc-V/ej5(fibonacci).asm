.text
.globl main
main:
    li t0, 1            # Inicializar t0 con 1 para el caso base
    la a0, n            # Cargar el valor de la dirección de n en a0
    lw a0, 0(a0)        # Obtener el valor apuntado por n
    jal ra, fibo        # Llamar a la función fibo
    j epilogo           # Saltar a epilogo después de la llamada

fibo:
    # Casos base
    beq a0, zero, base_zero  # Si n == 0, saltar a base_zero
    beq a0, t0, base_one     # Si n == 1, saltar a base_one

    # Guardar a0 y ra en el stack
    addi sp, sp, -16         # Reservar espacio en el stack
    sw a0, 0(sp)             # Guardar a0 en el stack
    sw ra, 4(sp)             # Guardar ra en el stack

    # Llamada recursiva para Fib(n-1)
    addi a0, a0, -1          # n = n - 1
    jal ra, fibo             # Llamar a fibo recursivamente

    # Guardar el resultado de Fib(n-1) en stack
    sw a0, 8(sp)              # Mover el resultado a t1

    # Restaurar a0 para la segunda llamada recursiva
    lw a0, 0(sp)             # Restaurar a0 desde el stack
    addi a0, a0, -2          # n = n - 2
    jal ra, fibo             # Llamar a fibo recursivamente

    # Sumar los resultados de las dos llamadas recursivas
    lw a1, 8(sp)
    add a0, a0, a1           # a0 = resultado de Fib(n-1) + resultado de Fib(n-2)

    # Restaurar ra y el stack
    lw ra, 4(sp)             # Restaurar ra desde el stack
    addi sp, sp, 16          # Liberar espacio en el stack
    ret                      # Retornar

base_zero:
    li a0, 0                 # Si n es 0, devolver 0
    ret

base_one:
    li a0, 1                 # Si n es 1, devolver 1
    ret

epilogo:
    # Movida para que no se cuelgue el simulador
    li a7, 10 
    ecall 

.data
n: .word 0x9                # Definir el valor de n
