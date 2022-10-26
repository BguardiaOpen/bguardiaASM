 Ciclos

Tema #14
========

Técnicas de programación: Ciclos y arreglos
===========================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase13.md)

[![Sesión](../../images/light.gif)  
Sesión 9](../Sesiones/sv09.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase15.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Revisar las técnicas apropiadas para el manejo de ciclos, condiciones y arreglos.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

## Condiciones
-----------

Antes que nada, hay que analizar cuál es el funcionamiento de una condición, tal como la manejamos en un lenguaje de alto nivel.

* * *

`SI SE CUMPLE (Condicion)`

`{`

`Instrucciones que se ejecutan en caso de cumplirse la condición (bloque THEN)`

`}`

`DE LO CONTRARIO`

`{`

`Instrucciones que se ejecutan en caso de no cumplirse la condición (bloque ELSE)`

`}`

* * *

Para implementarlo en ensamblador, se suelen seguir los siguientes pasos:

1.  Evaluar la condición
2.  Usar un salto condicional, para que en caso de no cumplirse, se salte a la región del programa donde se encontrarón las instrucciones del bloque ELSE.
3.  Codificar a continuación las instrucciones del bloque THEN.
4.  Codificar un salto incondicional hacia después del bloque ELSE, donde continuará la ejecución.
5.  Poner la etiqueta a la que saltá el salto condicional del paso 2.
6.  Codificar a continuación las instrucciones del bloque ELSE.

Por ejemplo, supongamos el pseudocódigo:

`Si A es mayor que B`

`{`

`Imprime "A mayor que B"`

`}`

`de lo contrario (A <= B)`

`{`

`Imprime "A menor o igual a B"`

`}`

En ensamblador, podría codificarse:

`.data`

`... ; más variables`

`; dentro de los datos`

`A DW ? ; Variables que vamos a comparar posteriormente`

`B DW ?`

`Mensaje1 DB 'A mayor que B$'`

`Mensaje2 DB 'A menor o igual que B$'`

`... ; más variables`

`.code`

`... ; principio del código`

`; Aquí va la condición`

`; Paso 1: Evaluar la condición`

`MOV AX, A ; No puede compararse memoria-memoria, uso un registro como temporal.`

`CMP AX, B`

`JLE ParteElse ; Comparación salto condicional considerando variables con signo`

`; Aquí van las instrucciones de la parte THEN`

`MOV AH, 9`

`MOV DX, OFFSET Mensaje1`

`INT 21h`

`; Saltar al final`

`JMP DespuesDelIf`

`ParteElse: ; Etiqueta que señala dónde empieza el bloque ELSE`

`; Aquí van las instrucciones de la parte ELSE`

`MOV AH, 9`

`MOV DX, OFFSET Mensaje2`

`INT 21h`

`DespuesDelIf:`

En este caso, puede eficientarse el código al darnos cuenta de que los dos bloques tienen instrucciones comunes:

`.data`

`... ; más variables`

`; dentro de los datos`

`A DW ? ; Variables que vamos a comparar posteriormente`

`B DW ?`

`Mensaje1 DB 'A mayor que B$'`

`Mensaje2 DB 'A menor o igual que B$'`

`... ; más variables`

`.code`

`... ; principio del código`

`; Aquí va la condición`

`; Paso 1: Evaluar la condición`

`MOV AX, A ; No puede compararse memoria-memoria, uso un registro como temporal.`

`CMP AX, B`

`JLE ParteElse ; Comparación salto condicional considerando variables con signo`

`; Aquí van las instrucciones de la parte THEN`

`MOV DX, OFFSET Mensaje1`

`; Saltar al final`

`JMP DespuesDelIf`

`ParteElse: ; Etiqueta que señala dónde empieza el bloque ELSE`

`; Aquí van las instrucciones de la parte ELSE`

`MOV DX, OFFSET Mensaje2`

`DespuesDelIf:`

`MOV AH, 9`

`INT 21h`

Ciclos
------

Para realizar un ciclo, tenemos varios casos:

*   Caso Ciclo Infinito.  
    En este caso, se desea repetir una acción indefinidamente.  
    Se codifica sencillamente, haciendo un JMP incondicional hacia el inicio del ciclo:  
    `CicloInfinito:   ; Aquí van todas las instrucciones que quieran poner dentro del ciclo   JMP CicloInfinito`
*   Caso While.  
    En este caso, se va a evaluar una condición; si no se cumple, se continúa la ejecución DESPUÉS del ciclo, mientras que si se cumple, entra a ejecutar las instrucciones dentro del ciclo, y al final del ciclo se regresa a la condición. Es como un ciclo infinito, nada más con una condición que se evalúa al principio del ciclo, que puede sacarlo:  
    Puede verse como un ciclo infinito que tiene un IF dentro, en el cual el caso ELSE es fuera del ciclo.  
    `While:   ; Aquí va la condición, supongamos para ejemplificar que se compara AX con 0   CMP AX, 0   JNE Salir ; Si no se cumple, fuera del ciclo   ; Aquí van todas las instrucciones que se requieran dentro del ciclo   JMP While   Salir:`  
    A veces se puede tener el problema de que el ciclo es muy grande, y marca un error "_Relative Jump Out of Range..._"; hay dos soluciones:
    *   Poner las instrucciones dentro del ciclo, en un procedimiento separado.
    *   Usar lógica negativa. Esta idea se ejemplifica a continuación  
        `While:   ; Aquí va la condición, supongamos para ejemplificar que se compara AX con 0   CMP AX, 0   JE NoSalir ; Si se cumple, dentro del ciclo   JMP Salir ; Si no se cumple, fuera del ciclo   NoSalir:   ; Aquí van todas las instrucciones que se requieran dentro del ciclo   JMP While   Salir:`
*   Caso For  
    Este caso es un caso particular de While, generalmente regulado por un contador. Se recomienda en Ensamblador usar una lógica de decremento, y a CX como contador. Si el objetivo es realizar un ciclo X veces, supongamos 8 veces, el código apropiado sería del tipo:  
    `MOV CX, 8 ; Número de veces   For:   DEC CX   JZ Salir ; Cuando llega a 0, se terminó, salimos   ; Instrucciones dentro del ciclo   JMP For`

### Arreglos

Para manejar un arreglo en ensamblador, ya vimos las técnicas de representación. Para el acceso, generalmente usamos modo indexado de base, o modo indirecto.

En caso de usar modo indexado de base, la técnica consiste en:

1.  Poner la dirección de base del arreglo en BX
2.  Poner en SI (o DI) el desplazamiento del elemento deseado (calculado como tamaño de cada elemento \* número del elemento, iniciando siempre en 0).
3.  Acceder a la memoria del arreglo usando \[BX+SI\]

En caso de usar modo indirecto, la técnica consiste en calcular la dirección de un elemento, y colocarla en SI o DI.

Por ejemplo, si tenemos un arreglo de números enteros de 16 bits, vamos a recorrerlo y mandarlo a imprimir:  
`.data`

`Arreglo DW 50 DUP(?) ; Arreglo de 50 Words.`

`.code`

`; Instrucciones al inicio...`

`RecorreArreglo PROC`

`; Primero, coloquemos BX en la base`

`MOV BX, OFFSET Arreglo`

`; Coloquemos en SI el número de elemento * Tamaño del elemento`

`MOV SI, 0 ; Esto sería más eficiente con un SUB SI, SI, por ejemplo`

`; Va el ciclo, 50 veces`

`MOV CX, 50`

`Ciclo:`

`DEC CX`

`JZ FinRecorre`

`MOV AX, [BX+SI] ; Accesa el elemento del arreglo`

`CALL ImprimeAX ; Rutina que imprima el número en AX`

`ADD SI, 2 ; Apuntar al siguiente elemento del arreglo`

`JMP Ciclo`

`FinRecorre: RET`

`RecorreArreglo ENDP`

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

*   Libros de metodología de la programación
*   Clases anteriores.

![Línea de separación](../../images/waveline.gif) 

## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Do 9-Mar-97_  
_última actualización: Do 9-Mar-97_