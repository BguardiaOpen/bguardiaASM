 Manejo del Ratón

Tema #25
========

Manejo del Ratón
================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase24.md)

[![Sesión](../../images/light.gif)  
Sesión 16](../Sesiones/sv16.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](clase26.md)

[Objetivos Específicos](#objetivo)
----------------------------------

[Teoría](#teoria)
-----------------

[Bibliografía](#biblio)
-----------------------

![Línea de separación](../../images/waveline.gif)

Objetivos Específicos
---------------------

*   Conocer los servicios de la interrupción 33h para el manejo del ratón, mediante el sistema de "polling", es decir, muestreo del estado.

![Línea de separación](../../images/waveline.gif)

Teoría
------

### Manejo del Ratón

*   [Introducción](#introduccion)
*   [Tabla de servicios](#servicios)

* * *

Introducción
------------

El ratón es controlado, en general, a través de los distintos servicios de la interrupción 33h. Dicha interrupción normalmente no es ocupada, sino hasta que se carga el driver del ratón, que es proporcionado por el fabricante del hardware. Existen funciones para controlar su activación, mostrar el cursor en modo texto o gráfico, detectar las coordenadas donde se encuentra y el estado de los botones. Dichas funciones son llamadas siguiendo el esquema normal de llamadas a interrupción.

* * *

### Servicios

Servicio

Descripción

Entrada

Salida

Comentarios

0000h

Inicializa el driver del ratón

AX = 0000h

AX = FFFFh, en éxito  
BX = Número de botones del ratón

AX = 0000h, en error (no hay driver instalado)

Esta función debe llamarse antes de cualquier otra, para ver si están disponibles las funciones del driver del ratón.

0001h

Activa el cursor del ratón  
(lo muestra)

AX = 0001h

No tiene

Esta función permite que el usuario visualize el cursor, sea de texto o gráfico, con el cual se guía para apuntar los objetos en la pantalla.

0002h

Esconde el cursor del ratón  
(lo desactiva)

AX = 0002h

No tiene

Esta función desactiva la visualización del ratón; esto es particularmente importante en el modo gráfico, al momento de pintar, pues si no se desactiva el cursor del ratón, éste borrará parte de la información pintada. Si se requiere estrictamente que el cursor se visualize, conviene hacer una desactivación y activación rápida.

0003h

Obtener posición del ratón y estado de los botones

AX = 0003h

[BX = Estado de los botones del ratón.  
](#estado)CX = Coordenada horizontal (X) donde se encuentra el apuntador.  
DX = Coordenada vertical (Y) donde se encuentra el apuntador.  

Esta función nos permite averigüar en dónde se localiza el cursor en el momento actual, y si los botones están o no presionados.

0004h

Ajusta la posición del ratón

AX = 0004h  
CX = Coordenada horizontal (X).  
DX = Coordenada vertical (Y).

 

Esta función nos permite colocar al cursor del ratón en una posición determinada, como ocurre cuando se busca dar una opcin por defecto al usuario, o restringir el área de movilidad del cursor a una ventana [(ver funciones 7 y 8)](#ventana)

0007h

Restringe la zona de movilidad horizontal del apuntador

AX = 0007h  
CX = Coordenada mínima horizontal (X).  
DX = Coordenada máxima horizontal (X).

 

Esta función nos permite, en combinación con la 08h, restringir la movilidad del cursor del ratón a una ventana; en particular, con esta función definimos una franja horizontal donde el usuario puede mover al ratón; al llegar a los límites, el cursor ya no avanza más.

0008h

Restringe la zona de movilidad vertical del apuntador

AX = 0008h  
CX = Coordenada mínima vertical (Y).  
DX = Coordenada máxima vertical (Y).

 

Esta función nos permite, en combinación con la 07h, restringir la movilidad del cursor del ratón a una ventana; en particular, con esta función definimos una franja vertical donde el usuario puede mover al ratón; al llegar a los límites, el cursor ya no avanza más.

#### Codificación del estado de los botones del ratón.

Los ratones normalmente cuentan con dos botones, si bien algunos soportan hasta tres; la mayor parte de las aplicaciones no le dan significado al tercero; en el caso de los ratones de dos botones, muchos drivers interpretan al caso de ambos botones presionados como el presionar el botón medio.

*   Bit 0 = 1 si está presionado el botón izquierdo  
    
*   Bit 1 = 1 si está presionado el botón derecho  
    
*   Bit 2 = 1 si está presionado el botón medio  
    
*   Bits 3-15 = No usados

### Errores comunes en el manejo del ratón

> _**El error más común, consiste en poner el número de servicio en AH, como estamos acostumbrados al usar otras interrupciones; pero, desafortunadamente, en esta interrupción HAY QUE PONERLO en AX.**_

![Línea de separación](../../images/waveline.gif)

Bibliografía
------------

1.  PC Interno, versión 2.0, de Michael Tischer. Ya lo tenemos en Biblioteca del Campus.
2.  Microsoft Mouse Reference, también está en Biblioteca.

![Línea de separación](../../images/waveline.gif) Página por Bruno Guardia R.

f [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 16-Sep-96_  
_Última actualización: Mi 12-Abr-1998_