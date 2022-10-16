 Organización de la Memoria en PC

Tema #6
=======

Organización de la Memoria en PC
================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase05.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase07.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![](../../images/waveline.gif)

## Objetivos Específicos

---------------------

* Conocer la forma en que se organiza la memoria en una PC.

![Línea de separación](../../images/waveline.gif)

## Teoría

------

Organización de PC

### Sistema Operativo

* Abstracción que permite a los programadores de aplicaciones realizar operaciones con el hardware de la computadora sin importar cuál sea.
* Proporciona rutinas de código que ahorran trabajo al programador
* Ventaja: fácil programación, uso estándar de los recursos de la máquina
* Desventaja: _overhead_, reduce la eficiencia (en algunos casos no es importante, en otros sí)

### Modelo de capas de la PC

#### Aplicaciones

El programador crea sistemas de aplicación específica, apoyándose en las tres capas inferiores.

#### DOS

Se usa por medio de la técnica de interrupciones (instrucción INT)

#### BIOS

Al igual que DOS, provee interrupciones.

#### Hardware

Se accesa a través de puertos (instrucciones IN/OUT)

DOS
---

### Disk Operating System = Sistema Operativo de Disco

* Se aloja en RAM, se carga de un medio magnético u ó al arrancar la máquina
* MS-DOS: origen Microsoft, 1981
* Principalmente da servicios de entrada/salida a diversos dispositivos
* Todos los dispositivos se manejan como archivos, a este nivel

BIOS
----

* Basic Input Output System
* Se aloja en memoria ROM
* Mayor diversidad de versiones que DOS
* Cada dispositivo de hardware (disco duro, tarjeta de video) agrega funciones a BIOS
* Manejo a más bajo nivel del hardware: servicios de video, acceso a sectores individuales del disco.

Organización de memoria RAM en PC
---------------------------------

### Partes

* Mapeo de la ROM (BIOS nativa y de dispositivos)
* Área de datos de DOS/BIOS
* Área de acceso a dispositivos: memoria de video
* Memoria de usuario

## Mapa de la memoria

<table border="1" cellpadding="2"><caption align="top">RAM</caption>

<tbody>

<tr>

<td>0</td>

<td>0000:0000 - 0000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>1</td>

<td>1000:0000 - 1000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>2</td>

<td>2000:0000 - 2000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>3</td>

<td>3000:0000 - 3000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>4</td>

<td>4000:0000 - 4000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>5</td>

<td>5000:0000 - 5000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>6</td>

<td>6000:0000 - 6000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>7</td>

<td>7000:0000 - 7000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>8</td>

<td>8000:0000 - 8000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>9</td>

<td>9000:0000 - 9000:FFFF</td>

<td>RAM Usuario</td>

</tr>

<tr>

<td>A</td>

<td>A000:0000 - A000:FFFF</td>

<td>RAM Video</td>

</tr>

<tr>

<td>B</td>

<td>B000:0000 - B000:FFFF</td>

<td>RAM Video</td>

</tr>

<tr>

<td>C</td>

<td>C000:0000 - C000:FFFF</td>

<td>BIOS extra</td>

</tr>

<tr>

<td>D</td>

<td>D000:0000 - D000:FFFF</td>

<td>Libre ROM</td>

</tr>

<tr>

<td>E</td>

<td>E000:0000 - E000:FFFF</td>

<td>Libre ROM</td>

</tr>

<tr>

<td>F</td>

<td>F000:0000 - F000:FFFF</td>

<td>ROM BIOS</td>

</tr>

</tbody>

</table>

![Línea de separación](../../images/waveline.gif)

## Bibliografía

------------

Capítulo 3 del Libro de Texto

![Línea de separación](../../images/waveline.gif)

## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 26-Ago-96_  
_Última actualización: Do 9-Feb-97_
