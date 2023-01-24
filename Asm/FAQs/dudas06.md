## Dudas Comunes (Entrada/Salida)

1.  _Tengo un problema al dividir. Me marca división por cero, y ya chequé con el Debugger, que el registro que pongo en el divisor no es un 0\. ¿A qué se debe?_  
    R: Hay que cuidar, al dividir, es común el error consistente en sobrepasar la capacidad del registro destino. Pongamos el siguiente ejemplo en código:  
    `MOV AX, 1000  
    MOV BL, 2  
    DIV BL`  
    Este código marcará el error "Dividir por cero" o "Desbordamiento de división" y tronará la ejecución del programa. La razón (mal explicada en algunos casos) es que el resultado sobrepasa el tamaño del registro destino (en este caso, el cociente, 500, deberá ponerse en AL; pero como no cabe...)  
    En este tipo de errores, el programador debe tener mucho cuidado.
2.  _Tengo un problema al dividir. Tal vez mi procesador no funcione, pues divido dos números y el resultado no es correcto._  
    R: También esto es común, por problemas en el entendimiento de la división. Pongamos como ejemplo el siguiente código:  

    .data  
    Hola DB 'Hola$'  
    MensajeBienvenida DB 'Programa que muestra la división$'  
    .code  
    MOV AX, @data  
    MOV DX, AX  
    MOV AH, 9  
    MOV DX, OFFSET MensajeBienvenida  
    INT 21h  
    MOV AX, 1000  
    MOV BX, 50  
    DIV BX  
    ; Aquí esperamos que AL = 1000 / 50 = 20, pero resulta que AX > 60000 !!!  

    Como puede notarse, el problema es que se quiso dividir un word entre otro word, lo que no hace la instrucción DIV. El DIV al tener un word (BX) como parámetro, automáticamente toma como dividendo un double word (DX:AX), así que toma un número de 32 bits formado por DX y AX, que en este caso es algo más de 300,000; mientras que se deseaba que el dividendo fuera solamente AX (1000). Este caso puede corregirse de dos formas:  
    a) Vemos que no necesitamos un word para el divisor; cambiamos BX por BL, y entonces haremos división entre word y byte, que sí da un resultado byte.  
    b) Ampliamos nuestro dividendo a double word; para que la doble palabra DX:AX tenga un valor de 1000, hay que poner DX en 0 antes de dividir.