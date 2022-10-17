 Manejo básico de Video

Tema  #11
=========

Manejo básico de Video usando BIOS
==================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase10.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase12.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos

---------------------

* Conocer los servicios de BIOS que nos permiten manejar texto con control de cursor y colores, así como los modos gráficos y pintar pixels en ellos.

![Línea de separación](../../images/waveline.gif)

## Teoría

------

PRINCIPALES SERVICIOS DE LA INTERRUPCIÓN 10h

* [Ajuste del modo de video](#servicio-00h-ajustar-el-modo-de-video)
* [Limpiar pantalla](#servicio-06h-desplaza-una-ventana-hacia-arriba)
* [Ajuste de la página activa de video](#servicio-05h-cambia-la-página-activa-de-video)
* [Manejo de texto](#servicios-para-manejo-de-texto)
  * [Ajuste del cursor](#servicio-01h-ajustar-el-tipo-o-tamaño-del-cursor)
  * [Posicionamiento del cursor](#servicio-02h-posiciona-el-cursor-dentro-de-la-pantalla)
  * [Obtener la configuración del cursor](#servicio-03h-obtiene-la-configuración-del-cursor)
  * [Desplazar una ventana, hacia arriba](#servicio-06h-desplaza-una-ventana-hacia-arriba)
  * [Desplazar una ventana, hacia abajo](#servicio-06h-desplaza-una-ventana-hacia-arriba)
  * [Obtener un caracter de la pantalla](#servicio-08h-toma-un-caracter-y-su-atributo-de-la-posicion-actual-del-cursor-en-pantalla)
  * [Colocar un caracter en la pantalla](#servicio-09h-coloca-un-caracter-y-su-atributo-en-la-posicion-actual-del-cursor-en-pantalla)
* [Manejo de gráficos](#servicios-para-manejo-de-gráficos)
  * [Obtener un pixel de la pantalla](#servicio-0dh-toma-el-color-de-un-pixel-de-la-posicion-indicada-en-pantalla)
  * [Colocar un pixel en la pantall](#servicio-0ch-coloca-un-pixel-en-la-posición-indicada-en-pantalla)



## Servicio 00h: Ajustar el modo de video

--------------------------------------

Parámetros:

* AL = Modo de video deseado.

Regresa:

* Nada

Esta función cambia el modo en que opera la tarjeta controladora de video. En particular, permite conmutar los modos de texto y gráficos. Los principales modos que se pueden manejar son, entre otros:

* 01h = Texto, 40x25 caracteres, 16 colores, 8 páginas.
* 03h = Texto, 80x25 caracteres, 16 colores, 4 páginas.
* 0Dh = Gráfico EGA/VGA, 320x200 pixels, 16 colores, 8 páginas.
* 10h = Gráfico EGA/VGA, 640x350 pixels, 16 colores, 2 páginas.
* 12h = Gráfico VGA, 640x480 pixels, 16 colores, 1 página.
* 13h = Gráfico MCGA/VGA, 320x200 pixels, 256 colores, 4 páginas.

* * *

## Servicio 05h: Cambia la página activa de video

----------------------------------------------

Parámetros:

* AL = Número de [pagina](#página-de-video) deseada

Regresa:

* Nada

Esta función cambia la página activa. En un modo de páginas múltiples, se deja de proyectar la información de la zona actual de memoria, y a partir del próximo barrido el monitor representaró la información de la página indicada.

El rango de AL debe ir entre 0 y el número de páginas que soporte el modo actual de video, menos uno.

.

* * *

## Servicios para manejo de texto

------------------------------

* * *

## Servicio 01h: Ajustar el tipo o tamaño del cursor

-------------------------------------------------

Parámetros:

* CH = Línea superior de examinación del cursor
* CL = Línea inferior de examinación del cursor

Regresa:

* Nada

Esta función ajusta el tipo de cursor que yo deseo usar. Por ejemplo, un cursor completamente lleno (cursor de cuadro), se puede programar al llamar a este servicio con CH=0 y CL=7; un cursor normal se programa con CH=6, CL=7; un cursor de tamaño mínimo, hasta abajo, con CH=CL=7; un cursor que tiene una barra hasta abajo y una hasta arriba, con CH=7 y CL=0; e inclusive un cursor invisible.

* * *

## Servicio 02h: Posiciona el cursor dentro de la pantalla

-------------------------------------------------------

Parámetros:

* BH = Número de [página](#página-de-video) (recuerden, hay un cursor para cada página)
* DH = Renglón donde posicionarse (0-24, normalmente)
* DL = Columna donde posicionarse (0-39 o 0-79, normalmente)

Regresa:

* Nada

Esta función coloca el cursor en la posición especificada. Equivale a que hicieramos un gotoxy(DL, DH), en C o Pascal.

* * *

## Servicio 03h: Obtiene la configuración del cursor

-------------------------------------------------

Parámetros:

* BH = Número de página (recuerden, hay un cursor para cada página)

Regresa:

* CH = Línea superior de examinación del cursor
* CL = Línea inferior de examinación del cursor
* DH = Renglón donde se encuentra el cursor (0-24, normalmente)
* DL = Columna donde se encuentra el cursor (0-39 o 0-79, normalmente)

Esta función complementa las dos anteriores, permitiéndonos conocer que forma tiene el cursor, y donde esté posicionado.

* * *

## Servicio 06h: Desplaza una ventana hacia arriba

-----------------------------------------------

## Servicio 07h: Desplaza una ventana hacia abajo

**Ambos servicios permiten el borrado de pantalla.**

Parámetros:

* AL = Número de renglones que se desea desplazar. **Si AL=0, se limpia la ventana especificada.**
* BH = [Atributo](#Atributo) de color de línea en blanco
* CH = Renglón superior (coordenada Y de la esquina superior izquierda de la ventana que se desea desplazar)
* CL = Columna superior (coordenada X de la esquina superior izquierda de la ventana que se desea desplazar)
* DH = Renglón inferior (coordenada Y de la esquina inferior derecha de la ventana que se desea desplazar)
* DL = Columna inferior (coordenada X de la esquina inferior derecha de la ventana que se desea desplazar)

Regresa:

* Nada

Esta función nos permite mover la información de la pantalla hacia arriba o hacia abajo, según el servicio que se use, rellenando el espacio desplazado por renglones en blanco, con el atributo de color indicado en BH.

Un ejemplo de la aplicación de esto se encuentra en los procesadores de palabra, que mueven la información hacia arriba o hacia abajo cuando con el cursor nos desplazamos "fuera" de la página actual.

Como no tiene sentido desplazar 0 renglones, se ha reservado ese caso para definir la limpieza de la ventana; si AL=0, la región de la pantalla que se indica es rellenada con espacios, que toman el color indicado por el atributo.

Ambos servicios operan exclusivamente sobre la página activa de video.

* * *

## Servicio 08h: Toma un caracter y su atributo, de la posicion actual del cursor en pantalla

------------------------------------------------------------------------------------------

Parámetros:

* BH = Número de [página](#Pagina) (recuerden, hay un cursor para cada página)

Regresa:

* AH = [Atributo](#atributos-de-pantalla) de color del caracter bajo el cursor.
* AL = Código de pantalla del caracter bajo el cursor. (ASCII extendido)

Esta función consulta el código del caracter y su color, en la posición actual del cursor en la página especificada.

Nos permite averigúar el contenido de la pantalla, posiblemente antes de modificarla.

* * *

## Servicio 09h: Coloca un caracter y su atributo, en la posicion actual del cursor en pantalla

--------------------------------------------------------------------------------------------

Parámetros:

* BH = Número de [página](#página-de-video) (recuerden, hay un cursor para cada página)
* BL = [Atributo](#atributos-de-pantalla) de color para el caracter
* AL = Código de pantalla del caracter
* CX = Contador de repetición, que nos permite colocar el mismo caracter en varias localidades consecutivas de la pantalla, de izquierda a derecha y de arriba hacia abajo.

Regresa:

* Nada

Esta función pinta el caracter indicado, con el atributo indicado, en la posición actual del cursor en la página especificada de pantalla.

* * *

## Servicios para manejo de gráficos

---------------------------------

* * *

## Servicio 0Dh: Toma el color de un pixel, de la posicion indicada en pantalla

----------------------------------------------------------------------------

Parámetros:

* BH = Número de [página](#página-de-video)
* CX = Columna (coordenada X, en pixels) del punto a consultar
* DX = Renglón (coordenada Y, en pixels) del punto a consultar

Regresa:

* AL = Color del pixel en la posición indicada

Esta función consulta el color del pixel indicado, en modo gráfico.

Nos permite averigüar el contenido de la pantalla de gráficos, posiblemente antes de modificarla.

* * *

## Servicio 0Ch: Coloca un pixel en la posición indicada en pantalla

-----------------------------------------------------------------

Parámetros:

* BH = Número de [página](#página-de-video)
* CX = Columna (coordenada X, en pixels) del punto a consultar
* DX = Renglón (coordenada Y, en pixels) del punto a consultar
* AL = Color del pixel en la posición indicada

Regresa:

* Nada

Esta función pinta un pixel, con el color indicado en la posición indicada. Es la única primitiva de dibujo que nos da el BIOS, y sobre ella se pueden construir funciones para trazado de líneas, círculos, etcétera.

Equivale a funciones de librería de Pascal y C, como dot(CX, DX, AL)

* * *

## Glosario

--------

## Atributos de pantalla

* Atributo de pantalla: Es la combinación de colores que corresponde a un caracter. Se codifica en 8 bits:

  * 1 bit (el más significativo) para controlar el parpadeo.
  * 3 bits (del bit 6 al 4) para controlar el color de fondo.
    * Bit 6: Rojo
    * Bit 5: Verde
    * Bit 4: Azul
  * 4 bits (los menos significativo) para controlar el color del caracter.
    * Bit 3: Intenso
    * Bit 2: Rojo
    * Bit 1: Verde
    * Bit 0: Azul

    Por ejemplo, el atributo 1Fh (0 001 1111 en binario) indica un caracter de color blanco intenso, sobre fondo azul, que no parpadea.

    Otro ejemplo: el atributo 87h (1 000 0111 en binario) indica un caracter de color blanco mate o gris claro, sobre fondo negro, que parpadea.

    * * *

## Página de video

* Página de video: Para evitar el parpadeo en el video, los controladores modernos cuentan con la capacidad de manejar varias zonas de memoria que contienen la información necesaria para representar la pantalla. Sólo una de ellas es la que consulta el controlador, en el momento que el monitor le pide la información para presentarla en el barrido.

    De esta manera, se puede realizar un dibujo complejo en una página de video que no se esté visualizando, es decir que no sea la página activa; y una vez que se ha terminado de dibujar, en un instante se puede cambiar la página activa a la que acabamos de dibujar. Con ello, se garantiza una presentación coherente de "cuadros" al usuario: en un momento ve la pantalla 1, y en otro momento la pantalla 2, pero no ocurre el "flickering", que consiste en los casos en que hay un pequeño instante, en el cual el monitor refleja parte de la información de la pantalla 1 y parte de información de la pantalla 2.

![Línea de separación](../../images/waveline.gif)

## Bibliografía

------------

Capítulo15, libro de texto.

Manuales de interrupciones, por ejemplo el apéndice C del libro de texto.

![Línea de separación](../../images/waveline.gif)

## Página por Bruno Guardia R

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Vi 7-Jun-96_  
_última actualización: Do 16-Feb-97_
