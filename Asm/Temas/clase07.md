 Instrucciones básicas

Tema #7
=======

Instrucciones básicas
=====================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase06.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase08.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![](../../images/waveline.gif)

## Objetivos Específicos

---------------------

* Conocer las instrucciones sencillas más usadas en Lenguaje Ensamblador de la familia 80x86.
* Comprender los efectos de estas instrucciones en el estado del procesador.

![Línea de separación](../../images/waveline.gif)

## Teoría

------

Grupos de instrucciones
-----------------------


  - [Manejo de memoria](#manejo-de-memoria)
  - [Instrucciones aritméticas](#instrucciones-aritméticas)
  - [Operaciones lógicas (booleanas)](#operaciones-lógicas-booleanas)
- [Manejo de bits (rotaciones y desplazamientos)](#manejo-de-bits-rotaciones-y-desplazamientos)

- [Evaluación de condiciones y saltos](#evaluación-de-condiciones-y-saltos)
- [Uso de procedimientos/subrutinas](#uso-de-procedimientossubrutinas)
- [Principales directivas (TASM)](#principales-directivas-tasm)
    

* * *

## Manejo de memoria

------------------

<table border="1" cellpadding="4" units="pixels">

<tbody>

<tr>

<th>Instrucción</th>

<th>Operandos</th>

<th>Función equivalente en "C"</th>

</tr>

<tr>

<td>MOV</td>

<td>destino, fuente</td>

<td>destino = fuente</td>

</tr>

<tr>

<td>PUSH</td>

<td>fuente</td>

<td>[SS:SP] = fuente; SP += sizeof(destino)</td>

</tr>

<tr>

<td>POP</td>

<td>destino</td>

<td>SP -= sizeof(destino) ; destino = [SS:SP]</td>

</tr>

<tr>

<td>XCHG</td>

<td>op1, op2</td>

<td>temp = op1; op1 = op2; op2 = temp</td>

</tr>

</tbody>

</table>

### Comentarios

* MOV acepta distintos modos de direccionamiento; las principales limitantes que tiene son:
  * Destino y fuente no pueden ser, ambos, referencias a memoria; al menos uno de ellos debe ser un registro o una constante.
  * El destino no puede ser una constante, debe ser un registro o una referencia a memoria.
  * Los registros de segmento solamente pueden usarse junto con un registro de uso general.
  * Destino y fuente deben tener el mismo "tipo" (ambos referencias a bytes, o a word, pero no uno a byte y otro a word).
* PUSH y POP requieren operandos de tamano Word. En 8086/88 tiene que ser un registro o una localidad de memoria; en 80286 y superiores, la mejora principal es que PUSH ya se puede hacer sobre una constante.
* XCHG tiene las mismas características que MOV, con la única excepción de que no acepta constantes de ninguno de los dos lados.

* * *

## Instrucciones aritméticas

--------------------------

<table border="1">

<tbody>

<tr>

<th>Instrucción</th>

<th>Operandos</th>

<th>Función equivalente en "C"</th>

<th>Resultados</th>

</tr>

<tr>

<td>ADD</td>

<td>op1, op2</td>

<td>op1 = op1 + op2</td>

<td> </td>

</tr>

<tr>

<td>SUB</td>

<td>op1, op2</td>

<td>op1 = op1 - op2</td>

</tr>

<tr>

<td>ADC</td>

<td>op1, op2</td>

<td>op1 = op1 + op2 + Carry</td>

</tr>

<tr>

<td>SBB</td>

<td>op1, op2</td>

<td>op1 = op1 - op2 - Carry</td>

<td> </td>

</tr>

<tr>

<td>INC</td>

<td>op1</td>

<td>op1 ++;</td>

<td> </td>

</tr>

<tr>

<td>DEC</td>

<td>op1</td>

<td>op1 --;</td>

<td> </td>

</tr>

<tr>

<td>MUL</td>

<td>op1</td>

<td>Si op1 es tipo byte:</td>

<td>AX = AL * op1</td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>Si op1 es tipo word:</td>

<td>(DX:AX) = AX * op1</td>

</tr>

<tr>

<td>DIV</td>

<td>op1</td>

<td>Si op1 es tipo byte:</td>

<td>AL = AX / op1</td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td>AH = AX % op1</td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>Si op1 es tipo word:</td>

<td>AX = (DX : AX) / op1</td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td>DX = (DX : AX) % op1</td>

</tr>

<tr>

<td>NEG</td>

<td>op1</td>

<td>op1 = - op1</td>

<td> </td>

</tr>

</tbody>

</table>

## Manejo de bits (rotaciones y desplazamientos)

----------------------------------------------

<table border="1">

<tbody>

<tr>

<th>Instrucción</th>

<th>Operandos</th>

<th>Función equivalente en "C"</th>

</tr>

<tr>

<td>SHL</td>

<td>op1, cuenta</td>

<td>op1 <<= cuenta</td>

</tr>

<tr>

<td>SHR</td>

<td>op1, cuenta</td>

<td>op1 >>= cuenta</td>

</tr>

<tr>

<td>SAR</td>

<td>op1, cuenta</td>

<td>(no hay equivalente)</td>

</tr>

<tr>

<td>ROL</td>

<td>op1, cuenta</td>

<td>(no hay equivalente)</td>

</tr>

<tr>

<td>ROR</td>

<td>op1, cuenta</td>

<td>(no hay equivalente)</td>

</tr>

</tbody>

</table>

En todas las instrucciones de rotación/desplazamiento de bits, cuenta puede ser 1 o bien CX.

* * *

## Operaciones lógicas (booleanas)

--------------------------------

<table border="1">

<tbody>

<tr>

<th>Instrucción</th>

<th>Operandos</th>

<th>Función equivalente en "C"</th>

</tr>

<tr>

<td>AND</td>

<td>op1, op2</td>

<td>op1 = op1 & op2</td>

</tr>

<tr>

<td>OR</td>

<td>op1, op2</td>

<td>op1 = op1 | op2</td>

</tr>

<tr>

<td>XOR</td>

<td>op1, op2</td>

<td>op1 = op1 ^ op2</td>

</tr>

<tr>

<td>NOT</td>

<td>op1</td>

<td>op1 = ~op1</td>

</tr>

</tbody>

</table>

## Evaluación de condiciones y saltos

----------------------------------

<table border="1">

<tbody>

<tr>

<th>Instrucción</th>

<th>Operandos</th>

<th>Función equivalente en "C"</th>

</tr>

<tr>

<td>JMP</td>

<td>etiqueta</td>

<td> </td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>CMP</td>

<td>op1, op2</td>

<td> </td>

<td>(no hay equivalente)</td>

</tr>

<tr>

<th>Comparaciones sin signo</th>

</tr>

<tr>

<td>JB/JNAE</td>

<td>etiqueta</td>

<td>if (op1 < op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JNB/JAE</td>

<td>etiqueta</td>

<td>if (op1 >= op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JBE/JNA</td>

<td>etiqueta</td>

<td>if (op1 <= op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JNBE/JA</td>

<td>etiqueta</td>

<td>if (op1 > op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JE/JZ</td>

<td>etiqueta</td>

<td>if (op1 == op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JNE/JNZ</td>

<td>etiqueta</td>

<td>if (op1 != op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<th>Comparaciones con signo</th>

</tr>

<tr>

<td>JL/JNGE</td>

<td>etiqueta</td>

<td>if (op1 < op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JNL/JGE</td>

<td>etiqueta</td>

<td>if (op1 >= op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JLE/JNG</td>

<td>etiqueta</td>

<td>if (op1 <= op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JNLE/JG</td>

<td>etiqueta</td>

<td>if (op1 > op2) /* con un CMP */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JP/JPE</td>

<td>etiqueta</td>

<td>if (PF) /* Parity flag */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JNP/JPO</td>

<td>etiqueta</td>

<td>if (! PF)</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JS</td>

<td>etiqueta</td>

<td>if (SF) /* Sign flag */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JNS</td>

<td>etiqueta</td>

<td>if (! SF)</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JC</td>

<td>etiqueta</td>

<td>if (CF) /* Carry flag */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JNC</td>

<td>etiqueta</td>

<td>if (! CF)</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JO</td>

<td>etiqueta</td>

<td>if (OF) /* Overflow flag */</td>

<td>goto <etiqueta></td>

</tr>

<tr>

<td>JNO</td>

<td>etiqueta</td>

<td>if (! OF)</td>

<td>goto <etiqueta></td>

</tr>

</tbody>

</table>

## Uso de procedimientos/subrutinas

--------------------------------

<table border="1">
  <tr>
    <th>Instrucción </th>
    <th>Operandos </th>
    <th>Función equivalente en &quot;C&quot; </th>
  </tr>
  <tr>
    <td>CALL </td>
    <td>etiqueta </td>
    <td>Llamada a función </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>PUSH IP </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>PUSH CS ; Sólo si es llamada larga (CALL FAR) </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>JMP etiqueta </td>
  </tr>
  <tr>
    <td>RET </td>
    <td>(ninguno) </td>
    <td>return </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>POP IP-temp </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>POP CS-temp ; Sólo si es llamada larga (RETF) </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>JMP&nbsp;CS-temp:IP-temp </td>
  </tr>
</table>


## Principales directivas (TASM)

-----------------------------

### ¿Qué es una directiva?

Cuando un mnemónico o palabra reservada de ensamblador se va a traducir a lenguaje máquina (código de operación del procesador), para su posterior ejecución por parte del CPU, se le llama instrucción.

Pero también existen mnemónicos o palabras reservadas del Lenguaje Ensamblador, que no se convierten a lenguaje de máquina, es decir, no son instrucciones propias del lenguaje de máquina del procesador. Sin embargo, son necesarias para controlar el proceso de Ensamblado; le dicen al Ensamblador cuáles son las secciones del programa, cómo definir las variables, y cómo estructurar el programa, entre otras aplicaciones. A estas palabras, que el Ensamblador reconocerá pero no son instrucciones, les llamamos "_Directivas_".

* * *

De segmentos (simplificadas):

Se les considera simplificadas, pues antiguamente se usaban directivas mucho más complejas para realizar la misma función. Aún se requieren esas directivas, pero sólo en los casos donde se accesarán múltiples segmentos; inclusive en Turbo Assembler, solamente cuando hay más de dos segmentos de datos. Por ello, no las veremos en el curso, pues es muy rara su aplicación, y estas son más sencillas de entender y usar.

* `.model <modelo de memoria>`  
    Nos indica qué modelo de memoria se usará para ensamblar este programa. Este concepto se verá más adelante en el curso.  
    Para las aplicaciones comunes, usaremos siempre el modelo _small_. De esta manera, un programa fuente iniciará con la directiva "`.model small`"
* `.stack <tamaño en bytes>`  
    Le indica al ensamblador cuánto espacio deberá reservar para la pila del sistema. Como hay funciones básicas que usan la pila, aunque nosotros no la usemos explícitamente, debe dejarse un espacio razonable.  
    Para la generalidad de las aplicaciones, basta reservar unos 256 bytes (100h). Por ello, generalmente veremos a los programas fuentes tener la directiva "`.stack 100h`"
* `.data`  
    Esta directiva indica dónde inicia la defnición de las variables. Generalmente, esta zona de memoria se asociará al registro DS; de hecho, se considera que es la defnición del contenido y espacio reservado para el segmento de datos por defecto.
* `.code`  
    Esta directiva indicará al ensamblador dónde inicia el código. A partir de ella, se encontrarán las instrucciones propiamente dichas.

* * *

## Para uso de procedimientos

* `<etiqueta> PROC {NEAR/FAR}`  
    Asocia una etiqueta a un procedimiento. Por ejemplo, si ponemos:  
    `Principal PROC`  
    esto definirá el punto de inicio del procedimiento llamado "Principal".  
    NEAR o FAR son parámetros opcionales, que por el momento omitiremos, revisando su uso en el tema de Modelos de Memoria.
* `<etiqueta> ENDP`  
    Cierra un procedimiento, debe estar balanceado con un PROC para abrirlo.
* `END {etiqueta}`  
    Cierra un módulo de programa. Esta directiva le indica al Ensamblador que ignore cualquier cosa que venga después; es como decirle que ahí acabó el archivo con el código fuente.  
    El parámetro (opcional) "etiqueta" indica en qué procedimiento iniciará la ejecución del programa. Así como en Pascal el programa inicia siempre en el `begin` principal, y en C iniciará en la función `main`, sin importar su localización, en Ensamblador usaremos esta directiva para indicar dónde iniciar el programa. Por ejemplo:  
    `END Principal`  
    indica al Ensamblador que la ejecución iniciará en el procedimiento o etiqueta Principal.  
    En caso de omitirse el parámetro opcional, la ejecución se inicia en la primera instrucción después de la directiva `.code`.

* * *

## Definición de constantes

`<identificador> EQU <expresión>`  
Define una constante llamada como el identificador, en una forma similar al `#define` de C. Es decir, cada vez que se encuentre el identificador en el programa fuente, se sustituirá (como texto) por la expresión indicada en el `EQU`.

`<identificador> = <expresión>`  
Es similar al `EQU`, solamente que en este caso podrá variarse (redefinirse) la sustitución que corresponde al identificador.

![Línea de separación](../../images/waveline.gif)

## Bibliografía

------------

Capítulo 4 del Libro de Texto

![Línea de separación](../../images/waveline.gif)
## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Lu 26-Ago-96_  
_Última actualización: Do 9-Feb-97_
