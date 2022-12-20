## Dudas Comunes (Instrucciones básicos y modos de direccionamiento)

1.  _¿Cuál es la diferencia entre un corrimiento (por ejemplo SHL), y una rotación (por ejemplo, ROL)?_  
    R: En un corrimiento, el bit que entra siempre es un 0; en una rotación, entra un valor dependiendo del bit que sale.  
    Por ejemplo, supongamos que en AL está el número binario:

    <table>

    <tbody>

    <tr>

    <th>AL</th>

    <th>01010101</th>

    </tr>

    </tbody>

    </table>

    Ahora, supongamos que se ejecuta la interrupción  
    `SHL AL, 1`  
    quedará el valor:

    <table cellpadding="2">

    <tbody>

    <tr>

    <th>AL</th>

    <th>10101010</th>

    </tr>

    </tbody>

    </table>

    Si fuera un  
    `ROL AL, 1`  
    en vez del corrimiento, en este caso quedaría igual, porque el bit más significativo (el de la izquierda) era un 0.  
    Pero si repetimos, sobre el último valor:

    <table cellpadding="2">

    <tbody>

    <tr>

    <th>AL</th>

    <th>10101010</th>

    </tr>

    </tbody>

    </table>

    Si fuera un  
    `SHL AL, 1`  
    quedará el valor:

    <table cellpadding="2">

    <tbody>

    <tr>

    <th>AL</th>

    <th>01010100</th>

    </tr>

    </tbody>

    </table>

    Si fuera un  
    `ROL AL, 1`  
    quedará en cambio

    <table cellpadding="2">

    <tbody>

    <tr>

    <th>AL</th>

    <th>01010101</th>

    </tr>

    </tbody>

    </table>

    Porque el 1 que salió por la izquierda, entrá por la derecha; en el corrimiento, el 1 que salió no vuelve a entrar, siempre entra un 0 por la derecha.

2.  _¿Se puede mover la información de un registro de segmento a otro?_  
    R: No directamente, ya que aunque en ambos lados el modo de direccionamiento sería tipo registro, como se mencionó en las características de los registros, un registro de segmento solamente puede accederse a través de uno de propósito general. De esta manera:  
    `MOV DS, ES`  
    sería una interrupción ilegal; pero puede hacerse el mismo procedimiento en dos pasos:  
    `MOV AX, DS  
    MOV ES, AX`  

    **<font size="+1">ENVIADAS POR ALUMNOS</font>**  

3.  Cuando se lleva acabo la interrupción DIV, cómo indicas si debe realizarse la operación de división o la de módulo?
4.  ¿Qué es lo que hacen las rotaciones y desplazamientos y para qué se usan? ¿Qué es un corrimiento?
5.  Las operaciones AND, OR, etc. se realizan sobre cada uno de los bits que contiene una celda de memoria, un registro, etc?
6.  ¿Hay alguna forma de recordar los nombres de las instrucciones para evaluación de condiciones de salto sin tener que memorizar?, es decir, ¿Qué significan cada una de las letras que las componen?
7.  Dentro del modo de direccionamiento indirecto, dices que solamente se puede usar los registros SI, DI como apuntadores. A que se debe esta limitacion en memoria?
8.  ¿Cómo distingue el programa de un código ASCII y de un número hexadecimal para trabajar con el o imprimirlo?
9.  No me quedo muy claro el funcionamiento de las instrucciones para el manejo de memoria push y pop, ya que las estoy asociando con las instrucciones de una pila y creo que no es asi.
10.  Cuando vas creando los segmentos en un programa de ensamblador, el CS, SS y SS toman una parte de la memoria, si por ejemplo, en DS tienes declaraste cuatro variables de byte ¿Qué mecanismo es el que decide que parte de la memoria asignarle a ese segemento? ¿Se puede decirle al programa que tome cierta dirección específica? Cuando carga el código,¿Lo "mide" y lo acomoda?
11.  En la página dice que la MEMORIA DE USUARIO (RAM) va de 0000:0000 a 9000:FFFF. Yo supongo que es para programas de aplicación. En el libro (pág 48, fig. 3.5) dice que la primera parte de la memoria, de 00000 a 00400 está ocupada por los vectores de interrupción. ¿Porqué estas discrepancias? ¿Se debe a diferentes procesadores o es también cuando se manda el sistema operativo a memoria alta (DOS=HIGH)?
12.  La sección de memoria de Libre rom en que se utiliza...  
    a)¿Es para que lo use el BIOS?  
    b)¿Es para que se aloje el BIOS?
13.  En instrucciones aritméticas:los números que usamos pueden ser en base no binaria y el compilador los transforma a binario? (duda del tasm)
14.  _Lo último que vimos de modos de direccionamiento, en esa de directo, lei en un libro que en las PC's las direcciones las pones al revés. Por ejemplo si quieres la direccion 1003h, le pondrias primero (en un byte) el 03 y en el otro byte un 10?_  
    Es correcto lo de que las direcciones se ponen "al revés", pero eso se refiere exactamente al almacenamiento en memoria, que lo vimos en [representación](dudas02.md), en un Intel se almacenan primero los bits menos significativos. Lo de "al revés" es porque aquí sí es subjetivo; depende de cómo dibujemos la memoria. Ahora bien, esto no tiene que ver con modos de direccionamiento; el modo indica cómo se accesa la memoria, no cómo se codifican las instrucciones y sus datos. Pasaría lo mismo en modo inmediato, o en modo indexado de base.
