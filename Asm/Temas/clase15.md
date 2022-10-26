 Apuntadores

Tema #15
========

Técnicas de programación: Apuntadores
=====================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase14.md)

[![Sesión](../../images/light.gif)  
Sesión 9](../Sesiones/sv09.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase16.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Comprender el concepto de apuntadores.
*   Revisar su uso para acceder eficientemente a arreglos.
*   Revisar su uso para construir listas y árboles.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

> ### ¿Qué es un apuntador?
> 
> Existen diversos problemas en los cuales se requiere referenciar un dato. Por ejemplo, si tenemos la información de los alumnos de Ensamblador y sus calificaciones:

<table cellspacing="0" border="0" cellpadding="3" width="336">

<tbody>

<tr>

<td width="121">

**<font face="Helv" size="3" color="#000000">Matrícula</font>**

</td>

<td width="115">

**<font face="Helv" size="3" color="#000000">Nombre</font>**

</td>

<td width="76">

**<font face="Helv" size="3" color="#000000">Carrera</font>**

</td>

</tr>

<tr>

<td width="121">

<font face="Helv" size="2" color="#000000">123456</font>

</td>

<td width="115">

<font face="Helv" size="2" color="#000000">Juan</font>

</td>

<td width="76">

<font face="Helv" size="2" color="#000000">ISC</font>

</td>

</tr>

<tr>

<td width="121">

<font face="Helv" size="2" color="#000000">654321</font>

</td>

<td width="115">

<font face="Helv" size="2" color="#000000">Luis</font>

</td>

<td width="76">

<font face="Helv" size="2" color="#000000">ISE</font>

</td>

</tr>

<tr>

<td width="121">

<font face="Helv" size="2" color="#000000">333111</font>

</td>

<td width="115">

<font face="Helv" size="2" color="#000000">Pepe</font>

</td>

<td width="76">

<font face="Helv" size="2" color="#000000">IEC</font>

</td>

</tr>

</tbody>

</table>



<table cellspacing="0" border="0" cellpadding="3" width="335">

<tbody>

<tr>

<td width="120">

**<font face="Helv" size="3" color="#000000">Matrícula</font>**

</td>

<td width="83">

**<font face="Helv" size="3" color="#000000">Parcial</font>**

</td>

<td width="108">

**<font face="Helv" size="3" color="#000000">Calificación</font>**

</td>

</tr>

<tr>

<td width="120">

<font face="Helv" size="2" color="#000000">123456</font>

</td>

<td width="83">

<font face="Helv" size="2" color="#000000">1</font>

</td>

<td width="108">

<font face="Helv" size="2" color="#000000">80</font>

</td>

</tr>

<tr>

<td width="120">

<font face="Helv" size="2" color="#000000">123456</font>

</td>

<td width="83">

<font face="Helv" size="2" color="#000000">2</font>

</td>

<td width="108">

<font face="Helv" size="2" color="#000000">93</font>

</td>

</tr>

<tr>

<td width="120">

<font face="Helv" size="2" color="#000000">654321</font>

</td>

<td width="83">

<font face="Helv" size="2" color="#000000">1</font>

</td>

<td width="108">

<font face="Helv" size="2" color="#000000">87</font>

</td>

</tr>

<tr>

<td width="120">

<font face="Helv" size="2" color="#000000">333111</font>

</td>

<td width="83">

<font face="Helv" size="2" color="#000000">1</font>

</td>

<td width="108">

<font face="Helv" size="2" color="#000000">69</font>

</td>

</tr>

</tbody>

</table>
 

> Por ejemplo, la primera tabla describe la relación entre los alumnos, su nombre y su carrera. Mientras que la segunda, describe la relación entre los alumnos y sus calificaciones.
> 
> En este contexto, la relación entre los dos arreglos que corresponderían a las tablas en memoria, está dada por el campo de Matrícula, que es tipo entero. En general, en cualquier problema similar existirá un campo común que permite relacionar los dos arreglos.
> 
> En el ejemplo de arriba, la relación es eficiente y minimiza el gasto de memoria; pero existen problemas en los que la relación requiere demasiada memoria, además de un algoritmo de búsqueda que requerirá más tiempo para ejecutarse. Por ejemplo:
> 
<table cellspacing="0" border="0" cellpadding="3" width="472">

<tbody>

<tr>

<td width="335">

**<font face="Helv" size="2" color="#000000">Nombre</font>**

</td>

<td width="1">

**<font face="Helv" size="2" color="#000000">Carrera</font>**

</td>

</tr>

<tr>

<td width="335">

<font face="Helv" size="2" color="#000000">Juan Pablo Contreras Luna</font>

</td>

<td width="1">

<font face="Helv" size="2" color="#000000">ISC</font>

</td>

</tr>

<tr>

<td width="335">

<font face="Helv" size="2" color="#000000">Luis Alberto Gutiérrez de GomezLanda</font>

</td>

<td width="1">

<font face="Helv" size="2" color="#000000">ISE</font>

</td>

</tr>

<tr>

<td width="335">

<font face="Helv" size="2" color="#000000">José de Jesús Echeverría de los Monteros</font>

</td>

<td width="1">

<font face="Helv" size="2" color="#000000">IEC</font>

</td>

</tr>

</tbody>

</table>
 
<table cellspacing="0" border="0" cellpadding="3" width="522">

<tbody>

<tr>

<td width="335">

**<font face="Helv" size="2" color="#000000">Nombre</font>**

</td>

<td width="55">

**<font face="Helv" size="2" color="#000000">Parcial</font>**

</td>

<td width="108">

**<font face="Helv" size="2" color="#000000">Calificación</font>**

</td>

</tr>

<tr>

<td width="335">

<font face="Helv" size="2" color="#000000">Juan Pablo Contreras Luna</font>

</td>

<td width="55">

<font face="Helv" size="2" color="#000000">1</font>

</td>

<td width="108">

<font face="Helv" size="2" color="#000000">80</font>

</td>

</tr>

<tr>

<td width="335">

<font face="Helv" size="2" color="#000000">Juan Pablo Contreras Luna</font>

</td>

<td width="55">

<font face="Helv" size="2" color="#000000">2</font>

</td>

<td width="108">

<font face="Helv" size="2" color="#000000">93</font>

</td>

</tr>

<tr>

<td width="335">

<font face="Helv" size="2" color="#000000">José de Jesús Echeverría de los Monteros</font>

</td>

<td width="55">

<font face="Helv" size="2" color="#000000">1</font>

</td>

<td width="108">

<font face="Helv" size="2" color="#000000">87</font>

</td>

</tr>

<tr>

<td width="335">

<font face="Helv" size="2" color="#000000">Luis Alberto Gutiérrez de GomezLanda</font>

</td>

<td width="55">

<font face="Helv" size="2" color="#000000">1</font>

</td>

<td width="108">

<font face="Helv" size="2" color="#000000">69</font>

</td>

</tr>

</tbody>

</table>

> En este caso, el campo común de los dos arreglos es bastante largo; por ello, la redundancia de ambos campos genera un alto consumo de memoria. Especialmente en los primeros tiempos del cómputo, cuando se empezaban a desarrollar los lenguajes de alto nivel, se tenían que buscar soluciones para hacer más eficiente el uso de la memoria; y como consecuencia, también más rápido el procesamiento. En este caso, el procesamiento resulta lento pues para encontrar la correspondencia, se tienen que hacer comparaciones de cadenas, las cuales son más costosas y requieren más accesos a memoria que, por ejemplo, la búsqueda de un entero que vimos en la sección previa (la matrícula).
> 
> La primera y más directa solución consiste en sustituir el campo largo, en la segunda tabla, por un entero que permita la búsqueda más eficientemente. Podríamos crear un código que identifique a cada elemento del arreglo, en forma única, como fue la matrícula en el primer ejemplo. Sin embargo, no es necesario hacerlo, pues el arreglo tiene ya un identificador para cada elemento: el índice en el arreglo. Esto hace mucho más eficiente el acceso, pues ya no requiere comparaciones sino solamente calcular, en base al índice almacenado, la localidad donde está el elemento relacionado.
> 
> Aún no es la solución más eficiente, puesto que se calcula la dirección destino, cuando podría almacenarse directamente. Por tanto, si en vez del índice en el arreglo guardamos la dirección de memoria donde se encuentra el elemento relacionado, no tendremos que hacer operaciones. Esto tiene además la ventaja de que permite relacionar elementos que no están en un arreglo y por lo tanto no se puede calcular tan eficientemente su dirección; de hecho, por esta última razón los apuntadores son la solución natural para estructuras de datos como los árboles y listas, que no siempre tendrán un orden en sus elementos como ocurre con los arreglos.
> 
> ### Acciones comunes con apuntadores:
> 
> Para ejemplificar el uso de apuntadores, verificaremos dos casos comunes de aplicación:
> 
> **a) Recorrido secuencial, apuntadores contra arreglos** 
> 
> En diversos algoritmos, necesitamos recorrer todos los elementos de un arreglo, especialmente en cadenas. Como ejemplo, veremos una función de sumatoria, que suma todos los elementos en un arreglo:
> 
> En lenguaje C, el código sería:

