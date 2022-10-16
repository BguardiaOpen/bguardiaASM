 Modos de direccionamiento

Tema #8
=======

Modos de direccionamiento
=========================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase07.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase09.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Conocer el concepto de modos de direccionamiento y acceso a memoria.
*   Conocer los principales modos de direccionamiento
*   Saber cuándo utilizarlos.
*   Saber qué combinaciones de modos de direccionamiento son válidas y cuáles no.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

Modos de direccionamiento
-------------------------

Se les llama modos de direccionamiento a las distintas formas de combinar los operandos según el acceso que se hace a memoria.

Dicho de otra manera, un modo de direccionamiento será una forma de parámetro para las instrucciones. Una instrucción que lleve un parámetro, por lo tanto, usará un modo de direccionamiento, que dependerá de cómo direccionará (accesará) al parámetro; una instrucción de dos parámetros, combinará dos modos de direccionamiento.

* * *

Direccionamiento implícito

*   Depende solamente de la instrucción, es decir, la instrucción no lleva parámetros.
*   Particularmente en instrucciones que no accesan memoria, o bien que tienen una forma específica de accesarla.
*   Ejemplos: `PUSHF, POPF, NOP`

* * *

Modo registro

*   Usa solamente registros como operandos
*   Es el más rápido, pues minimiza los recursos necesarios (toda la información fluye dentro del EU del CPU)

### Ejemplo:

*   `MOV AX, BX`

* * *

Modo inmediato

*   Tiene dos operandos: un registro y una constante que se usa por su valor.
*   El valor constante no se tiene que buscar en memoria, pues ya se obtuvo al hacer el "fetch" de la instrucción.
*   Por tanto, es rápido aunque no tanto como el modo registro; requiere ir al BIU por el dato.

### Ejemplo:

*   `MOV AH, 9`

* * *

Modo directo

*   Uno de los operandos involucra una localidad específica de memoria
*   El valor constante se tiene que buscar en memoria, en la localidad especificada.
*   Es más lento que los anteriores, pero es el más rápido para ir a memoria, pues ya "sabe" la localidad, la toma de la instrucción y no la tiene que calcular.

### Ejemplo:

*   `MOV AH, [0000]`
*   `MOV AH, Variable`

Estas dos instrucciones serían equivalentes, si Variable está, por ejemplo, en la localidad 0 de memoria. En la forma primitiva del lenguaje de máquina, como el primer ejemplo, se tiene que indicar "mover a AH el **contenido** (indicado por los corchetes), de la localidad 0 de los datos (lo de los datos es implícito). El lenguaje Ensamblador, sin embargo, nos permite la abstracción del uso de variables, pero como una variable tiene una localidad determinada en memoria, para el procesador funciona igual. La única diferencia consiste en que el programador no tiene que preocuparse por la dirección, ese manejo lo hace automáticamente el Ensamblador.

* * *

Modo indirecto

*   Se usan los registros SI, DI como apuntadores
*   El operando indica una localidad de memoria, cuya dirección (sólo la parte desplazamiento) está en SI o DI.
*   Es más lento que los anteriores, pues tiene que "calcular" la localidad

### Ejemplos:

*   `MOV AL, [SI]`
*   `MOV BL, ES:[SI]` ; Aquí se dice que se usa un "_segment override_", donde se indica que en vez de usar el segmento de datos por defecto, se use en su lugar como referencia el segmento extra.

* * *

Modo indexado de base

### Formato:

`[   BX o BP   + SI o DI` (opcionales)`+ constante` (opcional)`   ]`

BX o BP indica una localidad base de la memoria

A partir de BX o BP, se puede tener un desplazamiento variable y uno constante

La diferencia es el segmento sobre el que trabajan por defecto:

*   BX por defecto en el segmento de datos
*   BP por defecto en el segmento de pila.

### Ejemplos:

*   `MOV AX, [BX]`
*   `MOV DX, [BX+2]`
*   `MOV CX, [BX+DI]`
*   `MOV DL, [BX+SI+3]`

![Línea de separación](../../images/waveline.gif)

### Tabla de combinaciones posibles

De acuerdo a lo que se ha visto, y a la regla de que no se permiten dos accesos a memoria en la misma instrucción, se pueden combinar en la siguiente forma:
<table border="1" cellpadding="0" cellspacing="0">

<tbody>

<tr>

<th>Modo  
destino</th>

<th>Modo  
Fuente</th>

<th>Registro</th>

<th>Inmediato</th>

<th>Directo</th>

<th>Indirecto</th>

<th>Indexado</th>

</tr>

<tr>

<th colspan="2">Registro</th>

<td> 

![bien.gif (2262 bytes)](../../images/bien.gif)

</td>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)

</td>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)

</td>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)
</td>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)
</td>

</tr>

<tr>

<th colspan="2" align="center">Inmediato</th>

<td colspan="5" align="center">No se puede tener inmediato a la izquierda  
(¿Dónde se depositaría la información?)</td>

</tr>

<tr>

<th colspan="2">Directo</th>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)</td>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)</td>

<td colspan="3" rowspan="3">

Estas combinaciones no se pueden  
(serían dos accesos a memoria  
en la misma instrucción)

</td>

</tr>

<tr>

<th colspan="2">Indirecto</th>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)</td>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)</td>

</tr>

<tr>

<th colspan="2">Indexado</th>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)</td>

<td>

![bien.gif (2262 bytes)](../../images/bien.gif)</td>

</tr>

</tbody>

</table>

## Bibliografía
------------

Manual de Turbo Assembler, versión 2.0

Un poco, capítulo 10 del libro de texto (tiene un enfoque distinto)

![Línea de separación](../../images/waveline.gif) 
## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 26-Ago-96_  
_Última actualización: Do 9-Feb-97_