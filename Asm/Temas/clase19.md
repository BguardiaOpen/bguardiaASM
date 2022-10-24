 Instrucciones de Ciclos

Tema #19  
Instrucciones de Ciclos
==================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase18.md)

[![Sesión](../../images/light.gif)  
Sesión 11](../Sesiones/sv11.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase20.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Conocer las instrucciones especiales de la familia 80x86, especialmente diseñadas para el manejo eficiente de ciclos.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

### Instrucciones de ciclos

Las instrucciones de ciclos son muy particulares de la familia 80x86, son instrucciones de mayor nivel que combinan la funcionalidad de varias instrucciones de las ya vistas; con ello, se reduce el FETCH para un proceso particular, por lo que estas instrucciones generalmente se usan para conseguir una mayor eficiencia del código, sea en tamaño o velocidad.

*   [JCXZ](#jcxz)
*   [LOOP](#loop)
*   [LOOPE/LOOPNE](#loopeloopne)

* * *

### JCXZ

*   CX se usa especialmente como contador
*   Es común tener que realizar la comparación Si CX = 0, entonces no entres al ciclo (o salta a cualquier otro lado)

Sintaxis:

`JCXZ <etiqueta>`

equivale a:

`CMP CX, 0`

`JZ <etiqueta>`

Diferencia importante: No altera las banderas

* * *

### LOOP

Ciclos comunes: repetir un bloque de instrucciones "N" veces

`(mientras N > 0) {...; N--; }`

Manejo: se pone N en CX

`MOV CX, N`

`Etiqueta:`

`...`

`DEC CX`

`CMP CX, 0`

`JNE Etiqueta`

LOOP reemplaza al DEC, CMP y JNE; no afecta las banderas.

`MOV CX, N`

`Etiqueta:`

`...`

LOOP `Etiqueta`

#### Ventajas:

1.  Es más estructurado
2.  Es más compacto en memoria
3.  Normalmente, es más eficiente
4.  No altera las banderas, por lo que otra comparación puede conjugarse con la condición de fin del ciclo.

* * *

### LOOPE/LOOPNE

LOOPE: Mientras (CX > 0 y ZF = 1), es decir "Ciclo mientras la bandera de cero está activa y el contador no llegue a 0"

Similar a LOOP, se puede explicar mencionando que un ciclo como el siguiente puede ser sustituido por el LOOPE:

`Ciclo: ...`

`JNE FinCiclo`

`DEC CX`

`CMP CX, 0`

`JNE Ciclo`

`FinCiclo:`

LOOPNE: Mientras (CX > 0 y ZF = 0) , es decir "Ciclo mientras la bandera de cero está apagada y el contador no llegue a 0"

Es un caso similar

`Ciclo: ...`

`JE FinCiclo`

`DEC CX`

`CMP CX, 0`

`JNE Ciclo`

`FinCiclo:`

Al igual que LOOP, estas instrucciones no afectan las banderas

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

1.  Libros de referencia.
2.  Libro de texto, solamente en la referencia de instrucciones, pp. 499-500

![Línea de separación](../../images/waveline.gif) 

## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Ma 2-Jul-96_  
_última actualización: Mi 15-Abr-1998_