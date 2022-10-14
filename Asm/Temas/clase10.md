 Entrada/Salida Básica y Programación Estructurada

Tema #10
========

Entrada/Salida Básica y Programación Estructurada
=================================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase09.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase11.md)

[Objetivos Específicos](#objetivo)
----------------------------------

[Teoría](#teoria)
-----------------

[Bibliografía](#biblio)
-----------------------

![Línea de separación](../../images/waveline.gif)

Objetivos Específicos
---------------------

*   Que el alumno conozca las técnicas básicas para recibir entrada del teclado y enviar salida a pantalla.
*   Que el alumno conozca el concepto de procedimientos, y los aplique en su programación.

![Línea de separación](../../images/waveline.gif)

Teoría
------

Entrada y Salida

#### Técnicas básicas

* * *

Técnicas

Toda entrada y salida es, finalmente, a través de los puertos

#### Desventajas:

*   Dependencia del hardware.
*   Dificultad de programación

#### Alternativa:

*   Usar los servicios del sistema operativo (DOS y BIOS)

#### Ventajas:

*   El sistema se ocupa de las particularidades del hardware.
*   Se programa como llamadas a funciones.

* * *

Entrada y salida de un caracter

Se realiza por medio de los servicios de la interrupción 21h (DOS)

El número de servicio se indica en AH

*   Servicio 8: Obtener caracter (equivale a getch en "C" o readkey en Pascal), sin eco en pantalla.
*   Servicio 1: Obtener caracter con eco en pantalla.
*   Servicio 2: Imprimir caracter (equivale a un printf con formato %c)

#### Instrucciones para leer un caracter

`MOV AH, 1 ; Numero de servicio`

`INT 21h ; Realiza la operación`

Regresa en AL el código ASCII del caracter leído

#### Instrucciones para escribir un caracter

`MOV DL, 'A' ; Se carga el caracter deseado en DL`

`MOV AH, 2 ; Numero de servicio`

`INT 21h ; Se imprime el caracter`

Como se puede ver, en DL se le pasa como parámetro el caracter a escribir en pantalla.

### Salida de una cadena

Servicio 9 de la interrupción 21h

DS:DX apuntan al inicio de la cadena a imprimir

La cadena termina con un byte 24h ('$')

No regresa nada

#### Ejemplo

`.data`

`Variable DB 'Hola mundo'`

`.code`

`...`

`MOV AH, 9 ; Número de servicio`

`MOV DX, OFFSET Variable`

`INT 21h`

`...`

### Programación Estructurada

Un principio básico de la programación es el dividir un problema grande en problemas cada vez más pequeños. En un lenguaje de alto nivel, esto implica codificar procedimientos y funciones; de la misma manera lo haremos en ensamblador, mediante el uso apropiado de los siguientes comandos:

#### Instrucciones

CALL etiqueta

Guarda en la pila el IP actual; hace un JMP a la etiqueta, alterando de esa manera el IP; pero puede regresar, cuando encuentre un RET.

RET

Regresa el valor de IP, sacándolo de la pila; el efecto es que el programa continúa su ejecución en la instrucción posterior al CALL.

#### Directivas

etiqueta PROC

Marca el punto donde hay una etiqueta especial, asociada a un procedimiento. Para todos los efectos de control de programa, es exactamente lo mismo usar PROC que una etiqueta simple; se puede hacer tanto JMP como CALL a la etiqueta; pero es más clara la intención del programador, de separar funciones.

etiqueta ENDP

Delimita el final de un procedimiento. Esta es la otra diferencia significativa con una etiqueta simple; obliga al programador a indicar qué rango de instrucciones forman una función o procedimiento específica.

![Línea de separación](../../images/waveline.gif)

Bibliografía
------------

![Línea de separación](../../images/waveline.gif) Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Ju 5-Sep_  
_última actualización: Do 16-Feb-97_