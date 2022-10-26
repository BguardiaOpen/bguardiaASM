 Introducción a Lenguaje Ensamblador

![Lenguaje Ensamblador](../../images/ASM/asm.jpg)
=================================================

Introducción a Lenguaje Ensamblador
===================================

Tema #2
=======

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase01.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase03.md)

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

[Resumen](#resumen)
-------------------

![](../../images/waveline.gif)

Objetivos Específicos
---------------------

* Entender los conceptos de:
  * Lenguaje de máquina
  * Lenguaje ensamblador
  * Lenguajes de alto, medio y bajo nivel
* Conocer la historia y [evolución](#evolución-de-los-lenguajes-computacionales) de los lenguajes computacionales
* Reconocer la importancia, [ventajas](#ventajas-y-desventajas-del-lenguaje-ensamblador) y desventajas del uso del Lenguaje Ensamblador

![](../../images/waveline.gif)

### Teoría

------

### Conceptos básicos

Al desarrollarse las primeras computadoras electrónicas, se vio la necesidad de programarlas, es decir, de almacenar en memoria la información sobre la tarea que iban a ejecutar. Las primeras se usaban como calculadoras simples; se les indicaban los pasos de cálculo, uno por uno.

John Von Neumann desarrolló el modelo que lleva su nombre, para describir este concepto de "programa almacenado". En este modelo, se tiene una abstracción de la memoria como un conjunto de celdas, que almacenan simplemente números. Estos números pueden representar dos cosas: los datos, sobre los que va a trabajar el programa; o bien, el programa en sí.

¿Cómo es que describimos un programa como números? Se tenía el problema de representar las acciones que iba a realizar la computadora, y que la memoria, al estar compuesta por switches correspondientes al concepto de bit, solamente nos permitía almacenar números binarios.

La solución que se tomó fue la siguiente: A cada acción que sea capaz de realizar nuestra computadora, asociarle un número, que será su _código de operación (opcode)_ . Por ejemplo, una calculadora programable simple podría asignar los _opcodes_ :  
1 = SUMA, 2 = RESTA, 3 = MULTIPLICA, 4 = DIVIDE.

Supongamos que queremos realizar la operación 5 \* 3 + 2, en la calculadora descrita arriba. En memoria, podríamos "escribir" el programa de la siguiente forma:



<table border="1">

<tbody>

<tr>

<th>Localidad</th>

<th>Opcode</th>

<th>Significado</th>

<th>Comentario</th>

</tr>

<tr>

<td>0</td>

<td>5</td>

<td>5</td>

<td>En esta localidad, tenemos el primer número de la fórmula</td>

</tr>

<tr>

<td>1</td>

<td>3</td>

<td>*</td>

<td>En esta localidad, tenemos el _opcode_ que representa la multiplicación.</td>

</tr>

<tr>

<td>2</td>

<td>3</td>

<td>3</td>

<td>En esta localidad, tenemos el segundo número de la fórmula</td>

</tr>

<tr>

<td>3</td>

<td>1</td>

<td>+</td>

<td>En esta localidad, tenemos el _opcode_ que representa la suma.</td>

</tr>

<tr>

<td>4</td>

<td>2</td>

<td>2</td>

<td>En esta localidad, tenemos el último número de la fórmula</td>

</tr>

</tbody>

</table>

Podemos ver que con esta representación, es simple expresar las operaciones de las que es capaz el hardware (en este caso, nuestra calculadora imaginaria), en la memoria.

La descripción y uso de los _opcodes_ es lo que llamamos _lenguaje de máquina_ . Es decir, la lista de códigos que la máquina va a interpretar como instrucciones, describe las capacidades de programación que tenemos de ella; es el lenguaje más primitivo, depende directamente del hardware, y requiere del programador que conozca el funcionamiento de la máquina al más bajo nivel.

Cuando abstraemos los _opcodes_ y los sustituimos por una palabra que sea una clave de su significado, a la cual comúnmente se le conoce como _mnemónico_ , tenemos el concepto de _Lenguaje Ensamblador_ . Así, podemos definir simplemente al Lenguaje Ensamblador de la siguiente forma:  

_Lenguaje Ensamblador_ es la primera abstracción del _Lenguaje de Máquina_ , consistente en asociar a los _opcodes_ palabras clave que faciliten su uso por parte del programador

Como se puede ver, el Lenguaje Ensamblador es directamente traducible al Lenguaje de Máquina, y viceversa; simplemente, es una abstracción que facilita su uso para los seres humanos. Por otro lado, la computadora no entiende directamente al Lenguaje Ensamblador; es necesario traducirle a Lenguaje de Máquina. Originalmente, este proceso se hacía a mano, usando para ello hojas donde se escribían tablas de programa similares al ejemplo de la calculadora que vimos arriba . Pero, al ser tan directa la traducción, pronto aparecieron los programas Ensambladores, que son traductores que convierten el código fuente (en Lenguaje Ensamblador) a código objeto (es decir, a Lenguaje de Máquina).

Una característica que hay que resaltar, es que al depender estos lenguajes del hardware, hay un distinto Lenguaje de Máquina (y, por consiguiente, un distinto Lenguaje Ensamblador) para cada CPU. Por ejemplo, podemos mencionar tres lenguajes completamente diferentes, que sin embargo vienen de la aplicación de los conceptos anteriores:

1. Lenguaje Ensamblador de la familia Intel 80x86
2. Lenguaje Ensamblador de la familia Motorola 68000
3. Lenguaje Ensamblador del procesador POWER, usado en las IBM RS/6000.

Tenemos 3 fabricantes distintos, compitiendo entre sí y cada uno aplicando conceptos distintos en la manufactura de sus procesadores, su arquitectura y programación; todos estos aspectos, influyen en que el lenguaje de máquina y ensamblador cambie bastante.

Para este curso, trabajaremos con el Lenguaje Ensamblador de la familia Intel 80x86, que es el más difundido junto con las computadoras personales compatibles con IBM; pero es importante que se desarrollen las estructuras de programación y la comprensión de los conceptos, suficientes para poder usar otros ensambladores, teniendo una lista de mnemónicos y su uso.

### Evolución de los lenguajes computacionales

Como se pudo ver en la sección anterior, los lenguajes más primitivos fueron los lenguajes de máquina. Esto, ya que el hardware se desarrolló antes del software, y además cualquier software finalmente tiene que expresarse en el lenguaje que maneja el hardware.

La programación en esos momentos era sumamente tediosa, pues el programador tenía que "bajarse" al nivel de la máquina y decirle, paso a pasito, cada punto de la tarea que tenía que realizar. Además, debía expresarlo en forma numérica; y por supuesto, este proceso era propenso a errores, con lo que la productividad del programador era muy limitada. Sin embargo, hay que recordar que en estos momentos, simplemente aún no existía alternativa.

El primer gran avance que se dio, como ya se comentó, fue la abstracción dada por el Lenguaje Ensamblador, y con él, el nacimiento de las primeras herramientas automáticas para generar el código máquina. Esto redujo los errores triviales, como podía ser el número que correspondía a una operación, que son sumamente engorrosos y difíciles de detectar, pero fáciles de cometer. Sin embargo, aún aquí es fácil para el programador perderse y cometer errores de lógica, pues debe bajar al nivel de la forma en que trabaja el CPU, y entender bien todo lo que sucede dentro de él.

Con el desarrollo en los 50s y 60s de algoritmos de más elevado nivel, y el aumento de poder del hardware, empezaron a entrar al uso de computadoras científicos de otras ramas; ellos conocían mucho de Física, Química y otras ramas similares, pero no de Computación, y por supuesto, les era sumamente complicado trabajar con lenguaje Ensamblador en vez de fórmulas. Así, nació el concepto de Lenguaje de Alto Nivel, con el primer compilador de FORTRAN (_FORmula TRANslation_), que, como su nombre indica, inició como un "simple" esfuerzo de traducir un lenguaje de fórmulas, al lenguaje ensamblador y por consiguiente al lenguaje de máquina. A partir de FORTRAN, se han desarrollado innumerables lenguajes, que siguen el mismo concepto: buscar la mayor abstracción posible, y facilitar la vida al programador, aumentando la productividad, encargándose los compiladores o intérpretes de traducir el lenguaje de alto nivel, al lenguaje de computadora.

Hay que notar la existencia de lenguajes que combinan características de los de alto nivel y los de bajo nivel (es decir, Ensamblador). Mi ejemplo favorito es C: contiene estructuras de programación de alto nivel, y la facilidad de usar librerías que también son características de alto nivel; sin embargo, fue diseñado con muy pocas instrucciones, las cuales son sumamente sencillas, fáciles de traducir al lenguaje de la máquina; y requiere de un entendimiento apropiado de cómo funciona la máquina, el uso de la memoria, etcétera. Por ello, muchas personas consideramos a lenguajes como C (que fue diseñado para hacer sistemas operativos), lenguajes de nivel medio.

### Ventajas y desventajas del Lenguaje Ensamblador

Una vez que hemos visto la evolución de los lenguajes, cabe preguntarse: ¿En estos tiempos "modernos", para qué quiero el Lenguaje Ensamblador?

El proceso de evolución trajo consigo algunas desventajas, que ahora veremos como las ventajas de usar el Lenguaje Ensamblador, respecto a un lenguaje de alto nivel:

1. [Velocidad](#velocidad)
2. [Eficiencia de tamaño](#tamaño)
3. [Flexibilidad](#flexibilidad)

Por otro lado, al ser un lenguaje más primitivo, el Ensamblador tiene ciertas desventajas respecto a los lenguajes de alto nivel:

1. [Tiempo de programación](#tiempo-de-programación)
2. [Programas fuente grandes](#programas-fuente-grandes)
3. [Peligro de afectar recursos inesperadamente](#peligro-de-afectar-recursos-inesperadamente)
4. [Falta de portabilidad](#falta-de-portabilidad)

#### Velocidad

El proceso de traducción que realizan los intérpretes, implica un proceso de cómputo adicional al que el programador quiere realizar. Por ello, nos encontraremos con que un intérprete es siempre más lento que realizar la misma acción en Lenguaje Ensamblador, simplemente porque tiene el costo adicional de estar traduciendo el programa, cada vez que lo ejecutamos.

De ahí nacieron los compiladores, que son mucho más rápidos que los intérpretes, pues hacen la traducción una vez y dejan el código objeto, que ya es Lenguaje de Máquina, y se puede ejecutar muy rápidamente. Aunque el proceso de traducción es más complejo y costoso que el de ensamblar un programa, normalmente podemos despreciarlo, contra las ventajas de codificar el programa más rápidamente.

Sin embargo, la mayor parte de las veces, el código generado por un compilador es menos eficiente que el código equivalente que un programador escribiría. La razón es que el compilador no tiene tanta inteligencia, y requiere ser capaz de crear código genérico, que sirva tanto para un programa como para otro; en cambio, un programador humano puede aprovechar las características específicas del problema, reduciendo la generalidad pero al mismo tiempo, no desperdicia ninguna instrucción, no hace ningún proceso que no sea necesario.

Para darnos una idea, en una PC, y suponiendo que todos son buenos programadores, un programa para ordenar una lista tardará cerca de 20 veces más en Visual Basic (un intérprete), y 2 veces más en C (un compilador), que el equivalente en Ensamblador.

Por ello, cuando es crítica la velocidad del programa, Ensamblador se vuelve un candidato lógico como lenguaje.

Ahora bien, esto no es un absoluto; un programa bien hecho en C puede ser muchas veces más rápido que un programa mal hecho en Ensamblador; sigue siendo sumamente importante la elección apropiada de algoritmos y estructuras de datos. Por ello, se recomienda buscar optimizar primero estos aspectos, en el lenguaje que se desee, y solamente usar Ensamblador cuando se requiere más optimización y no se puede lograr por estos medios.

#### Tamaño

Por las mismas razones que vimos en el aspecto de velocidad, los compiladores e intérpretes generan más código máquina del necesario; por ello, el programa ejecutable crece. Así, cuando es importante reducir el tamaño del ejecutable, mejorando el uso de la memoria y teniendo también beneficios en velocidad, puede convenir usar el lenguaje Ensamblador. Entre los programas que es crítico el uso mínimo de memoria, tenemos a los virus y manejadores de dispositivos (drivers). Muchos de ellos, por supuesto, están escritos en lenguaje Ensamblador.

#### Flexibilidad

Las razones anteriores son cuestión de grado: podemos hacer las cosas en otro lenguaje, pero queremos hacerlas más eficientemente. Pero todos los lenguajes de alto nivel tienen limitantes en el control; al hacer abstracciones, limitan su propia capacidad. Es decir, existen tareas que la máquina puede hacer, pero que un lenguaje de alto nivel no permite. Por ejemplo, en Visual Basic no es posible cambiar la resolución del monitor a medio programa; es una limitante, impuesta por la abstracción del GUI Windows. En cambio, en ensamblador es sumamente sencillo, pues tenemos el acceso directo al hardware del monitor.

Resumiendo, la flexibilidad consiste en reconocer el hecho de que

Todo lo que puede hacerse con una máquina, puede hacerse en el lenguaje ensamblador de esta máquina; los lenguajes de alto nivel tienen en una u otra forma limitantes para explotar al máximo los recursos de la máquina.

#### Tiempo de programación

Al ser de bajo nivel, el Lenguaje Ensamblador requiere más instrucciones para realizar el mismo proceso, en comparación con un lenguaje de alto nivel. Por otro lado, requiere de más cuidado por parte del programador, pues es propenso a que los errores de lógica se reflejen más fuertemente en la ejecución.

Por todo esto, es más lento el desarrollo de programas comparables en Lenguaje Ensamblador que en un lenguaje de alto nivel, pues el programador goza de una menor abstracción.

#### Programas fuente grandes

Por las mismas razones que aumenta el tiempo, crecen los programas fuentes; simplemente, requerimos más instrucciones primitivas para describir procesos equivalentes. Esto es una desventaja porque dificulta el mantenimiento de los programas, y nuevamente reduce la productividad de los programadores.

#### Peligro de afectar recursos inesperadamente

Tenemos la ventaja de que todo lo que se puede hacer en la máquina, se puede hacer con el Lenguaje Ensamblador (flexibilidad). El problema es que todo error que podamos cometer, o todo riesgo que podamos tener, podemos tenerlo también en este Lenguaje. Dicho de otra forma, tener mucho poder es útil pero también es peligroso.

En la vida práctica, afortunadamente no ocurre mucho; sin embargo, al programar en este lenguaje verán que es mucho más común que la máquina se "cuelgue", "bloquee" o "se le vaya el avión"; y que se reinicialize. ¿Por qué?, porque con este lenguaje es perfectamente posible (y sencillo) realizar secuencias de instrucciones inválidas, que normalmente no aparecen al usar un lenguaje de alto nivel.

En ciertos casos extremos, puede llegarse a sobreescribir información del CMOS de la máquina (no he visto efectos más riesgosos); pero, si no la conservamos, esto puede causar que dejemos de "ver" el disco duro, junto con toda su información.

#### Falta de portabilidad

Como ya se mencionó, existe un lenguaje ensamblador para cada máquina; por ello, evidentemente no es una selección apropiada de lenguaje cuando deseamos codificar en una máquina y luego llevar los programas a otros sistemas operativos o modelos de computadoras. Si bien esto es un problema general a todos los lenguajes, es mucho más notorio en ensamblador: yo puedo reutilizar un 90% o más del código que desarrollo en "C", en una PC, al llevarlo a una RS/6000 con UNIX, y lo mismo si después lo llevo a una Macintosh, siempre y cuando esté bien hecho y siga los estándares de "C", y los principios de la programación estructurada. En cambio, si escribimos el programa en Ensamblador de la PC, por bien que lo desarrollemos y muchos estándares que sigamos, tendremos prácticamente que reescribir el 100 % del código al llevarlo a UNIX, y otra vez lo mismo al llevarlo a Mac.

![](../../images/waveline.gif)

### Bibliografía

------------

1. Capítulo 1 del Libro de Texto
2. Capítulo 4, Guía del Usuario del Turbo Assembler

![](../../images/waveline.gif)

### Resumen

-------------------------------------

El protocolo con el que un microprocesador interpreta al contenido de la memoria como instrucciones, es llamado lenguaje de máquina.

Su primera abstracción, que consiste en traducir los números o valores en memoria a "mnemónicos", es llamado Lenguaje Ensamblador.

A estos lenguajes, por estar en estrecha relación con un hardware determinado, se les conoce como lenguajes de bajo nivel.

Los lenguajes con los que comúnmente aprendemos a programar (Pascal, BASIC, Scheme), son llamados de alto nivel, por su mucho mayor grado de abstracción, que permite con pocas instrucciones realizar acciones relativamente complejas para la máquina, que se traducen en muchas instrucciones del lenguaje de máquina o ensamblador.

Existen lenguajes que combinan la abstracción de los lenguajes de alto nivel con el acceso cercano al hardware, como es el caso de C, y se les llama de nivel medio.

En nuestro curso examinaremos el Lenguaje Ensamblador de la familia 80x86 de procesadores Intel. La justificación de usar cualquier Lenguaje Ensamblador, está en analizar sus ventajas o desventajas para una aplicación dada. Las principales ventajas que tenemos son:

1. [Velocidad](#velocidad)
2. [Eficiencia de tamaño](#tamaño)
3. [Flexibilidad](#flexibilidad)

Las principales desventajas son:

1. [Tiempo de programación](#tiempo-de-programación)
2. [Programas fuente grandes](#programas-fuente-grandes)
3. [Peligro de afectar recursos inesperadamente](#peligro-de-afectar-recursos-inesperadamente)
4. [Falta de portabilidad](#falta-de-portabilidad)

![](../../images/waveline.gif)

### Página por Bruno Guardia R

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Vi 7-Jun-96_  
_Última actualización: Lu 10-Jun-96_
