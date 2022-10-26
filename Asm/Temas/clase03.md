
Bases de Microcomputadoras

Tema #3
=======

Bases de Microcomputadoras
==========================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase02.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase04.md)

[Objetivos específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![](../../images/waveline.gif)

### Objetivos Específicos

---------------------

* Conocer la terminología básica y el contexto requeridos para el estudio de la materia.
* Comprender cómo se visualiza al sistema computacional (computadora personal), desde el procesador.
* Comprender cómo funciona el procesador.
* Conocer el funcionamiento básico de los puertos
* Conocer los conceptos y diferencias de Lenguaje Ensamblador y Lenguaje de Máquina

![](../../images/waveline.gif)

### Teoría

------

#### Sistema Computacional: Componentes físicos

1. Unidad del sistema
2. Dispositivos de entrada
    * Teclado
    * Ratón
3. Dispositivos de salida
    * Monitor
    * Impresoras
4. Almacenamiento
    * Discos flexibles
    * Discos duros

#### Componentes básicos de Microcomputadoras

Dentro de la Unidad del Sistema

* CPU
* Memoria
* Puertos de Entrada/Salida

### Unidad Central de Proceso (CPU)

* Su función es ejecutar instrucciones (procesamiento)
* La representación de las instrucciones o acciones se conoce como "lenguaje máquina"
* Las instrucciones se almacenan en memoria, formando programas.

### Memoria

* Organizada en un arreglo unidimensional
* RAM: área de datos (variables y código)
* ROM: Software del sistema

### Puertos de Entrada/Salida

* Son la liga con el mundo exterior
* Actúan como interfase con los dispositivos
* Se accesan como localidades de memoria, sea de entrada (lectura) o salida (escritura)
* Dos tipos básicos: Seriales y Paralelos

### Ciclo de Fetch/Execute

Modelo del funcionamiento del procesador

_Fetch:_

* Traer la instrucción de memoria
* Decodificar la instrucción
* Traer los datos de memoria, si se requieren

_Execute:_

* Procesa los datos
* Almacena los resultados en memoria, si aplica

[Programa de Simulación del Procesador](../download/fetch.zip).

![](../../images/waveline.gif)Mecanismos de Entrada y Salida
------------------------------------------------------------

### Comunicación con el mundo exterior

### ¿Por qué se requieren?

* Permiten comunicar al CPU con el mundo exterior

### Funcionamiento de los puertos

Registros de entrada

Localidades de memoria, que al leerlas, reportan el estado del dispositivo.

Registros de salida

Localidades de memoria, que al ser escritas, funcionan como interruptores que controlan el dispositivo

### Concepto de mapeo

Memoria = puerto = dispositivo

Ejemplo de mapeo: Memoria de video

### ¿Qué es el lenguaje ensamblador?

### Lenguaje de máquina

Ejemplo: principio de una pianola

Explicación:

* El programa es un rollo, formado por "n" instrucciones
* Cada instrucción representa un estado del hardware (teclas presionadas o teclas sueltas)
* La secuencia dada por el distinto tiempo en que se van ejecutando las instrucciones, va formando la música.

### Lenguaje ensamblador

* Es la primera abstracción del lenguaje máquina
* Características de la abstracción
* El lenguaje se traduce en términos más humanos:
  * Símbolos
  * Mnemónicos
* Sin embargo, esos términos se refieren directamente a la máquina
* No es un lenguaje de alto nivel

![](../../images/waveline.gif)

### Bibliografía

------------

Capítulo 1 del libro de texto.

![](../../images/waveline.gif)

### Página por Bruno Guardia R

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Vi 7-Jun-96_  
_Última actualización: Vi 7-Jun-96_
