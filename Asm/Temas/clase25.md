 Manejo del Ratón

Tema #25
========

Manejo del Ratón
================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase24.md)

[![Sesión](../../images/light.gif)  
Sesión 16](../Sesiones/sv16.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](clase26.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Conocer los servicios de la interrupción 33h para el manejo del ratón, mediante el sistema de "polling", es decir, muestreo del estado.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

### Manejo del Ratón

*   [Introducción](#introducción)
*   [Tabla de servicios](#servicios)

* * *

## Introducción
------------

El ratón es controlado, en general, a través de los distintos servicios de la interrupción 33h. Dicha interrupción normalmente no es ocupada, sino hasta que se carga el driver del ratón, que es proporcionado por el fabricante del hardware. Existen funciones para controlar su activación, mostrar el cursor en modo texto o gráfico, detectar las coordenadas donde se encuentra y el estado de los botones. Dichas funciones son llamadas siguiendo el esquema normal de llamadas a interrupción.

* * *

### Servicios

<table border="1">

<tbody>

<tr>

<th>Servicio</th>

<th>Descripción</th>

<th>Entrada</th>

<th>Salida</th>

<th>Comentarios</th>

</tr>

<tr>

<td>0000h</td>

<td>Inicializa el driver del ratón</td>

<td>AX = 0000h</td>

<td>AX = FFFFh, en éxito  
BX = Número de botones del ratón

AX = 0000h, en error (no hay driver instalado)

</td>

<td>Esta función debe llamarse antes de cualquier otra, para ver si están disponibles las funciones del driver del ratón.</td>

</tr>

<tr>

<td>0001h</td>

<td>Activa el cursor del ratón  
(lo muestra)</td>

<td>AX = 0001h</td>

<td>No tiene</td>

<td>Esta función permite que el usuario visualize el cursor, sea de texto o gráfico, con el cual se guía para apuntar los objetos en la pantalla.</td>

</tr>

<tr>

<td>0002h</td>

<td>Esconde el cursor del ratón  
(lo desactiva)</td>

<td>AX = 0002h</td>

<td>No tiene</td>

<td>Esta función desactiva la visualización del ratón; esto es particularmente importante en el modo gráfico, al momento de pintar, pues si no se desactiva el cursor del ratón, éste borrará parte de la información pintada. Si se requiere estrictamente que el cursor se visualize, conviene hacer una desactivación y activación rápida.</td>

</tr>

<tr>

<td>0003h</td>

<td>Obtener posición del ratón y estado de los botones</td>

<td>AX = 0003h</td>

<td>[BX = Estado de los botones del ratón.  
](#estado)CX = Coordenada horizontal (X) donde se encuentra el apuntador.  
DX = Coordenada vertical (Y) donde se encuentra el apuntador.  
</td>

<td>Esta función nos permite averigüar en dónde se localiza el cursor en el momento actual, y si los botones están o no presionados.</td>

</tr>

<tr>

<td>0004h</td>

<td>Ajusta la posición del ratón</td>

<td>AX = 0004h  
CX = Coordenada horizontal (X).  
DX = Coordenada vertical (Y).</td>

<td> </td>

<td>Esta función nos permite colocar al cursor del ratón en una posición determinada, como ocurre cuando se busca dar una opción por defecto al usuario, o restringir el área de movilidad del cursor a una ventana [(ver funciones 7 y 8)](#ventana)</td>

</tr>

<tr>

<td>0007h</td>

<td>Restringe la zona de movilidad horizontal del apuntador</td>

<td>AX = 0007h  
CX = Coordenada mínima horizontal (X).  
DX = Coordenada máxima horizontal (X).</td>

<td> </td>

<td>Esta función nos permite, en combinación con la 08h, restringir la movilidad del cursor del ratón a una ventana; en particular, con esta función definimos una franja horizontal donde el usuario puede mover al ratón; al llegar a los límites, el cursor ya no avanza más.</td>

</tr>

<tr>

<td>0008h</td>

<td>Restringe la zona de movilidad vertical del apuntador</td>

<td>AX = 0008h  
CX = Coordenada mínima vertical (Y).  
DX = Coordenada máxima vertical (Y).</td>

<td> </td>

<td>Esta función nos permite, en combinación con la 07h, restringir la movilidad del cursor del ratón a una ventana; en particular, con esta función definimos una franja vertical donde el usuario puede mover al ratón; al llegar a los límites, el cursor ya no avanza más.</td>

</tr>

</tbody>

</table>

#### Codificación del estado de los botones del ratón.

Los ratones normalmente cuentan con dos botones, si bien algunos soportan hasta tres; la mayor parte de las aplicaciones no le dan significado al tercero; en el caso de los ratones de dos botones, muchos drivers interpretan al caso de ambos botones presionados como el presionar el botón medio.

*   Bit 0 = 1 si está presionado el botón izquierdo  
    
*   Bit 1 = 1 si está presionado el botón derecho  
    
*   Bit 2 = 1 si está presionado el botón medio  
    
*   Bits 3-15 = No usados

### Errores comunes en el manejo del ratón

> _**El error más común, consiste en poner el número de servicio en AH, como estamos acostumbrados al usar otras interrupciones; pero, desafortunadamente, en esta interrupción HAY QUE PONERLO en AX.**_

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

1.  PC Interno, versión 2.0, de Michael Tischer. Ya lo tenemos en Biblioteca del Campus.
2.  Microsoft Mouse Reference, también está en Biblioteca.

![Línea de separación](../../images/waveline.gif) Página por Bruno Guardia R.

f [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 16-Sep-96_  
_Última actualización: Mi 12-Abr-1998_