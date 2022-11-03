## Ejercicios

No son para entregar, sólo para practicar y discutir.

1.  Supongamos que tenemos la ecuación:  
    X = Y - 3  
    Si el valor de Y se encontrara en el registro AX, ¿qué instrucciones serían necesarias para que el valor de X quedara en BX?
2.  Supongamos que tenemos la ecuación:  
    X = 3Y + 5  
    Si el valor de Y se encontrara en el registro AX, ¿qué instrucciones serían necesarias para que el valor de X quedara en BX?
3.  Supongamos que tenemos la ecuación:  
    X = AY + C  
    Si el valor de Y se encontrara en el registro AX, el valor de A en CX, y el valor de C en BX, ¿qué instrucciones serían necesarias para que el valor de X quedara en BX?
4.  ¿Cómo multiplicarías con sólo dos instrucciones al registro BX por 4?
5.  ¿Cómo multiplicar al registro CX por dos, en una sola instrucción? ¿Es óptima la solución? ¿Hay alguna forma de hacerlo usando modo registro de ambos lados?
6.  Indicar tres formas distintas de hacer 0 un registro, en una sola instrucción. ¿Cómo funcionan? ¿Cuál es más eficiente? (Tip: ver el problema 4)
7.  Indicar qué pasa con los registros al ejecutar el siguiente bloque de instrucciones:  
    `MOV AX, 0  
    MOV BX, 0  
    Ciclo:  
    ADD AX, BX  
    INC BX  
    JMP Ciclo`
8.  ¿Cómo dividir al registro BX entre dos? ¿Dónde queda el resultado (cociente) de la división? ¿Dónde queda el residuo de la división?
9.  Realizar una secuencia de instrucciones que ejecute un procedimiento similar al que hace el sumador de direcciones. Es decir, que tome dos registros de 16 bits, y genere un resultado de 20 bits. Para propósitos de ejemplo, usar AX como el valor de Segmento, BX como el del desplazamiento, y dejar el resultado en CX (16 bits más significativos, 12 deben estar en 0 y sólo usarse los 4 menos significativos); y DX (los 16 bits menos significativos).