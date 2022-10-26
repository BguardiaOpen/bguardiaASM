 Proyecto Final - 9801

Proyecto Final Lenguaje Ensamblador
-----------------------------------

Fecha de entrega: 21 de noviembre de 2000, salón SC09, 19:00 horas. (Tope)

**Individual, por defecto.**

En equipos de hasta cuatro personas, si lo justifica, se requiere autorización previa del profesor.

### Temas ya apartados:

Aquí se irán poniendo los proyectos según los aparten los alumnos; no se considerará un proyecto aceptado por el profesor, sino hasta que aparezca aquí y reciban un correo de confirmación. Por favor, para apartar un tema, usen el correo electrónico [bguardia@itesm.mx](mailto:bguardia@campus.ccm.itesm.mx)

### Requisitos: 

*   **Tema libre (a elección del alumno).**
*   Deberá mostrar la aplicación del Lenguaje Ensamblador para resolver un problema práctico, realista
*   Se calificará solamente la parte de Lenguaje Ensamblador, aunque el problema puede resolverse utilizando un programa mixto, donde se use un lenguaje de alto nivel en su mayor parte, y Ensamblador para problemas específicos dentro del programa, donde sea justificable por su velocidad, tamaño compacto del código, o necesidad de acceso directo al hardware.
*   Podrá tener puntos extras, hasta 30, a juicio del profesor por la complejidad del problema.
*   El tema deberá informarse con anticipación al profesor, por medio personal o por correo, para obtener la autorización correspondiente del tema, y en su caso, para justificar la formación de un equipo
*   Puede aplicarse (_**y se fomenta**_) el que sea un proyecto también para otra materia; inclusive, que combinen equipos multidisciplinarios, por ejemplo un proyecto de Ingeniería Mecánica con éste.

*   Sugerencias, para más ideas, conviene que vean el [cuadro de honor:](../HONOR.md)


<table border="1" cellpadding="2">

<tbody>

<tr>

<th>Categorías</th>

<th>Ejemplos, ordenados en forma creciente por su dificultad</th>

</tr>

<tr>

<th>Optimización</th>

<td>Tomar un programa en C y traducirlo a ensamblador, para hacerlo más eficiente, por un factor al menos de 2 veces más rápido, a veces hasta de 4\. Documentar el "caso"</td>

</tr>

<tr>

<th>Imágenes</th>

<td>

*   Mostrar archivos con formato PGP
*   Convertir archivos entre distintos formatos, por ejemplo:
    *   PCX a BMP (sencillo)
    *   GIF a BMP
    *   JPEG a BMP
    *   TIFF multipágina a varios BMP
*   Mostrar archivos de video FLIC.
*   Mostrar GIFs animados (se puede tomar como base el proyecto en el [Cuadro de Honor](../HONOR.md))
*   Mostrar y navegar por archivos TIFFs multipágina (p.ej. Fax) (se puede tomar como base el proyecto en el [Cuadro de Honor](../HONOR.md))
*   Mostrar archivos JPEG
*   Mostrar archivos de video AVI.
*   Mostrar archivos de video Quick Time.

</td>

</tr>

<tr>

<th>Programas educativos</th>

<td>Pueden ser simulaciones o tutoriales de distintas materias, a niveles preparatoria y profesional; por ejemplo:

Química:

*   Tabla periódica interactiva.
*   Balanceo de ecuaciones
*   Graficar estructura atómica o molecular
*   Simulación de reacciones químicas.

Física:

*   Simulación del tiro parabólico
*   Simulación del comportamiento de los gases (presión, volumen y temperatura por ejemplo, afectan el movimiento de las moléculas del gas)
*   Simulaciones hidráulicas
*   En general, cualquier simulación gráfica de un fenómeno concreto, acompañada de un texto explicativo.

Estructura de datos:

*   Simulación del comportamiento de un ordenamiento (EJEMPLO YA UTILIZADO)
*   Simulación gráfica de operaciones sobre árboles, colas, pilas; o técnicas como Hash.

Ensamblador

*   Simulación del procesador - Fetch Execute usando 80x86 como referencia.
*   Simulación del funcionamiento de una familia de instrucciones; por ejemplo, los corrimientos y rotaciones.

</td>

</tr>

<tr>

<th>Juegos</th>

<td>Deben ser originales, ya hemos tenido Pacman, carreras, Tetris y muchos de los juegos sencillos similares.

Hay oportunidades en:

*   Juegos educativos.
*   Juegos de estrategia.
*   Juegos de mundos virtuales.

</td>

</tr>

<tr>

<th>Control de Hardware</th>

<td>Por los puertos seriales y paralelos, puede ser hardware existente, como por ejemplo:

*   Joysticks.
*   Lápiz óptico.
*   Tabletas de dibujo.

O bien, hardware construido (buena oportunidad para ligar con otras materias); por ejemplo, he recibido:

*   Displays de letreros con opciones de Scroll.
*   "Robot" cambiador de discos.

Como oportunidades, hay algunas ideas de hardware relativamente fácil de construir:

*   Pad para escritura o dibujo a mano.
*   Display gráfico multicolor (similar a los usados para anuncios espectaculares que cambian).
*   Filtro para monitor "touchscreen".
*   Interfase para control de estéreos, videos o TV (por ejemplo, a través de control remoto).

