# 4. Modelado de la arquitectura

## 4.1 Panorama del capítulo

En este capítulo se revisan las necesidades que plantea la implementación de ANGEL, una vez que se ha determinado que es un sistema tutor inteligente, con las características adicionales de ser un agente que funciona como interfaz inteligente, es decir, de ser un asesor inteligente automatizado.

Entre estas necesidades, se tienen que examinar:

- Las funciones que realizará ANGEL dentro del proceso de enseñanza - aprendizaje, siguiendo el rol de asesor.

- El contexto del curso dentro del cual se integrará, y el rediseño que dicho curso ha tenido para incluir al asesor como una herramienta del mismo.

- El diseño de la arquitectura general de implementación.

- Las técnicas de la Inteligencia Artificial, Ciencias Computacionales y Pedagogía que permitirán su implementación.

- El diseño detallado de los componentes de ANGEL.

## 4.2. Papel del asesor inteligente en el proceso de enseñanza - aprendizaje

Se empezó a analizar en la sección 2.4, donde se reconocieron tres roles básicos dentro del proceso de enseñanza - aprendizaje, particularmente en el caso de lenguajes de programación:

- El transmisor

- El asesor

- El receptor

En particular para el asesor, tenemos las siguientes funciones:

- Observar el comportamiento del estudiante al aplicar sus nuevos conocimientos (en el caso de estudio, programando, sentado frente a la computadora). [7]

- Diagnosticar la situación de aprendizaje del estudiante: si ha adquirido correctamente unidades de conocimiento, y las está aplicando de esa manera; o si está cometiendo errores comunes en la aplicación del conocimiento. [2]

- Retroalimentar oportunamente al estudiante, de manera que éste pueda modificar su comportamiento y reforzar el aprendizaje mediante dicho nuevo comportamiento.

- Conocer al estudiante, y adaptar la retroalimentación de acuerdo a su nivel de conocimientos y situación en la adquisión de conceptos específicos.

Estas serían las características que identifiquen a un asesor inteligente automatizado; en este caso, se busca que ANGEL pueda reducir la necesidad de asesores humanos, y está disponible aún cuando y donde no podría estar disponible un asesor humano.

Para conseguir la realización de dichas funciones, ANGEL observará al estudiante a través de una interfase con el usuario apropiada, mientras está programando; el diagóstico se hará a través de un sistema experto [30], el cual opera sobre la base de conocimientos específico del dominio del lenguaje; la retroalimentación se hará a través de la misma interfase; el conocimiento del estudiante estará en una base de conocimiento sobre el estudiante, que implementará al componente 'modelo del estudiante' del Sistema Tutor Inteligente. Finalmente, las estrategias de retroalimentación serían dictadas por la implementación apropiada del 'modelo pedagógico'.

Resumiendo, la arquitectura general de un Sistema Tutor Inteligente vista en el capítulo 3, es apropiada para el asesor inteligente ANGEL. De modo que, a lo largo de este capítulo, se analizará cómo implementar cada uno de sus componentes.

Sería deseable que ANGEL cuente con conocimiento equivalente al de un asesor humano; sin embargo, aquí se encuentra un problema difícil de la Inteligencia Artificial: dotarlo de 'sentido común'. Por ello, en este trabajo no se espera llegar a dicho nivel y 'sustituir' totalmente al asesor humano; pero, de acuerdo a la experiencia de la rama de Inteligencia Artificial, es razonable esperar que el asesor cuente con el "conocimiento experto", totalmente especializado al dominio donde va a asesorar al estudiante, en este scaso, un lenguaje específico de programación.

A continuación, se presenta un resumen del contexto del curso de Ensamblador, en el cual se aplica el prototipo del asesor inteligente; hay que mencionar que no solamente el asesor inteligente deberá encajar apropiadamente en el curso, sino que el curso requirió de una adaptación para facilitar la función del asesor inteligente. Una vez que se plantee dicho contexto, se analizará módulo a módulo el diseño de ANGEL.

## 4.3. Adaptación del curso

Los objetivos planteados para el curso de Ensamblador [E7] son:

- Conocer y aplicar el lenguaje Ensamblador de los procesadores 80x86 en la resolución de problemas.

- Consolidar las habilidades de programación.

Para conseguir estos objetivos, se cuenta con una serie de herramientas básicas:

- Libro de texto y apuntes en páginas WWW [E7], que contienen la información sobre los conceptos (teoría) del curso: componentes del procesador, modos de direccionamiento, uso de variables e instrucciones.

- Programas de ejemplo [E7] que ilustran la aplicación de dichos conceptos para resolver problemas específicos.

- Ejercicios y proyectos, que se asignan al alumno para que resuelva los problemas que le plantean utilizando las herramientas.

- Laboratorio de cómputo donde los alumnos cuentan con las herramientas computacionales que les permiten desarrollar las soluciones, supervisados o no por el profesor.

- Biblioteca, hemeroteca, centro de información y conexión a Internet, recursos de información que le permiten al alumno documentarse más ampliamente.

- Correo electrónico, chat y grupo de noticias, en diversos grados de desarrollo, que permiten intercambiar la información y asesorar a los alumnos en forma asíncrona.

A diferencia de otros sistemas tutores inteligentes, ANGEL no busca sustituir el rol del transmisor: en su lugar, hará referencias al libro de texto, programas de ejemplo y apuntes en páginas WWW, para que el alumno refuerce su conocimiento teórico en el tema que ANGEL determine que el alumno no domina y por tanto cause problemas en su práctica de programación. También es importante ver que se tiene la orientación de proporcionar los apuntes, programas de ejemplo, etcétera, en diskette, para que el alumno cuente con el acceso a dicha información al igual que al asesor inteligente automatizado, aún en casa o cualquier otro lugar fuera del laboratorio de la escuela, siempre y cuando cuente con una computadora personal, lo cual es un requisito básico para ejecutar la práctica de la programación.

El correo electrónico ha funcionado como un buen mecanismo de asesoría, al permitir enviar y recibir programas fuente y señalar en ellos los errores comunes, o los puntos que se pueden perfeccionar; por lo que es un buen complemento para mejorar la capacidad del profesor de asesorar a los alumnos. Sin embargo, al ser asíncrono y no en línea, es relativamente lento, no siempre proporciona la respuesta con suficiente oportunidad; además de que el alumno no cuenta con acceso al correo en todo momento en que está practicando la programación, por lo cual, muchas oportunidades de asesoría no se aprovechan. Estas limitantes son el área de oportunidad para ANGEL.

Para maximizar la disponibilidad de los recursos, los alumnos del grupo Virtual cuentan con clase en laboratorio 3 horas a la semana; en dicho laboratorio se cuenta con computadoras PC compatibles, las cuales permiten acceder a Internet, y en particular, al material y referencias del curso, así como al correo electrónico; en ellas se instalará el asesor inteligente ANGEL, para complementar el equipo de herramientas de los alumnos. Tanto los alumnos del grupo presencial como virtual requerirán de la entrega de un diskette de instalación, para permitirles el uso de todas las herramientas del curso en su casa o en otros laboratorios.

