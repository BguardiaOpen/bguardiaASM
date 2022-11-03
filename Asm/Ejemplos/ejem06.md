## Ejemplos

1.  _Sumar dos números de 32 bits._  
    Se requiere usar el concepto del Carry. Supongamos que un número de 32 bits se encuentra repartido en AX (la parte alta) y BX (la parte baja); y el otro, entre CX y DX. Queremos que el resultado quede en AX con BX. Las dos instrucciones, con sus respectivos comentarios, están a continuación:  

    `ADD BX, DX  
    ; Suma las partes bajas. No toma en cuenta el carry, si es que existía (estamos iniciando una operación independiente)  
    ADC AX, CX  
    ; Suma las partes altas, pero considerando el carry que pudo haber en la suma de las bajas.`
2.  _Explicar por qué un corrimiento a la izquierda equivale a multiplicar por dos:_  
    Esto se puede explicar visualmente; supongamos el número binario de 8 bits:  
    `00000011`  
    que equivale a 3 decimal. Si hacemos un corrimiento a la izquierda, quiere decir que todos los bits se hacen un lugar a la izquierda, insertando un 0 por la derecha y descartando el último bit (el más significativo), que se va al _Carry Flag_:  
    `00000110`  
    Como se puede ver, el resultado equivale a 6 decimal; así que parece que la regla se cumple.  
    Podemos observar que insertar un 0 por la derecha, es justo lo que hacemos para multiplicar por 10; pero esto en base decimal. Aquí, usando bits, es como usar base binaria; y multiplicar por 10 en esta base, es exactamente lo mismo que lo que conocemos como multiplicar por 2, en base binaria.
3.  _Tengo X pesos, donde X es un número entero entre 1 y 100\. Construir una sección de código en Ensamblador que indique la combinación mínima de monedas de $1, $5, $10  y  $20 necesaria para cubrir esa cantidad. Para ello, dejar los valores en CL, CH, DL y DH, respectivamente. Suponer que X se encuentra al inicio en AL_  
    El algoritmo consiste en dividir sucesivamente, entre 20, 10 y 5:  
    `; Primero, dividir AL entre 20:  
    MOV AH, 0 ; Para que AX completo valga lo mismo que AL  
    MOV BL, 20 ; Cantidad a dividir  
    DIV BL ; Divide AX / 20  
    ; El cociente queda en AL, el residuo en AH  
    MOV CL, AL ; Número de monedas de $20  
    MOV AL, AH ; Para seguir dividiendo  
    MOV AH, 0 ; Para que AX completo valga lo mismo que AL  
    MOV BL, 10 ; Cantidad a dividir  
    DIV BL ; Divide AX / 10  
    ; El cociente queda en AL, el residuo en AH  
    MOV CH, AL ; Número de monedas de $10  
    MOV AL, AH ; Para seguir dividiendo  
    MOV AH, 0 ; Para que AX completo valga lo mismo que AL  
    MOV BL, 5 ; Cantidad a dividir  
    DIV BL ; Divide AX / 5  
    ; El cociente queda en AL, el residuo en AH  
    MOV DL, AL ; Número de monedas de $5  
    MOV DH, AH ; Número de monedas de $1`

También conviene ver entre los programas que hay como referencia; entre los apropiados al tema están:

1.  [Hola Mundo](../programa/hello.asm)
2.  [Clave César](../programa/cesar.asm)
3.  [Serie de Fibonacci](../programa/fibo.asm)