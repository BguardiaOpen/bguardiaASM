## Dudas Comunes (Arquitectura)

1.  _¿Cómo funciona el esquema de segmentación?_  
    R: Se tuvo que inventar para conseguir que con los registros de 16 bits que tenemos para datos dentro del procesador, se lograra determinar una localidad específica de memoria, teniendo 20 bits para direccionar (2<sup>20</sup> bytes = 1 Mb. de memoria). Para ello, requerimos de 2 registros, de 16 bits cada uno; pero estos nos dan 32 bits, por lo que sobran y tenemos que usar algún mecanismo para generar sólo 20\. La idea es tener tantas regiones de memoria como permita uno de los registros (2<sup>16</sup> = 65536 regiones), por lo que este registro se le llama de _segmento_. Ya dentro de esa región, usar el otro registro para indicar el byte específico dentro de la región, llamando a este registro _desplazamiento_. Para hacer la combinación, el circuito sumador de direcciones automáticamante usa la fórmula:  
    DF = S * 10h + D  
    Donde DF es la Dirección Física; S es el Segmento; y D es el Desplazamiento. La Dirección Física será el número consecutivo de 20 bits que indica cuál localidad de memoria de el Megabyte nos interesa. A la representación a través de Segmento y Desplazamiento, le llamamos dirección física.
2.  _¿Por qué se dice que el 8086 es un procesador de 16 bits?_  
    R: Por el tamaño de los registros internos y del bus de datos; es la unidad con la que normalmente trabajará el procesador. Si bien la unidad para dividir la memoria es el byte, el procesador es capaz de trabajar dos bytes a la vez, para cualquier operación y para los accesos a memoria. No debe confundirse con la información de que tiene 20 bits de direccionamiento. Esto quiere decir que el bus de direcciones mide 20 bits, lo que da el tamaño de memoria que puede manejar el procesador.
3.  _¿Cuál es la diferencia entre los procesadores DX y SX?_  
    R: Por problemas de costo, Intel después de sacar el 386 tuvo que reducir el tamaño del bus de datos, para que además el procesador nuevo, pudiera instalarse en los _motherboards_ de 286\. A esto se le llamó el 386SX; básicamente un 386 por dentro, con la interfase de 286 por fuera. Obviamente es más lento en el acceso a memoria que un 386 tradicional (DX), pero superior al 286 en instrucciones, velocidad y la capacidad interna de trabajar a 32 bits.  
    Posteriormente ocurrió algo similar con el 486; nada más que el 486SX (recortado) lo que redujeron no fue el bus de datos, sino la eliminación del coprocesador.  

    **<font size="+1">ENVIADAS POR ALUMNOS</font>**  

4.  _Que tal Bruno!, te escribo este mail ya que al estar checando el programa que hace el fetch me surgió la siguiente duda: ¿Por qué al querer sumar el contenido de dos registros, los datos del MDR primero se van a un registro y después, de ese regitro pasan al ALU?, es decir, ¿por qué los datos (a ser sumados) no pasan DIRECTAMENTE al ALU?_  
    Nada más es porque de acuerdo a las especificaciones del procesador que se simula en el programa de ejemplo, si te das cuenta el bus interno no tenía una conexión de entrada al ALU, por eso no podía pasar directo. En un 8086, por ejemplo, si ves el diagrama te darás cuenta de que ahí sí se puede hacer, como los ejemplos que vimos en clase.
5.  _¿Puedo pasar el valor de un registro de segmento a otro?_  
    No, solamente se puede a través de un registro de propósito general. Es decir, se requieren dos pasos.