## 4.4. Diseño de la arquitectura

### 4.4.1 Diagrama general

Kaplan [11] sugiere una arquitectura general para Sistemas Tutores Inteligentes, la cual ya fue mostrada en la figura 8, del capítulo 3; tomando como base esta arquitectura, y los requerimientos explicados en la sección anterior, se presenta en la figura 11 el diagrama con los componentes a que se consideran necesarios para el asesor inteligente, a un nivel conceptual.

![](IV-Modelado_files/image002.gif)

#### Figura 11: Arquitectura general de ANGEL

Las entidades externas que interactúan con ANGEL son el profesor (humano), el alumno y el desarrollador.

- El profesor (humano), guiará al grupo de alumnos, ejecutar el rol de Transmisor del curso; y respaldar las funciones del Asesor, cuando está disponible. Para ello, podrá extraer información recabada por ANGEL, a través de la interfase propia para ello, que le indicará el comportamiento y errores comunes de un alumno, lo cual le permitirá dirigir mejor su asesoría o la transmisión de información sobre el curso.

- Los alumnos interactuarán uno a uno con ANGEL; su función será practicar la programación, lo cual harán a través de un editor de texto, donde escriben el código fuente, el cual servirá como interfase para que el asesor observe sus acciones y les retroalimente. Cabe aclarar que cada estudiante, por lo tanto, contará con su propia "copia" de ANGEL. El caso en el cual múltiples estudiantes interactúen con la misma instancia de ANGEL no será soportado, en la primera versión.

- El desarrollador, depurará las reglas, tanto en el modelo del dominio como en el modelo pedagógico, así como la gramática del lenguaje. Para la experimentación inicial, el desarrollador, profesor y autor de este trabajo, son la misma persona; sin embargo, se deja abierta la arquitectura de modo que otros profesores y desarrolladores puedan intervenir en la impartición del curso de Ensamblador, o bien en la adaptación de ANGEL para otro lenguaje.

Mientras que, a grandes rasgos, cada uno de los componentes de la arquitectura estará encargado de las siguientes funciones:

- La interfase será el conjunto de módulos y funciones encargados de interactuar con los tres actores indicados. De esta forma, incluirá: un módulo editor de texto, el cual proporcionará la interacción con el alumno; un módulo editor de reglas y gramática, para el desarrollador; y un módulo de información sobre el alumno que ha usado ANGEL, para el profesor.

- El modelo del experto contendrá el conocimiento sobre el lenguaje de programación. Se divide en tres partes: el _scanner_ o analizador léxico; el _parser_ analizador sintáctico; y las reglas del dominio, que permiten obtener deducciones de acuerdo a las acciones disparadas los analizadores léxicos y sintáctico, y por tanto, diagnosticar los errores cometidos, así como las probables intenciones del alumno.

- El modelo del estudiante representará el estado actual del conocimiento del estudiante, indicando qué conceptos se han dominado [34], así como las relaciones entre ellos; se construirá de acuerdo al diagóstico que ofrezca el modelo del experto.

- Finalmente, el modelo instruccional o pedagógico, basado en el modelo instruccional de Gagné, como se justificó en el capítulo 2, será un sistema experto que decidirá la estrategia o técnica instruccional que se usará para retroalimentar al alumno, según el diagóstico que ofrezca el modelo experto y el estado del modelo del estudiante.

El diseño específico para cada uno de estos componentes se analizará en las siguientes secciones.

### 4.4.2 Diseño de la interfase

#### 4.4.2.1. Interfase con el estudiante: Editor de programa

En el capítulo 2 se describió cómo es el proceso actual de enseñanza - aprendizaje de la materia; en particular, se determinó que las principales actividades del estudiante, fuera de la clase, son prácticas y ejercicios de programación.

Por ello, podemos delimitar el alcance del asesor ANGEL: debe estar 'disponible' en el momento en que el alumno está practicando la programación; es decir, en el momento en que está sentado frente a una computadora, desarrollando programas que resuelvan los problemas que tenga planteados.

El proceso de programación, independientemente de las etapas de análisis, diseño, y documentación, es ejecutado en una computadora; en los lenguajes de programación no visuales, tales como C y Ensamblador, la construcción de los programas requiere editar un código fuente, el cual es un texto en el lenguaje dado, y sigue la sintaxis y gramática del lenguaje correspondiente; posteriormente, el programador compila (o ensambla) su código, obteniendo código objeto y finalmente ejecutable, el cual queda listo para probarlo. Al ejecutarlo, la computadora procesará las entradas que se le proporcionen y entregará una salida, que se busca solucione el problema.

Observando esta dinámica de la práctica de programación, está claro que el momento donde el programador expresa sus ideas es cuando escribe su código fuente; todo asesor humano en el área de lenguajes de programación reconoce que el código fuente muestra el estilo y objetivos que se planteaba el programador [2] [E6]; en particular el autor ha tenido buenos resultados utilizando el correo electrónico como medio de asesoría, siempre y cuando el alumno envíe su código fuente, de cuyo análisis se pueden detectar concepciones erróneas, lo cual permite retroalimentar en forma efectiva al alumno.

Algunos asesores inteligentes aplicados a la enseñanza de la programación, tales como MENO [15], hacen un análisis del programa una vez escrito; y después de ello, informan al alumno de sus posibles errores. Otros, como COACH [7] y WEST [15], retroalimentan al alumno mientras que está editando su programa fuente; de ello viene que su comentario sea más oportuno. Existen teorías pedagógicas, como la de Skinner [13], que respaldan experimentalmente la estrategia de sentido común, consistente en que la retroalimentación debe ser lo más inmediata al estímulo, para ser efectiva. Por ello, ANGEL seguirá la segunda estrategia; sin olvidar la característica de no interrumpir al usuario, la cual es más efectiva según estudios en el área del diseño de interfases [6] [36], y es usada también en COACH y WEST.

De manera que se eligió como metáfora de la interfase, una que sea similar a la experiencia previa del alumno [6]. Se tomó en cuenta que en la generalidad de los lenguajes de programación, donde se desea aplicar ANGEL, tales como Ensamblador, C, Pascal, Java, LISP o C++, se usa un editor de texto para escribir el código, de manera que se siguió el modelo del editor de texto, con una interfase tradicional basada en menús _pull_-_down_, de la cual tenemos como ejemplos el _Edit de MS-DOS_ , el _Notepad de Windows_, el _ASMEdit en X-Windows_ y otros muchos editores similares. Sin embargo, el módulo editor es lo bastante independiente de los otros módulos, como para que ANGEL se integre en un futuro a otros editores, como puede ser el_vi_ en UNIX, o editores visuales como los que vienen incluidos en Microsoft Visual Basic  y Borland Delphi.

