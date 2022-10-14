Manejo de la Línea de Comandos de DOS

Tema #17
========

Manejo de la Línea de Comandos de DOS
=====================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase16.md)

[![Sesión](../../images/light.gif)  
Sesión 10](../Sesiones/sv10.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase18.md)

[Objetivos Específicos](#objetivo)
----------------------------------

[Teoría](#teoria)
-----------------

[Bibliografía](#biblio)
-----------------------

![Línea de separación](../../images/waveline.gif)

Objetivos Específicos
---------------------

*   Conocer las técnicas y herramientas necesarias para analizar la línea de comandos que recibe un programa al ejecutarse desde DOS.

![Línea de separación](../../images/waveline.gif)

Teoría
------

Cuando se ejecuta un programa desde DOS, la cadena que es escrita por el usuario se conoce como "línea de comandos". El intérprete de comandos (generalmente, el COMMAND.COM), se encarga de almacenar esta información en el PSP (_Program Segment Prefix_), de donde los programas pueden aprovecharla.

Específicamente, la línea de comandos se encuentra como una cadena "tipo Pascal" a partir del desplazamiento 80h dentro del segmento de PSP. Por tanto, la información está organizada como lo indica la figura:

Para la figura, se toma el ejemplo de la línea de comandos:

**C:\\>** PROGRAMA parametro

Desplazamiento

Contenido  
(Hexadecimal)

Significado

80h

0Bh

En decimal, 11; es decir, la cadena es de 11 caracteres.

81h

20h

Espacio después de la palabra PROGRAMA

82h

70h

p (ASCII)

83h-8Ah

61h 72h 61h ... 6Fh

arametro

8Bh

0Dh

En decimal, 13; es decir, el ASCII del Enter con el que termina la cadena.

Una vez que conocemos el formato básico de la línea de comandos, el problema se divide en dos:

1.  Obtener el segmento del PSP
2.  Usar el conocimiento sobre los desplazamientos, para construir funciones que exploran la línea de comandos; es decir, codificar un análisis de léxico y sintaxis.

Para obtener el segmento, existen dos formas principales:

*   [Usar el Servicio 62h de la Interrupción 21h](#PSP)
*   Cuando el programa inicia, DOS usa el segmento de datos para apuntar al PSP; por tanto, antes de inicializar el segmento de datos, podemos utilizar el valor que tiene al inicio del programa para accesar la línea de comandos.

* * *

INT 21h, Servicio 62h: Obtener Segmento PSP

### Parámetros:

AH = 62h

(Número del Servicio)

### Regresa:

BX

Valor del segmento del PSP; generalmente, se copia a ES antes de usarse.

![Línea de separación](../../images/waveline.gif)

Bibliografía
------------

1.  PC Interno, de Michael Tischer.
2.  [Ejemplo de programa que muestra cómo usar la línea de comandos](../programa/param2.asm)
3.  [Ejemplo de Comparar archivos, usa línea de comandos](../programa/compare.asm)

![Línea de separación](../../images/waveline.gif) Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 21-Oct-96_  
_última actualización: Mi 10-Abr-98_