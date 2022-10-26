 Macros

Tema #18  
Macros
=================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase17.md)

[![Sesión](../../images/light.gif)  
Sesión 11](../Sesiones/sv11.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase19.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Comprender el concepto de Macros, y su aplicación en Ensamblador.
*   Conocer las directivas que permiten evitar el tecleo de código repetitivo.
*   Conocer las directivas de ensamblado condicional.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

### Conceptos básicos

#### Definición y operación

Una macro es un símbolo que representa un bloque de texto.

El ensamblador usa las macros de tal manera que cada vez que encuentra al símbolo que define la macro, lo sustituye por el texto que representa.

#### Cómo crear macros

##### Sintaxis:

`<Nombre> MACRO [parametros]`

`...`

`ENDM`

##### Ejemplo:

    DuplicaAL MACRO

        SHL AL, 1

    ENDM

##### Código que la usa:

`MOV AL, 2`

`DuplicaAL ; Esta es la "llamada" al macro`

El ensamblador sustituye cada vez que aparezca la macro

No es como los procedimientos, que se "llaman" pero no repiten el código

Ejemplo:

`MOV AL, 2`

`DuplicaAL ; CALL Duplica`

`DuplicaAL ; CALL Duplica`

Este código queda

`MOV AL, 2`

`SHL AL, 1 ; CALL Duplica`

`SHL AL, 1 ; CALL Duplica`

#### Cúando usarlas y cúando no

*   Cuando se quiere el código más rápido y no importa ser repetitivo (código grande)
*   Cuando se van a generar diversas variantes de código similar
*   No cuando se quiere código compacto, evitando repetir el mismo (en este caso, usar procedimientos)

### Asignación de variables y constantes para el ensamblador

Pseudoinstrucciones, pues solamente se usan durante el proceso de traducción

##### Sintaxis:

<Simbolo> EQU Valor

<Simbolo> = Valor

Permiten definir constantes y variables del ensamblador

La diferencia es que _\=_ puede usarse varias veces sobre el mismo símbolo (como una

variable)

### REPT

Directiva para definir bloques repetitivos

Permite repetir un código determinado, tantas veces como se desee

##### Sintaxis:

`REPT <n>`

`...`

`ENDM`

Ejemplo:

`Valor = 0 ; Variable de ensamblador`

`REPT 10`

    `DW Valor`

    `Valor = Valor + 1`

`ENDM`

### Uso de parámetros en macros

Los macros pueden ser adaptativos; por ejemplo:

`Potencia2 MACRO Registro, Valor`

    `REPT Valor`

        `SHL Registro, 1`

    `ENDM`

`ENDM`

##### Uso:

`Potencia2 CX, 4`

Se convierte en:

`SHL CX, 1`

`SHL CX, 1`

`SHL CX, 1`

`SHL CX, 1`

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

1.  Manuales de Turbo Assembler (User's Guide & Reference Guide).
2.  Libro de Texto, capítulo 13.
3.  Macro Magic with Turbo Assembler

![Línea de separación](../../images/waveline.gif)

Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Ma 2-Jul-96_  
_última actualización: Mi 10-Abr-98_