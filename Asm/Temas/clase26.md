 Programas residentes

Tema #26
========

Programas residentes
====================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase25.md)

[![Sesión](../../images/light.gif)  
Sesión 16](../Sesiones/sv16.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Sesiones/sv17.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#biblio)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Conocer las técnicas básicas para operar programas residentes en memoria.
*   Conocer el funcionamiento de este tipo de programas..

![Línea de separación](../../images/waveline.gif)

## Teoría
------

### Programas residentes

*   [Introducción](#introducción)
*   [Programas residentes/transientes](#programas-residentes-programas-transientes)
*   [Programación de TSRs](#programación-de-tsrs)
*   [Interceptar una interrupción](#interceptar-una-interrupción)
*   [Sustituir una interrupción](#sustituir-una-interrupción)
*   [Ejemplos](#ejemplos)

* * *

## Introducción
------------

Todo el semestre hemos usado interrupciones para hacer llamado a servicios de DOS y BIOS; hasta ahora, principalmente las hemos visto como formas de llamar al sistema operativo.

La razón por la que este sistema es llamado "interrupción" es precisamente porque funcionan interrumpiendo la ejecución del programa en un punto dado, ejecutan una labor determinada y regresan a donde estaban. Es como estar trabajando en la tarea, recibir una llamada telefónica, atenderla y al terminar lograr regresar exactamente al estado previo para continuar con la tarea

Existen dos tipos de interrupciones:

*   Interrupciones de hardware: son las más primitivas y origen del concepto. Están diseñadas para que el procesador pueda atender a los dispositivos aún a mitad de la ejecución de un programa que no está detectándolos.
*   Interrupciones de software: permiten al software emular las operaciones que se hacen al atender el hardware. También permiten contener una interfase universal a los servicios del sistema operativo, que son independientes de las versiones del sistema operativo.

Cuando un dispositivo requiere atención del CPU, le avisa por medio de una señal (electrónica) que llamamos "Interrupción". Esta señal físicamente llega a un pin del CPU; cuando esto ocurre, el CPU termina la instrucción que estaba ejecutando, salva en la pila la dirección actual (CS, IP) para poder continuar más adelante en el punto donde se quedó, y salta a ejecutar el código de atención de la interrupción, que generalmente es parte del sistema operativo. Dado que el código que atiende la interrupción puede encontrarse en distintos lugares de memoria, se requiere algún mecanismo para que el CPU encuentre eficientemente donde continuar la atención de la interrupción. Este mecanismo es conocido como "tabla de interrupciones", y se basa en reconocer por un código a cada interrupción, el cual será usado para la búsqueda en esta tabla. Esta tabla de interrupciones la encuentra el 80x86 al inicio de la memoria, en el primer 1 Kb. Está formada por un arreglo de 256 direcciones, cada una de 32 bits, pues contiene al segmento y al desplazamiento (en orden inverso, como es costumbre en Intel). De modo que si se recibe el código de interrupción 0, se consulta la información en la localidad 0:0, y de ahí se obtienen el segmento y el desplazamiento correspondientes. Si se recibe el código de interrupción 8, se consulta la información en la localidad 0:20h (20h = 32 = 8 por 4, dado que cada entrada en el arreglo tiene 4 bytes), y de ahí se ejecuta el código correspondiente. Al terminar el código de atención de la interrupción, ejecuta una instrucción IRET, que regresa el punto de ejecución a donde se había quedado,

Funcionan de un modo similar a las de hardware, solamente que en vez de que un dispositivo envíe la señal, lo hace el programa utilizando la instrucción INT. Esta instrucción causa que se ejecute todo el proceso anterior, pero señalada por un programa.

## Programas residentes / programas transientes
--------------------------------------------

La mayor parte de los programas con los que hemos trabajado son programas "transientes", es decir, se cargan en memoria, se ejecutan y al terminar su ejecución, regresan el control al sistema operativo y se eliminan de memoria.

Un programa residente (Terminate and Stay Resident, de ahí las siglas TSR comúnmente usadas) consiste en que un programa se carga en memoria, se ejecuta, prepara la ejecución de la segunda sección (por medio de un control fino sobre las interrupciones), y libera solamente la memoria del código de preparación. De este modo, una sección de su código queda "latente", en espera de ser disparado por un evento: generalmente, una interrupción.

Entre las aplicaciones de los programas residentes tenemos:

*   El sistema operativo DOS: queda en memoria esperando a que otro programa lo llame, para entonces ejecutar un determinado código.
*   Programas que esperen una combinación de teclas, para entonces realizar su acción. Por ejemplo, sacar un menú con acciones específicas.
*   Programas que sustituyan la funcionalidad del sistema operativo. Por ejemplo, las versiones 2 a 3 de Novell Netware se cargaban despúes de DOS, y le anexaban la capacidad de acceder a unidades de red.

## Programación de TSRs
--------------------

Para programar un TSR, utilizaremos una serie de servicios de interrupciones que nos facilitan la capacidad de dejar una sección del programa activa, así como cambiar la dirección a la que apunta una interrupción. Resumiendo, tendremos dos grandes secciones en un programa residente:

*   La sección transiente, que lleva a cabo la inicialización requerida y prepara los vectores de interrupción (las direcciones que están en la tabla), de modo que apunten a los procedimientos del programa residente que van a atenderlas.
*   La sección residente, la cual contiene los procedimientos de atención a las interrupciones. Terminar un programa y dejar una sección residente en memoria.

Cuando llamamos al servicio 4Ch de la INT 21h, toda la memoria que ocupó nuestro programa se marca como libre y el sistema operativo puede reutilizarla. Esto sería desastroso en el caso de un programa residente, pues el código que atiende interrupciones podría sobreescribirse, con resultados impredecibles. Por ello, se debe terminar el programa de modo que deje ocupada su memoria. Para ello, existen varias opciones:

*   La interrupción 27h, que termina el programa y deja residente en memoria la zona indicada por DS:DX, donde DS apunta al segmento donde se encuentra el código, y DX al desplazamiento final del código que debe respetarse. De este modo, no se liberará memoria indebidamente.
*   Servicios de la 21h, que no veremos en este curso.

## Interceptar una interrupción
----------------------------

Para que se ejecute un procedimiento que nosotros desarrollamos, en atención de una interrupción, es común usar la técnica de "interceptar", que consiste en guardar el vector anterior de interrupción, cambiarlo para que apunte a nuestro programa residente, y al final de nuestra rutina residente, llamar al vector anterior. Esto conserva la funcionalidad regular, y al mismo tiempo nos permite realizar actividades adicionales. Cabe aclarar algunas de las interrupciones importantes que no hemos comentado por no ser tan usadas en software:

*   INT 08h - es llamada por el reloj del sistema, 18.2 veces por segundo, y entre otras cosas lleva el tiempo de BIOS. Podemos interceptarla (no sustituirla) para que nuestro programa realice algún proceso periódicamente.
*   INT 09h - es llamada por el teclado, cada vez que se recibe una tecla.
*   INT 0Ch - de software, es llamada por la interrupción del reloj.

Obviamente hay muchas otras, sirvan estas como ejemplo.

Se pueden interceptar las interrupciones generadas por puertos seriales, paralelos, división entre 0, una instrucción inválida, etcétera.

## Sustituir una interrupción
--------------------------

En ocasiones queremos reemplazar completamente el funcionamiento de una interrupción; en tal caso, sustituiremos el vector de interrupción para que apunte a nuestro código, y deberemos terminar la ejecución de nuestro procedimiento con un IRET, que permitirá regresar al punto donde se ejecutó nuestra interrupción. Por otro lado, es conveniente asegurarnos de conservar el valor de los registros (generalmente utilizando la pila) que modifiquemos, de este modo la interrupción no afecta la ejecución de otros procesos. Acciones válidas dentro de una interrupción En una interrupción podemos utilizar otros servicios, principalmente de acceso directo al hardware. Sin embargo, como DOS es un sistema operativo que no fue diseñado para ser multitarea, diversas funciones no soportan la capacidad de ser reentrantes; esto es, no pueden ser llamadas otra vez si están a medio ejecutarse. Pero como una interrupción puede ocurrir en cualquier momento, puede incluso ocurrir cuando está una función a medio ejecutarse. Por tanto, esto causaría inestabilidad del sistema. Existen dos métodos para evitar esta inestabilidad:

*   No usar interrupciones, que es bastante común y apropiado pues también tiene grandes beneficios de desempeño; cuando un programa residente no requiere hacer funciones complejas que están implementadas en el sistema operativo, sino funciones simples tales como pintar en pantalla, pueden codificarse estas funciones con acceso directo al hardware y de este modo se evita el problema.
*   Revisar si está una función del sistema en ejecución, para no volver a llamarla a mitad de la ejecución. Esto en DOS se hace por medio de un método que durante mucho tiempo no estaba documentado: la bandera InDOS. Para obtenerla, se llama al servicio 34h de la interrupción 21h, y nos deja en ES:BX la dirección de un byte que es esta bandera InDOS. El funcionamiento de la bandera es sencillo: si está en 0, no estamos a media función de DOS, por lo tanto, podemos sin problemas ejecutar una función DOS. De lo contrario, si el valor es 1 o superior, no debemos ejecutar la función DOS en este momento y nuestro programa TSR deberá posponer el uso de esta función, por lo que probablemente deberemos manejar la interrupción del reloj para intentar despúes de un tiempo.

Existen algunas precauciones adicionales que tomar en TSRs, sin embargo, como no siempre son requeridas, se hace la referencia al PC Interno y otros libros de la bibliografía.

## **Ejemplos**
------------

1.  [Programa residente muy simple](../programa/reside.asm)
2.  [Programa de reloj residente](../programa/relojres.asm)

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

1.  PC Interno, versión 5.0, de Michael Tischer. Ya lo tenemos en Biblioteca del Campus.
2.  PC Programming Bible, Peter Norton
3.  Libro de texto

![Línea de separación](../../images/waveline.gif)

## Página por Bruno Guardia R.

f [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 16-Sep-96_  
_Última actualización: Mi 12-Abr-1998_