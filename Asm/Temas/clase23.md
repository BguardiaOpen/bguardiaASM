 Macros y directivas condicionales

Tema #23
========

Uso avanzado de macros y directivas condicionales
=================================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase22.md)

[![Sesión](../../images/light.gif)  
Sesión 14](../Sesiones/sv14.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase24.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Conocer las directivas de ensamblado condicional.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

### REPT

Bloques repetitivos

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

### Uso de párametros en macros

Los macros pueden ser adaptativos; por ejemplo:

`Potencia2 MACRO Registro, Valor`

`REPT Valor`

`SHL Registro, 1`

##### Uso:

`Potencia2 CX, 4`

Se convierte en:

`SHL CX, 1`

`SHL CX, 1`

`SHL CX, 1`

`SHL CX, 1`

### Directivas condicionales

Base del poder de las macros

### IF

*   Permite una evaluación al momento de ensamblar
*   Usado principalmente para que el código de una macro se adapte a los operandos, ejemplo:

`IF Variable`

`...`

`ELSE`

`...`

`ENDIF`

### Otras condicionales

### IFE

*   Misma sintaxis que IF
*   Actúa cuando la condición o variable toma un valor de 0

### IFDEF/IFNDEF

*   Actúan si un símbolo está o no definido
*   Similares a #ifdef y #ifndef del preprocesador de "C"
*   Se puede definir el símbolo dentro del programa fuente, o mediante la línea de comandos:
*   Ejemplo: TASM /dDEBUG hola
*   En este caso, DEBUG queda definido y eso permite tener versiones ligeramente distintas de un programa

### Evaluación de párametros de macros

### IFB: IF Blank

Permite tomar una acción apropiada cuando determinado parámetro no se define

##### Sintaxis:

IFB <parametro de macro>

Su acción es evaluar si el parámetro se define o no; si no se define, se ensamblará el código que le sigue a la directiva IFB

### IFNB: IF Not Blank

Su función es inversa a IFB

### Parámetros

Evaluación por su nombre y no valor

### IFIDN: IF IDeNtical

Permite comparar un nombre con un parámetro

##### Sintaxis:

IFIDN <nombre>, <parámetro>

Ej.:

`IFIDN <AL>, <Parametro1>`

Se cumple solamente si el parámetro 1 es AL exactamente

### IFDIF: IF DIFerent

Su acción es contraria a IFIDN

### IFIDNI/IFDIFI:

Son similares a IFIDN e IFDIF, pero ignoran la distinción entre mayúsculas y minúsculas

### Control de errores

Mensajes durante el proceso de ensamblar

#### DISPLAY 'Mensaje'

Despliega un mensaje al momento de ensamblar el programa

#### .ERR

Genera un error al momento de ensamblar

Útil para evitar que se genere código incorrecto cuando con directivas condicionales se valida un error en el uso de las macros

#### .ERRE

Similar a IFE, seguido de un .ERR y el ENDIF; es decir, genera un error si la condición que evalúa es 0

Sintaxis: .ERRE \[expresión\]

### Notas geneúales sobre el uso de condicionales

*   Los párametros de una macro deben encerrarse entre <> ("angle brackets"), o & si se quiere que se tomen literalmente.
*   Las expresiones a evaluar deben ser constantes o variables de ensamblador, excepto por los símbolos definidos. (IFDEF/IFNDEF)
*   La comparación > se lleva a cabo con el operador GT Ejemplo: `IF SIMBOLO GT 5`

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

1.  Manuales de Turbo Assembler (User's Guide & Reference Guide).
2.  Libro de Texto, capítulo 13.
3.  Macro Magic with Turbo Assembler

![Línea de separación](../../images/waveline.gif) 

## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Ma 2-Jul-96_  
_Última actualización: Mi 12-Abr-1998_