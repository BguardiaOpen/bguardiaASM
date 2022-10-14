 Representación y Tipos de Datos

Tema #4
=======

Representaci y Tipos de Datos
===============================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase03.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase05.md)

[Objetivos específicos](#objetivo)
----------------------------------

[Teoría](#teoria)
-----------------

[Bibliografía](#biblio)
-----------------------

![](../../images/waveline.gif)

Objetivos Específicos
---------------------

*   Explicar cómo se almacena la información de distintos tipos de datos, en memoria.
*   Calcular el espacio requerido para el almacenamiento

![](../../images/waveline.gif)

Teoría
------

Representación de Datos

cómo ve la información el CPU, en los distintos tipos de datos:

1.  [Números enteros sin signo](#Unsigned)
2.  [Números enteros con signo](#Signed)
3.  [Caracteres](#Char)
4.  [Punto flotante](#Float)
5.  [Estructuras](#Struct)
6.  [Arreglos](#Arrays)
7.  [Cadenas](#String)

### ![](../../images/waveline.gif)

### Números enteros sin signo

*   Tipos "unsigned" de C
*   Representan solamente la magnitud, en forma binaria.
    
    Permiten almacenar Números desde 0 hasta (2^n) - 1
    
    _n se refiere al número de bits usados para representar_
    
*   Números de 1 byte sin signo: 0 a 255: _unsigned char_
*   Números de 2 bytes sin signo: 0 a 65535: _unsigned short_
*   Números de 4 bytes sin signo: 0 a algo más de 4 mil millones: _unsigned long_

### ![](../../images/waveline.gif)

### Números enteros con signo

*   Los más usuales, "integer", "long".
*   Un bit (el más significativo) es usado para representar el signo.
*   Cuando es 0, el número es positivo
*   Cuando es 1, el número es negativo
*   Permiten almacenar Números desde -2^(n-1), hasta +(2^(n-1)) - 1
*   Bytes: -128 a +127, words: -32768 a 32767
*   Para propósitos de aprovechar el mismo circuito sumador/restador para Números con signo o sin signo, los Números negativos se almacenan usando el complemento a dos

#### Complemento a uno

*   Primer paso para el manejo de Números negativos
*   Consiste en complementar todos los bits de un número binario
*   Los dígitos 0 se convierten en dígitos 1, y los dígitos 1 se convierten en dígitos 0

##### Operaciones para obtenerlo

*   NOT - lógico
*   XOR del número contra una constante equivalente a tantos 1s binarios como bits tenga el número.

#### Complemento a dos

*   Para manejo de Números negativos
*   Se obtiene sumándole uno al complemento a uno
*   Tiene la propiedad de que si sumamos un número binario con su complemento a dos, nos da 0.
*   Por tanto, se puede interpretar como el inverso aditivo o simétrico

![](../../images/waveline.gif)

### Representación de caracteres

Es una abstracción de datos:

*   El CPU solamente sabe procesar Números
*   Otros datos deben representarse en términos numéricos

Código de caracter: define una tabla de correspondencias entre caracteres y Números asignados

*   EBCDIC: Antiguo, usado en Mainframes.
*   ASCII: es de 7 bits (0 a 127), en PC's se extiende a 256
*   Unicode

### ![](../../images/waveline.gif)

### Punto flotante

Es una representación de los Números reales, basada en la notación científica.

En decimal en la notación científica podemos escribir:

1.9 x 109 o en forma corta 1.9E9

En este caso, el signo es positivo; la mantisa es el número que multiplica, es decir, el 1.9; y el exponente (al que se eleva la base) es 9. En binario, simplemente se asignan los bits correspondientes para cada uno de estos elementos, pero se usa la base 2 en vez de la base 10.

Utiliza para su representación 32 bits (palabra doble), 64 (palabra cuádruple). El formato corto utiliza los 32 bits de la siguiente manera:

*   1 bit para signo,
*   8 bits para el exponente,
*   24 bits para la mantisa.

El rango de los Números a representar, en los positivos, es desde 2^-128 (1.175 x 10^-38) a 2^128 (3.40 x 10^38). Y equivalentemente, en los negativos.

En C, el formato de 32 bits es conocido como tipo _float_; el de 64 bits, como _double_.

![](../../images/waveline.gif)

### Estructuras

Una colección de datos cuya organización se caracteriza por las funciones de acceso que se usan para almacenar y acceder a elementos individuales de datos.

Hay tres formas distintas de examinar una estructura de datos:

*   Nivel Abstracto o lógico. En este nivel, se encuentra la organización y especificación de los procedimientos y funciones generales de acceso.
*   Nivel de Implementación. En este nivel, se examina las formas de representación de los datos en memoria y cómo implementar los procedimientos.
*   Nivel de Aplicación. Este nivel presenta con precisión las relaciones entre los datos y como son representados por las estructuras.

Así, para calcular el espacio que ocupa una estructura y ver su forma de almacenamiento, nos basta con concatenar en memoria las de sus elementos. Por ejemplo, la estructura:

_struct ejemplo {_

_int Datos1;_

_char Datos2;_

_};_

Requiere 3 bytes para su almacenamiento, encontrándose el entero a partir de la localidad 0 relativa al inicio de la estructura, y el caracter a partir de la localidad 2.

![](../../images/waveline.gif)

### Arreglos

El arreglo es un tipo de datos estructurado formado por una colección finita de elementos ordenados, todos del mismo tipo. El acceso se realiza mediante un índice que permite especificar cuál es el elemento deseado dando su posición en la colección.

Un byte es la unidad de memoria que se asigna para almacenar un valor. En el caso de un arreglo las sentencias de declaración le dicen al compilador cuántos bytes se necesitan para representar el arreglo. Entonces el nombre del arreglo se asocia con las caracteristicas del mismo, estas son:

*   El límite superior del rango.
*   El límite inferior del rango
*   La posición en memoria del primer byte del arreglo, llamada la dirección base.
*   El número de posiciones de memoria necesarias para cada elemento del arreglo.

La función de acceso utiliza esta información para determinar la posición del elemento deseado, usando una simple multiplicación y una suma:

_Posicion Elemento\[i\] = Dirección Base + (i - Limite Inferior) \* Tamaño Elemento_

![](../../images/waveline.gif)

### Cadenas

Una cadena es una secuencia de caracteres. Se utiliza para guardar textos. Dado que la longitud es dinámica, se usan algunos bits extras con información sobre la longitud máxima, la longitud real de la cadena o un indicador de fin de cadena.

Por ejemplo, Pascal almacena en el primer byte, el número de caracteres que contiene la cadena. Por ello, la longitud máxima que permite es de 256 caracteres.

C permite cadenas de longitud indefinida, pues codifica la información desde el primer byte, hasta encontrar un caracter nulo (código ASCII 0), que funciona como terminador de cadena.

![](../../images/waveline.gif)

Bibliografía
------------

*   Capítulo 2 del libro de texto.
*   Manuales de C y Pascal.
*   Estándares, por ejemplo el de la IEEE para representación de Números reales.

![](../../images/waveline.gif)

Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Vi 7-Jun-96_  
_Última actualización: Mi 14-Ago-96_