Un problema relacionado con la necesidad de que el usuario, en este caso el alumno programando, no sea interrumpido por el asesor, es el de plantear la interfase mediante la cual el asesor inteligente retroalimentará al estudiante. Como ejemplo, el asistente de Office 97 es una ventana que aparece repentinamente, cuando considera que es apropiado para el usuario, y le hace perder el foco de la ventana donde está editando, lo cual puede causar cierto retraso e incomodidad para el usuario. COACH resuelve este problema mediante una interfase dividida en paneles, la cual permite que en una ventana se edite, mientras en otra ventana aparecen los mensajes del asistente, en una forma que no interrumpe al usuario [7]. Se sigue esta idea para ANGEL, con dos consideraciones importantes basadas en principios del diseño de interfases [6] [36]: la ventana de mensajes del asistente es mucho menor que el espacio de trabajo para editar, a diferencia de COACH; y, para conseguir que el usuario tenga una sensación de control de la aplicación, además de dicha ventana le proporciona una opción de "ayuda", en la cual el alumno podrá pedirle consejo al asesor en el momento que considere lo requiera [36].

En conclusión, la interfase de ANGEL con el alumno constará de:

- Un editor de texto, con las características generales que se pueden encontrar en los editores comunes.

- Una ventana de retroalimentación, donde el alumno podrá ver las sugerencias que el asesor inteligente considere pertinente hacer.

- Una opción de solicitar ayuda, que le permitirá al alumno "pedirle pistas" al asesor ANGEL, en el momento que considere conveniente.

#### 4.4.2.2. Interfase con el profesor: Reportes de comportamiento del estudiante

Cuando el profesor humano combina los roles de transmisor y asesor, se puede reconocer que hay interacción entre ellos: por ejemplo, si el asesor observa un error, el transmisor informa al alumno sobre las partículas de conocimiento o conceptos teóricos que le ayuden a superarlo; del mismo modo, puede ejemplificarse que el transmisor repite un tema o lo parafrasea, cuando el asesor descubre que el grupo de alumnos no lo ha captado.

En el modelo de tres roles, donde el rol de asesor será cubierto por ANGEL, dicha interacción es menor. Por un lado, el profesor transmisor puede ajustar las reglas que dirigen el comportamiento de ANGEL, comportándose como desarrollador, tal como se trata en el siguiente apartado; pero sería desafortunado que el profesor humano, sea para su rol de transmisor o para extender el rol de asesor, no contara con información sobre el comportamiento previo del estudiante.

Por ello, además del código fuente del alumno, el profesor humano puede consultar el registro de la información recabada por ANGEL; esta información debe contener, entre sus elementos:

- Los errores que ha diagnosticado ANGEL, su tiempo y forma de resolución, en su caso.

- Resúmenes de los parámetros almacenados en el modelo del estudiante, y su evolución con el tiempo.

- Información sobre consultas realizadas por el alumno, y si fueron o no satisfactoriamente resueltas.

Se decidió que este módulo fuera separado del módulo editor a través del cual interactúa el alumno, para no hacer el módulo editor demasiado grande y en particular, que ocupara demasiada memoria, lo que impediría su aplicación práctica por parte del alumno; además de facilitar su distribución. Por ello, el funcionamiento del módulo consiste en tomar un archivo con los datos propios de un estudiante, y mostrar sus reportes a partir de dicha información. De esta manera, el profesor puede llevar su aplicación de interfase, en diskette, a la máquina del alumno y así obtener el reporte deseado; o al revés, pedir sus archivos de registro al alumno.

#### 4.4.2.3. Interfase con el desarrollador: edición de reglas, conceptos y gramática

Para entender más claramente este apartado, puede ser necesario considerar los apartados que se refieren al diseño del modelo del dominio y del modelo pedagógico, que se encuentran en las siguientes secciones, puesto que la interfase del desarrollador es dependiente de los detalles de dichos modelos.

Se asume que el desarrollador cuenta con los conocimientos apropiados de la arquitectura de ANGEL, así como de la teoría de compiladores [44] y sistemas expertos [30], suficiente para describir las reglas de la gramática, tales como BNF; y de la misma manera, conoce la sintaxis de las reglas usadas por el motor de inferencia. Como se explica en el capítulo 5, "Implementación de ANGEL", se usa LALR como compilador - compilador para obtener el analizador sintáctico, y CLIPS como API para el desarrollo de los sistemas expertos integrados en ANGEL; por ello, se usa dicha sintaxis para el planteamiento de las reglas, tanto de la gramática como de los sistemas expertos. De acuerdo a ello, ambos tipos de reglas se almacenan en archivos de texto: las de gramática, en un archivo GRM, y las de sistemas expertos, en archivos CLP. En el caso de cambiar la gramática, para conseguir la mayor eficiencia del analizador sintáctico, se tiene que recompilar, usando LALR para generar el nuevo código fuente del mismo. Sin embargo, en el caso de las reglas del sistema experto, basta con editar el archivo CLP y "compilar" las reglas, utilizando un programa auxiliar, para cambiar el funcionamiento del sistema experto, lo que permite fácilmente modificar el modelo pedagógico o el del dominio. Esto facilita su evolución rápida, distribuyendo nuevos archivos de reglas sin necesidad de cambiar el ejecutable del asesor.

En esta primera versión no se proporciona una interfase de mayor nivel para el desarrollador, salvo para la edición del archivo de conceptos; solamente una plataforma de código fuente, estructurada y modificable. Esto reduce el tiempo de desarrollo, sin embargo, por el momento solamente permite la adaptación de ANGEL por parte de un desarrollador especializado en el área de sistemas.

### 4.4.3 Diseño del modelo del dominio

#### 4.4.3.1. Generalidades

Para describir el modelo del dominio, se tomó el enfoque de dividir varias clases de conocimiento, requeridas por el alumno que está aprendiendo a programar en determinado lenguaje. Ya se había visualizado la necesidad de esta división en el capítulo 1, "Antecedentes", al comparar el aprendizaje de un lenguaje de programación con el lenguaje matemático.

Esta clasificación no es aleatoria; además de ser similar a las de otros asesores inteligentes, tales como COACH [7] y MENO [15], resulta natural al considerar las herramientas con las que las Ciencias Computacionales y la Inteligencia Artificial se han referido a dichas áreas para solucionar problemas de las mismas.

Las clases de conocimiento consideradas son:

- El léxico del lenguaje, es decir, qué palabras son válidas dentro del mismo y cuál es su función.

- La sintaxis del lenguaje, que indica cómo se relacionan las palabras en unidades sintácticas válidas.

- La semántica del lenguaje, que se refiere a extraer el significado propio de una unidad sintáctica válida; en el caso de los lenguajes de programación, generalmente representa la declaración de un elemento (variable, etiqueta, procedimiento) que será usado en otra sección del programa; o bien, una acción específico que se debe realizar.