6.  _¿Cuál es la diferencia entre memoria física y lógica, el rango de la memoria cambia dependiendo de a cuál me estoy refiriendo?_  
    La memoria es la misma, no se divide en lógica y física. Lo que cambia es la dirección:  
    - La dirección física es aquella que por hardware tiene la memoria; si tengo 1 Mb, quiere decir que tengo 1'048,576 bytes, los que van a numerarse del 0 al 1'048,575\. Esa numeración consecutiva es la que llamamos dirección física.  
    - La dirección lógica es la abstracción que tenemos dentro del CPU; como solamente tienen 16 bits los registros, no alcanzan para dar la numeración que es la dirección física. Imagínate que tuvieras sólo 4 espacios para representar una dirección en una avenida con 15,000 números. Por ello, usas dos registros, cada uno con los 16 espacios, para entre los dos juntar los 20 necesarios. Uno es el segmento, que es algo así como si fuera la colonia; y otro, el desplazamiento, que es algo así como el número de la calle si contáramos desde que empieza la colonia. La regla de conversión es la fórmula que automáticamante calcula el procesador: DF = S * 10h + D; lo importante aquí es entender el concepto de que manejamos las dos direcciones, pues una es práctica si lo ves desde el punto de vista de visualizar el hardware y como está, y otra es la única forma en que el procesador puede acceder al recurso de memoria.
7.  _Tengo algunas dudas sobre la bandera de paridad, pues no entiendo bien su funcionamiento._  
    Cada vez que se realiza una operación en el ALU, se actualizan las banderas; en particular, se cuenta el número de bits prendidos (valor 1), que hay en el byte menos significativo del resultado. Si este número de bits es par, se prende el PF; si es non, se apaga. Para ver ejemplos, sugiero que chequen el capítulo 5 del libro de texto, en particular las secciones 5.1 y 5.3.
8.  _Mi pregunta es: el registro CS, que guarda especificamente? Una dirección, una instruccion o algo asi? También el DS es una dirección (porque dice que aparta 64kb)_  
    Guarda el valor del segmento, donde va a estar el código. Este valor se usa junto con un desplazamiento (generalmente el IP, cuando se trata del CS), para calcular una dirección física.  
    Un segmento representa una región de 64 Kb. de memoria, aquella que puede accesarse a través de dicho valor en el registro de segmento.  
    Lo mismo pasa en el DS, nada más que en ese segmento (región) se encontrarán los datos.  
    Pero por sí mismos, no son direcciones ni apuntadores (que sería lo mismo casi que direcciones)
9.  _¿Cuáles son algunas de las variables del BIOS?_  
    Como algunos ejemplos, el reloj que indica la hora del sistema; la memoria base instalada; los puertos instalados; para más, puedes checar el libro del PC Interno 2.0
10.  _No entiendo bien lo de como son 20 bits para las direcciones y los registros son de 16, por que necesitamos dos registros? Es porque no alcanzan los 20 con un registro? De ser asi, por que dos registros (32 bits?)_  
    Efectivamente, no alcanzas 20 bits con un registro, pues son de 16; por eso requieres dos. No vale un registro con 4 bits, no podemos usar a medias los registros; además, se reduce el desperdicio de memoria al usar segmentación. Pero obviamente es complejo el manejo, porque como sobrarían 12 bits, se utilizan en una forma más complicada. Tienes que tomar dos registros de 16 bits y aplicarles una operación tal que quede un registro de 20 bits. Eso es la fórmula de DF = S * 10h + D
11.  _¿A qué se refiere con la secuencia de estados del procesador que logra gracias a la ejecucion del microcodigo? y como es ese microcodigo o que dice?_  
    Bueno, esa es pregunta que corresponde más a las materias de Arquitectura y Organización Computacional. El CPU es una máquina de estados, como suelen diseñar los electrónicos los circuitos que dependen de un reloj. El microcódigo es lenguaje totalmente de máquina, que se analiza a nivel de bits, que indica en cada estado que pasará con cada componente del sistema. Para más detalle, esto lo puedes ver en libros de diseño digital, por ejemplo el Morris Mano. La idea es que el microcódigo define cómo cambia de estado en estado el procesador, según la instrucción que se quiera ejecutar.
12.  _También a que se refiere con que los registros se combinen con otros?_  
    Como el caso de traducir 16 a 20 bits, se requieren 2 registros para una acción; hay operaciones básicas, como el acceso a memoria, que necesitan más de 16 bits de información.
