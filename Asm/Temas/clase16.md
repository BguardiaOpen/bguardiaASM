 Manejo de archivos

Tema #16
========

Manejo básico de Archivos usando DOS
====================================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase15.md)

[![Sesión](../../images/light.gif)  
Sesión 10](../Sesiones/sv10.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase17.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Conocer los servicios de DOS que nos permiten manejar archivos, bajo el esquema de los _handles_ o descriptores de archivos.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

### Conceptos Generales del manejo de archivos a bajo nivel, por DOS

*   La estructura del sistema de archivos es jerárquica
    *   Un directorio raíz
    *   Subdirectorios en directorio raíz y en subdirectorios
*   DOS tiene una tabla de archivos, donde mantiene la información global de cada uno.
*   La cantidad de archivos abiertos se establece con la línea FILES del CONFIG.SYS; de esta manera, al arrancar, el sistema reserva el espacio necesario para la tabla
*   Se llena una entrada de la tabla al abrir un archivo; y se libera al cerrarlo.
*   Todas las funciones sobre archivos se accesan usando el identificador dentro de la tabla de archivos de DOS.
*   Dos métodos: por _FCB_s y por "_handle_" entero
*   _FCB_: Estructuras de control de archivos, como las usadas en <stdio.h> (tipo FILE) en "C".
*   Descriptor o _Handle_: es de más bajo nivel; corresponde a "io.h", es decir, funciones como "open", "write", "read", etc.
*   El handle se obtiene al abrir el archivo.
*   Todas las cadenas usadas por estos servicios son ASCIIZ
    *   Estilo "C", cadenas de caracteres ASCII con un caracter 0 como delimitador, al final.

### PRINCIPALES SERVICIOS DE LA INTERRUPCIÓN 21h PARA EL MANEJO DE ARCHIVOS

*   [Manejo de directorios](#servicios-39h-3ah-3bh-manejo-de-directorios)
*   [Crear archivo](#servicio-3ch-crear-archivo)
*   [Abrir archivo](#servicio-3dh-abrir-archivo)
*   [Leer del archivo](#servicio-3fh-leer-del-archivo)
*   [Escribir en el archivo](#servicio-40h-escribir-en-el-archivo)
*   [Posicionarse en el archivo](#servicio-42h-posicionarse-en-el-archivo)
*   [Cerrar el archivo](#servicio-3eh-cerrar-el-archivo)
*   [Borrar un archivo](#servicio-41h-borrar-un-archivo)
*   [Códigos de error](#códigos-de-error)

* * *

## Servicios 39h, 3Ah, 3Bh: Manejo de directorios
----------------------------------------------

Servicio 39h: Crear subdirectorio (mkdir o md)

Servicio 3Ah: Eliminar subdirectorio (rmdir o rd)

Servicio 3Bh: Cambiar el directorio actual (chdir o cd)

Parámetros:

*   DS:DX = Apuntador al nombre (incluyendo trayectoria).

Regresa:

Cualquier error se indica activando CF, e indicando en AX el código del error. Si CF está apagada, no existió ningún error.

Ejemplo:

`.model small`

`.stack 100h`

`.data`

`NombreDirectorio DB 'C:\EJEMPLO' , 0`

`.code`

`... ; Código de inicialización, etc.`

`LEA DX, NombreDirectorio`

`MOV AH, 39h ; Servicio MD`

`INT 21h`

`MOV AH, 3Bh ; Cambia al directorio`

`INT 21h`

* * *

## Servicio 3Ch: Crear archivo
---------------------------

Equivale a `fopen` de C, con modo "w.."

Parámetros:

*   DS:DX = Apuntador al nombre del archivo ASCIIZ
*   CX= Atributo con que se debe crear (sólo lectura, escondido, de sistema, copia de respaldo).
    *   0 = Atributo normal.
    *   El atributo se codifica con bits.

Regresa:

Usa CF y AX para el manejo de errores;

*   En caso de éxito, CF=0 y en AX el descriptor o _handle_.
*   En caso de error, CF=1 y en AX el código de error.

* * *

## Servicio 3Dh: Abrir archivo
---------------------------

Equivale a `fopen` de C, con modo "r.."

Parámetros:

*   DS:DX = Apuntador al nombre del archivo ASCIIZ
*   AL = Modo de acceso
    *   0 = lectura ("rb"); 1 = escritura ("rb+" sin permitir leer); 2 = lectura/escritura ("rb+")

Regresa:

Usa CF y AX para el manejo de errores;

*   En caso de éxito, CF=0 y en AX el descriptor o _handle_.
*   En caso de error, CF=1 y en AX el código de error.

* * *

## Servicio 3Fh: Leer del archivo
------------------------------

Equivale a `fread` de C

Parámetros:

*   BX = descriptor del archivo, obtenido con los servicios 3Dh á 3Eh
*   DS:DX =Apuntador al buffer de datos
*   CX =Número de bytes a leer

Regresa:

Usa CF y AX para el manejo de errores;

*   En caso de éxito, CF=0 y en AX el número de bytes leídos. Si AX =0, significa que hemos llegado al fin del archivo.
*   En caso de error, CF=1 y en AX el código de error.

* * *

## Servicio 40h: Escribir en el archivo
------------------------------------

Equivale a `fwrite` de C

Parámetros:

*   BX = descriptor del archivo, obtenido con los servicios 3Dh á 3Eh
*   DS:DX =Apuntador al buffer de datos
*   CX =Número de bytes a escribir

Regresa:

Usa CF y AX para el manejo de errores;

*   En caso de éxito, CF=0 y en AX el número de bytes escritos
*   En caso de error, CF=1 y en AX el código de error.

* * *

## Servicio 42h: Posicionarse en el archivo
----------------------------------------

Equivale a `fseek` de C

Parámetros:

*   AL = "whence", origen para el desplazamiento
    *   0 = SEEK\_SET: a partir del inicio del archivo
    *   1 = SEEK\_CUR: a partir de la posición actual
    *   2 = SEEK\_END: a partir del final del archivo
*   CX:DX - Desplazamiento, en bytes. Es un número de 32 bits sin signo, cuya parte alta está en CX y la baja en DX.
*   BX = descriptor del archivo, obtenido con los servicios 3Dh á 3Eh

Regresa:

Usa CF y AX para el manejo de errores;

*   En caso de éxito, CF=0 y en DX:AX la nueva posición, respecto al inicio
*   En caso de error, CF=1 y en AX el código de error.

* * *

## Servicio 3Eh: Cerrar el archivo
-------------------------------

Equivale a `fclose` de C

Parámetros:

*   BX = descriptor del archivo, obtenido con los servicios 3Dh á 3Eh

Regresa:

Usa CF y AX para el manejo de errores;

*   En caso de éxito, CF=0
*   En caso de error, CF=1 y en AX el código de error.

* * *

## Servicio 41h: Borrar un archivo
-------------------------------

Equivale a `unlink` de C

El archivo no debe estar abierto.

Parámetros:

*   DS:DX = Apuntador al nombre del archivo ASCIIZ

Regresa:

Usa CF y AX para el manejo de errores;

*   En caso de éxito, CF=0
*   En caso de error, CF=1 y en AX el código de error.

* * *

## Códigos de error
----------------

0 = Sin error.

1 = Función inválida

2 = Archivo no encontrado.

3 = Trayectoria no encontrada.

4 = Tabla de archivos llena

5 = Acceso denegado

6 = Descriptor inválido

0Ch = Código de acceso inválido

0Fh = Unidad de disco inválida

10h = No se puede remover el directorio actual

11h = No se puede renombrar entre drives distintos

12h = No hay más archivos al buscar el siguiente.

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

1.  Todos los manuales de interrupciones
2.  Libro de Texto, capítulo 19; apéndices B y C.

![Línea de separación](../../images/waveline.gif)

Ejemplos
--------

*   [Type o Cat](../programa/mitype.asm) (mostrar un archivo en pantalla)
*   [Copy](../programa/micopy.asm) (crear un archivo destino y colocarle la información leída de un archivo fuente)
*   [Numera](../programa/numera.asm) (Lee un archivo de texto y lo despliega en la salida estándar, con las líneas numeradas)
*   [Comparador de archivos](../programa/compare.asm)

![Línea de separación](../../images/waveline.gif)

## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Do 30-Jun-96_  
_última actualización: Mi 10-Abr-98_