- El conocimiento sobre las acciones comunes del lenguaje, específicos al mismo; por ejemplo, en Ensamblador se requiere del conocimiento sobre cómo llamar a una interrupción del sistema operativo, el cual no es usado en lenguajes de alto nivel como C, Pascal o Java. Del mismo modo, en Java se requiere conocer el nombre de los métodos que contiene una clase, para implementar apropiadamente una clase derivada de ella.

- El conocimiento sobre los errores y concepciones erróneas que suelen ocurrir al aprender el lenguaje, y cómo evitarlos.

- Finalmente, el conocimiento general a los lenguajes de programación, aplicable a los distintos lenguajes que serían usados; podría llamársele "el conocimiento sobre el paradigma de programación".

El conocimiento experto sobre el dominio, de acuerdo a las funciones que deberá realizar ANGEL, deberá ser suficiente para diagnosticar los errores más comunes cuando los estudiantes están en proceso de aprendizaje del lenguaje; se presenta una lista de errores comunes de acuerdo a la experiencia del profesor, en el apéndice B.

#### 4.4.3.2. Conocimiento sobre el léxico y la gramática

Ya se ha trabajado ampliamente en la teoría de la Computación y los lenguajes formales [44], por lo que se cuenta con herramientas que facilitan enormemente la construcción de los analizadores léxicos o semánticos. A estas herramientas se les suele llamar "compiladores - compiladores"; los más conocidos son las utilerías LEX y YACC disponibles ampliamente en las distintas versiones de UNIX en el mercado.

Se toma el enfoque de que el conocimiento sobre el lenguaje en este "bajo nivel", es estático; es decir, generalmente no va cambiando con el tiempo. Cuando se especifique un lenguaje de programación para que ANGEL apoye a los alumnos en su aprendizaje, puede conocerse completamente su léxico y su gramática. En cambio, el conocimiento sobre librerías, técnicas de programación y errores comunes, va perfeccionándose con el tiempo; por ejemplo, si bien el autor cuenta con casi 4 años impartiendo el curso de Ensamblador, y ha recabado más de 60 tipos de errores comunes, todavía suele encontrarse con nuevas categorías; conviene ir adicionando ese conocimiento que se va "descubriendo" o ampliando con el tiempo, por lo que se considera dinámico. Cuando se especifica un nuevo lenguaje, se conoce totalmente su léxico y sintaxis; pero con toda seguridad, aún no se han observado todas las problemáticas posibles a las que se enfrentarán los programadores.

Una limitante, resultado del enfoque tomado, es que cuando se requiera adaptar ANGEL a otros lenguajes, se tendrá que modificar la gramática y reconstruir el analizador léxico y sintáctico. Podría haberse evitado eso, si la gramática se expresara en forma de reglas que un analizador léxico y un analizador sintáctico genéricos tomaran en tiempo de ejecución, creando "al vuelo" la tabla de transiciones; sin embargo, esto hubiera tenido un fuerte costo en desempeño y requeriría el desarrollo de dicho analizador léxico y sintáctico, lo cual iba más allá del objetivo buscado; por otro lado, hubiera complicado el llamado dinámico de las funciones adicionales relacionadas con la generación de hechos en la base de conocimientos, según se van cumpliendo las producciones. De manera que puede resumirse que, por desempeño, se sacrificó generalidad, siguiendo la línea que han establecido la generalidad de los analizadores léxicos y sintácticos basados en tablas.

Para conectar el conocimiento de este nivel con el conocimiento basado en reglas utilizado en el siguiente nivel, como se describe en el siguiente apartado, las reglas gramaticales que indican la formación de una unidad sintáctica completa de código, es decir, de una instrucción completa, invocan a funciones externas, las cuales agregan hechos simples a la base de conocimiento. Como ya se explicó, el introducir reglas de inferencia en este nivel hubiera tenido un costo fuerte en desempeño; con el enfoque tomado, una regla de más alto nivel (un término de la gramática), se convierte en un ladrillo del más bajo nivel del sistema de inferencia usado en el siguiente nivel. Esto permite un balance entre el conocimiento dinámico y fácilmente adaptable, correspondiente al significado de las instrucciones en el contexto de un problema, o las técnicas de programación utilizadas; y el conocimiento estático, como es la sintaxis y gramáticas del lenguaje.

Dicho de otra forma: se hace la distición entre el conocimiento estático, descrito por la sintaxis y léxico del lenguaje de programación, pues una vez establecido el lenguaje, éste no cambia; y el dinámico, que según el experto adquiere más experiencia, puede ir evolucionando. El primero se implementó buscando el máximo desempeño; el segundo, como se ve en la siguiente sección, busca la máxima flexibilidad.

#### 4.4.3.3. Conocimiento particular del lenguaje

Más allá del léxico y la sintaxis, que están definidos por reglas claras, maquinales, y sin ambigüedad, existe el conocimiento de alto nivel sobre el lenguaje, que incluye al semántico, a los errores comunes, así como las acciones comunes del lenguaje. El conocimiento sobre la semántica se consideró dentro de esta clasificación, pues a diferencia de lo que ocurre con un compilador, no será un proceso monótono de traducción. Para el asesor, una instrucción puede tener un significado distinto, de acuerdo al contexto, pues no solamente se está realizando un análisis local sobre la acción que corresponde a la instrucción dada, sino un análisis global sobre sé su relación con otras instrucciones es coherente y consigue un fin determinado y de acuerdo a los patrones comunes de programación.

Gracias a la combinación de estos tres tipos de conocimiento, es posible realizar diagnósticos distintos a los que hace el compilador: además de los errores estrictos, se pueden reconocer errores de lógica, o estructuras correctas en el lenguaje pero cuya aplicación indica probablemente que el alumno ha asimilado erróneamente un concepto, o determinar que el estudiante ha dominado un concepto.

Este conocimiento se puede implementar mediante reglas, usando un motor de inferencia para procesarlas [30]. Se tomó en cuenta la posibilidad de representarlo por medio de redes semánticas, redes neuronales, y redes causales; sin embargo, se decidió usar reglas de producción para representar el conocimiento, técnica común en los sistemas expertos, por las siguientes ventajas:

- Otros métodos, como es el caso de las redes neuronales [42], son opacos; es decir, el conocimiento no se representa en una forma clara para el desarrollador; esto complica su transcripción, e impide que un experto en el lenguaje pero no experto en Inteligencia Artificial lo codifique.

- El proceso de inferencia es no monótono, es decir, es posible deducir primero conclusiones tales como "el alumno domina el uso de MOV", y después encontrarse con hechos o nuevas conclusiones que se opongan a la deducción anterior, lo cual sugiere la necesidad de retractar las conclusiones. Esto es difícil de hacer con otras técnicas, específicamente con las redes causales.

- Es deseable contar con relaciones distintas a causa - efecto, naturales de las redes causales, tales como son los conceptos de "es parte de" o "está formado por".

