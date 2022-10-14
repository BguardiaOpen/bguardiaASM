 Interfaz entre C y Ensamblador

Tema #21
========

Interfaz entre C y Ensamblador
==============================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase20.md)

[![Sesión](../../images/light.gif)  
Sesión 13](../Sesiones/sv13.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase22.md)

[Objetivos Específicos](#objetivo)
----------------------------------

[Teoría](#teoria)
-----------------

[Bibliografía](#biblio)
-----------------------

![Línea de separación](../../images/waveline.gif)

Objetivos Específicos
---------------------

*   Conocer las técnicas y herramientas necesarias para ligar rutinas entre un lenguaje de alto nivel, y Ensamblador.
*   Reconocer las ventajas de los programas "híbridos" entre lenguajes, y saber cuando aplicar las técnicas en el desarrollo de sistemas.

![Línea de separación](../../images/waveline.gif)

Teoría
------

### Por qué combinar

#### Ventajas de combinar lenguajes

*   Realizar el trabajo fuerte en un lenguaje de alto nivel, lo que facilita la programación global.
*   Conseguir la máxima eficiencia en los módulos críticos, usando el lenguaje de más bajo nivel.
*   Al combinar lenguajes, se puede obtener una combinación óptima entre eficiencia y facilidad de programación, en cada sección del programa.

#### Requerimientos para combinar lenguajes

*   Se requiere tener un conocimiento profundo de ambos lenguajes y su interacción.
*   Se requiere un análisis apropiado para seleccionar óptimamente cuándo usar cuál de los lenguajes, de manera que se obtengan sus beneficios y no al contrario.

### Ligado de módulos múltiples

#### Herramientas

Cada módulo se compila o ensambla por separado, obteniendo el archivo objeto (.OBJ)

Se incluyen todos los módulos al construir el ejecutable, en el proceso de ligado.

Se requiere una estructura que defina la interfaz entre los distintos módulos

### Creación de un ejecutable con módulos múltiples

#### En ensamblador

`TASM uno`

`TASM dos`

`TLINK uno dos, resultado`

#### C con ensamblador

`TASM uno`

`TCC -c dos`

`TLINK uno dos,resultado`

Como se puede ver de los ejemplos que tenemos arriba, el proceso es similar; se crean varios objetos, ensamblando o compilando (con la bandera -c); y luego, el TLINK se encarga de ligar los módulos en un ejecutable.

Normalmente, el segundo caso se puede hacer en forma tal que el compilador de C llame al TLINK automáticamente (lo que es más conveniente, pues requeriremos menos parámetros que no mostró en el ejemplo de arriba):

`TASM uno`

`TCC -Eresultado.exe dos.c uno.obj`

### Requisitos para la unión

#### Características del .ASM

*   Usar un modelo de memoria compatible con el archivo .C; preferiblemente, el mismo
*   Iniciar el fuente con la directiva DOSSEG, que indica al ensamblador que ordene los segmentos en la forma estándar en lenguajes de alto nivel.
*   Definición "externa" o "pública" de las variables que se van a compartir
*   Directivas EXTERN, PUBLIC y GLOBAL
*   Manejo correcto de parámetros de funciones, por medio del uso de la pila acorde al "orden C" de parámetros, y al modelo de memoria

### Variables Compartidas

#### Características generales

*   Las variables definidas por un compilador de "C" internamente se preceden por un subguión (\_)
*   Las variables compartidas por distintos módulos deben ser definidas en "C" como globales, no estáticas (automáticas).
*   Se debe usar la opción apropiada en el ensamblador para que sea "sensitivo" a mayúsculas/minúsculas, como es el caso de "C" (/ml en TASM)

#### PUBLIC y EXTRN

Toda variable o función que está definida en el módulo actual, y deba ser usada por otro módulo, se declara como PUBLIC

Sintaxis:

`PUBLIC Simbolo`

Toda variable o función definida en otro módulo, que se vaya a usar en el actual,

se declara como EXTRN

Sintaxis:

`EXTRN Simbolo:Tipo`

#### Tipos válidos

Para su uso en EXTRN

1.  BYTE - Equivale a "char" de "C"
2.  WORD - Equivale a "int", "short" o "enum" de "C". También se usa para sustituir a los apuntadores cortos (near \*)
3.  DWORD - Equivale a "long" de "C". También se usa para "float", y para los apuntadores largos (far \*)
4.  QWORD - Equivale a 8 bytes, como "double" en "C".

#### Reglas para el manejo de parámetros de "C"

Como los parámetros se colocan en la pila, se hace "push" de sus valores, de derecha a izquierda; es decir, el último parámetro está más abajo en la pila.

El valor de retorno de una función se coloca en:

*   AL, si es de tamaño byte
*   AX, si es de tamaño word (o near \*)
*   DX:AX, si es double word (o far \*)

Vean los programas de ejemplo del Speaker para clarificar el uso de los parámetros.

![Línea de separación](../../images/waveline.gif)

Bibliografía
------------

1.  Manuales de Turbo Assembler, Turbo C, Borland C, Turbo Pascal.
2.  Waite's Group Turbo Assembler Programming Bible.
3.  Ejemplos de combinar C con Ensamblador
    *   Programa que usa el Speaker
        *   [SPEAKER.ASM: Librería para Manejo del Speaker](../programa/speaker.asm)
        *   [SPEAKER.H: Encabezados para usarla desde C](../programa/speaker.h)
        *   [PRUSPEAK.C: Programa para probar el uso desde C](../programa/pruspeak.c)
        *   [MAKEFILE para el conjunto](../programa/makespk)
    *   Programa que muestra gráficos en modo 13h
        *   [LIGA.ASM: Funciones en Ensamblador para gráficos en modo 13h](../programa/liga.asm)
        *   [LIGA.H: Encabezados para usarla desde C](../programa/liga.h)
        *   [LIGA-C.C: Programa para probar el uso desde C](../programa/liga-c.c)

![Línea de separación](../../images/waveline.gif) Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Ma 2-Jul-96_  
_Última actualización: Mi 12-Abr-1998_