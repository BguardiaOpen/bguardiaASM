 Instrucciones básicas

Tema #7
=======

Instrucciones básicas
=====================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase06.htm)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase08.htm)

[Objetivos Específicos](#objetivo)
----------------------------------

[Teoría](#teoria)
-----------------

[Bibliografía](#biblio)
-----------------------

![](../../images/waveline.gif)

Objetivos Específicos
---------------------

*   Conocer las instrucciones sencillas más usadas en Lenguaje Ensamblador de la familia 80x86.
*   Comprender los efectos de estas instrucciones en el estado del procesador.

![Línea de separación](../../images/waveline.gif)

Teoría
------

Grupos de instrucciones
-----------------------

*   [Manejo de memoria](#Memoria)
*   [Instrucciones aritméticas](#aritmetica)
*   [Operaciones lógicas (booleanas)](#booleana)
*   [Manejo de bits (rotaciones y desplazamientos):](#shifts)
*   [Evaluación de condiciones y saltos](#jumps)
*   [Uso de procedimientos/subrutinas](#subs)
*   [Principales directivas (TASM)](#directivas)

* * *

Manejo de memoria:
------------------

Instrucción

Operandos

Función equivalente en "C"

MOV

destino, fuente

destino = fuente

PUSH

fuente

\[SS:SP\] = fuente; SP += sizeof(destino)

POP

destino

SP -= sizeof(destino) ; destino = \[SS:SP\]

XCHG

op1, op2

temp = op1; op1 = op2; op2 = temp

### Comentarios

*   MOV acepta distintos modos de direccionamiento; las principales limitantes que tiene son:
    *   Destino y fuente no pueden ser, ambos, referencias a memoria; al menos uno de ellos debe ser un registro o una constante.
    *   El destino no puede ser una constante, debe ser un registro o una referencia a memoria.
    *   Los registros de segmento solamente pueden usarse junto con un registro de uso general.
    *   Destino y fuente deben tener el mismo "tipo" (ambos referencias a bytes, o a word, pero no uno a byte y otro a word).
*   PUSH y POP requieren operandos de tamano Word. En 8086/88 tiene que ser un registro o una localidad de memoria; en 80286 y superiores, la mejora principal es que PUSH ya se puede hacer sobre una constante.
*   XCHG tiene las mismas características que MOV, con la única excepción de que no acepta constantes de ninguno de los dos lados.

* * *

Instrucciones aritméticas:
--------------------------

Instrucción

Operandos

Función equivalente en "C"

Resultados

ADD

op1, op2

op1 = op1 + op2

 

SUB

op1, op2

op1 = op1 - op2

ADC

op1, op2

op1 = op1 + op2 + Carry

SBB

op1, op2

op1 = op1 - op2 - Carry

 

INC

op1

op1 ++;

 

DEC

op1

op1 --;

 

MUL

op1

Si op1 es tipo byte:

AX = AL \* op1

 

 

Si op1 es tipo word:

(DX:AX) = AX \* op1

DIV

op1

Si op1 es tipo byte:

AL = AX / op1

 

 

 

AH = AX % op1

 

 

Si op1 es tipo word:

AX = (DX : AX) / op1

 

 

 

DX = (DX : AX) % op1

NEG

op1

op1 = - op1

 

* * *

Manejo de bits (rotaciones y desplazamientos):
----------------------------------------------

Instrucción

Operandos

Función equivalente en "C"

SHL

op1, cuenta

op1 <<= cuenta

SHR

op1, cuenta

op1 >>= cuenta

SAR

op1, cuenta

(no hay equivalente)

ROL

op1, cuenta

(no hay equivalente)

ROR

op1, cuenta

(no hay equivalente)

En todas las instrucciones de rotación/desplazamiento de bits, cuenta puede ser 1 o bien CX.

* * *

Operaciones lógicas (booleanas):
--------------------------------

Instrucción

Operandos

Función equivalente en "C"

AND

op1, op2

op1 = op1 & op2

OR

op1, op2

op1 = op1 | op2

XOR

op1, op2

op1 = op1 ^ op2

NOT

op1

op1 = ~op1

* * *

Evaluación de condiciones y saltos
----------------------------------

Instrucción

Operandos

Función equivalente en "C"

JMP

etiqueta

 

goto <etiqueta>

CMP

op1, op2

 

(no hay equivalente)

Comparaciones sin signo

JB/JNAE

etiqueta

if (op1 < op2) /\* con un CMP \*/

goto <etiqueta>

JNB/JAE

etiqueta

if (op1 >= op2) /\* con un CMP \*/

goto <etiqueta>

JBE/JNA

etiqueta

if (op1 <= op2) /\* con un CMP \*/

goto <etiqueta>

JNBE/JA

etiqueta

if (op1 > op2) /\* con un CMP \*/

goto <etiqueta>

JE/JZ

etiqueta

if (op1 == op2) /\* con un CMP \*/

goto <etiqueta>

JNE/JNZ

etiqueta

if (op1 != op2) /\* con un CMP \*/

goto <etiqueta>

Comparaciones con signo

JL/JNGE

etiqueta

if (op1 < op2) /\* con un CMP \*/

goto <etiqueta>

JNL/JGE

etiqueta

if (op1 >= op2) /\* con un CMP \*/

goto <etiqueta>

JLE/JNG

etiqueta

if (op1 <= op2) /\* con un CMP \*/

goto <etiqueta>

JNLE/JG

etiqueta

if (op1 > op2) /\* con un CMP \*/

goto <etiqueta>

JP/JPE

etiqueta

if (PF) /\* Parity flag \*/

goto <etiqueta>

JNP/JPO

etiqueta

if (! PF)

goto <etiqueta>

JS

etiqueta

if (SF) /\* Sign flag \*/

goto <etiqueta>

JNS

etiqueta

if (! SF)

goto <etiqueta>

JC

etiqueta

if (CF) /\* Carry flag \*/

goto <etiqueta>

JNC

etiqueta

if (! CF)

goto <etiqueta>

JO

etiqueta

if (OF) /\* Overflow flag \*/

goto <etiqueta>

JNO

etiqueta

if (! OF)

goto <etiqueta>

* * *

Uso de procedimientos/subrutinas
--------------------------------

Instrucción

Operandos

Función equivalente en "C"

CALL

etiqueta

Llamada a función

 

 

PUSH IP

 

 

PUSH CS ; Sólo si es llamada larga (CALL FAR)

 

 

JMP etiqueta

RET

(ninguno)

return

 

 

POP IP-temp

 

 

POP CS-temp ; Sólo si es llamada larga (RETF)

 

 

JMP CS-temp:IP-temp

* * *

Principales directivas (TASM)
-----------------------------

### ¿Qué es una directiva?

Cuando un mnemónico o palabra reservada de ensamblador se va a traducir a lenguaje máquina (código de operación del procesador), para su posterior ejecución por parte del CPU, se le llama instrucción.

Pero también existen mnemónicos o palabras reservadas del Lenguaje Ensamblador, que no se convierten a lenguaje de máquina, es decir, no son instrucciones propias del lenguaje de máquina del procesador. Sin embargo, son necesarias para controlar el proceso de Ensamblado; le dicen al Ensamblador cuáles son las secciones del programa, cómo definir las variables, y cómo estructurar el programa, entre otras aplicaciones. A estas palabras, que el Ensamblador reconocerá pero no son instrucciones, les llamamos "_Directivas_".

* * *

De segmentos (simplificadas):

Se les considera simplificadas, pues antiguamente se usaban directivas mucho más complejas para realizar la misma función. Aún se requieren esas directivas, pero sólo en los casos donde se accesarán múltiples segmentos; inclusive en Turbo Assembler, solamente cuando hay más de dos segmentos de datos. Por ello, no las veremos en el curso, pues es muy rara su aplicación, y estas son más sencillas de entender y usar.

*   `.model <modelo de memoria>`  
    Nos indica qué modelo de memoria se usará para ensamblar este programa. Este concepto se verá más adelante en el curso.  
    Para las aplicaciones comunes, usaremos siempre el modelo _small_. De esta manera, un programa fuente iniciará con la directiva "`.model small`"
*   `.stack <tamaño en bytes>`  
    Le indica al ensamblador cuánto espacio deberá reservar para la pila del sistema. Como hay funciones básicas que usan la pila, aunque nosotros no la usemos explícitamente, debe dejarse un espacio razonable.  
    Para la generalidad de las aplicaciones, basta reservar unos 256 bytes (100h). Por ello, generalmente veremos a los programas fuentes tener la directiva "`.stack 100h`"
*   `.data`  
    Esta directiva indica dónde inicia la defnición de las variables. Generalmente, esta zona de memoria se asociará al registro DS; de hecho, se considera que es la defnición del contenido y espacio reservado para el segmento de datos por defecto.
*   `.code`  
    Esta directiva indicará al ensamblador dónde inicia el código. A partir de ella, se encontrarán las instrucciones propiamente dichas.

* * *

Para uso de procedimientos:

*   `<etiqueta> PROC {NEAR/FAR}`  
    Asocia una etiqueta a un procedimiento. Por ejemplo, si ponemos:  
    `Principal PROC`  
    esto definirá el punto de inicio del procedimiento llamado "Principal".  
    NEAR o FAR son parámetros opcionales, que por el momento omitiremos, revisando su uso en el tema de Modelos de Memoria.
*   `<etiqueta> ENDP`  
    Cierra un procedimiento, debe estar balanceado con un PROC para abrirlo.
*   `END {etiqueta}`  
    Cierra un módulo de programa. Esta directiva le indica al Ensamblador que ignore cualquier cosa que venga después; es como decirle que ahí acabó el archivo con el código fuente.  
    El parámetro (opcional) "etiqueta" indica en qué procedimiento iniciará la ejecución del programa. Así como en Pascal el programa inicia siempre en el `begin` principal, y en C iniciará en la función `main`, sin importar su localización, en Ensamblador usaremos esta directiva para indicar dónde iniciar el programa. Por ejemplo:  
    `END Principal`  
    indica al Ensamblador que la ejecución iniciará en el procedimiento o etiqueta Principal.  
    En caso de omitirse el parámetro opcional, la ejecución se inicia en la primera instrucción después de la directiva `.code`.

* * *

Definición de constantes

`<identificador> EQU <expresión>`  
Define una constante llamada como el identificador, en una forma similar al `#define` de C. Es decir, cada vez que se encuentre el identificador en el programa fuente, se sustituirá (como texto) por la expresión indicada en el `EQU`.

`<identificador> = <expresión>`  
Es similar al `EQU`, solamente que en este caso podrá variarse (redefinirse) la sustitución que corresponde al identificador.

![Línea de separación](../../images/waveline.gif)

Bibliografía
------------

Capítulo 4 del Libro de Texto

![Línea de separación](../../images/waveline.gif) Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 26-Ago-96_  
_Última actualización: Do 9-Feb-97_