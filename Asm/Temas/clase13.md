 Manejo básico del Teclado

Tema #13
========

Manejo básico del Teclado usando BIOS
=====================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase12.md)

[![Sesión](../../images/light.gif)  
Sesión 9](../Sesiones/sv09.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase14.md)

[Objetivos Específicos](#objetivo)
----------------------------------

[Teoría](#teoria)
-----------------

[Bibliografía](#biblio)
-----------------------

![Línea de separación](../../images/waveline.gif)

Objetivos Específicos
---------------------

*   Conocer los servicios de BIOS que nos permiten manejar el teclado, a más bajo nivel que DOS; especialmente, el manejo del teclado sin requerir de espera.

![Línea de separación](../../images/waveline.gif)

Teoría
------

Servicios de la Interrupción 16h
--------------------------------

*   [Leer un carácter](#LeerCaracter)
*   [Checar si se ha tecleado un carácter](#Keypressed)
*   [Obtener el Estado del Teclado](#ObtenerEstado)

* * *

Servicio 00h: Leer un carácter
------------------------------

Parámetros:

*   Ninguno

Regresa:

*   AL = Código ASCII de la tecla presionada
*   AH = Scan-Code de la tecla presionada

Esta función es similar al [servicio 1 de la interrupción 21h](clase11.htm#Entrada); solamente que en una sola llamada regresa los caracteres extendidos, sin requerir llamar dos veces. En este caso, el código ASCII en AL será 0, y el Scan-Code nos indica un valor que identifica la tecla especial.

Si se desea obtener un cáracter ASCII, no tiene caso revisar el Scan-Code.

Ya que el servicio de mapeo de teclados en otros idiomas (por ejemplo, español) no es parte de BIOS sino de DOS, hay que tener cuidado, ya que BIOS indicará los códigos del teclado sin tomar en cuenta que se tenga instalado otro tipo de teclado, es decir, como si se tuviera teclado en inglés.

* * *

Servicio 01h: Checar si hay un carácter disponible
--------------------------------------------------

Parámetros:

*   Ninguno

Regresa:

*   Bandera de Cero prendida, si no hay caracteres disponibles en el teclado; y continúa la ejecución.
*   Bandera de Cero apagada, si hay un carácter; en ese caso:
    *   AL = Código ASCII de la tecla presionada
    *   AH = Scan-Code de la tecla presionada

Esta función tiene un problema en su manejo: deja el carácter leído en la cola del teclado, por lo cual se requiere llamar después de ella al servicio 0 para poder seguir leyendo caracteres.

* * *

Servicio 02h: Obtener el estado del teclado
-------------------------------------------

Parámetros:

*   Ninguno

Regresa:

*   AL = Byte de estado del teclado.

Esta función indica si están presionadas las teclas de control, en forma de banderas, de acuerdo a la siguiente tabla:

Bit

Significado

7

Modo Insert

6

Bloqueo de mayúsculas (_Caps Lock_)

5

Bloqueo de números(_Num Lock_)

4

Bloqueo de desplazamiento (_Scroll Lock_)

3

Alt

2

Control

1

Shift Izquierdo

0

Shift Derecho

![Línea de separación](../../images/waveline.gif)

Bibliografía
------------

*   PC Interno, Michael Tischer
*   Manuales de Interrupciones, por ejemplo el apéndice C del libro de texto.

![Línea de separación](../../images/waveline.gif) Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Vi 7-Jun-96_  
_última actualización: Do 16-Feb-97_