int Arreglo[1000];

int Sumatoria()

{

int i, Temp;

Temp = 0;

for (i = 0; i<1000; i++)

Temp += Arreglo[i];

return Temp;

}

 > 
En este caso, estamos haciendo el recorrido de todos los elementos, y para cada elemento del arreglo se está calculando su dirección, utilizando la fórmula que vimos en el tema de "Representación de datos". Esto es ineficiente, por lo que en vez de implementar el uso del arreglo en ensamblador, usaremos un apuntador para ir a través de él. 

.data

Arreglo DW 1000 DUP (?)

.code

...

MOV SI, OFFSET Arreglo

MOV AX, 0 ; AX va a tener el temporal para llevar el resultado

MOV CX, 0 ; CX la hará de contador

CicloForI:

ADD AX, \[SI\]

; Avanzar el apuntador al siguiente elemento del arreglo

ADD SI, 2

INC CX

CMP CX, 1000

JNE CicloForI

...

 > **b) Construir estructuras de datos complejas**
> 
> En ocasiones requeriremos estructuras de datos que no son simples arreglos o estructuras; por ejemplo, usaremos una lista ligada para acceder a un conjunto de datos en orden alfabético.
> 
> Para construir la estructura usaremos un arreglo con datos especialmente pensados:
> 
> > Será un arreglo de alumnos
> > 
> > Se aceptarón hasta 1000 alumnos
> > 
> > Cada registro de alumno usará los campos de "Nombre" (20 caracteres), "Matrícula" (6 caracteres), "Promedio" (3 caracteres con justificación a la derecha y espacios de relleno), y "Siguiente", que será un apuntador (un Word), el que inicializaremos con 0.

