 Instrucciones de Strings

Tema #20  
Instrucciones de Strings
===================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase19.md)

[![Sesión](../../images/light.gif)  
Sesión 12](../Sesiones/sv12.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase21.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Conocer las instrucciones especiales de la familia 80x86, especialmente diseñadas para el manejo eficiente de bloques de memoria.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

Instrucciones de Strings

### Descripción

Las instrucciones de Strings son instrucciones muy particulares a la familia de procesadores Intel 80x86, que se especializan en los procesos más comunes de manejo de memoria. Conceptualmente, están concebidas para reunir en una sola instrucción la funcionalidad de una serie de instrucciones. En los primeros procesadores de la familia, esto era una ventaja porque es mas eficiente realizar una instrucción compleja, que varias sencillas, al ahorrar tiempo en la decodificación; pero estas instrucciones tienden a volverse obsoleta, con las nuevas arquitecturas en "pipeline", como la del Pentium.

Las instrucciones que vamos a estudiar a este respecto son:

*   [CLD](#cld-clear-direction-flag)
*   [STD](#std-set-direction-flag)
*   [LODS](#lods-load-string)
*   [STOS](#stos-store-string)
*   [MOVS](#movs-move-string)
*   [SCAS](#scas-scan-string)
*   [CMPS](#cmps-compare-string)
*   El prefijo [REP](#rep) y sus variantes [REPE/REPNE](#reperepne)

* * *

### CLD (CLear Direction flag)

Esta instrucción limpia (pone a 0) la bandera de dirección (DF). Esta bandera solamente tiene significado para las instrucciones de Strings; cuando esté en 0, las instrucciones de Strings incrementarón los apuntadores, mientras que cuando esté en 1, los decrementarón. Podemos conceptualizar que la dirección 0 es de izquierda a derecha, y 1 de derecha a izquierda.

* * *

### STD (SeT Direction flag)

Prende la bandera de dirección (DF = 1)

* * *

### LODS (LOaD String)

Esta instrucción carga el contenido apuntado por DS:SI en el acumulador, y además avanza el apuntador. Hay dos versiones: LODSB (LODS Byte) y LODSW (LODS Word). Equivalen aproximadamente al código siguiente:

`MOV AL, [DS:SI] ; Estas dos instrucciones equivalen a LODSB, con DF=0`

`INC SI`

`MOV AX, [DS:SI] ; Estas tres instrucciones equivalen a LODSW con DF=1`

`DEC SI`

`DEC SI`

Las diferencias que hay entre los dos tipos de LODS y las series de instrucciones que las representan, son principalmente dos:

a) LODS no altera el estado de las banderas.

b) La instrucción es más compacta (ocupa menos memoria), y generalmente más rápida.

* * *

### STOS (STOre String)

Esta instrucción copia el acumulador al contenido apuntado por ES:DI, y además avanza el apuntador. También hay dos versiones: STOSB y STOSW. Equivalen aproximadamente al código siguiente:

`MOV [ES:DI],AL ; Estas dos instrucciones equivalen a STOSB con DF=1`

`DEC DI`

`MOV [ES:DI],AX ; Estas tres instrucciones equivalen a STOSW con DF=0`

`INC DI`

`INC DI`

* * *

### MOVS (MOVe String)

Esta instrucción une la funcionalidad de las dos anteriores: copia el contenido apuntado por \[DS:SI\] al contenido apuntado por \[ES:DI\], con la característica de que no pierde el contenido de AX. También hay dos versiones: MOVSB y MOVSW. Equivalen aproximadamente al código siguiente:

`PUSHF ; Estas OCHO instrucciones equivalen a MOVSB, con DF=0`

`PUSH AX`

`MOV AL, [DS:SI]`

`INC SI`

`MOV [ES:DI],AL`

`INC DI`

`POP AX`

`POPF`

* * *

### REP

Este mnemónico no es realmente una instrucción; más bien, es un prefijo que modifica las instrucciones de strings, haciendo que se repitan, decrementando CX hasta llegar a 0. Hay que notar que si CX es de antemano 0, no se ejecuta nada. Las instrucciones equivalentes a un REP MOVSW, por ejemplo, serían:

`JCXZ @@FinREP`

`@@LoopREP:`

`MOVSW`

`LOOP @@LoopREP`

`@@FinREP:`

Ejemplos para mostrar la utilidad del REP son instrucciones tales como el MEMCPY y el MEMSET.

* * *

### SCAS (SCAn String)

Esta instrucción busca un determinado valor en memoria. Equivale a un acceso a memoria unido con una comparación. Como es regla en las instrucciones de strings, hay dos versiones: SCASB y SCASW. Equivalen aproximadamente al código siguiente:

`CMP AL, [ES:DI] ; Estas cuatro instrucciones equivalen a SCASB, con DF=0`

`PUSHF`

`INC DI`

`POPF`

`CMP AX, [ES:DI] ; Estas cinco instrucciones equivalen a SCASW con DF=1`

`PUSHF`

`DEC DI`

`DEC DI`

`POPF`

Para obtener toda la potencialidad de esta instrucción, suele combinarse con versiones particular de REP, tales como REPE o REPNE. De esta manera, se puede tener un ciclo que busque hasta que CX llegue a 0 o bien se encuentre un "match".

* * *

### CMPS (CoMPare String)

Esta instrucción compara dos elementos en memoria. Equivale a dos acceso a memoria unidos con una comparación. Como es regla en las instrucciones de strings, hay dos versiones: CMPSB y CMPSW. Por ejemplo, CMPSB equivale en funcionalidad al código siguiente:

`PUSH AX`

`PUSHF`

`MOV AL, [DS:SI]`

`MOV AH, [ES:DI]`

`INC SI`

`INC DI`

`POPF`

`CMP AL, AH`

`POP AX`

Para obtener toda la potencialidad de esta instrucción, suele combinarse con versiones particular de REP, tales como REPE o REPNE. De esta manera, se puede tener un ciclo que compare hasta que CX llegue a 0 o bien se encuentre una diferencia.

* * *

### REPE/REPNE

Estos mnemónicos también son prefijos que modifica las instrucciones de strings, haciendo que se repitan, decrementando CX hasta llegar a 0, o bien hasta que no se cumpla la condición indicada (en REPE, repite mientras ZF=1 o en REPNE, repite mientras ZF=0). Las instrucciones equivalentes a un REPNE SCASW, por ejemplo, serían:

 `JCXZ @@FinREP`

`@@LoopREP:`

 `SCASW`

 `JE @@FinREP ; Sale cuando llega a ser igual. (ZF != 0)`

 `LOOP @@LoopREP`

`@@FinREP:`

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

1.  Libro de Texto, capítulo 11.
2.  Capítulo correspondiente de los libros de referencia.

![Línea de separación](../../images/waveline.gif) 

## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Ma 2-Jul-96_  
_última actualización: Mi 10-Abr-98_