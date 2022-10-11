 Organización de la Memoria en PC

Tema #6
=======

Organización de la Memoria en PC
================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase05.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase07.htm)

[Objetivos Específicos](#objetivo)
----------------------------------

[Teoría](#teoria)
-----------------

[Bibliografía](#biblio)
-----------------------

![](../../images/waveline.gif)

Objetivos Específicos
---------------------

*   Conocer la forma en que se organiza la memoria en una PC.

![Línea de separación](../../images/waveline.gif)

Teoría
------

Organización de PC

### Sistema Operativo

*   Abstracción que permite a los programadores de aplicaciones realizar operaciones con el hardware de la computadora sin importar cuál sea.
*   Proporciona rutinas de código que ahorran trabajo al programador
*   Ventaja: fácil programación, uso estándar de los recursos de la máquina
*   Desventaja: _overhead_, reduce la eficiencia (en algunos casos no es importante, en otros sí)

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

*   Se aloja en RAM, se carga de un medio magnético u ó al arrancar la máquina
*   MS-DOS: origen Microsoft, 1981
*   Principalmente da servicios de entrada/salida a diversos dispositivos
*   Todos los dispositivos se manejan como archivos, a este nivel

BIOS
----

*   Basic Input Output System
*   Se aloja en memoria ROM
*   Mayor diversidad de versiones que DOS
*   Cada dispositivo de hardware (disco duro, tarjeta de video) agrega funciones a BIOS
*   Manejo a más bajo nivel del hardware: servicios de video, acceso a sectores individuales del disco.

Organización de memoria RAM en PC
---------------------------------

### Partes

*   Mapeo de la ROM (BIOS nativa y de dispositivos)
*   Área de datos de DOS/BIOS
*   Área de acceso a dispositivos: memoria de video
*   Memoria de usuario

Mapa de la memoria
------------------

RAM

0

0000:0000 - 0000:FFFF

RAM Usuario

1

1000:0000 - 1000:FFFF

RAM Usuario

2

2000:0000 - 2000:FFFF

RAM Usuario

3

3000:0000 - 3000:FFFF

RAM Usuario

4

4000:0000 - 4000:FFFF

RAM Usuario

5

5000:0000 - 5000:FFFF

RAM Usuario

6

6000:0000 - 6000:FFFF

RAM Usuario

7

7000:0000 - 7000:FFFF

RAM Usuario

8

8000:0000 - 8000:FFFF

RAM Usuario

9

9000:0000 - 9000:FFFF

RAM Usuario

A

A000:0000 - A000:FFFF

RAM Video

B

B000:0000 - B000:FFFF

RAM Video

C

C000:0000 - C000:FFFF

BIOS extra

D

D000:0000 - D000:FFFF

Libre ROM

E

E000:0000 - E000:FFFF

Libre ROM

F

F000:0000 - F000:FFFF

ROM BIOS

![Línea de separación](../../images/waveline.gif)

Bibliografía
------------

Capítulo 3 del Libro de Texto

![Línea de separación](../../images/waveline.gif)

Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 26-Ago-96_  
_Última actualización: Do 9-Feb-97_