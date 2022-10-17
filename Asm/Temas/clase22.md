 Modelos de Memoria

Tema #22
========

Modelos de Memoria
==================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase21.md)

[![Sesión](../../images/light.gif)  
Sesión 13](../Sesiones/sv13.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase23.md)

[Objetivos Específicos](#objetivo)
----------------------------------

[Teoría](#teoria)
-----------------

[Bibliografía](#biblio)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Comprender el concepto de Modelos de Memoria, y como nace de la arquitectura segmentada del manejo de la memoria en los procesadores 80x86.
*   Entender las diferencias en la generación tanto del código como de los datos, entre los distintos modelos de memoria.
*   Unir los conceptos de modelos de memoria con los de interfase de Ensamblador con otros lenguajes, para comprender cómo varía la interfase de acuerdo al modelo de memoria usado por el compilador.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

Modelos de memoria

Por modelos de memoria nos referimos al concepto de definir apuntadores "cortos" y/o "largos", según sea necesario para la aplicación.

Este concepto nace de la arquitectura segmentada de los procesadores Intel de la familia del 8086. Debido a esta arquitectura, se pueden accesar bloques de memoria hasta de 64 Kb. solamente (segmentos). Cuando el "software" se desarrolla y empieza a requerir más memoria, empiezan a construirse programas de segmentos múltiples. Para soportar estos programas, sin perder eficiencia en aquellos que no lo requieran, se desarrolla la idea de usar apuntadores dentro del mismo segmento, que contienen solamente el offset (16 bits), y a los que se llama apuntadores cortos ("near"). Y distinguir de ellos los apuntadores que se requieran para los nuevos programas, que contengan tanto segmento como desplazamiento (32 bits), a los que se llama apuntadores largos ("far").

Veremos como maneja un compilador de "C" este concepto, dando a las variables el espacio necesario. Para ello, se presenta un ejemplo de un programa mínimo en "C", y porciones seleccionadas del código que genera en los distintos modelos de memoria. Por cuestiones de espacio, se muestran solamente los más representativos.

*   [Modelo Corto](#modelo-corto)

*   [Modelo Compacto](#modelo-compacto)

*   [Modelo Largo](#modelo-largo)

* * *

## `/* Modelo corto */`

`/* Programa de prueba, en "C" */`

`char *Temporal;`


`char Arreglo[64000];`

`funcion()`

`{`

`char *Temporal2;`

`Temporal2 = Temporal;`

`while(*(--Temporal2));`

`}`

`main()`

`{`

`Temporal = Arreglo;`

`while(*Temporal) Temporal++;`

`funcion();`

`}`

`/* Codigo generado, en ensamblador: */`

`/* Modelo Small */`

`_TEXT segment byte public 'CODE'`

`;`

`; funcion()`

`;`

`assume cs:_TEXT,ds:DGROUP`

`_funcion proc near`

`push bp`

`mov bp,sp`

`;`

`; {`

`; char *Temporal2;`

`; Temporal2 = Temporal;`

`;`

`mov dx,word ptr DGROUP:_Temporal`

`jmp short @1@58`

`@1@58:`

`;`

`; while(*(--Temporal2));`

`;`

`dec dx`

`mov bx,dx`

`cmp byte ptr [bx],0`

`jne short @1@58`

`;`

`; }`

`;`

`pop bp`

`ret`

`_funcion endp`

`;`

`; main()`

`;`

`assume cs:_TEXT,ds:DGROUP`

`_main proc near`

`push bp`

`mov bp,sp`

`;`

`; {`

`; Temporal = Arreglo;`

`;`

`mov word ptr DGROUP:_Temporal,offset DGROUP:_Arreglo`

`jmp short @2@86`

`@2@58:`

`;`

`; while(*Temporal) Temporal++;`

`;`

`inc word ptr DGROUP:_Temporal`

`@2@86:`

`mov bx,word ptr DGROUP:_Temporal`

`cmp byte ptr [bx],0`

`jne short @2@58`

`;`

`; funcion();`

`;`

`call near ptr _funcion`

`;`

`; }`

`;`

`pop bp`

`ret`

`_main endp`

`_TEXT ends`

`_BSS segment word public 'BSS'`

`_Temporal label word`

`db 2 dup (?)`

`_Arreglo label byte`

`db 64000 dup (?)`

`_BSS ends`

`public _Temporal`

`public _Arreglo`

`public _funcion`

`public _main`

`end`

Comentario:

En este caso vemos que el apuntador Temporal es solamente de 2 bytes, es decir, es un apuntador corto. Por ello, solamente se almacena en el mismo el OFFSET, como se puede ver en la inicialización. Esto requiere menos código para incrementar el apuntador, tanto como para accesar su contenido. Nótese también que ambos procedimientos son "near".

También vemos algunas características generales de "C": todos los símbolos se anteceden con un subguión, y son públicos por defecto, si son globales.

* * *

## `/* Modelo compacto */`

`DGROUP group _DATA,_BSS`

`assume cs:_TEXT,ds:DGROUP`

`_TEXT segment byte public 'CODE'`

`;`

`; funcion()`

`;`

`assume cs:_TEXT,ds:DGROUP`

`_funcion proc near`

`push bp`

`mov bp,sp`

`sub sp,4`

`;`

`; {`

`; char *Temporal2;`

`; Temporal2 = Temporal;`

`;`

`mov dx,word ptr DGROUP:_Temporal+2`

`mov ax,word ptr DGROUP:_Temporal`

`mov word ptr [bp-2],dx`

`mov word ptr [bp-4],ax`

`jmp short @1@58`

`@1@58:`

`;`

`; while(*(--Temporal2));`

`;`

`dec word ptr [bp-4]`

`les bx,dword ptr [bp-4]`

`cmp byte ptr es:[bx],0`

`jne short @1@58`

`;`

`; }`

`;`

`mov sp,bp`

`pop bp`

`ret`

`_funcion endp`

`;`

`; main()`

`;`

`assume cs:_TEXT,ds:DGROUP`

`_main proc near`

`push bp`

`mov bp,sp`

`;`

`; {`

`; Temporal = Arreglo;`

`;`

`mov word ptr DGROUP:_Temporal+2,ds`

`mov word ptr DGROUP:_Temporal,offset DGROUP:_Arreglo`

`jmp short @2@86`

`@2@58:`

`;`

`; while(*Temporal) Temporal++;`

`;`

`inc word ptr DGROUP:_Temporal`

`@2@86:`

`les bx,dword ptr DGROUP:_Temporal`

`cmp byte ptr es:[bx],0`

`jne short @2@58`

`;`

`; funcion();`

`;`

`call near ptr _funcion`

`;`

`; }`

`;`

`pop bp`

`ret`

`_main endp`

`_TEXT ends`

`_BSS segment word public 'BSS'`

`_Temporal label dword`

`db 4 dup (?)`

`_Arreglo label byte`

`db 64000 dup (?)`

`_BSS ends`

`public _Temporal`

`public _Arreglo`

`public _funcion`

`public _main`

`end`

Comentario:

En este caso, podemos ver que el código sigue siendo "near", pero los datos ahora son "far". Esto se ve en la definición de Temporal, que ahora se almacena en 4 bytes, tanto como en su inicialización y su manejo, que ahora requiere dos instrucciones donde antes bastaba una.

* * *

## `/* Modelo Largo */`

`PRUEBA_TEXT segment byte public 'CODE'`

`;`

`; funcion()`

`;`

`assume cs:PRUEBA_TEXT,ds:DGROUP`

`_funcion proc far`

`push bp`

`mov bp,sp`

`sub sp,4`

`; Temporal2 = Temporal;`

`;`

`mov dx,word ptr DGROUP:_Temporal+2`

`mov ax,word ptr DGROUP:_Temporal`

`mov word ptr [bp-2],dx`

`mov word ptr [bp-4],ax`

`jmp short @1@58`

`@1@58:`

`;`

`; while(*(--Temporal2));`

`;`

`dec word ptr [bp-4]`

`les bx,dword ptr [bp-4]`

`cmp byte ptr es:[bx],0`

`jne short @1@58`

`;`

`; }`

`;`

`mov sp,bp`

`pop bp`

`ret`

`_funcion endp`

`;`

`; main()`

`;`

`assume cs:PRUEBA_TEXT,ds:DGROUP`

`_main proc far`

`push bp`

`mov bp,sp`

`;`

`; {`

`; Temporal = Arreglo;`

`;`

`mov word ptr DGROUP:_Temporal+2,ds`

`mov word ptr DGROUP:_Temporal,offset DGROUP:_Arreglo`

`jmp short @2@86`

`@2@58:`

`; while(*Temporal) Temporal++;`

`inc word ptr DGROUP:_Temporal`

`@2@86:`

`les bx,dword ptr DGROUP:_Temporal`

`cmp byte ptr es:[bx],0`

`jne short @2@58`

`; funcion();`

`push cs`

`call near ptr _funcion`

`;`

`; }`

`;`

`pop bp`

`ret`

`_main endp`

`PRUEBA_TEXT ends`

`_BSS segment word public 'BSS'`

`_Temporal label dword`

`db 4 dup (?)`

`_Arreglo label byte`

`db 64000 dup (?)`

`_BSS ends`

`public _Temporal`

`public _Arreglo`

`public _funcion`

`public _main`

`end`

Comentario:

En este último caso, vemos que ahora también el código es largo, por lo que todas las definiciones son "far". Sin embargo, la llamada es "near", en este caso, por la optimización del compilador, pues resulta que es más rápido y más óptimo hacer el PUSH del CS, seguido de la llamada, que el CALL FAR. Esto solamente se puede realizar gracias a que ambos procedimientos están con seguridad en el mismo segmento. Sin embargo, no podemos dejar de hacer "far" el procedimiento "funcion", pues puede ser llamado desde otro módulo, con otro segmento, y por tanto se requerirá el RETF (Retorno largo). Podemos mencionar también que se asume que cada módulo o archivo fuente va a corresponder a un segmento de código y uno de datos. De esta manera, se podrán tener más de 64Kb. de datos y/o código, pero divididos en módulos de 64Kb. o menos.

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

1.  Manuales de Turbo Assembler, Turbo C, Borland C.
2.  La serie de libros de referencia de Herbert Schildt: "Manual de Referencia de Turbo C" en sus distintas versiones.

![Línea de separación](../../images/waveline.gif) 

## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Ma 2-Jul-96_  
_Última actualización: Mi 12-Abr-1998_