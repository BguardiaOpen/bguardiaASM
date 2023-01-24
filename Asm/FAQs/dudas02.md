## Dudas Comunes (Representación de Datos)

1.  _¿Cuál es la relación entre los tipos de datos en C y la representación vista?_  
    R: Se está examinando la representación desde un punto de vista general, de bases teóricas. La evolución de los tipos de datos se basa en las arquitecturas de procesadores, lo que tiene mucho que ver con Ensamblador. En particular, C toma algunos de esos tipos básicos, aunque pueden variar según la arquitectura.  
    _char_ es un entero de 8 bits, con signo; _unsigned char_, cuando es entero de 8 bits sin signo.  
    _short_ es un entero de 16 bits, con signo; _unsigned short_, cuando es entero de 16 bits sin signo.  
    _long_ es un entero de 32 bits, con signo; _unsigned long_, cuando es entero de 32 bits sin signo.  
    No es recomendable usar _int_, por portabilidad, ya que varía según la arquitectura; en DOS o Windows 3.11 o anterior, equivale a 16 bits; mientras que en Windows 95, NT, y la generalidad de ambientes UNIX, es de 32 bits.
2.  _¿Cómo convertir un valor decimal con parte fraccionaria, a base binaria?_  
    R: El secreto está en usar potencias negativas. Para la conversión en partes enteras, se tienen que restar las potencias positivas del 2; en las fraccionarias, con las potencias negativas. Por ejemplo, 2.5 es fácil de convertir: es 2^1 + 2^-1, con lo que equivale a 10.1<sub>2</sub>. Puede ser práctico convertir primero la parte entera, en la forma convencional; y al final dejar la parte fraccionaria Cuando es un número más difícil, por ejemplo, 0.2555, la técnica es multiplicarlo varias veces por dos; la parte entera se va convirtiendo en un dígito de salida.  
    Por ejemplo, vamos a sacar el valor del 0.2555 en base binaria:  
    0.2555 x 2 = 0.511; tomamos el 0 como el dígito antes del punto.  
    0.511 x 2 = 1.022; tomamos el 1, es el dígito después del punto.  
    0.022 x 2 = 0.044, tomamos el 0 como el siguiente dígito.  
    0.044 x 2 = 0.088, tomamos el 0 como el siguiente dígito.  
    0.088 x 2 = 0.176, tomamos el 0 como el siguiente dígito.  
    0.176 x 2 = 0.352, tomamos el 0 como el siguiente dígito.  
    0.352 x 2 = 0.704, tomamos el 0 como el siguiente dígito.  
    0.704 x 2 = 1.408, tomamos el 1 como el siguiente dígito.  

    Y así sucesivamente; con la precisión que llegamos, podemos decir que 0.2555 = 0.1000001<sub>2</sub>.
3.  _¿Cómo se convierte rápido un número binario entero, a decimal?_  
    R: El mejor truco que conozco es tener una tabla mental de las potencias de 2; que serían en un número de 8 bits: 128, 64, 32, 16, 8, 4, 2, 1\. Así, dentro del rango de 8 bits puedo tener un número como 160:  
    160 > 128: eso quiere decir 160 / 128 = 1 y sobran 32\. Esto da que el primer bit de los 8 es 1 (sí hay 128)  
    32 < 64: eso quiere decir 32/64 = 0 y sobran 32\. Segundo bit 0.  
    32 = 32: eso quiere decir 32/32 = 1 y no sobra nada: Tercer bit 1 y los demás 0.  
    Por tanto, 160 se escribirá 10100000<sub>2</sub>. 
4.  _¿Por qué se usa la notación de complemento a 2, en vez de simplemente destinar un bit al signo y dedicar los demás a la magnitud? ¿No sería más eficiente y simple?_  
    R: Tal vez le ahorraría un poco de trabajo a la gente cuando convierte. Pero está diseñada para las computadoras; usando la notación de complemento a 2, la operación de suma y resta se unifican. Para probarlo, basta con que intentes sumar de acuerdo al algoritmo de suma binaria, un número positivo con uno negativo, que estén en notación de complemento a 2\. Por otro lado, de todos modos se requiere un programa para hacer la conversión del número binario, en representación interna de la máquina, al formato que los humanos podemos visualizar.  

    **<font size="+1">ENVIADAS POR ALUMNOS</font>**  

5.  _Aportación de un alumno, sobre cómo entender el rango de los números enteros de acuerdo al número de bits._  
    Cuando tengo _n_ bits, puedo formar los numeros desde 0 hasta (2^n)-1 pero seria bueno aclarara que en codigo BINARIO. Ahora, como yo lo entendi mejor fue pensando en decimal: Si tengo 2 bits por ejemplo, puedo formar los numeros desde el 0 hasta el (10^2)-1 es decir (10^n)-1 donde n es el numero de bits y eso nos da 99 que efectivamente es el numero mas grande en decimal que puedo representar con 2 bits y el 00 el mas chico. Lo mismo ocurre en binario.
6.  _¿Qué es un word?_  
    En base a lenguajes como Pascal, generalmente hablamos de datos tipo _word_, cuando nuestros datos ocupan 16 bits; equivaldría al _short_ de C, o al _integer_ o _word_ de Pascal. Como veremos más adelante, un _word_ en los temas de ensamblador de Intel también lo usaremos como el tipo de datos que ocupa 2 bytes.
7.  Si se tienen 16 bits para representar punto flotante, 12 para la mantisa y 4 para el exponente y cada uno puede tener signo, por qué el rango valido para el exponente es de -8 a 7 pero no lo es para la mantisa la cantidad que va de -(2 a la 11) hasta (2 a la 11).
8.  _Ya que existen numeros que necesitan un espacio mayor de 1 byte para ser almacenados, como 2 ó 4 bytes (short o long) ¿Como se almacena el numero en la memoria, es decir si en los primeros bytes se guanda la parte más significativa del numero o si empieza por la parte menos significativa?_  
    Como vimos en clase, se almacena en orden distinto según el procesador. Si es un Intel, se almacena primero la parte menos significativa; en un Motorola, se almacena primero la más significativa. Al primer caso se le llama _"big-endian"_, y al segundo, _"little-endian"_.
9.  _No entendi bien cuando quieres restar numeros y te queda un negativo, como por ejemplo: 13-10= -3\. Según yo seria algo asi como:  
    mov ax,13  
    mov bx,10  
    sub bx,ax  
    pero el resultado, ¿cómo lo pone?_  
    En BX quedará un -3, el cual se almacena como complemento a 2\. Si lo checamos, para sacar el complemento se hace:  

    Original: 3 = 0000000000000011 binario  
    Complemento a 1: C = 1111111111111100 binario  
    Complemento a 2: C = 1111111111111101 binario = FFFD hexadecimal.  

    De manera que quedará almacenado un FFFD hexadecimal, que es la representación del -3; como dices, depende de cómo lo uses su interpretación como positivo o negativo.