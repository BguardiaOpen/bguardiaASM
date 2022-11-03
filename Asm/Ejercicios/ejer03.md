## Ejercicios (Arquitectura de PCs)

No son para entregar, sólo para practicar y discutir.

1.  Enumerar los registros principales del procesador, divididos por categorías.
2.  Indica con qué registros de 8 bits cuenta el procesador.
3.  Investiga las limitaciones de los registros de segmentos.
4.  Explica por qué se dice que el 8086 es un procesador de 16 bits.
5.  ¿Qué puedes deducir en cuanto a los registros de propósito general del 80386, dado que este procesador es de 32 bits?
6.  Si por lo demás fueran iguales, ¿Cuánto sería más rápido un programa que haga un uso intensivo de memoria, ejecutado en un 80386 DX, a 40 Mhz., en relación al mismo programa en un 8086, a 5 Mhz.? ¿Cuánto en relación a correrlo en un 80386 SX a 20 Mhz.? ¿Cuánto más rápido en un Pentium de 120 Mhz.? Explica tu respuesta.
7.  ¿Qué procesador sería más rápido: un 386SX a 40 Mhz. o un 386 DX a 25 Mhz.? ¿Por qué?; y, entre un 80486DX a 50 Mhz. y un 80486SX a 50 Mhz., ¿Qué tanta diferencia habría en velocidad, y en qué circunstacias? ¿Por qué?
8.  En forma similar al ejercicio de las sesiones 1 y 2 (simulación de Fetch), simula lo que ocurre paso a paso con cada componente del procesador, si se ejecuta el siguiente código; suponiendo que el código está en la localidad lógica de memoria 1200h:1000h, dibuja cómo queda esa sección de memoria, y explica los valores de los registros en tu ejecución simulada:

> MOV AX, 5
> 
> MOV BX, 10
> 
> ADD AX, BX
> 
> MOV CX, AX

**Segmentación:**

1.  Calcula la dirección física que corresponde a la dirección lógica 3DEFh:4235h
2.  Encuentra tres direcciones lógicas que correspondan a la dirección física 98765h
3.  Indica con qué rango de segmentos podemos accesar la dirección física 01234h
4.  Realiza un programa en pseudocódigo que recorra la memoria completamente, generando las direcciones físicas de 00000h a FFFFFh, en forma de Segmento y Desplazamiento, sin saltar ninguna y sin repetir.