- Se ha demostrado que es siempre posible construir el equivalente a una red semántica, utilizando reglas. [18]

- Existe una mayor oferta de herramientas disponibles comercialmente o para usos educativos, en el área de sistemas expertos y motores de inferencia que en cualquiera de las otras opciones de representación de conocimiento mencionadas [30].

De entre las distintas formas de representar la incertidumbre, en el conocimiento representado por medio de reglas, tales como el uso de lógica difusa, o de factores de certeza, podemos observar que a pesar de su complejidad, el conocimiento sobre el uso de un lenguaje de programación está lo bastante bien definido como para considerar que las conclusiones referentes a las acciones o relaciones en el lenguaje, son necesariamente falsas o verdaderas, pero no pueden tener un valor intermedio de certeza.

La afirmación anterior se debe considerar como un teorema, basado en la observación del contexto; en la observación de que las decisiones entre alternativas de implementación suelen ser tomadas basándose en factores no ambiguos; y en la reflexión sobre los "tips" que el profesor suele proporcionar a los alumnos, que toman precisamente la forma "Si (_determinadas condiciones ocurren_) utiliza (_tal técnica, tal instrucción, o tal truco_) para (_hacer más veloz la ejecución, usar menos memoria, escribir menos código_)". No se pudo encontrar un contraejemplo, por lo cual, se decidió explorar la opción de implementar ANGEL utilizando reglas sin el manejo de incertidumbre. Esto hace más fácil la adaptación de las reglas por parte de un experto humano en el dominio, sin menoscabo de que, de ser necesario, puede posteriormente sustituirse el motor de inferencia por uno que soporte incertidumbre y extender las reglas del dominio para que la manejen. Esto ocurriría, por ejemplo, en caso de encontrar un contraejemplo, una regla o conclusión que fuera complejo implementar sin manejo de incertidumbre.

#### 4.4.3.4. Conocimiento general del paradigma de programación

Independientemente del lenguaje que se domine, es un hecho conocido y generalmente aceptado el que un experto programador humano, en un lenguaje imperativo como C o Pascal, puede transferir dicho conocimiento experto de las técnicas que usa para programar, a otros lenguajes como Ensamblador o Basic. También se reconoce que existe una menor transferencia del conocimiento cuando se desea aprender un lenguaje de programación que sigue otro paradigma, como pueden ser el aprendizaje Java y Smalltalk (paradigma orientado a objetos) para un programador en Basic; o de LISP o Miranda (lenguajes funcionales), para un programador de Ensamblador.

La conclusión que se obtiene de dichas observaciones, es que existe un cierto conocimiento transferible entre los distintos lenguajes. Por ejemplo, las reglas referentes a dividir el código en pequeños módulos, incluir comentarios con determinada frecuencia, evitar los ciclos infinitos, o no colocar una instrucción en un punto inalcanzable, tal que nunca se ejecute, son aplicables a todos los lenguajes de programación imperativa, y más o menos transferibles a aquellos orientados a objetos. Del mismo modo, las reglas sobre cómo aplicar el uso la herencia o el polimorfismo, aunque sea en distinta forma, tanto a C++ como a Java. Por ello se propone que este conocimiento se coloque en una clase diferente, la cual para este trabajo se llamará "conocimiento general del paradigma de programación", lo cual permitirá que dicha sección del conocimiento se transfiera con un mínimno de modificaciones al cambiar de un lenguaje de programación a otro.

### 4.4.4 Diseño del modelo del estudiante

Uno de los factores críticos para que el asesor ANGEL tenga buenos resultados, es el conocimiento con el que cuente sobre el alumno al que está asesorando. Por ello, la representación del conocimiento sobre el alumno, conocida como "el modelo del estudiante" siguiendo la arquitectura general de Sistemas Tutores Inteligentes propuesta por Kaplan [11]; la cual corresponde con el módulo conocido como "modelo del usuario", dentro de la arquitectura general de Sistemas Adaptativos propuesta por Benyon y Murray [20].

En primer lugar, se va a profundizar en algunos detalles de la implementación que otros trabajos han realizado de estos modelos; posteriormente, se hará referencia al modelo instruccional y cómo representa al estudiante; para finalmente, integrando las ideas recabadas, explicar cómo será el modelo del estudiante usado por ANGEL.

#### 4.4.4.1. Modelo usado por COACH

Selker, para implementar COACH [7], usa un modelo explícito del usuario, compuesto por marcos (_frames_), hechos y reglas. Existen dos marcos por cada concepto a aprender: uno "de la materia", que contiene el conocimiento invariante del concepto, y corresponde al modelo del dominio; y uno "adaptativo", que corresponde a una parte del modelo del estudiante, y contiene los siguientes atributos (_slots_) o características del usuario: experiencia, latencia, calificación global, tasa de aprendizaje, y ejemplos específicos. Estos conceptos se describen a continuación.

- La experiencia se define como cuántas veces se ha usado el concepto a aprender.

- La latencia indica cuánto tiempo ha pasado desde que fue usado el concepto.

- La calificación global mide en general qué tan bien ha sido usado el concepto.

- La tasa de aprendizaje es la tasa de cambio en la calificación global.

- Finalmente, los ejemplos específicos son una lista de los errores en que ha caído un usuario respecto al concepto, y cómo los ha solucionado.

Estos conceptos se encuentran en una red semántica, que contiene principalmente las relaciones de "conocimiento requerido" y "conocimiento relacionado"; de manera que se pueden distinguir los conocimientos que son prerrequisitos, y otros conocimientos que si bien no son requeridos, es pertinente contar con ellos para dominar el concepto que está relacionado con ellos.

Cabe hacer notar que los valores que pueden tomar los atributos, ya no son simplemente verdadero o falso. En este caso, se requiere algún tipo de medida de estos atributos, tal como "bajo" o "alto". De modo que las reglas que operen con este conocimiento, requerirán de algún tipo de manejo de incertidumbre, o bien de definir con precisión conceptos difusos como los anteriores, como se hace cuando se toman valores umbral y se usan operadores de comparación. Por ejemplo, "calificación baja" puede definirse como "calificación < 70".

También se cuenta con un atributo implícito adicional, que es el nivel de ayuda que requiere el usuario, e indica cómo catalogar al usuario: novato, intermedio, profesional o experto. Este nivel de ayuda requerida está directamente relacionado con la forma en la que se presenta la asesoría al alumno.

#### 4.4.4.2. Modelo del usuario manejado en el asistente de agenda CAP

CAP (Aprendiz de Calendario) [17] es un asistente inteligente, cuyo objetivo consiste en llevar la agenda del usuario, como lo haría una secretaria. Para ello, requiere conocer el comportamiento común del usuario, al que se ajusta, aprendiendo de la experiencia.

El contexto donde trabaja el asistente, es un ambiente para manejar una agenda en línea y correo electrónico. Se pueden registrar citas, juntas y otras tareas en la agenda, y dichos eventos pueden marcarse como tentativos o confirmados. En particular, la organización de juntas utiliza el correo electrónico para enviar las invitaciones y recordatorios. Existen otros comandos útiles, tales como la impresión de la agenda.

