 Manejo de video por acceso directo a memoria

Tema #24
========

Manejo de video por acceso directo a memoria
============================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase23.md)

[![Sesión](../../images/light.gif)  
Sesión 15](../Sesiones/sv15.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase25.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Conocer la técnica de programación de gráficos a través del acceso directo a memoria de video.
*   Utilizar esta técnica para la programación eficiente de gráficas.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

Manejo de video por acceso directo a memoria
--------------------------------------------

* * *

Conceptos Generales

#### Organización de la memoria

En modo texto (1 y 3), la pantalla se representa en memoria a través de 2 bytes para cada caracter en la pantalla:

Byte de caracter: contiene el código ASCII

Byte de atributo: contiene el código del color de fondo y frente, además del parpadeo

En modo gráfico, un pixel se representa por los bits necesarios para representar su color.

En un modo monocromático, 1 bit = 1 pixel

En modo 16 colores (12h), 4 bits = 1 pixel

En modo 256 colores (13h), 8 bits = 1 byte = 1 pixel

* * *

Modo Texto (03h)

#### Organización en memoria

*   La zona de memoria donde se encuentra inicia a partir del segmento 0B800h
*   Ocupa 4000 bytes (80 caracteres por renglón x 25 renglones x 2 bytes por caracter)
*   Los bytes con desplazamientos "pares" (0, 2, 4, ...) representan los caracteres; y los nones los atributos.
*   Ejemplo: El caracter en la coordenada (10, 10) se encuentra en el desplazamiento:  
    (10 + 10 x 80) x 2 = 1620
*   Y su atributo se encuentra en el desplazamiento 1621
*   El modo 1h se organiza en forma similar; solamente hay que considerar que sólo son 40 columnas, lo que cambia la fórmula para calcular el desplazamiento.
*   Hay que considerar el manejo de las páginas. Todo lo anterior, aplica para la página 0; las páginas siguientes empiezan con un desplazamiento, de 0800h (2048 decimal) en el caso de modo 1h; y de 1000h (4096 decimal) en el caso de modo 3h; es decir, que en el caso del modo 80x25 se desperdician 96 bytes entre cada página; y 48 en el caso del modo 40x25.

* * *

Modo Gráfico (13h)

#### Organización en memoria

*   Inicia a partir del segmento 0A000h
*   Ocupa 64000 bytes (320 columnas x 200 renglones x 1 byte por pixel)
*   Simplemente, cada byte representa el color del pixel que corresponde.
*   El cálculo del desplazamiento se hace en forma similar:  
    Desplazamiento(x,y) = x + y \*320

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

*   PC Interno, Michael Tisher
*   Libros de programación del video VGA.

![Línea de separación](../../images/waveline.gif)

## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 16-Sep-96_  
_Última actualización: Do 16-Feb-97_