Alumnos DB 'Bruno', 15 DUP(' '), '123456', ' 85', 0, 0

DB 'Juanito', 13 DUP(' '), '987654', '100', 0, 0

DB 'Pepito del Cuento', 3 DUP(' '), '987654', '100', 0, 0

 Como un ejemplo adicional, véase el recorrido de una lista:

.model small
.stack 100h
.data
Head DW OFFSET Arreglo3

Arreglo DB '2'
	DW OFFSET Arreglo1

Arreglo1 DB '3'
	DW 0 	; Null por convencion

Arreglo2 DB '1'
	DW OFFSET Arreglo

Arreglo3 DB '0'
	DW OFFSET Arreglo2

.code
Principal PROC
	MOV AX, @data
	MOV DS, AX
	CALL RecorreLista
	MOV AH, 4Ch
	INT 21h
Principal ENDP

RecorreLista PROC
	MOV SI, Head ; el apuntador
CicloRecorre:
	CMP SI, 0 ; es NULL?
	JE FinLista
	MOV DL, \[SI\] ; imprime el contenido
	MOV AH, 2
	INT 21h
	MOV DL, 13 ; imprime salto de linea
	INT 21h
	MOV DL, 10
	INT 21h
	; Mover al siguiente
	MOV SI, \[SI+1\]
	JMP CicloRecorre
FinLista:
	RET
RecorreLista ENDP

END Principal
 

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

*   PC Interno, Michael Tischer
*   Manuales de Interrupciones, por ejemplo el apéndice C del libro de texto.

![Línea de separación](../../images/waveline.gif) Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Vi 7-Jun-96_  
_última actualización: Lu 26/Sep/2000_