15.  _¿Qué hace específicamente SAR?_  
    Trataré de dibujarlo:  
    SAR hace un SHift a la Derecha, pero con la característica de que en vez de meter un 0 por la izquierda, deja el mismo bit. Para esto, te mostrará dos números como ejemplos:  
    Si AL tiene un número positivo, o no te importa el signo:  
    AL = 5 = 00000101  
    Como vimos en clase, un SHR (SHift Right), moverá los bits a la derecha para dividir entre dos, con lo que quedará:  
    AL = 2 = 00000010, CF = 1 (residuo).  
    En el caso de SAR, con este número ocurrirá lo mismo.  
    El problema viene cuando son números con signo; nuevamente, si es positivo, no pasa nada, pero veamos uno negativo:  
    AL = -5 = 11111011 (Checa hacer el complemento a 2)  
    Si hiciéramos un SHR, queriendo dividir entre 2, fíjate lo que pasa:  
    AL = 125 = 01111101, CF = 1 (no resultó la división).  
    El resultado correcto sería -2, que se ve:  
    AL = -2 = 11111101 (Checa hacer el complemento a 2)  
    Como verás, la única diferencia está que el SHR pone en 0 el último bit, que es el de signo; de manera que el SAR es un SHR, con la ligera diferencia de que el último bit lo deja igual, siendo el de signo. De manera que cuando dividas entre dos un número con signo, usa SAR; y cuando sea sin signo, usas SHR, de ahí el nombre de SAR, que significa "Shift Aritmethic Right".  
    En el caso de multiplicar (SHL) no hay problema con el signo, por lo que no se necesita un SAL.
16.  _¿Se puede usar otro registro en el modo indirecto, que no sea SI o DI)_  
    Los registros SI y DI: se diseñaron con esa especialidad, servir como registros índices para acceso a memoria; de manera que no se puede usar otro registro para usar el modo indirecto.
17.  _En el modo de direccionamiento directo ¿Cuántos numeros (máximo y mínimo)se pueden poner dentro de los corchetes y si estos numeros se pueden poner en decimal o unicamente en hexadecimal?_  
    En modo de direccionamiento directo, pones un sólo número, que es la parte de desplazamiento de la dirección. Ese número es de 16 bits, por lo que puedes escribir entre 1 y 4 dígitos hexadecimales; o entre 1 y 16 binarios; o hasta 5 decimales, pero con un valor menor a 65536\. Puedes usar cualquiera de las tres bases, hexadecimal, binaria o decimal, solamente es necesario que en caso de poner hexadecimal termines con una h, y binario con una b. Claro que conviene no manejar números, sino directamente los nombres de variables, como veremos.
18.  _¿Cómo le haces para referirte a una dirección que tenga el mismo número de desplazamiento pero que se encuentre en diferente segmento?_  
    Para referirte a otro segmento, tienes primero que ajustar los registros de segmento apropiados, y luego poner un "segment override", que sería simplemente indicar el registro de segmento que quieres usar y dos puntos:  
    en vez de MOV AX, [0000h]  
    sería MOV AX, [ES:0000h]
19.  _¿Cuál es la diferencia entre el ROL y RCL, o ROR y RCR, si dan el mismo resultado?_  
    Son completamente diferentes; en un ROL o ROR, son 8 bits los usados, y el CF tiene una copia del que pasó; mientras que en un RCL o RCR, el carry se usa como intermediario:  
    AL = 01010101, y CF = 0  

    Si fuera un ROL AL, 1: AL = 10101010 y CF = 0  
    Si fuera un RCL AL, 1: AL = 10101010 y CF = 0 (aparentemente similar)  

    Pero ahora veámoslo con CF = 1:  

    Si fuera un ROL AL, 1: AL = 10101010 y CF = 0  
    Si fuera un RCL AL, 1: AL = 10101011 y CF = 0
20.  En las instrucciones de MUL y DIV por que solamente les das 1 operador y >no le especificas sobre quien va a realizar la operacion. Y se la realiza directamente al registro AX, es posible utilizar otro registro para estas operaciones o es el unico y si se puede como le especificas sobre cual registro o a que registro le quieres hacer la operacion.  
    Precisamente, el operador es la especificación de sobre quién realizar la operación. Siempre el multiplicando (o dividendo) está dado ya, por ejemplo AL o AX son los posibles multiplicandos; y el operador que indicas es el multiplicador. La selección de AL o AX como multiplicando, depende de si el operador es byte o word, respectivamente.  

    Por ejemplo, si tienes un MUL BX, como BX es word, se tomará a AX como multiplicando, y se calculará la operación AX * BX, dejando el resultado en la combinación de registros DX y AX.