El tipo de comportamientos que CAP aprende del usuario, incluye el tiempo o duración de una junta, el lugar donde se realizará, su hora y fecha; y con ese conocimiento, puede sugerir dichos atributos cuando el usuario desea convocar una junta; así como aceptar o declinar en forma tentativa, las invitaciones que reciba en ausencia del usuario.

Se usa el algoritmo ID3, también conocido como "algoritmo de entropía", para descubrir los patrones comunes en el comportamiento del usuario. Con este algoritmo se pueden crear reglas, las cuales requieren el mínimno de factores para diferenciar entre dos conclusiones distintas.

De esta forma, todo el conocimiento que maneja CAP sobre el usuario se puede dividir en dos partes:

- Ejemplos anteriores, que conserva los últimos 180 ejemplos de reuniones. Este tamaño fue escogido como un número de ejemplos suficiente para el entrenamiento. Este conocimiento puede considerarse como "hechos", con atributos específicos al dominio como son la hora, lugar y asistentes a la reunión.

- Reglas inducidas, utilizando ID3, a partir de dichos ejemplos. Un ejemplo de una posible regla sería "si el director asiste a la reunión, la reunión es en Dirección General, con un factor de certeza del 100%". Esta regla habría venido de encontrar que el valor "director" en el atributo "asistentes" de los ejemplos anteriores, estaba correlacionado con el atributo "lugar" con el valor "Dirección General, y que no se encontró ni un contraejemplo del mismo. Puede decirse que el conocimiento de alto nivel sobre el usuario, el que puede ser transferible, se encuentra en esta parte, pues describe más claramente y en forma más general los comportamientos inherentes al usuario.

#### 4.4.4.3. Modelo del alumno según Gagné

Como se revisó en la sección 2.7, para Gagné el alumno se modela como un procesador de información, el cual contiene sensores, un registro sensorial, una memoria de corto plazo, una memoria de largo plazo, un generador de respuestas, efectores, el control ejecutivo y las expectativas [13]. Estos parámetros son entidades modelables, que en conjunto pueden servir como un modelo del estudiante.

Los sensores y efectores no son modelados en ninguno de los trabajos analizados en esta sección. Más bien, tanto el usuario como la interfase inteligente tienen acceso a un conjunto común de información, que perciben por sus "sensores"; y el efecto del comportamiento del usuario, también puede ser percibido por la interfase. De modo que la interfase resulta una abstracción apropiada para los sensores y efectores del alumno; y el estado actual de "hechos" relacionados con la interfase, puede considerarse equivalente al registro sensorial propuesto por Gagné.

La memoria de corto plazo puede ser representada, como se hace en CAP, registrando los últimos _n_ ejemplos del comportamiento del alumno. CAP utiliza los ejemplos recientes para obtener "reglas nuevas", las cuales suelen ser válidas durante un corto plazo.

En CAP, según una regla deducida va siendo utilizada, y la tasa de éxito de dicha regla es alta, se refuerza esa regla y pasa a formar parte del conjunto de "reglas viejas". Este conjunto de reglas puede asemejarse a una memoria de largo plazo.

En el caso de COACH, ambos tipos de memoria son implícitamente representados, en forma de ejemplos explícitos, tanto como en los atributos abstraídos del aprendizaje, como es la latencia y la tasa de aprendizaje.

El generador de respuestas es una parte que no se modela en COACH, para el estudiante; el conocimiento del dominio es un modelo de lo que se espera del generador de respuestas, pero no se representa el del alumno. Por otro lado, en CAP las reglas inducidas no son otra cosa sino una representación explícita del generador de respuestas del usuario; CAP predice la respuesta del usuario, porque ha adquirido el conocimiento sobre la regla que utiliza el usuario para decidir.

El control ejecutivo es la estrategia de aprendizaje que el alumno usa para modificar su generación de respuestas y transferir la información registrada, a la memoria de corto y largo plazo. Para representar este "control ejecutivo", se requeriría conocer sobre los posibles estilos de aprendizaje de un alumno [28], de modo que se le clasifique dentro de uno de ellos. La teoría 4-MAT [21] puede ser utilizada para definir estos estilos, con lo que el estilo de aprendizaje se convierte en un atributo concreto del modelo del estudiante, que puede afectar la estrategia instruccional que ANGEL usará con ese alumno en particular.

Finalmente, las expectativas del alumno afectan el proceso de aprendizaje. Para representarlas, al igual que se hizo con el control ejecutivo, conviene contar con una teoría que permita clasificar a los alumnos en un número finito de clases, de acuerdo a sus expectativas, y reconocer qué comportamientos son propios de cada clase. Afortunadamente, el mismo modelo 4-MAT indica las expectativas del alumno de acuerdo a su estilo de aprendizaje; de modo que, bajo la premisa del uso de este modelo, el control ejecutivo y las expectativas se pueden ver reflejados en reglas dependientes de una sola variable, que es el atributo "estilo de aprendizaje" del estudiante.

#### 4.4.4.4. Resumen de requerimientos del modelo del estudiante

Se requiere modelar la memoria de corto y largo plazo, así como el generador de respuestas, en forma de reglas o hechos; la adaptabilidad del modelo se hace más sencilla si se usan reglas [5], pero es más sencillo implementar el modelo en forma de hechos, los cuales son procesados por reglas adicionales, establecidas por el desarrollador.

Por otro lado, el control ejecutivo así como las expectativas se pueden consolidar mediante el conocimiento del "estilo de aprendizaje" del alumno, y reglas fijas obtenidas por el modelo de estilos de aprendizaje; ambos se tomarán del modelo 4-MAT.

Se resumen a continuación los campos o atributos que se requerirá almacenar en el modelo del estudiante, así como las reglas que se requerirán para complementarlo.

- Una lista de los conceptos que se han manejado, y para cada concepto su experiencia, latencia, calificación global, tasa de aprendizaje, y nivel de asesoría requerido; así como la fase de aprendizaje, requerida por el modelo de Gagné.

- Ejemplos anteriores, que se organizan como una lista de hechos.

- Estilos de aprendizaje y la dominancia de uno u otro hemisferio.

- Con objeto de personalizar al asesor, el nombre y matrícula del alumno [38].

#### 4.4.4.5. Reglas para calcular o estimar los parámetros requeridos

La experiencia se calculará como el número de veces que se ha manejado el concepto [7]. De modo que cada vez que se use el concepto, se incrementará el coeficiente asociado.

La latencia se describe almacenando la fecha y hora cada vez que se maneje el concepto, y se calculará mediante la diferencia entre el momento actual y el tiempo almacenado en que se usó.

La calificación global será la resultante de dividir el número de veces que se ha manejado correctamente el concepto, entre la experiencia.