13.  _¿Cómo funciona el algoritmo del [ejemplo](../Ejemplos/ejem02.md)?_  
    Sugiero que lo analices de la forma siguiente:  
    Segmento Desplazamiento Dirección física  
    0000h 0000h 00000h  
    0000h 0001h 00001h  
    0000h 0002h 00002h  
    ...  
    0000h FFFEh 0FFFEh  
    0000h FFFFh 0FFFFh  

    Aquí, para continuar con la siguiente dirección física, fíjate lo que pasa:  

    0001h 0000h 00010h  
    1000h 0000h 10000h  

    Como verás, la forma correcta es la segunda; de ahí lí justificación del algoritmo.
14.  Con respecto a la dirección física, ves que la fórmula es:  
    DF=segmento*0010h+desplazamiento  
    La duda es por qué se hace el desplazamiento.
15.  Acerca de la unidad de control, entiendo que controla todo lo relacionado con el fetch/execute, pero que quieres decir con que genera la secuencia de estados del procesador....no se si con esto, te refieres a que nos dice las distintas fases que pasa el procesador mientras se ejecutan fetch/execute?
16.  ¿Para qué sirve el modelo de capas? Tengo la idea, pero no me queda muy clara.
17.  La página dice que el DOS maneja los dispositivos como archivos, ¿Qué significa eso?
18.  ¿Qué tipo de funciones agregan los dispositivos de hardware al BIOS?
19.  ¿Qué es un sector del disco?
20.  ¿Qué sucede con los segmentos cuando se tiene más memoria del 1 Mb que tenía el procesador 8086?
21.  _He estado leyendo en revistas y periodicos sobre la aparición del procesador MMX o algo así; solo por curiosidad, que tiene de nuevo este procesador._  
    Lo que tiene de nuevo es que ampliaron el set de instrucciones básicas, con instrucciones especialmente diseñadas para Multimedia.
22.  _físicamente, ¿Cómo puedo saber el tamaño del bus de datos, el bus de direcciones y el bus de control en un procesador?, ¿Existe un estándar en cuanto a su ubicación en cualquier procesador?_  
    Desafortunadamente no es fácil; no tienen una "etiqueta" las patitas del procesador. Por lo que lo más físico es irse al manual del procesador y ver el significado que tiene cada una, o bien tener la suerte de contar con un motherboard donde se indique (que no es común).
23.  _En cuanto a desplazamientos y segmentos, cuando te dan una dirección como: 654321h, yo le puedo poner desplazamiento 6540 y segmento 3210\. Y ademas eso de poner segmentos y desplazamientos es subjetivo, no? Es decir que lo pongo como a mi mejor me parezca o hay una regla o algo asi?_  
    Bueno, está incorrecto el ejemplo, pues en primer lugar la dirección física deben ser 20 bits, no 24 como manejas; y el segmento y desplazamiento están manejados al revés...  
    Lo de que es subjetivo no es muy preciso; puedes ponerlos como mejor te convengan, sí, pero sí existen reglas; pero eso lo veremos en clases de herramientas, y el ensamblador pondrá los segmentos de acuerdo al código y datos que usemos.
24.  _Si yo tengo la dirección fisica 75500d como le hago para encontrar su dirección lógica._  
    Respecto a obtener la dirección lógica, simplemente es un despeje hacia atrás, con dos variables (por tanto, una libre). Así que tienes 4096 direcciones lógicas distintas, para esa dirección física. Ejemplos de las formas más sencillas de solucionar el problema son:  
    (Asumirá que la dirección física estuviera en hexadecimal, es decir, fuera 75500h).  
    Tomar el desplazamiento como el último caracter (el dígito hexadecimal que solamente depende del desplazamiento), y despejar el segmento. Eso daría el Segmento 7550h, desplazamiento 0h.  
    Otra forma: tomar los últimos 4 como desplazamiento. Entonces, sería el segmento 7000h, desplazamiento 5500h.  
    Si la tienes en decimal, es lo mismo el despeje, nada más que debes trabajar en esa base y no se puede tan sencillo como tomar un cierto número de caracteres. Por eso, no trabajamos en decimal esas direcciones, sino en hexadecimal.