 Errores Comunes en Ensamblador

Tema #12
========

Errores Comunes en Ensamblador
==============================

[![Sesión Anterior](../../images/anterior.gif)  
Clase Anterior](clase11.md)

[![Sesión Siguiente](../../images/sigue.gif)  
Clase Siguiente](../Temas/clase13.md)

[Objetivos Específicos](#objetivos-específicos)
----------------------------------

[Teoría](#teoría)
-----------------

[Bibliografía](#bibliografía)
-----------------------

![Línea de separación](../../images/waveline.gif)

## Objetivos Específicos
---------------------

*   Conocer y entender los errores que más comúnmente se cometen en el uso del lenguaje ensamblador.
*   Conocer las técnicas para evitarlos.

![Línea de separación](../../images/waveline.gif)

## Teoría
------

### Invertir operandos

En el MOV, ADD, SUB e instrucciones similares, es fácil pensar en el orden contrario al debido. Por ejemplo, la instrucción:

> MOV AL, BL

Podría ser interpretada como "MOVer el valor en AL a BL", cuando su significado es exactamente el contrario: "MOVer el valor de BL a AL". Hay que recordar que el destino está siempre a la izquierda.

### Olvidar el uso de los operandos en MUL y DIV

Es común asumir que la multiplicación tomará al último registro que se carga, y después al parámetro indicado; pero siempre se toma como multiplicador AX o AH; y el resultado siempre queda en DX:AX o AX, respectivamente. Por ello, el código parece lógico pero no se obtiene el resultado esperado. Por ejemplo, un programador puede suponer erróneamente que este código multiplicará 10 por 20:

> MOV DL, 20
> 
> MOV CL, 10
> 
> MUL DL

### Olvidar inicializar DX al dividir.

De la misma forma que en la multiplicación, en la división es fácil pensar que divido un word entre otro, como el código siguiente:

> ; Dividir 1000h ente 5:
> 
> MOV AX, 1000h
> 
> MOV BX, 5
> 
> DIV BX

Sin embargo, cuando el divisor es un Word, la instrucción DIV asume que el dividendo estó no sólo en AX, sino en DX:AX. Por ello, si por suerte DX tuviera 0 al ejecutar el código pasado, aparentemente el programa funcionaría bien y sacaría el resultado esperado; pero en otro caso, el resultado sería mucho mayor de lo planeado, e inclusive podría causar un "overflow", como se explica más adelante.

### Dividir inadvertidamente entre 0.

Esto causa un error de "overflow" o desbordamiento de división; en ciertos sistemas, se muestra "división entre 0". Pero en los otros casos, el error no aclara lo que pasó. Desafortunadamente, este error termina el programa inmediatamente, por lo que es muy notorio. Se arregla por medio de una validación apropiada, que evite la división en caso de que el divisor sea 0 y avise al usuario de la manera apropiada a la aplicación.

### Tener un resultado demasiado grande en la división.

Se muestra un error de "overflow" o desbordamiento de división, o inclusive, "división entre 0", cuando el operando no es un 0. La causa es que la división define sus operandos en forma equivalente a la multiplicación, por lo cual el resultado puede no caber en el registro definido para el destino.

Por ejemplo, suponer que se desea dividir el valor 2000h entre 20h:

> MOV AX, 2000h ; En AX se coloca el 2000h (perfectamente válido, pues es un Word)
> 
> MOV BL, 20h ; En BL se coloca el 20h (válido, es un byte)
> 
> DIV BL ; Esto causa el error!!!

Al dividir 2000h entre 20h, nos da 100h. El problema es que cuando el parámetro de DIV es un byte, se asume que el dividendo es un Word en AX, y que el resultado (cociente) sera un byte que quedará en AL, así como el residuo en AH. En este caso, el cociente no cabe en un byte; de ahí el overflow.

Para resolver este problema, hay varias opciones:

*   Si se desea dividir word entre byte, o word entre word, podemos extender el Word a Double Word, y el divisor a Word, para que funcione. En el ejemplo anterior, en vez de AX=2000h, se puede poner DX=0 y AX=2000h; y en vez de dividir entre BL=20h, dividir entre BX=0020h. Con ello, el resultado quedaría en AX=0100h, donde cabe sin problema.
*   Si se desea dividir entre una potencia de 2, se puede hacer mediante corrimientos.
*   En otro caso, cuando no se pueda aplicar ninguno de los anteriores, hay que implementar un algoritmo de división, paso a paso.

### Perder el valor de un registro al llamar una función, y no restaurarlo.

Al ver la ocupación de un registro, si llamamos a un procedimiento, es fácil visualizar que el registro "no ha cambiado", sin ver que dentro del procedimiento pudo haber sido usado. Por ello, conviene documentar todos los procedimientos, para que al llamarlos tomemos las precauciones (respaldar los registros), necesarias.

### Olvidar definir la pila, u ocupar demasiado espacio de pila.

Cuando se realizan procedimientos recursivos, o se llama a funciones tales como las de VESA del BIOS, se requiere una cantidad de pila superior a la estándar; con lo que se puede invadir memoria que no se reservá, causando la destrucción del código, de los datos o de otros programas en memoria. Normalmente, esto presentará como síntoma el bloquear la máquina.

Hay que recordar que consume el recurso de la pila en las siguientes circunstancias:

*   Al usar PUSH (liberando con POP)
*   Al llamar procedimientos (instrucción CALL)
*   Al llamar interrupciones (instrucción INT)

### No colocar el RET al final de un procedimiento.

A diferencia de un lenguaje de alto nivel, los procedimientos son solamente una abstracción que etiqueta un bloque de código. Al ser pseudoinstrucciones, el procesador no reconoce realmente los procedimientos, por lo que si no colocamos un RET, se hará fetch de la siguiente instrucción, así que la ejecución continuará con el siguiente procedimiento; lo cual normalmente no es lo que se deseaba.

### Tener distinto número de PUSH y POPs en un procedimiento, con lo que la pila no queda balanceada.

En particular, los procedimientos usan la pila para el CALL y RET, por lo que este problema causa generalmente que se bloquee la máquina. Sin embargo, en ocasiones el resultado es que se continúa ejecutando el programa, en un sitio inesperado; por ejemplo, en el Turbo Debugger vemos que un RET en vez de regresar al punto donde se llamó al procedimiento, vuelve a ejecutar el procedimiento o ejecuta otra sección del programa..

### Hacer un salto condicional cuando la bandera ya ha sido alterada.

Las instrucciones aritméticas y lógicas afectan las banderas, las cuales son usadas para evaluar el salto condicional. Por ejemplo, este código no funcionaría:

> CMP CX, 0
> 
> INC CX
> 
> JE SalSiFue0

Esto podría hacer un programador que quiere "compilar" una instrucción tal como:

> if (CX++)

Donde se desea checar si es 0, primero, incrementar y luego ejecutar lo que haya en el if. Pero el resultado de la comparación (la bandera de cero), es alterado por el INC, es decir, se refiere al resultado del incremento y ya no al de la comparación, cuando se ejecuta el salto.

Se recomienda usar los saltos condicionales inmediatamente después de la instrucción que checó la condición, o causé el efecto en la bandera que se está checando.

La principal excepción a esta recomendación se da cuando queremos checar varias condiciones respecto a la misma comparación; aquí conviene tomar en cuenta que los saltos NO alteran las banderas, por lo que podemos eficientar el código.

### Olvidar llamar a DOS para terminar el programa.

A diferencia de un lenguaje de alto nivel, el programa no termina automáticamente; por lo que en el momento que queramos terminarlo, debemos llamar a la función exit de DOS, representada por el servicio 4Ch de la interrupción 21h.

Resumiendo: las directivas END y ENDP no generan código, necesario para terminar el programa.

### Olvidar establecer el segmento de datos apropiadamente.

En este caso, suele observarse el síntoma de que se imprime basura en pantalla, en vez de los mensajes deseados.

Por eso, se recomienda siempre iniciar el programa con las instrucciones:

> MOV AX, @data
> 
> MOV DS, AX

### Escribir inadvertidamente información en el lugar que no corresponde.

Como la memoria la accesamos por dirección, al igual que cuando usamos apuntadores en C, podemos escribir en memoria que no era la que se quería escribir. Por ejemplo, si a una cadena se le reservan 10 bytes en memoria, y después escribimos 20 caracteres en la cadena, ocupamos los 10 que nos corresponden pero invadimos los 10 siguientes, con lo que generalmente destruimos los valores de las variables que están definidas después de la cadena.

Inclusive podemos destruir código de esta forma, al accesar la memoria del código como si fuera de variables.

### Escribir datos en la base inapropiada

Por ejemplo, al llamar a DOS, se intenta llamar a la interrupción 21h, y se olvida poner la **h** de hexadecimal. Con esto, se llama a la interrupción 21 decimal, equivalente a 15 hexadecimal, la cual no soporta los servicios de DOS sino los de otros servicios de BIOS, con lo que puede trabarse el programa o más comúnmente no hacer nada, pues el servicio 9 y los más comunes de la INT 21h no están definidos en la 15h. Sin embargo, en este caso no obtenemos el efecto deseado (imprimir, accesar un archivo, etcétera).

### Usar un salto condicional equivocado

Específicamente, es muy común usar JG o un salto similar cuando se quiere comparar dos números, y saltar cuando el resultado de la comparación es "el primero mayor que el segundo". Pero, si los operandos son números sin signo, esto puede causar problemas, pues un número muy grande será interpretado como "menor", ya que se tomará como negativo.

Hay que recordar que se usan:

*   JA, JB, JAE, JBE, para operandos sin tomar en cuenta el signo.
*   JG, JL, JGE, JLE, para operandos tomando en cuenta el signo.

Otros errores comunes del mismo tipo son:

*   Lógica invertida: usar el salto si fueron diferentes, cuando se quería saltar si eran iguales. Aquí conviene ver la sesión de "técnicas de programación", para ver cómo hacer la equivalencia de la lógica de Ensamblador con la lógica de un lenguaje de alto nivel.
*   No considerar el caso de igualdad; este también es un error común en los lenguajes de alto nivel.

![Línea de separación](../../images/waveline.gif)

## Bibliografía
------------

Guía del Usuario de Turbo Assembler, Versión 2.0

![Línea de separación](../../images/waveline.gif) 
## Página por Bruno Guardia R.

 [![Correo](../../images/mail.gif) bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

_Creada: Ju 12-Sep-96_  
_última actualización: Do 16-Feb-97_