La tasa de aprendizaje se calculará como el promedio del cambio de la calificación global en las últimas _n_ veces que se ha manejado el concepto. Por lo tanto, requerirá de almacenar las últimas _n_ calificaciones globales.

De acuerdo a los resultados del modelo instruccional, para cada vez que se maneja erróneamente el concepto, se propone una forma de retroalimentar al estudiante, correspondiente a un nivel de asesoría. Si este nivel es satisfactorio y proporciona el resultado esperado, se almacena dicho nivel para la ocasión _i_ que se usa el concepto. De lo contrario, se eleva el nivel de asesoría y se retroalimenta nuevamente al alumno con ese nuevo nivel. El nivel de asesoría almacenado en el modelo del estudiante, será formado por dos partes: los últimos _n_ niveles de asesoría, así como el promedio de dichos últimos _n_ niveles.

La fase del aprendizaje indicará si el alumno se encuentra en la fase de motivación, aprehensión, adquisión, retención, recuerdo, generalización, el desempeño o la retroalimentación que indica si se alcanzó el objetivo; estas fases ya fueron descritas al analizar el modelo de Gagné.

Las reglas requeridas por el modelo serían aquellas que permitan la evolución del mismo; en una primera versión, se sigue el enfoque de COACH, consistente en usar reglas fijas, y de representar el generador de respuestas del alumno como el conjunto de reglas dentro del modelo del dominio que aparentemente el alumno está aplicando, de acuerdo al diagóstico realizado sobre el alumno.

Los ejemplos específicos serían hechos observados; principalmente se referirán a las conclusiones obtenidas sobre errores cometidos por el alumno, así como los usos correctos del concepto.

El estilo de aprendizaje puede abstraerse reconociendo ciertos comportamientos comunes; existen 4 estilos, que se combinan en distintas circunstancias; y están relacionados con dos tipos de técnicas de procesamiento, que corresponden con los hemisferios derecho e izquierdo del cerebro. Por ello, la forma en que se representa esta información sobre el estudiante está dada en seis contadores: L1, L2, L3, L4, HI, HD; cada uno de ellos representará el número de "pruebas" o hechos que respalden dicho estilo de aprendizaje (L1 a L4), o el uso de ese hemisferio (HI o HD). De este modo, las reglas instruccionales podrán tomar en cuenta si el estudiante procesa predominantemente usando el hemisferio izquierdo o derecho, y si su estilo de aprendizaje es tipo 1, 2, 3 y 4\. Las reglas específicos vendrán de las definiciones de los estilos de aprendizaje, dadas por el método 4-MAT, que a continuación se indican.

- El estilo de aprendizaje 1 (correspondiente al contador L1), percibe en forma concreta y reflexiva; aprenden escuchando y compartiendo ideas. Su pregunta descriptiva es "¿Por qué?".

- El estilo de aprendizaje 2 (contador L2), es abstracto y reflexivo; aprenden en forma racional y lógica, forman teorías y diseñan estructuras. Su pregunta descriptiva es "¿Qué?".

- El estilo de aprendizaje 3 (contador L3), es abstracto y activo; aprenden probando las teorías, son sujetos de acción inmediata. Su pregunta descriptiva es "¿Cómo funciona?".

- El estilo de aprendizaje 4 (contador L4), es concreto y activo; aprenden por ensayo y error. Descubren por sé mismos, en forma creativa. Su pregunta descriptiva es "¿Qué pasaría si...?".

Del mismo modo, para describir la dominancia de los hemisferios, el modelo nos sugiere características como las siguientes:

- En el hemisferio izquierdo se procesa en forma racional; el pensamiento es verbal; se requiere información lógica y objetiva; y el proceso es analítico y secuencial. Se eliminan los sentimientos, se es "imparcial".

- En el hemisferio derecho se procesa en forma intuitiva; el pensamiento es visual; los juicios son subjetivos y creativos; es un pensamiento sintático y paralelo Intervienen fuertemente los sentimientos, se siguen corazonadas.

El desarrollo de las reglas que asocien un comportamiento observado en el alumno con descubrir su estilo de aprendizaje y la dominancia de hemisferios cerebrales es un ejercicio fuera del alcance de este trabajo. Sin embargo, en el prototipo de ANGEL se demuestran unas cuantas de estas reglas, con el objetivo de comprobar que pueden ser usadas para ampliar el alcance del perfil del estudiante.

#### 4.4.4.6. Proceso de adaptación del conocimiento sobre el estudiante

El modelo del estudiante se almacena en una base separada de hechos; se crea un perfil con valores por defecto para el perfil del estudiante, salvo su nombre y matrícula; y la interacción con el estudiante genera hechos. Algunos de estos hechos son usados para diagnosticar los errores, y son premisas usadas por reglas en el modelo del dominio; pero también se usan para el modelo del estudiante, pues indican el afectar la experiencia o latencia de un concepto. Del mismo modo, algunas de las conclusiones obtenidas en el diagóstico, afectarán a las variables dentro del modelo del estudiante.

De acuerdo a la definición manejada por COACH, los atributos internos de un concepto, se recalculan continuamente, como función de su valor anterior y a los nuevos hechos presentados. Esto se logra creando unas cuantas funciones de usuario, invocadas por el sistema de inferencia al cumplirse las reglas o por el analizador léxico cuando una producción se completa. Estas funciones permiten registrar que se está usando un concepto, y por tanto incrementar su índice de uso (experiencia); se indica si el uso fue correcto o inapropiado, y automáticamente se actualiza la Latencia del concepto, ajustándola a 0\. Si el concepto usado es el mismo que estaba registrado como "Concepto Actual", no se incrementa la experiencia; si es uno distinto, se marca el tiempo actual como el tiempo de último uso del concepto anterior, antes de ajustar el nuevo concepto como concepto actual. En este enfoque, solamente se puede manejar un concepto a la vez; en un futuro se puede explorar el tener un cierto número de conceptos concurrentes.

### 4.4.5 Diseño del modelo instruccional o pedagógico

ANGEL cuenta con conocimiento sobre cómo y cuando retroalimentar al estudiante, de acuerdo a su perfil y al diagóstico con el que se cuenta. Para ello, utiliza un subconjunto de las técnicas que utiliza el asesor humano; ejemplos de las reglas instruccionales se encuentran en el apéndice C.

Cuenta también con reglas que le indican cuándo aplicar dichas técnicas instruccionales, de acuerdo al estado actual del conocimiento del estudiante, su estilo de aprendizaje y los tipos de errores que el experto diagnostica en el momento.

El modelo de Gagné, que se seleccionó como un modelo apropiado para implementar la estrategia instruccional, requiere de conocer la fase del aprendizaje, y los procesos que ocurren dentro de ella; y establece los estímulos externos que debe proveer el instructor para facilitar la ocurrencia del aprendizaje.

Se utilizarán de esta manera, tácticas bien definidas [24], de acuerdo al nivel de aprendizaje establecido.