</td>

</tr>

<tr>

<th>Comunicaciones</th>

<td>Comunicar información entre distintas máquinas es una aplicación natural de Ensamblador. Desafortunadamente, ya está un poco saturado.

Algunas aplicaciones ya hechas (no aceptables):

*   Talk entre dos máquinas por el puerto serial
*   Transferencia de archivos por el puerto serial o paralelo, entre dos máquinas.
*   Ejecución remota de un comando a través del puerto serial ("COMMAND.COM" remoto)

Algunas oportunidades:

*   Conferencia entre tres máquinas, usando el puerto paralelo.
*   Ejecución remota de un comando a través del puerto paralelo.
*   Talk o transferencia de archivos entre dos máquinas, usando tarjetas de red, sin usar facilidades del sistema operativo, sino directamente los drivers.
*   Construir dispositivos de hardware especialmente diseñados para comunicaciones, y controlarlos a nivel Ensamblador; por ejemplo:
    *   Módem
    *   Módem acústico
    *   Convertidor a señales ópticas para comunicación por fibra óptica.

</td>

</tr>

<tr>

<th>Librerías para otros lenguajes</th>

<td>Este tipo de proyectos hacen uso de la interfaz de C con Ensamblador; se trata de proveer funciones para los programadores de C, que faciliten su trabajo. Estas funciones se deben realizar en ensamblador (no se califica el código en C).

Algunas de las que ya se han realizado (y por tanto, no serían válidas) incluyen:

*   Manejo del ratón
*   Primitivas gráficas en modo 13h (línea, círculo, etc...)

Algunas oportunidades serían:

*   Decodificación de archivos de imágenes, por ejemplo BMP, PCX, GIF y TIFF.

</td>

</tr>

<tr>

<th>Demos</th>

<td>Pueden revisar en especial el libro "PC al Límite", disponible en Biblioteca.

Consisten en presentaciones de un producto o compaña, por ejemplo los comerciales de TV; obviamente, involucran gráficas computacionales y animación, muchas veces también sonido.

También pueden ser animaciones de entrada a un programa, que llamen la atención del usuario.

</td>

</tr>

<tr>

<th>Música y sonido</th>

<td>Ya tenemos en el [Cuadro de honor](../HONOR.md) un piano electrónico. Algunas oportunidades que se podrían hacer incluyen:

*   Extender el piano con uso de tarjetas de sonido;
*   "Escribir" música en un pentagrama, utilizando el modo gráfico para dibujar, y posiblemente el ratón para "arrastrar y soltar" las notas; y utilizar las funciones del piano para tocar la música en el pentagrama.
*   Digitalizar música haciendo interfaz con el micrófono y la tarjeta de sonido.
*   Librería de efectos especiales de sonido, ej. explosión, láser, tren pasando... Al menos, debieran crear unos 20; o bien, un programa que permita crearlos.

</td>

</tr>

<tr>

<th>Utilerías</th>

<td>Programas que permitan a un usuario poderoso sacar mayor provecho de su máquina o bien obtener datos internos, por ejemplo he recibido:

*   Información de sistema (tipo SI de Norton o MSD - Microsoft Diagnostics).
*   Vacunas - pueden ver el [cuadro de Honor](../honor.md), aquí las oportunidades ya están limitadas a vacunas contra virus nuevos o contra virus de macros.
*   Conjunto de utilerías "EACTools" - tipo PC Tools, está en el [cuadro de Honor](../honor.md).
*   Observador del nombres extendidos Windows 95, en versiones anteriores de DOS; está en el [Cuadro de honor](../honor.md).
*   Tocar CDs desde MS-DOS.

Algunas que puedo sugerir incluyen:

*   Lector de discos con formato de Macintosh.
*   Desensamblador
*   Compresión de archivos ejecutables, con la descompresión dinámica al ejecutarse. En este caso, el algoritmo de compresión no necesariamente tiene que ser complejo.
*   Encripción de archivos ejecutables, con el desciframiento dinámico al ejecutarse. En este caso, el algoritmo de compresión no necesariamente tiene que ser especialmente seguro.

</td>

</tr>

<tr>

<th>Encripción</th>

<td>Es un tema muy explotado, por lo cual quedan pocas ideas. Ya he recibido programas que cifran y descifran archivos, utilizando diversos algoritmos, incluyendo RSA, TEA, IDEA, DES, XOR con muchas variantes, etcétera.

No se aceptan algoritmos "inventados" por el alumno, a menos que tengan una fundamentación matemática que muestre su "fortaleza"; por lo que en general, sugiero hagan una búsqueda de algoritmos nuevos de encripción, publicados.

</td>

</tr>

<tr>

<th>Compresión</th>

<td>Al igual que la encripción, es un tema explotado en distintas ocasiones. Ya he recibido programas que comprimen y descomprimen usando algoritmos como RLE.

Hay opción para otros algoritmos, por ejemplo ZIP y LZW; sin embargo, generalmente estos ya son proyectos relativamente complejos, solamente los recomendaría para alumnos que tienen una amplia práctica de programación.

</td>

</tr>

</tbody>

</table>