**<font face="Arial" size="4">

### Tarea 3

Ejercicios cortos para aplicar Instrucciones Básicas y Modos de Direccionamiento:

</font>**<font size="2">

Básicos

1.  Instrucciones para restar dos números de 32 bits; el minuendo se encontrará en DX y AX (parte alta y parte baja, respectivamente), y el sustraendo se encontrará en CX y BX. Dejar el resultado en DX y AX.
2.  Instrucciones para multiplicar CX por 4, que dejen el resultado en el mismo CX y respeten todos los demás registros, es decir, no se pierda el valor de ningún otro registro.
3.  Instrucciones para sumar el valor en la variable Cuenta, de tipo BYTE, a DX, dejando el resultado en DX.
4.  Calcular la sumatoria de todos los enteros entre un valor inicial (i) y un valor final (j), que se proporcionan en variables. El resultado deberá quedar en AX, utiliza enteros de 16 bits sin signo.
5.  Calcular el factorial de N, que se proporciona en una variable.
6.  Tengo un número en AL, que está en binario. Quiero saber el valor del bit 5 (numerando 7 al más significativo y 0 al menos significativo). Tu rutina entrega en BL el código "0" o "1" en ASCII.
7.  Calcular y=mx + b. Todas las variables (4) en la función son words y se han definido con los nombres respectivos.
8.  El usuario tecleó sí o no (S/N/s/n). Tengo el código de la tecla en la variable Tecla. Realizar instrucciones que conviertan a mayúsculas la tecla, independientemente de si fue "s" o "n", respetando el valor en caso de que sea "S" o "N"
9.  Tengo un número de 32 bits en DX y AX (parte alta y baja respectivamente), con signo. Quiero cambiarle el signo (hacer complemento a 2), pero el NEG no acepta los 32 bits. ¿Cómo lo hacemos?
10.  El tamaño de un disco en Kilobytes, sale del número de Caras (Cabezas), Pistas y Sectores. Cada sector ocupa Kb., cada pista tiene tantos Sectores como te indica la variable correspondiente; cada Cabeza tiene tantas pistas como indica la variable. De modo que tienes que multiplicar el número de Cabezas por el de Pistas y éste por el de Sectores, para saber cuántos sectores tienes, y de ahí deducir cuántos Kb.

Intermedios

12.  Instrucciones para restar dos números de 32 bits; el minuendo se encontrará en la variable Minuendo y el sustraendo en la variable Sustraendo. Deberás pasar los datos a registros para operar sobre ellos; dejarás el resultado en la variable Resultado, también de 32 bits. TIP: para acceder a distintos elementos de una variable, puedes usar una sintaxis similar a arreglos; por ejemplo, Variable[3] permite acceder al contenido del tercer byte en adelante dentro de una variable.
13.  El apuntador SI está colocado sobre el elemento 0 del arreglo Numeros, que contiene valores numéricos de tipo byte. Se requiere calcular una sumatoria de los 1000 elementos del arreglo Numeros.
14.  Quiero prender el bit "N" en el numero binario "Numero". Recibes los datos en las variables N y Numero, y al final el resultado queda en Numero. Por ejemplo, si Numero vale 145 ("10010001" en binario) y N vale 3, se prenderá el bit 3, quedando en Numero el resultado "10011001" (153 decimal).
15.  El apuntador BX está colocado sobre el elemento 0 del arreglo Numeros, que tiene 1000 elementos de tipo WORD, con signo. Buscar el valor más grande en el arreglo, y depositarlo en la variable Max.
16.  Realizar una rutina que cuente el número de caracteres que tiene la cadena apuntada por SI (buscando el caracter nulo, cuyo ASCII es 0)

</font>