En primer lugar, durante la fase de motivación, dirigir las expectativas del alumno. Esta táctica queda reservada al profesor transmisor, debe ocurrir antes de que el alumno empiece a programar y usar el asesor ANGEL. Por ello, ANGEL asume como fase inicial, la fase 2 (dirigir la atención).

En la segunda fase, se debe dirigir la atención del alumno. El asesor puede participar en esta fase, al resaltar los errores que detecte, permitiendo que el alumno los note. De modo que el primer nivel de asesoría, siguiendo el modelo, será "llamar la atención del alumno hacia una línea de su programa".

En la tercera fase, Gagné sugiere estimular la memoria. Por ello, la siguiente estrategia de asesoría, correspondiente al segundo nivel, consistirá en que ANGEL le proporcione una "pista" sobre la causa del error.

Otra estrategia sugerida por Gagné en esta fase indica "guiar el aprendizaje". El tercer nivel de asesoría de ANGEL consistirá en indicarle al alumno la referencia sobre el tema o apunte que le conviene repasar para superar el error.

El cuarto nivel de asesoría, cuando el error siga sin ser corregido, consistirá en hacer una referencia donde se explique a un nivel "novato", cómo corregir el error específico.

Finalmente, un quinto nivel de "asesoría", el cual será usado por ANGEL si el alumno aún no logra corregir el error, será apoyarse en el profesor humano; ANGEL recomendará el uso del correo electrónico y registrará el hecho, el cual podrá ser usado por el profesor humano al recibir el reporte del modelo del estudiante.

Mientras el alumno está recibiendo asesoría de nivel 4 o 5 sobre un concepto, se considerá que se encuentra en la fase 2 (dirigir la atención) del aprendizaje de dicho concepto; cuando se le proporcione asesoría en nivel 3, se considerá que se encuentra en la fase 3 (adquisión); similarmente, si con un nivel 2 de asesoría basta para resolver el problema, se considerá que se encuentra entre las fases 4 (retención) y 5 (recuerdo) del aprendizaje; cuando se use un nivel 1 de asesoría, se le considerá entre las fases 6 (generalización) y 7 (desempeño). Cuando no se requiera asesoría, es decir, no se cometan errores, se podrá considerar que se ha alcanzado la fase 8 del aprendizaje (retroalimentación).

El uso del resto de las estrategias instruccionales propuestas por Gagné, se hará según descienda el nivel de asesoría requerido. La estrategia "promover la retención", correspondiente a las fases 4 y 5 del aprendizaje, se implementa al utilizar el historial del atributo "nivel de asesoría". Cada vez que se va a dar asesoría sobre un mismo concepto, si las demás condiciones son similares, ANGEL intenta asesorar al alumno usando un nivel menor al anterior; de este modo, un mayor nivel de aprendizaje del alumno deberá reflejarse en solucionar un problema que ya había solucionado, requiriendo de menos asesoría.

De este modo, un concepto no se considera dominado sino hasta que se ocupe correctamente y sin requerir ningún tipo de asesoría; sin embargo, la calificación va subiendo, según el alumno disminuye su nivel de asesoría y por tanto, el número de errores en que cae al usar dicho concepto.

La estrategia "promover la transferencia", correspondiente a las fases 6 y 7 del aprendizaje, se implementa gracias a la relación de "conceptos relacionados". El nivel de dominio de un concepto se ve afectado por el nivel de dominio de sus conceptos relacionados; de forma que un error en la aplicación de un concepto, deberá propagarse como un posible error o concepto erróneo, que deberá representarse en los conceptos relacionados. De este modo, se refuerza la probabilidad de que el asesor inteligente sugiera al alumno el estudio de un tema que está indirectamente relacionado con el error, pero en realidad pudiera ser la causa de que el alumno no comprenda totalmente el concepto actual, directamente relacionado con el error diagnosticado.

Por último, cuando se alcanza un nivel de desempeño apropiado, o se da un gran salto en el nivel de asesoría requerido, es decir, se puede considerar que el alumno está dirigiéndose a la fase de refuerzo, ANGEL retroalimenta al alumno, felicitándolo por el buen desempeño observado.

## 4.5. Conclusiones

De acuerdo a los modelos seleccionados, expuestos en este capítulo, se cuenta con las bases para plantear la arquitectura física del sistema, sobre la que se fundamenta la implementación.

Haciendo una recapitulación, el asesor inteligente que se desarrolla en este trabajo, utilizará los siguientes modelos y herramientas:

- La interfase con el alumno: se basa en el paradigma del editor de texto, el cual está integrado con la parte "observadora" del agente, que permite inducir hechos de acuerdo al texto (programa) que el alumno escribe.

- La interfase con el profesor humano, consiste de una herramienta de reportes, los cuales se obtienen directamente del modelo del estudiante, almacenado en archivos.

- La interfase con el desarrollador es a través de la edición directa de las reglas gramaticales o las reglas de producción, las cuales son usadas tanto en el modelo del dominio como en el modelo instruccional.

- Modelo del dominio: basado en dos partes, el análisis léxico y sintáctico; y la representación del conocimiento dinámico, sea específico al lenguaje o general al paradigma de programación asociado; el análisis léxico y sintáctico se implementa como conocimiento estático, el cual se debe programar explícitamente como la gramática usada por un compilador - compilador para generar los módulos correspondientes; mientras que el conocimiento dinámico se implementa en forma de reglas, y es el que se adquiere del experto del lenguaje utilizando la metodología de desarrollo de sistemas expertos; ya que este evoluciona continuamente, se implementa en reglas que se interpretan por el motor de inferencia del asesor inteligente, con un cierto costo en el desempeño, ganando mayor generalidad.

- Modelo del estudiante: tomando como referencia trabajos anteriores, se sugiere un registro adaptativo que representa las características propias del alumno, como su nombre, matrícula, estilos dominantes de aprendizaje, y dominancia hemisférica en dicho aprendizaje; así como un historial de ejemplos de las situaciones a las que se ha enfrentado el alumno; y una lista de los conceptos que maneja, y cuantificadores del aprendizaje sobre cada uno de los conceptos.

- Modelo instruccional: sigue el de Gagné, implementado en forma de reglas que se disparan de acuerdo a la fase en que se encuentra el alumno, que a su vez se deduce del nivel de asesoría requerido. Estas reglas son procesadas por el motor de inferencia, usado también en el diseño del modelo del dominio; sin embargo, se encuentran en una "base de conocimiento" separada, lo que permite su sustitución sin afectar al modelo del dominio.

El establecimiento de estos modelos permite pasar a la fase de construcción de ANGEL, que se explica con el detalle pertinente, en el próximo capítulo; así como diseñar experimentos que permitan validar que ANGEL sea útil para los alumnos, de acuerdo a su diseño. Se propone un experimento, el cual se desarrollará en el capítulo 6, y comprobará la funcionalidad del asesor inteligente una vez implementado.
