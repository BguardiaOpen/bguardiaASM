# PROPUESTA DE TESIS

**ASESORES INTELIGENTES PARA APOYAR EL PROCESO DE ENSEÑANZA DE LENGUAJES DE PROGRAMACIÓN**

Aspirante: [Bruno Guardia Robles](mailto:bguardia@itesm.mx)

Asesor: Dr. Marc Boumedine Montaner

Comité de tesis:

* [Dr. Carlos Rodríguez Lucatero](mailto:lucatero@itesm.mx)
* [M.C. Enrique David Espinosa Carrillo](mailto:eespinos@itesm.mx)

![](line1.gif)

**CONTENIDO**

1. [ANTECEDENTES](#1---antecedentes)
2. [PLANTEAMIENTO Y JUSTIFICACIÓN DEL PROBLEMA](#2---planteamiento-y-justificación-del-problema)
3. [OBJETIVOS](#3---objetivos)
4. [TRABAJO PROPUESTO](#4---trabajo-propuesto)
5. [BIBLOGRAFÍA](#5---biblografía)

* [LISTA DE FIGURAS](#lista-de-figuras)
* [LISTA DE TABLAS](#lista-de-tablas)

![](line1.gif)

### 1 - Antecedentes {#1---antecedentes}

Dentro de la enseñanza de los lenguajes de programación, tenemos como objetivos generales el conseguir que los alumnos desarrollen sus habilidades, y adquieran los conocimientos necesarios, para desarrollar programas y sistemas computarizados que resuelvan problemas reales.

Durante mi experiencia como instructor y profesor de diversos lenguajes de programación, he discriminado algunas de las habilidades con las que un instructor de estos lenguajes debe contar:

* Conocimiento profundo del lenguaje y sus elementos.
* Capacidad de detectar errores de lógica rápidamente.
* Experiencia sobre los errores comunes al usar el lenguaje.

Por otro lado, dadas las circunstancias en que estoy estudiando la Maestría en Ciencias Computacionales, en el esquema vía satélite de la Rectoría de Universidad Virtual del ITESM, también he tenido contacto con la necesidad de apoyarme en material electrónico tanto como tradicional, para apoyar el autoestudio. Y con ello, me he interesado en aplicar las tecnologías computacionales, relacionadas con mi área, a la enseñanza, especialmente en forma virtual (sin la presencia del profesor). Dentro del Sistema ITESM, he podido observar algunos ejemplos de estas aplicaciones. \[8\] \[Espinosa 95\] \[31\].

Durante el desarrollo de sistemas en empresas de consultoría, para diversos clientes y compañías, he constatado las dificultades que los usuarios tienen para usar efectivamente las computadoras. A esto he agregado la experiencia adquirida al impartir el curso de Diseño de Interfase Hombre-Máquina; y el conocimiento de la tecnología de agentes inteligentes usados como asistentes, en la búsqueda de patrones en bases de datos (_Data Mining_), en la red mundial Internet (_Internet Agents_), como guías en el manejo de un GUI o asistentes que proporcionen sugerencias en el manejo de un paquete computacional (Asistente de Ideas de Microsoft Excel) y en la configuración automática de la interfase con el usuario. \[Schneiderman 1992\].

Una observación adicional es que una de las actividades más importantes en el aprendizaje de los lenguajes de programación es la práctica en la Máquina; y existe la solicitud del alumno, de retroalimentación y supervisión a cargo del profesor; donde las observaciones que el profesor con su experiencia puede aportar al alumno, sirven como refuerzos en el proceso de enseñanza-aprendizaje

Así, surge la idea, que se desarrolla en esta propuesta, de contar con una herramienta automatizada, capaz de asistir al alumno, apoyando las actividades de supervisión del profesor, tanto en la escuela como en forma remota o en casa. Esta se considera que será una aplicación de la Inteligencia Artificial, siguiendo el enfoque de Minsky, según el cual entra dentro de esta disciplina todo sistema computacional que realiza funciones que requerirían inteligencia, de ser llevadas a cabo por seres humanos. Definitivamente, en nuestra percepción subjetiva y según nuestro concepto intuitivo de inteligencia, un profesor apoyando al alumno en la resolución de sus dudas, generalmente explicando o corrigiendo, usa su inteligencia para ello.

Este proyecto será desarrollado como un proyecto de investigación personal, surgido de inquietudes personales y relacionado con el plan de impartición de la materia de Lenguaje Ensamblador, a cargo mío, en el ITESM-CCM, durante el semestre enero - mayo de 1997. Se encuentra dentro del contexto de un proyecto mayor, de mejora en la enseñanza apoyada en métodos computacionales, el cual ha sido un proceso que he desarrollado desde agosto de 1995; y que planeo apoyar con proyectos adyacentes, tales como el uso de multimedia y páginas WWW para la distribución de información.

El proyecto ha obtenido el apoyo por parte del Departamento de Computación y los directores de las carreras profesionales que cursan los alumnos de la materia ya mencionada, en cuanto a su difusión, y sobre todo al permitirme la libertad de cátedra necesaria para llevar a cabo este proyecto.

![](line1.gif)

### 2 - Planteamiento y JUSTIFICACIÓN del problema {#2---planteamiento-y-justificación-del-problema}

**2.1 Planteamiento del problema.**

Una de las actividades más comunes de un instructor de lenguajes de programación, especialmente en el ambiente de un laboratorio de cómputo, consiste en la supervisión y asesoría del instructor al alumno, directamente sobre los programas que está realizando como ejercicio, en la computadora. Esta actividad puede considerarse como benéfica, pues permite que el instructor se adapte a las necesidades de cada alumno, detectando los puntos que no se han entendido Así como los problemas a los que el alumno personalmente se enfrenta en el aprendizaje del lenguaje. Además, las experiencias y observaciones que el instructor encuentra en este proceso de asesoría, le permiten resaltar los puntos importantes y le proporcionan una retroalimentación con la que puede controlar mejor el desarrollo de su clase, adaptándola a las circunstancias.

Desafortunadamente, esta actividad puede verse limitada por tiempo, espacio y recursos. Entre los problemas y limitaciones que se observan al analizar la actividad de asesoría en la programación, descrita en el párrafo anterior, están las siguientes:

* La atención del profesor está dividida entre muchos alumnos; por lo que aun si puede asesorar a cada uno, no siempre bastará el tiempo que dedica a un alumno en particular para resolver todas sus dudas; aun si todos los alumnos apreciarán y se beneficiarán por la asesoría, no a todos les bastaría la información recibida de ella. Inclusive si un alumno resuelve todas sus dudas, con más tiempo el profesor tendría la posibilidad de ampliar el conocimiento que le transmite. Este problema se agudiza cuando el grupo es grande.
* Cuando el alumno estudia por su cuenta, no tiene al profesor disponible para dicha asesoría.
* Cuando el alumno realiza sus tareas o proyectos de programación, normalmente no es durante la hora de clase. Por ello, no siempre puede resolver sus dudas en el momento que surgen, sino que suele existir un lapso de tiempo desperdiciado entre el momento que surge la duda y cuando el profesor está disponible para resolverla. Por otro lado, si el alumno no registra la duda, puede más tarde olvidarla y dejarla pendiente, con lo que no se consiguen completamente los objetivos del proceso de enseñanza-aprendizaje.
* Es difícil la asesoría remota, pues aunque el profesor está disponible a través de medios como el teléfono o el correo electrónico, no tiene el acceso a toda la información, por ejemplo al código fuente o a la salida de errores dada por el programa, como puede tenerlo el alumno.
* Si un laboratorio no cuenta con suficientes Máquinas, es posible que los alumnos lo usen en diversos horarios; por lo que el profesor no podrá asesorarlos a todos en el momento que lo requieran.

Para reducir estas limitantes, se propone atacar al problema siguiente:

_¿Cómo conseguir reducir o eliminar las limitantes de tiempo, espacio y recursos del proceso de asesoría del profesor al alumno durante la práctica de programación, apoyados en medios computacionales?_

Este problema, como se ha visto, se presenta cuando el alumno durante su práctica de programación, empieza a tener dudas o problemas; y no cuenta con el profesor para asesorarlo.

Para describir más a fondo el problema, se enumeran las razones más comunes que llevan al alumno a requerir una asesoría:

* Errores de sintaxis.
* Otros errores y advertencias en la compilación.
* Ambigüedades del lenguaje.
* Seguimiento incorrecto del programa.
* Fallas por efectos colaterales no previstos.
* Conceptos equivocados sobre los recursos y técnicas utilizadas.
* Errores de lógica de programación.
* No se ha entendido el Paradigma de programación asociado al lenguaje.
* Falta de conocimientos y práctica de técnicas de programación eficaces.

Se presentan alternativas de solución para conseguir asesorar al alumno; todas ellas deberán enfocarse a cubrir soluciones a todos los problemas mencionados, pues si dichos problemas originan una solicitud de asesoría por parte del alumno, y la solución propuesta no los considera, el alumno no encontrará solución a través de ellos.

**2.2 Importancia del problema.**

Para hacer un primer estimado de la magnitud del problema, realicé un pequeño análisis estadístico del número de alumnos que a lo largo de los semestres no consiguen cumplir satisfactoriamente los objetivos de un curso específico de programación, bajo la hipótesis de que hay una alta probabilidad de que un alumno que no aprueba la materia, haya sido afectado por las dudas no resueltas durante su práctica de programación. Siendo un curso donde el 30% de la calificación está dada por los proyectos de programación, y otro 55% por exámenes en los que se le pide que codifique rutinas, lo cual también es una actividad de programación, puede considerarse razonable la hipótesis.

Del total de alumnos durante 3 semestres que se impartió el curso, un 26.8 % (22/82) no ha aprobado finalmente la materia. Si bien este porcentaje es considerado bajo para la materia, podemos considerar dada la hipótesis, que al menos una cuarta parte de los alumnos de la materia se enfrenta al problema de que la asesoría que recibió, resultó insuficiente para conseguir que aprendiera y desarrollara las habilidades necesarias para superar los requisitos de la materia.

Por supuesto, esta estadística no es concluyente, pues no considera otros factores que pueden influir en el resultado de la materia, tales como los problemas de los alumnos en su aprendizaje durante las materias anteriores, requisitos de la materia en cuestión, y la observación de que el tiempo de laboratorio es insuficiente; y además, no considera la posibilidad de que los alumnos que aprobaron la materia tampoco hayan obtenido todo el apoyo y asesoría que hubieran requerido, para mejorar sus resultados. Sin embargo, con esta estadística y la observación empírica de la demanda de asesoría durante las horas de laboratorio, se puede considerar que la mayoría de los alumnos se enfrenta a este problema en algún momento.

A esto hay que agregar que los alumnos de carreras tales como Ingeniería en Sistemas Computacionales, estudian varias materias en donde hacen uso de los lenguajes y técnicas de programación; por lo que este problema puede presentarse en diversas etapas de su preparación. Durante mi experiencia docente que tengo he observado dicho problema en diversos niveles y cursos de programación o que requieren de la programación como herramienta. De esta manera, el alcance que se tiene es general, en diversas materias; por lo que reultará útil la búsqueda de una solución al mismo, para la consecución de los objetivos de la Universidad Virtual. Dichos objetivos incluyen \[14\]:

* Generar paquetes educativos y de educación a distancia.
* Llevar educación a los hogares y centros de trabajo.

Una de las actividades complementarias que se deben profundizar es este análisis, de forma que quede mejor fundamentada la hipótesis; hasta aquí, se han proporcionado argumentos empíricos y observaciones simples, que simplemente justifican y muestran realizar investigación sobre las mismas.

Entre las consecuencias que el problema puede tener, se mencionarán las siguientes:

* Baja en el desempeño de los alumnos.
* Limitaciones al nivel académico de los profesores que imparten materias posteriormente. Es decir, las fallas en el aprendizaje en un curso, incidirán en problemas en el aprendizaje durante cursos posteriores, ligados con el primero.
* Desperdicio del tiempo del profesor, resolviendo repetitivamente las mismas dudas a distintos alumnos, durante distintos tiempos, algunas de ellas ya mencionadas en clase; tiempo que podráa ser aprovechado para ampliar los conocimientos que se cubren, agregar mayor número de ejemplos, y otras diversas actividades académicas.

Al resolver el problema de las limitantes en la asesoría de programación, se podrán obtener entre otros beneficios los siguientes, que se ocuparán como objetivos de este trabajo:

* Apoyo al trabajo del profesor, reduciendo su carga de trabajo repetitivo y permitiéndole Así ampliar el tiempo que dedica a las actividades que requieren mayor experiencia, inteligencia o creatividad.
* El alumno mejorará su aprendizaje, al resolver sus dudas, especialmente aquellas comunes en el aprendizaje de la materia; y lo conseguirá en un tiempo más oportuno.
* Se apoyará al proyecto de Universidad Virtual, al no requerir de la presencia o tiempo del profesor, en las labores relativamente mecúnicas de soporte.
* Se podrá llevar un registro más completo de la evolución del alumno.
* Las materias impartidas podrán verse enriquecidas y aumentar su nivel, al liberar al profesor de actividades repetitivas.
* La solución podráa generalizarse a otras áreas; por ejemplo: al autoaprendizaje del manejo de un paquete computacional, por parte de los usuarios; la asesoría en la solución de problemas en una planta de producción; el trabajo en grupo a distancia; la programación automática; la prueba automática de software y hardware; el Diseño asistido por computadora; y la ReIngeniería de procesos.

**2.3 Parámetros para buscar una solución.**

Antes de revisar las posibles alternativas, tanto tradicionales como por medios computacionales, sería conveniente analizar brevemente qué parámetros nos permitirán distinguir las alternativas entre sí; criterios apropiados para compararlas, en el contexto que nos encontramos (asesoría durante la práctica de programación).

* **Disponibilidad**: es deseable que la alternativa seleccionada sea accesible al alumno, durante el mayor tiempo posible, sin las limitantes que normalmente tiene un profesor o instructor.
* **Ubicuidad**: es deseable que la alternativa sea fácilmente transportable, de tal manera que el alumno pueda accesarla en la escuela, en la casa o en cualquier otro lugar donde está realizando su práctica de programación.
* **Costo**: es deseable que la alternativa no requiera recursos elevados, que limiten su ubicuidad; al mismo tiempo, es conveniente que su costo de distribución sea bajo, de manera que pueda alcanzar a un gran número de alumnos sin incrementar los costos en la misma medida.
* **Dinamismo**: es conveniente que la aplicación sea activa o diñamica, más que reactiva o estática, de forma tal que induzca al alumno al aprendizaje y no dependa de las acciones del alumno para funcionar.
* **Adaptabilidad o flexibilidad**: es importante que, al igual que un profesor humano, pueda ajustarse la aplicación de la herramienta, a los distintos perfiles de usuarios (alumnos) que va a tener.
* **difusión**: existen alternativas sobre las que ya se ha investigado ampliamente, y a las que por ello la población estudiantil ya tiene acceso; pero se preferirán aquellas alternativas que aun no son utilizadas por una porción amplia de la población, pues justifican una mayor investigación sobre ellas.

**2.4 Alternativas de solución.**

Ahora bien, para mostrar que este es un problema abierto, y justificar la investigación de una solución para él, revisará algunas de las diversas alternativas de solución, tanto existentes como propuestas.

Se describirán las diversas alternativas que se han considerado: No se pretende que esta sea una lista completa o exhaustiva, sino una primera aproximación para compararlas. Al final de esta sección, se presenta una tabla de comparación, de acuerdo a los criterios indicados anteriormente.

* Libros y tutoriales
* Manuales de solución de problemas
* Libros o tutoriales en multimedios
* Laboratorios virtuales:
* Realidad virtual
* Ayuda en línea, hipertexto e hipermedios
* retroalimentación por parte del ambiente de programación
* prácticas de programación en equipo
* asesoría por correo electrónico
* Sistemas tutoriales inteligentes: (_Intelligent Tutoring Systems_ o ITS)
* Auxiliares asesores humanos
* Asesores automatizados

**2.4.1 Libros y tutoriales**

Cuando el profesor no está disponible, muchas de las dudas se pueden resolver a través del uso del libro de texto, Así como de tutoriales impresos, los cuales contienen el conocimiento y muchas veces descripciones de los problemas comunes con sus soluciones. Un alumno puede reaccionar, al encontrarse con el problema de asesoría, y buscar la información necesaria en estos medios. Un buen Diseño de los libros de texto y tutoriales puede ayudarnos a la solución del problema.

Sin embargo, este medio tiene la desventaja de ser pasivo y estático, en vez de ser activo: el alumno debe reconocer el problema y tomar la decisión de buscar su solución en estos medios, además de realizar la búsqueda. Por otro lado, al igual que el profesor, no es un medio que siempre está disponible, en particular en los laboratorios donde el alumno realiza su actividad de programación; por diversas razones, el estudiante puede no contar con acceso a este medio; y, finalmente, la oportunidad con la que se resuelven las dudas no es óptima.

Nuevamente, aquí se pueden reducir las desventajas mediante diversas técnicas, tales como los índices y glosarios; con la disponibilidad de amplias bibliotecas, y la integración de las mismas en los laboratorios de cómputo.

**2.4.2 Manuales de solución de problemas**

Esta es una forma particular de la solución anterior, específicamente enfocada al problema de asesoría. Con ello, tenemos una solución más concreta al problema específico, lo que reduce el tiempo y espacio de búsqueda para el alumno, a cambio de reducir la información adicional que acompaña la solución, que podráa ser útil para el alumno. Por lo demás, sus ventajas y desventajas son similares al caso anterior; por lo que podemos considerar que son dos soluciones que se complementan entre sí, especialmente si hacen referencias cruzadas. Solamente hay que enfatizar para esta alternativa, que es sumamente estática: tiene un formato único y una técnica particular de búsqueda de la solución, lo cual limita su aplicación.

**2.4.3 Libros o tutoriales en multimedios**

Dada la desintegración de los medios, el impreso donde tenemos libros y manuales; y el computacional, donde realiza su trabajo de programación el alumno, se tiene un cierto grado de distracción. Una de las opciones para resolver este problema, eficientar la búsqueda y reducir la linealidad con la que se suelen organizar los medios anteriores, es el apoyo por multimedios. Muy en general, esto consiste en complementar la información de los libros y manuales con material audiovisual, y muchas veces con los medios computacionales. Esto permite un acercamiento entre el lugar donde el alumno realiza su trabajo y donde resuelve sus dudas; además, el uso efectivo de multimedios amplía la retención y mejora la atención e interés del alumno, al producir un mayor impacto sensorial. \[13\]

Entre sus desventajas tenemos el riesgo de que el medio audiovisual distraiga la atención del alumno, cuando se desea que atienda al profesor; o bien, que el profesor pierda su presencia o reduzca su participación, dándole demasiada importancia al medio y su contenido en vez de enriquecer la clase con otros aspectos; cuando el profesor no está disponible, depende del alumno la aplicación apropiada del medio, y muchas veces la búsqueda no es sencilla, además de que puede nuevamente distraerse al alumno por el exceso de información; sigue siendo un medio pasivo; y un problema particular de estos medios, es su disponibilidad, pues requiere de un costoso equipo, y recursos normalmente superiores a aquellos de los que disponen el alumno y muchos laboratorios.

**2.4.4 Laboratorios virtuales**

Alan Kay describe la aplicación de computadoras a la enseñanza de química, física, biología y disciplinas semejantes, \[17\] donde los experimentos pueden ser peligrosos o incosteables, por medio de la simulación del laboratorio, permitiendo Así que los estudiantes aprendan por experimentación. Los laboratorios de cómputo, donde se aprende programación, desafortunadamente no están enfocados de esta forma; si bien es posible que el alumno por su propia iniciativa experimente y pruebe sus ideas, revisando los resultados de aplicarlas. Las simulaciones de lo que ocurre en una computadora pueden justificarse como un medio alterno de asesoría: si el alumno tiene una duda, podráa apoyarse al meter su programa o su duda al laboratorio simulado, y que este le muestre que pasa.

Sin embargo, la construcción de estos laboratorios virtuales es costosa, desde el punto de vista del desarrollo del software; por otro lado, es difícil conceptualizarlos, y no se conocen muchos trabajos avanzados en el área. Es una tecnología nueva y poco desarrollada, que requiere mayor investigación.

**2.4.5 Realidad virtual**

Derivada del concepto anterior, y de los videojuegos, esta técnica ha sonado bastante en años recientes, por sus aplicaciones en el campo de la simulación y el entrenamiento. Dados los éxitos en el área de entrenamiento, podráa considerarse como una alternativa útil; sin embargo, estos éxitos han sido en campos con una representación física clara para el ser humano, no demasiado abstractos. Los éxitos conocidos de esta tecnología, no se encuentran en ramas como las matemáticas y la programación de computadoras; probablemente, debido a que estas ciencias y técnicas son abstractas y difíciles de representar en una forma física, aun virtual.

Ahora bien, es posible visualizar la idea de un profesor virtual, que haga vivir a los alumnos la ilusión de presencia en lugares remotos, y viceversa, que haga que el profesor "vea" el ambiente donde el alumno programa. Entre las desventajas, esta interacción sería en línea, solamente en los salones de clase; la tecnología es incosteable para uso personal, por ejemplo desde la casa del alumno. Por otro lado, puede estar limitada en su capacidad. Además, aunque resuelve el problema de la distancia, no así el de la temporalidad.

Por ello, se puede considerar que esta alternativa por sí sola no resuelve el problema general; aunque es una alternativa interesante para combinar con otras; en particular, como líneas futuras de investigación podráa considerarse adicionar esta técnica a los asesores inteligentes.

**2.4.6 Ayuda en línea, hipertexto e hipermedios**

Con el desarrollo de las interfases gráficas con el usuario, en las microcomputadoras se ha desarrollado una profusión de sistemas de ayuda en línea. Por otro lado, se han desarrollado sistemas de hipertexto e hipermedios, que permiten la navegación no lineal de la información, lo que nuevamente eficienta la búsqueda de información. Aplicado a la asesoría al aprender lenguajes de programación, hay evidencia empírica de que muchos programadores pueden resolver muchas de sus dudas eficientemente con ayuda de estos medios; por otro lado, la integración de los medios en el mismo ambiente computacional, y la capacidad de sensitividad al contexto de las ayudas en línea modernas, ayudan a eficientar la búsqueda.

Sin embargo, diversos estudios \[32\] han encontrado una reducción del 15 al 30 por ciento en la asimilación de la información y comprensión del texto en línea respecto al texto en papel, en medios tradicionales. Por otro lado, tienen el problema de exceso de información, ya mencionado anteriormente; y son medios pasivos: dependen para su activación, del alumno, y no se adaptan para mostrar información al alumno de acuerdo a su comportamiento.

**2.4.7 retroalimentación por parte del ambiente de programación**

Una solución que deja de ser pasiva, y es más reactiva, consiste en la capacidad de ciertos ambientes de programación, de retroalimentar al usuario al momento de realizar la programación. Esta retroalimentación informa inmediatamente al alumno de algunos de los problemas con los que se encuentra durante su trabajo. Y, combinada con medios tales como los anteriormente mencionados, es una solución poderosa para muchos de los problemas más simples.

Entre los ejemplos que podemos dar de esta solución, incluiremos el énfasis en color de la sintaxis ("_syntax highlighting_"), con el que cuentan, entre otros, las últimas versiones de los compiladores de Borland y Microsoft en ambiente Windows; los depuradores ("_debuggers_"); y la revisión de sintaxis incremental realizada por Visual BASIC, que indica muchos posibles errores desde el momento de teclearlos.

Un problema de esta solución es el bajo nivel de errores que corrige; no tiene capacidades inteligentes para determinar y resaltar errores y problemas de más alto nivel, ni proporciona recomendaciones sobre buenos hábitos de programación. Otra desventaja es que no existe una arquitectura abierta que nos permita compartir dichas tecnologías entre distintos lenguajes. Una ventaja, por otro lado, es la integración completa entre el proceso de programación, y el asesor primitivo del alumno. Podemos decir que esta solución ataca los problemas de falta de conocimiento, dando un elemento particular del mismo al ambiente; pero no ayuda al alumno en su desarrollo de habilidades.

A pesar de que su reacción depende de la acción del alumno, todavía no es un sistema activo ni adaptable: no toma la iniciativa de dar recomendaciones al alumno, sino que le indica un resultado o estado de acuerdo a su comportamiento; y no se adapta a distintos usuarios, ni reconoce los patrones de comportamiento del mismo.

**2.4.8 prácticas de programación en equipo**

Cuando el profesor no está disponible, una opción es que los alumnos cooperen en la solución de los problemas. Es decir, los alumnos se convierten en asesores de unos con otros. Esto amplía el alcance de la asesoría, fuera de clase, durante el tiempo de programación. Sin embargo, está limitado por factores psicológicos, tales como el trabajo bajo presión, la falta de comunicación entre los alumnos, y la falta de una dirección de asesoría para el equipo. Además, hay que considerar que normalmente ninguno de los alumnos es experto en la materia, ni se ha especializado, como ocurre (normalmente) con el profesor; por lo que no tiene el mismo conocimiento o profundidad para llegar a una solución. De esta manera, si bien al enfocar este trabajo en equipo se pueden obtener los beneficios producto de la interacción, discusión y lluvias de ideas, es limitado el alcance del mismo.

**2.4.9 asesoría por correo electrónico**

Con algunos de los medios modernos, el profesor puede estar disponible en forma Asíncrona y distribuida; es decir, en distinto lugar y espacio \[32\]. Si el alumno contara con una conexión apropiada a la red, local o no, en el momento que le surge la duda; y tuviera la posibilidad de definirla concreta y explícitamente; el profesor se vería en la posibilidad de solucionarla, aun en tiempo y lugar distintos. Sin embargo, esta técnica tiene los problemas de pasividad, insuficiencia en la información que recibe el profesor, y sobre todo falta de oportunidad.

**2.4.10 Sistemas tutoriales inteligentes: (Intelligent Tutoring Systems o ITS)**

Si combinamos algunas técnicas de la inteligencia artificial, tales como reglas o heurísticas, sacadas de la experiencia del profesor, con los tutoriales computarizados ya mencionados, surge un nuevo concepto: los sistemas tutoriales inteligentes, o ITS por sus siglas en inglés.

Estos sistemas aprovechan el conocimiento de que disponen para guiar el proceso del tutorial, y adaptarse al nivel y otras características del alumno; en general, todos contienen cuatro componentes \[16\], si bien la terminología varía según el autor:

* Interfase con el usuario
* Modelo del usuario o estudiante
* Experto o modelo del dominio
* Modelo pedagágico o instruccional

Se ha realizado gran cantidad de investigación dentro del campo en los últimos años; si bien sus orígenes se remontan a 1970 \[[16](#Biblio16)\].

Tienen el problema de la falta disponibilidad de la inteligencia o el sistema; sin embargo, este puede considerarse menor, ya que en el ambiente que estamos delimitando (cuando el alumno se encuentra practicando la programación), normalmente sí tenemos los recursos necesarios.

Su principal desventaja es que no necesariamente son dinámicos: dependen del alumno para que él haga uso del tutorial, y guíe su comportamiento en base a selecciones; pueden recordar y sugerir líneas de exploración al alumno, pero no directamente observar el comportamiento del alumno en la solución de problemas reales, a menos que integren otras de las alternativas.

**2.4.11 Asesores humanos**

Una solución casi ideal al problema, sería dedicar un asesor especializado, humano, y personal, a cada uno de los alumnos. Esto daría el máximo tiempo y disponibilidad de la asesoría para el alumno. Sin embargo, es fácil descartar esta solución, por problemas de costo, insuficiencia de especialistas con la capacidad necesaria, y desperdicio del tiempo de dichos especialistas que, de estar siempre disponibles para asesorar al alumno, quedarían mucho tiempo ociosos.

**2.4.12 Asesores automatizados**

Surgido de la idea anterior, se sugiere el modelo alterno de contar con sistemas inteligentes ("agentes", en el sentido de que son entes autónomos) capaces de simular o sustituir las funciones de los asesores o auxiliares humanos. Existen muestras de asesores construidos durante el desarrollo de un ITS, y son de particular interés dentro del área de la Inteligencia Artificial, porque debido a su comportamiento se les podrá caracterizar como Agentes Inteligentes, y la investigación dentro de estos últimos ha tenido un gran auge en los últimos años.

**2.5 Clasificación de ITS y Asesores Automatizados dentro del Contexto de Agentes Inteligentes**

Para propósitos de este trabajo, se hace una diferencia notoria entre el concepto de un Sistema Tutorial Inteligente (ITS) y un Asesor Automatizado, si bien existen trabajos que combinan muchas características de ambos. Para distinguirlos, se proponen las definiciones:

Un Sistema Tutorial Inteligente es un sistema basado en conocimiento, capaz de reconocer errores y conceptos equivocados, monitorear e intervenir cuando sea necesario, con distintos niveles de explicación, y de generar problemas siguiendo un conjunto dado de reglas o guías instruccionales. \[[3](#Biblio3)\]

Un Asesor Automatizado es un sistema que sustituye las funciones de asesoría realizadas por seres humanos, tales como el soporte técnico a usuarios de sistemas computacionales y la explicación de un profesor a un alumno con algún problema.

Se pueden clasificar a los asesores automatizados como agentes inteligentes, de acuerdo a la definición de Russell, según la cual un _**agente** es todo aquello que puede considerarse que percibe su ambiente mediante sensores, y que responde o actúa en tal ambiente por medio de efectores_ \[[30](#Biblio30)\]; a esta se puede agregar la definición de Marvin Minsky sobre **Inteligencia Artificial**, según la cual esta disciplina consiste en la disciplina de construir aplicaciones que requerirían inteligencia de ser llevadas a cabo por seres humanos. \[[18](#Biblio18)\]. Finalmente, un _**agente inteligente** es, desde un punto de vista ideal, aquel que responde al ambiente con la mejor decisión posible en una situación dada_ \[[30](#Biblio30)\]. Tomar la mejor decisión _siempre_ no es necesario, basta con tomar _generalmente_ dicha mejor decisión, para que consideremos inteligente a un ser humano, según nuestra definición intuitiva; tomaremos dicho enfoque para el análisis posterior.

De esta manera se puede definir a un Asesor Inteligente como un Agente Inteligente cuyos sensores y efectores son canales de comunicación con otro agente (humano o computarizado), al cual le proporcionan un servicio basado en conocimiento. Específicamente, un Asesor Automatizado en la enseñanza, es un Asesor Automatizado que proporciona servicios de consulta y apoyo al estudiante, en la materia o dominio del conocimiento con que cuenta.

![Figura 1: Relación entre ITS, Agentes y Asesores Inteligentes](Image1.gif)

**_Figura 1: Relación entre las áreas de investigación sobre Sistemas Tutores Inteligentes, Agentes Inteligentes e Interfase Hombre-Máquina._**

según estas definiciones, (figura 1) un Asesor Automatizado en la enseñanza estará en la intersección entre las áreas de Agentes Inteligentes, Sistemas Tutores Inteligentes e Interfase Hombre-Máquina. Es posible que un Asesor Automatizado sea un ITS en toda la extensión de la definición; que sea solamente parte de un ITS; o que sea independiente, formando parte del sistema de enseñanza del profesor, como una herramienta más.

Para complementar la clasificación presentada, en la Tabla 1 se presentan algunos ejemplos de las clases definidas.

_Tabla 1: Sistemas que entran dentro de la clasificación presentada_

| Sistema | Clase |
|-------- |-------|
| Web Tutor e Hyper Tutor \[[27](#Biblio27)\] | ITS Hipermedia |
| Gracile \[[1](#Biblio1)\] |Asesor Inteligente aplicado a la enseñanza |
| Internet Softbot \[[11](#Biblio11)\] | Interfaz Inteligente |
| Asistente de e-mail Maxims \[[19](#Biblio19)\] | Interfaz Inteligente |
| Aprendiz de calendario CAP \[[21](#Biblio21)\] | Interfaz Inteligente |
| Página WWW de análisis de Algoritmos \[[31](#Biblio31)\] y [Lenguaje Ensamblador](../asm9708/framev.htm) | Páginas WWW |
| Coach \[[33](#Biblio33)\] | Asesor Inteligente de programación |
| CAPRA \[[34](#Biblio34)\] | Asesor Inteligente de programación |

Esta área sigue siendo de reciente creación; aunque cabe resaltar proyectos, considerados como ITSs, tales como CAPRA \[[34](#Biblio34)\]; LISP Tutor \[[37](#Biblio37)\], PROUST \[[42](#Biblio42)\], Coach \[[33](#Biblio33)\] y LAURA \[[36](#Biblio36)\]. Otros ejemplos de asesores automatizados fuera del campo de ITSs, que justifican la distinción, se encuentran en el Internet Softbot \[[11](#Biblio11)\], el aprendiz de calendario o CAP \[[21](#Biblio21)\] y el agente de manejo de correo electrónico Maxims \[[19](#Biblio19)\].

Por ser el enfoque que cubre mejor las necesidades que se han detectado en los alumnos (asesoría cuando el profesor no está disponible), se seguirá esta alternativa como línea principal de investigación. Las otras alternativas también pueden integrarse en ciertas secciones, particularmente la de ITSs no especializados en la asesoría; pero en el contexto actual, la necesidad de estas alternativas es menor, al tener disponible al profesor y recursos tales como libros e información en línea, para los propósitos de transmisión del conocimiento. Como se explicó anteriormente, la problemática principal está en el proceso de asesoría.

Se debe complementar la JUSTIFICACIÓN del interés en esta técnica, con algunas observaciones:

* Para el problema específico que estamos atacando, se ajusta fácilmente, ya que involucra el uso de una computadora, y permite la observación directa del comportamiento del usuario (alumno) en la resolución de problemas prácticos.
* Toca varias disciplinas, creando analogías y relaciones entre ellas. Así que la investigación en cualquiera de ellas justificará explorar la solución propuesta. Entre dichas áreas o disciplinas tenemos:

> * Inteligencia Artificial
> * programación de Sistemas
> * Detección de errores y depuración automática de programas
> * Psicología
> * Pedagogía

* Es fácil representar la idea mentalmente, en forma similar al caso de asesores humanos, como se puede ver en la [tabla 2](#Tabla2). Es decir, tenemos una representación muy directa de la realidad del problema que queremos resolver. Es sabido que en los problemas a resolver usando Inteligencia Artificial, es conveniente tener una representación cuyo mapeo a la realidad sea sencillo.

#### Tabla 2: Comparación entre los papeles en esquemas de enseñanza de programación teórico vs. en laboratorio, vs. apoyado en asesor inteligente.

| Forma de Clase/Disponibilidad del Profesor | _Profesor disponible_ | _Profesor no disponible_ |
|---|---|---|
| _Clase Teórica (Salón)_ | El profesor transmite los conocimientos, resuelve ejercicios y dudas, en forma verbal. Los alumnos no pueden practicar (programar) en el momento, salvo ejercicios en papel. | Los alumnos estudian de libros, bibliografía adicional, y apuntes. Practican en tiempo adicional a la clase, principalmente como consecuencia de la realización de tareas, teniendo como apoyos solamente los recursos computacionales y BIBLOGRAFÍA. |
| _Clase práctica (Laboratorio)_ | El profesor dedica menos tiempo a la transmisión de conocimientos, y más a supervisar, corregir y asesorar a los alumnos, quienes desarrollan ejercicios de programación, generalmente indicados por el profesor. | Similar al caso de clase teórica con el profesor no disponible; con las diferencias de que: *Los alumnos cuentan con un tiempo designado, y generalmente ejercicios o tareas asignadas.*   Se facilita la cooperación entre los alumnos, al compartir el lugar y momento de practicar.
| _Clase apoyada por Asesor Inteligente (Salón + Laboratorio)_ | El profesor toma, según su criterio, el papel que desee de los dos anteriores. | Los alumnos, además de las posibilidades inherentes a los dos tipos de clases anteriores, cuentan con un sustituto del profesor en el proceso de asesoría. De esta manera, dentro de los alcances del conocimiento del Asesor Inteligente, se subsanan las limitantes debidas a la ausencia del profesor. |

Para complementar este análisis de alternativas, se presenta en la tabla 3 una comparación entre aquellas presentadas, basada en los criterios indicados en la sección de "_Parámetros para buscar una solución_", al inicio de este capítulo. Solamente es necesario la aclaración de que en la columna de dinamismo, se indica "sí" cuando la alternativa es diñamica, de acuerdo a la definición realizada para dinamismo; y recordar que la disponibilidad se refiere a la porción de tiempo durante el cual el alumno tendrá posibilidad de acceder a la solución, la ubicuidad se aplica en los aspectos de transportabilidad para el alumno a sus distintas áreas de trabajo, y la adaptabilidad se enfoca al usuario.

_Tabla 3: Tabla de comparación entre alternativas_

| Técnica | Disponibilidad | Ubicuidad | Costo |  Dinamismo | Adaptabilidad | Difusión |
|---|---|---|---|---|---|---|
| Libros y tutoriales |Buena | Buena | Muy bajo | No | Baja | Muy alta |
| Manuales de solución de problemas | Muy Buena | Buena | Muy bajo | No | Muy baja | Alta |
| Libros o tutoriales en multimedios | Regular | Baja | Alto | Sí | Regular | Baja |
| Laboratorios virtuales | Baja | Baja | Alto | Sí | Alta | Muy baja |
| Realidad virtual | Baja | Baja | Muy alto | Sí | Alta | Muy baja |
| Ayuda en línea, hipertexto e hipermedios | Muy buena | Muy buena | Bajo | Parcial | Regular | Alta |
| Retroalimentación por parte del ambiente de programación | Buena a Muy buena | Buena a Muy buena | Medio | Parcial | Baja | Regular a Alta |
| Prácticas de programación en equipo | Muy buena | Buena | Muy bajo | Sí | Alta | Alta |
| Asesoría por correo electrónico | Regular a Buena | Regular | Medio | Sí | Alta | Regular |
| Sistemas tutoriales inteligentes | Regular a Muy Buena | Buena a Muy buena | Alto | Parcial | Alta | Baja |
| Auxiliares asesores humanos | Regular | Regular | Medio - Alto | Sí | Alta | Alta |
| Asesores automatizados | Muy buena | Muy buena | Medio | Sí | Alta | Muy baja |

En base a esta tabla de comparación, se muestra que la alternativa de investigación sobre asesores automatizados es la más prometedora para atacar la problemática descrita, Así como una de las que ha sido menos investigada. Esto no quiere decir que los asesores automatizados sean una panacea; sino que dentro del contexto que delimitamos (práctica de la programación), se ajustan relativamente bien a las características. Cabe hacer mención de que en otro ambiente no se comportarían igual; la disponibilidad y ubicuidad dependen de la presencia de una computadora, la cual estamos asumiendo por el problema particular pero que no aplica en otros contextos. Lo mismo debe decirse del costo.

**2.6 Requerimientos adicionales**

Para conseguir la adaptabilidad, Así como para registrar en forma eficiente los resultados del uso de las herramientas, requeriremos profundizar en áreas tales como:

* La forma de describir los Perfiles de los alumnos; es decir, de categorizarlos en niveles distintos, los cuales servirán como Parámetros de adaptación del sistema.
* El estilo y ritmo de aprendizaje; los que pueden formar parte del perfil del alumno, pero también pueden estar asociados a los temas de la materia. De alguna forma, el asesor inteligente debe contar con conocimiento en esta área.
* El estilo de enseñanza. también un asesor inteligente deberá considerar su propia adaptabilidad a distintos perfiles de profesores, de manera que pueda simular el comportamiento de profesores distintos, usando el estilo apropiado a la materia o tema.
* Conocimiento de los mecanismos de relaciones humanas profesor - alumno, pues muchos de ellos deberán ser apoyados o simulados por el sistema. Entre ellos, mencionará, tomados de la negociación, al análisis de las necesidades y metas de los participantes y la percepción de las mismas; por otro lado, también considerará los niveles de actitud hacia el profesor: cerrado, abierto, confianza y fe.

**2.7 Estado del arte en la materia.**

**2.7.1 Panorama de la sección.**

En esta sección, se describirán brevemente los trabajos más importantes que están dentro del área de acción que se persigue: Asesores de enseñanza de la programación:

Ya con enfoque al proyecto propuesto, se describirán las bases bibliográficas para definir los diversos aspectos del desarrollo y arquitectura del proyecto.

**2.7.2 Asesores Inteligentes para enseñanza de la programación desarrollados en el pasado**

Ya se han desarrollado Asesores Inteligentes para apoyar la enseñanza de programación, en distintos lugares y con distintas arquitecturas. Entre otros, podemos mencionar:

* Depurador incluido en el tutor CAPRA \[34\]
* COACH \[33\]
* LAURA \[36\]
* ACTP \[37\]

CAPRA \[34\] es un tutor inteligente que enseña a programadores novatos. Durante su desarrollo en España, dentro de su investigación se ha tratado el problema de la detección y diagnóstico de errores en entornos de programación, la cual es de utilidad e interés para el presente trabajo. Entre otras cosas, el trabajo de Urretavizcaya enmarca una serie de técnicas propuestas para conseguir resolver dicho problema de detección y diagnóstico:

* Clasificación heurística de los errores.
* Análisis del flujo de datos.
* Ejecucón Simbólica
* Basadas en intenciones, completamente asociadas a un modelo del estudiante.

COACH (_Cognitive Adaptive Computer Help_) \[33\] permite crear ayuda personalizada al usuario. Es un observador de las acciones del usuario que está aprendiendo a operar un ambiente, y en base a ellas construye un modelo adaptativo del usuario. Si bien el concepto general es aplicable para áreas diversas tales como las Interfases Inteligentes y el soporte técnico, en particular es de interés para este trabajo ya que los dominios de prueba que modeló corresponden al de un lenguaje y un entorno de programación (LISP y UNIX, respectivamente); Así como por la prueba de adaptabilidad a distintos dominios en que probé ser efectivo. En dicha prueba, después de completar el desarrollo y pruebas del tutor bajo el dominio de LISP, se encargó a un estudiante inexperto, su adaptación al dominio de UNIX; dado el éxito de la adaptación, a pesar de la inexperiencia del constructor del dominio, Selker concluye que la aplicación de los conceptos y modelación del dominio son apropiados para diversos dominios, y por lo tanto, fácilmente adaptables.

Una de las contribuciones importantes de Coach consiste en la descripción de diversos modelos de usuarios, representados por medio de frames adaptativos; y el modelado cognitivo de variables tales como la experiencia, la latencia del conocimiento. Por otro lado, el análisis de resultados que hace Selker, basado en el comportamiento registrado por los usuarios de sistemas tradicionales y los del sistema asesor, muestra variables cuantificables para medir el éxito de un sistema similar como el que ocupa este trabajo.

El sistema ACTP \[37\] fue desarrollado para ser un tutor de LISP, lenguaje clásicamente preferido por las comunidades de estudio en el área de Inteligencia Artificial. Es uno de los precursores del uso de modelado cognitivo en los Sistemas Tutores Inteligentes \[16\]; y por el dominio que maneja puede considerarse de interés para el área de investigación que nos ocupa, si bien no tiene el enfoque de asesor inteligente. Llama la atención su uso de librerías de código común, las que usa como plantillas de comparación; lo que permite encontrar pequeños pero comunes errores en dicho código.

Otros ejemplos de sistemas tutores inteligentes enfocados a la programación se tienen en LAURA \[36\], el cual fue concebido para depurar los programas realizados por estudiantes, y es uno de los esfuerzos pioneros en el área; y PROUST \[42\], el cual se caracteriza por la innovación dada por el diagnóstico de intenciones. Es decir, este último asesor es capaz de deducir las metas del usuario, y compararlas con el código que analiza, lo que permite que detecte errores no triviales en la lógica de programación.

**2.7.3 Elementos y componentes requeridos para el Proyecto.**

Según la investigación realizada, las áreas en que se debe profundizar para describir y justificar el Diseño del proyecto, incluyen las siguientes:

* Clasificación de Sistemas Adaptativos
* Arquitecturas propuestas para Tutoriales Inteligentes
* Componentes de Tutoriales Inteligentes
  * *   Interfase Hombre-Máquina y modelos de interacción con el usuario.
  * Representación del conocimiento del dominio y del estudiante.
  * Modelos de enseñanza.
* Planteamiento teórico de la Universidad Virtual y avances actuales.
* Estado del Arte en Agentes Inteligentes.
* Asesores Inteligentes: características, ejemplos y arquitectura.

**2.7.3.1 Contextualización de las soluciones dentro de los sistemas adaptativos.**

Un sistema adaptativo se define \[3\], como un _sistema que puede alterar aspectos de su estructura, funcionalidad o interfase con el objetivo de adaptarse a las necesidades de grupos de usuarios o usuarios individuales, y sus cambiantes necesidades a través del tiempo._

Esta definición es aplicable al asesor inteligente que se tiene previsto en el proyecto propuesto, por lo cual es útil conocer las características de los sistemas adaptativos en general.

Benyon y Murray describen una clasificación de los sistemas adaptativos \[3\], con definiciones de ellos, que ayuda a clarificar el contexto dentro del cual se puede clasificar una solución. Citándolos literalmente.

* _"Una de las metas de este documento es proporcionar un modelo de referencia para la comparación de sistemas adaptativos"._

Para describir su clasificación, se muestra una tabla comparativa entre las distintas categorías, la característica que adicionan respecto al nivel anterior, y la meta general. Cabe aclarar que la terminología usada por Benyon y Murray no es universalmente aceptada; sin embargo, esta clasificación será útil para definir un contexto de trabajo y mostrar una escala ascendente de habilidades, desde los sistemas adaptativos más sencillos hacia los más sofisticados.

_Tabla 4: Clasificación de Sistemas Adaptativos según Benyon-Murray_

| Categoría | Característica | Metas principales |
|---|---|---|
| Interfases inteligentes | Representación del usuario individual y del dominio | Facilitar el uso del software para una amplia variedad de usuarios |
| Sistemas Adaptativos de Lenguaje Natural (NL) | Inferencia de necesidades y metas del usuario | Facilitar la comprensión y generación del lenguaje natural, al limitar el dominio al usuario particular. |
| Tutoriales Inteligentes (ITS) | Capaces de reconocer errores y conceptos erróneos, de observar el comportamiento del usuario e intervenir de ser necesario. | Enseñar conceptos al usuario estudiante (se asume la meta del usuario) |
| Soporte Inteligente | Similares a ITS, pero deben reconocer las metas del usuario, como NL. | Ayuda activa, soporte al usuario |
| Sistemas de Explicación | Agregan a lo anterior, la capacidad de explicar el comportamiento del sistema | Mostrar al usuario el porqué del comportamiento |
| Agentes cooperativos inteligentes | Sistemas independientes, que pudieran entrar en las categorías anteriores; agregan elementos de trabajo en equipo y negociación. | Mayor poder de resolución de problemas, en grupos. Conseguir la adaptación tanto respecto al exterior (humano) como interior (otro agente) |

Así, puede verse que de acuerdo al objetivo planteado, el sistema propuesto combinará características de ITS, Sistemas Inteligentes de Soporte Técnico, de Explicación del Comportamiento, y Agentes Inteligentes; es decir, se encontrará en los niveles superiores del modelo.

**2.7.3.2 Arquitecturas propuestas para Tutores Inteligentes.**

En diversas oportunidades se han reconocido las similaridades entre los desarrollos de sistemas tutores inteligentes, de manera que se han propuesto los componentes principales para su desarrollo; e inclusive metodologías generales.

**_![Figura 2: Arquitectura general de Sistemas Adaptativos](Image2.gif)_**

**_Figura 2: Arquitectura de Sistemas Adaptativos_**

Benyon y Murray \[3\] describen la arquitectura de los sistemas adaptativos en general, bAsíndola en tres componentes primordiales (figura 2)

* **El modelo del Usuario**: Es el modelo o representación con que el sistema adaptativo cuenta, **_sobre el sistema con el que interactúa_**; este puede ser otro sistema, por ejemplo otro agente dentro de un sistema multiagentes; o bien, un ser humano, como es claro cuando el sistema es una interfase inteligente.
* **El modelo del Dominio**: Es el modelo o representación con que incluye el sistema adaptativo, **_sobre la aplicación a la que se enfoca, y dentro de la que tiene que adaptarse_**; toma su nombre del concepto de dominio del conocimiento, dentro del área de sistemas expertos
* **El modelo de la Interacción Usuario - Dominio**: Se refiere a la descripción de la interacción entre los dos sistemas, descritos por el modelo del Usuario y el del Dominio.

A su vez, reconocen tres sub-componentes principales en el modelo del Usuario:

* Modelo del Estudiante: llamado así por haber sido desarrollado principalmente dentro de la investigación en ITSs; _modela lo que el sistema supone que el usuario cree acerca del dominio._ Es creado directamente en base al modelo del dominio.
* Modelo Psicológico: representa los aspectos esenciales: cognitivos y afectivos, del usuario. En esta área hay mucho campo abierto, pues aun no se cuenta con sistemas que se adapten al estado afectivo del usuario; sin embargo, diversos autores \[25\] han señalado la importancia de estos aspectos y la adaptación de los agentes a los mismos: si hay algún área donde el usuario es reacio a adaptarse, y por lo tanto el sistema adaptativo debiera tener mayor capacidad de adaptación, es esta.
* Perfil del Usuario: representa los datos disponibles sobre los antecedentes, intereses, perspectivas y conocimientos generales del usuario; obviamente combina aspectos de los dos anteriores, pero es determinista, al contrario que el psicológico, y no dependiente del dominio, al contrario que el del estudiante.

![Figura 3: Componentes de ITS](Image3.gif)

**_Figura 3: Arquitectura de Sistemas Tutores Inteligentes_**

Por otro lado, Kaplan generaliza la arquitectura de los sistemas tutores inteligentes a 4 componentes, similares a los anteriores: \[16\]

* La interfase, que permite a los usuarios interactuar con el sistema. Se distinguen tres tipos específicos de usuarios: el Estudiante, el Instructor, y el Desarrollador del sistema.
* El modelo instruccional o pedagógico, el que se encarga de definir la estrategia para transmitir el conocimiento a los usuarios.
* El modelo experto o del dominio, el cual versa sobre la materia o curso que se impartirá.
* El modelo del estudiante, que refleja cuánto conoce el estudiante sobre el dominio, Así como las experiencias cognitivas y de aprendizaje que ha llevado, en base a lo cual puede obtenerse un diagnóstico.

De acuerdo a distintos autores, al menos pueden reconocerse las siguientes clases de tutores inteligentes; cabe aclarar que estas clases no son excluyentes:

* Tutores multimedia \[16\]: son ITS que integran herramientas multimedia, complementando y enriqueciendo Así la información textual con la presentación de audio, animación y videos.
* Tutores hipermedia \[27\]: son tutores multimedia, que como característica adicional cuentan con la capacidad de "navegarse", mediante ligas activas entre los temas. El usuario tiene la capacidad de seleccionar un texto resaltado, o una imagen como botón de navegación, por medio de los cuales puede explorar el contenido del tutor; mientras que en un tutor multimedia la presentación de información está determinada por el sistema y no por el usuario.
* Asesores inteligentes \[33\]: en la introducción de la sección se dio una definición de este concepto. Selker lo define dentro del área de agentes inteligentes, y hace una distinción importante: bajo el término "_assistant-style agent_", un agente que hace las tareas por el usuario, es decir, el usuario delega, y crea dependencia; contra el término "_advisory-style agent_", con la meta explícita de enseñar al usuario, resaltando la importancia de esta distinción para sistemas educativos. Dichos términos corresponden más o menos con las áreas de intersección que en la figura 1 se describieron como "interfases inteligentes" y "asesores inteligentes dedicados a la enseñanza"; pero es importante el definir como una característica de un asesor inteligente para la enseñanza, el que no hará tareas por el usuario, sino que enseñará al usuario a hacerlas por sí mismo. En el caso de un asesor inteligente para la programación, no deberá ser un programador automático ni un depurador automático, sino que usará dichas herramientas para poder automatizar la enseñanza al usuario, para que sea programador y depurador.
* Tutores evolutivos \[16\]: son ITS que utilizan técnicas evolutivas (en el caso de ejemplo, algoritmos genéticos) para encontrar una mejor solución al problema de conocer el modelo del estudiante, es decir, el estado actual del conocimiento del estudiante.

**2.7.3.2 COMPONENTES DE TUTORIALES INTELIGENTES.**

**2.7.3.2.1 Interfase Hombre-Máquina y modelos de interacción con el usuario.**

Diversos autores han resaltado la importancia de una interfase apropiada entre los sistemas tutores y los alumnos humanos, para el éxito del tutor.

Por parte de investigadores especializados en el Diseño de Interfase Hombre-Máquina, se ha buscado una teoría general que explique la interacción con el usuario. Nuevamente, se ve la fuerte conexión existente entre las Ciencias Computacionales y la Psicología. Entre las teorías de alto nivel sobre la interacción con el usuario, que mayor influencia han tenido, se encuentran: \[32\]

* El modelo de 4 niveles: conceptual, semántico, sintáctico y léxico, de Foley y van Dam. Estos niveles corresponden a los modelos que el usuario tiene de Cómo es sistema (conceptual), del significado sus entradas y las salidas que regresa el sistema (semántico), del Cómo las unidades sintácticas se ensamblan para formar una instrucción (sintáctico), y de cuáles son las unidades sintácticas (léxico).

* El modelo GOMS, de Card, Moran y Newell, orientado a partir del las metas del usuario. El nombre viene de las siglas de los elementos que participan en el modelo: las metas (G), los operadores (O), los métodos (M) o procedimientos para llegar a las metas aplicando los operadores, y las reglas de selección (S), que describen los mecanismos para elegir los métodos para una meta determinada.
* _Goal Oriented Design_, de Alan Cooper. también orientado a las metas del usuario, pero con énfasis en no confundirlas con las del diseñador. Su base está en la observación de que comúnmente las tareas del programa van en oposición a las metas del usuario. El ejemplo más claro está en la validación excesiva: el programa consigue evitar fallas en su operación, pero el usuario no consigue su objetivo de introducir información al sistema.

Estas teorías de alto nivel son aplicables para diseñar la interfase de diversos sistemas; en particular, dentro del modelo de interacción de un ITS. En particular, GOMS es una representación fácil de implementar computacionalmente; y no se debe perder la observación de Cooper, de que la interfase se debe diseñar concentrándose en el usuario (en este caso, en el estudiante) y no en la facilidad o simplicidad de implementación del sistema.

Los autores de tutores inteligentes han trabajado fuertemente en el área de interfases basadas en multimedia \[8\] e hipermedia \[27\] \[9\], que combinen el contenido audiovisual clásico, y enfoques del tipo de libros de textos, con las posibilidades modernas que nos proporciona la tecnología computacional, tales como la navegación e Internet.

Una de las consideraciones importantes en toda interfase, es su adaptabilidad a distintos niveles de usuarios \[33\] \[32\]. Así que en el desarrollo de un sistema educativo como el proyecto propuesto, se deberá considerar una clasificación apropiada de los estudiantes de acuerdo a su nivel o perfil. La clasificación más común es vertical, con los tipos de usuarios y los modelos de presentación: novato, intermedio, profesional y experto, o similares. Pero también se puede considerar una clasificación horizontal, donde se deben tomar distintos enfoques de acuerdo a los distintos objetivos que cubrir; por ejemplo, dentro de los diversos estudiantes de un lenguaje de programación, habrá los que tienen como objetivo aprender a programar, quienes buscan el conocimiento necesario para desarrollar ciertas aplicaciones, quienes solamente requieren un panorama general. De acuerdo a dichos objetivos, _que no necesariamente son los mismos del profesor_ \[29\], también conviene que el asesor inteligente se adapte apropiadamente, si ha de conseguir cubrir sus objetivos en conjunto con las expectativas del estudiante.

Específicamente dentro del nicho de asesores inteligentes, las interfases han sido dependientes del problema que se ataca. Los sistemas de agenda \[21\], correo electrónico \[19\] y programación asistidos \[33\], han hecho uso de diversos recursos de interfase; pero pueden señalarse por ser comunes a ellos, los siguientes:

* Uso de ambientes gráficos o GUIs. Esta es una tendencia universal, con el objetivo de hacer más accesible el uso de computadoras al usuario. Es de sentido común su uso, salvo en los sistemas donde se busca enseñar al usuario a operar un ambiente que por naturaleza no es gráfico, donde posiblemente convenga que el tutor funcione en dicho ambiente.
* Intervención del sistema, más o menos oportuna y adaptable, para corregir o hacer sugerencias al usuario. Existen estudios \[33\] que muestran que tanto como la ayuda a solicitud del usuario, la intervención oportuna no solicitada puede reducir el tiempo para terminar la tarea objetivo, por parte del usuario. Sin embargo, también existen estudios \[32\] que indican que dicha intervención debe ser menor cuando el usuario aumenta su nivel de experiencia con el sistema.

* Antropomorfización del agente: la mayoría de los sistemas no intentan simular un comportamiento humano, ni tener "personalidad". Algunos como Maxims \[19\], lo hacen en forma limitada y con cierto éxito; es difícil pensar en un profesor asesor automatizado que no tienda a antropomorfizarse, pero hay que tener cuidado pues existen estudios mostrando que los usuarios no aceptan fácilmente dicho enfoque. \[32\]
* Capacidad del usuario para ajustar el grado de responsabilidad del agente y de sí mismo; es decir, qué tanto se autoriza al agente a actuar en representación del usuario. \[25\] \[2\]

**2.7.3.2.1 Representación del conocimiento del dominio y del estudiante.**

El conocimiento del dominio se refiere a la materia en que el estudiante está interesado, y donde el tutor va a contribuir, y no al sentido clásico de dominio dentro del área de Sistemas Expertos. Desde este último punto de vista, un Tutor Inteligente cuenta con varios "dominios"; en adición al de la materia, se tienen el del conocimiento sobre el estudiante, y sobre el modelo pedagógico y técnicas de enseñanza.

Los Sistemas Expertos han sido aplicados en distintos dominios, y no existe una representación única para todos ellos, a pesar de los intentos por unificar dicha representación. De esta manera, la forma de representación se ha especializado según el dominio.

Existen aspectos comunes a explotar en todo dominio que un tutor ataque; esto es lo que ha permitido que en el área de Pedagogía se hayan desarrollado teorías de instrucción \[39\], y técnicas para estructurar y organizar la información que un profesor va a transmitir, Así como cursos aplicados a profesores de diversas materias. \[13\].

Coach \[33\] representa la información por medio de marcos ("_frames"_) adaptativos, sobre la materia en forma de un sistema de ayuda, y la gramática usada por el analizador sintáctico. De esta manera, las unidades de aprendizaje (que corresponderán al modelo del estudiante) usadas por este sistema (recuérdese que es utilizado para enseñanza de LISP), son los estatutos, tokens, conceptos y conjuntos de conceptos básicos. Justifica el uso de dichas unidades, ya que para el _aprendizaje y uso efectivo de un lenguaje de programación_ el alumno necesita conocer y comprender su sintaxis y semántica, lo que corresponde a los dos primeros tipos de unidades; y además, deberá comprender conceptos fundamentales, que divide en aquellos independientes (ejemplos: iteración, variable) y aquellos relacionados o agrupados (por ejemplo, el concepto de lista ligada en LISP, que además de su propio contenido conceptual requiere el conocimiento de conceptos como los estatutos CONS, CAR, CDR, átomos y notación punto en listas). Por otro lado, los marcos sobre la materia que contienen el conocimiento del dominio se dividen en tres estilos: las descripciones y definiciones (teoría); los ejemplos asociados, y la sintaxis de soluciones.

En el caso de CAPRA \[34\], la representación es también tipo _frames_, donde los objetos de conocimiento incluyen una biblioteca de problemas, los objetos que participan en un problema y los planes del estudiante al programar; mientras que dentro del modelo del estudiante, el marco correspondiente al conocimiento de un concepto por parte del alumno, contiene entre sus elementos:

* La relación con los marcos de conceptos relacionados.
* El nivel al que se estima que ha adquirido el concepto.
* Los textos, ejemplos y otros recursos de explicación que el alumno ha utilizado.
* Una evaluación de la dificultad que ha tenido en aprender el concepto.
* Una lista de los problemas que ha resuelto, y su corrección.
* Los planes que el alumno siguió para resolver los problemas, tanto correctos como incorrectos.

Una de las contribuciones importantes de este trabajo es el modelaje de los tipos de errores, y los _frames_ que los describen. Entre los tipos de error hay que mencionar: omisión, exceso, cambio, enfoque, mala formación, mala situación, y falsedad. Esta clasificación de los errores permite a CAPRA guiar su comportamiento en base a la importancia relativa y forma de los errores, asesorando al alumno de acuerdo a los elementos donde considera que más necesita.

Algunos de los intentos para representar un perfil del estudiante se basan en teorías cognitivas; tal es el caso del modelo EMI \[5\], que se basa en la caracterización de tres variables cognitivas: la Dependencia e Independencia de Campo; las Unidades de Reforzamiento; y el Nivel Taxonómico de Aprendizaje. Una de las características de este modelo es su representación mediante técnicas de la teoría de la Computación, como un conjunto de estados en un espacio de búsqueda, donde el que busca es el alumno y no un programa. El recorrido del espacio es el que nos da información sobre dicho perfil. Su implementación ha resultado natural en sistemas hipermedia \[9\], donde el ciberespacio se identifica con el espacio de búsqueda.

Para la adaptabilidad del sistema a distintos estudiantes, requerida por los sistemas tutores inteligentes si se han de clasificar entre los sistemas adaptativos \[3\]; se pueden aplicar técnicas de reconocimiento de patrones, tanto estadísticas como evolutivas. Existen ejemplos de intentos para aplicar algoritmos genéticos \[16\] y redes neuronales \[48\] al determinar la situación cognoscitiva y afectiva del estudiante.

Las redes neuronales no han sido muy utilizadas para atacar este problema, posiblemente por la opacidad del conocimiento adquirido \[22\]. Sin embargo, es posible que sean aplicables para complementar las reacciones del sistema asesor inteligente hacia el estudiante; especialmente se ha visualizado el área de la predicción del comportamiento futuro del estudiante \[48\], ya que en esta aplicación no se han desarrollado metodologías o reglas para su especificación, sino que el profesor en base a su experiencia estima dicho comportamiento futuro, y ajusta su nivel e intervención con cada estudiante.

Pero requieren de un entrenamiento previo, y para realizar este, de una amplia cantidad de información disponible; por lo que en el problema a atacar se considera probable incluir esta técnica hasta una segunda fase, una vez que el asesor inteligente haya registrado la historia del comportamiento de un grupo de estudiantes durante un período más o menos amplio.

Los mapas cognitivos \[15\] son una alternativa interesante para la representación del perfil del estudiante, por ser intuitivos y fácilmente comprensibles para un profesor neófito en el área de tutores inteligentes. Son grafos que representan relaciones de causa efecto; y pueden representar grados de interacción (mapas cognitivos difusos). Se han aplicado para describir el comportamiento de distintas clases de agentes interactuando entre ellos; de la misma manera, se considera factible usarlos para describir el comportamiento de los estudiantes de acuerdo a su clasificación, las acciones que el tutor ejecute, y los factores externos al asesor, tales como la actuación del profesor, los resultados de exámenes, el período de tiempo que el estudiante dedica a interactuar con el sistema, las calificaciones que el estudiante obtiene, y la actuación del grupo en general.

**2.7.3.2.3 Modelos de enseñanza.**

La Pedagogía influye fuertemente en el desarrollo de sistemas de enseñanza, los cuales deben basar su modelo psicológico y buena parte de la información en el modelo del estudiante, Así como las estrategias para enseñar efectivamente, en teorías de instrucción tales como las de Piaget, Skinner y Brunner. \[39\]

La Psicología interviene en el establecimiento de modelos cognitivos, necesarios para el entendimiento y aplicación apropiadas de los modelos de enseñanza citados.

En los sistemas anteriormente desarrollados, ha destacado la aplicación de la teoría de Piaget, entre otras razones por la influencia de Seymour Papert, discípulo suyo, con el desarrollo del lenguaje educativo Logo y su participación en el Media-Lab del MIT \[18\] \[46\].

En el ITESM es de amplio uso, siendo uno de los cursos requeridos como básicos para los profesores, el sistema de Microenseñanza \[13\]. De él se pueden tomar algunos principios prácticos para la creación y presentación del material de enseñanza:

* Inducción que motive al alumno a aprender.
* Comunicación efectiva, donde se incluye la sencillez en los términos, el uso apropiado de tecnicismos, y la capacidad de parafraseo.
* El uso efectivo de apoyos visuales, con un propósito definido, y apareciendo en el momento apropiado.
* La variación del estímulo.
* La organización lógica (que incluye los objetivos, metodología y control del tiempo), integración y manejo de preguntas, tanto las que evalúan el desempeño como las que deberán contestarse a los alumnos.

**2.7.3.4 Planteamiento teórico de la Universidad Virtual y avances actuales**

La Universidad Virtual del Sistema ITESM ha sido definida como un proyecto estratégico, orientado a desarrollar modelos educativos que permitan generar paquetes educativos y de educación a distancia, Así como llevar educación a los hogares y centros de trabajo; entre otros de sus objetivos. De ahí la importancia de la investigación en asesores inteligentes, que permiten superar las barreras de tiempo y espacio entre los alumnos y sus profesores, al llevar un sustituto de cierto nivel para el profesor, pero con toda la disponibilidad para el alumno.

Las propuestas del modelo teórico de la Universidad Virtual incluyen requerimientos tales como \[10\]:

* La obtención de habilidades y experiencias para formar una cultura tecnológica y criterio para la búsqueda de información.
* Que los sistemas computacionales adopten un comportamiento inteligente para auxiliar al estudiante.
* La capacidad de negociación de los medios computacionales con los seres humanos.
* Educación distribuida en vez de centralizada, que coincide con dos macrotendencias, incluyendo la del cambio de las jerarquéas a las redes. \[23\]
* La combinación entre alta tecnología y toque humano, que coincide con la macrotendencia de alta tecnología/alto contacto. \[23\]
* La manipulación directa y remota en interfases Hombre-Máquina. \[32\]

El éxito (o la necesidad) de este modelo puede apoyarse por varias macrotendencias más \[23\]:

* El cambio de una sociedad industrial, a una de la información.
* De la economía nacional a la mundial, ahora más conocida como globalización.
* De la alternativa a la opción múltiple.
* El triunfo del individuo \[24\].

Una primera definición de Universidad Virtual \[10\]es la siguiente (subrayando los conceptos más importantes para este proyecto):

_Una Universidad Virtual es aquella que permite a sus profesores **facilitar a sus alumnos la obtención del conocimiento** a través del acceso a medios de información que les coloque en **situaciones relevantes, fructíferas y semejantes a las que experimentan bajo el modelo tradicional de enseñanza-aprendizaje**, con la diferencia de que éstas nuevas vivencias son aparentes y **no atadas a las restricciones usuales de tiempo y espacio**. El espacio virtual les ata a la comunidad local y foránea por medio de tecnología computacional de punta, permitiendo Así la **independencia pero estrecha relación entre alumno y profesor** y fomentando la responsabilidad del primero por sus estudios, además de darle a este mismo la posibilidad de abrir el espacio del análisis, la crítica y la discusión de aquellas situaciones en las que se le ha colocado, permitiendo Así la valorización de los comportamientos, el énfasis de la importancia en sus relaciones humanas, y el respeto a su individualidad._

Este contexto debe servir como guía para los objetivos de esta investigación.

En el aspecto de modelos cognitivos se ha realizado investigación en las técnicas para medir la adquisición efectiva de los conocimientos, proponiéndose el modelo EMI \[5\]; y se ha orientado dicho modelo para su validación, al aplicarlo en sistemas tutores hipermedia. \[8\] \[9\]

Dentro de este contexto, este trabajo es un esfuerzo complementario mediante líneas de investigación distintas pero complementarias, que fomentan el enriquecimiento de la información experimental que se está obteniendo al aplicar estos modelos.

**2.7.3.5 Estado del Arte en Agentes Inteligentes**

Existen fuertes grupos de investigación en el área dentro del ITESM, especialmente en el Campus Monterrey y en el Centro de la República Mexicana (Campus Morelos, Estado de México y Ciudad de México, con una estrecha colaboración). Dichos grupos están realizando proyectos donde se usan sistemas multiagentes en aplicaciones tales como el análisis de biosecuencias, la planificación de movimientos de robots, y sistemas tutoriales inteligentes.

El año pasado apareció el libro de "_Inteligencia Artificial: Un Enfoque Moderno_" \[30\] que cada vez es más citado, por ser un compendio amplio y didáctico de las técnicas desarrolladas en el área de Inteligencia Artificial; el cual es importante por su enfoque amplio, basado en el concepto unificador del Agente Inteligente. En este libro nos encontramos con algunas definiciones básicas, además de descripciones de las características de los agentes. Entre otras cosas, los agentes debieran ser:

* Racionales: tales que escojan la mejor decisión posible en un momento dado.
* Autónomos: tales que su comportamiento está definido por su propia experiencia además de sus percepciones; sin limitarse a ninguno de los dos.

también en dicho libro, se define la estructura de un agente: _arquitectura + programa_; y una clasificación principal de los tipos de agentes:

* Agentes de reflejo simple: basado en reglas de "condición - acción", que mapean una entrada a una salida. El mapeo no es exhaustivo, sino que se resume mediante las reglas.
* Agentes de reflejo con estado interno: Son similares a los anteriores, pero las reglas dependen además de la entrada, del estado interno del agente para producir una salida; y el estado interno se ve afectado por las reglas, al tiempo que se produce la salida..
* Agentes basados en metas: Adiciona a un agente con estado interno, el conocimiento sobre el estado final (meta) al que se quiere llegar, de manera que aplica búsqueda y/o planificación para encontrar la serie de acciones que lo llevará del estado actual a las metas.
* Agentes basados en utilidad: además de las metas, se puede usar una función de utilidad (o heurística, según otros autores) para calificar los estados, haciendo más o menos deseable alcanzar dichos estados para llevarnos a la meta.

Además se presenta un conjunto de propiedades de los ambientes, que nos permiten categorizar la dificultad de adaptación a la que se enfrentará un agente:

* **Accesibles vs. inaccesibles**: un ambiente será accesible si el agente puede tener el conocimiento total del ambiente.
* **Deterministas vs. no deterministas**: si el estado siguiente del ambiente se determina solamente como consecuencia del estado actual y la acción del agente, se dice que es determinista.
* **Episódicos vs. no episódicos**: si la calidad de una decisión por parte de un agente, en un momento dado, depende solamente del estado del sistema y de la decisión, y no se ve afectada por decisiones anteriores, entonces es episídico.
* **Estáticos vs. dinámicos**: Si el ambiente puede modificarse mientras el agente está en el proceso de decisión, es decir, no espera la decisión del agente, es dinámico; si el tiempo no afecta el estado mientras el agente decide, es estático; y si el tiempo no afecta al estado, pero sí a la calidad de la decisión del agente, el ambiente es semidinámico.
* **Discretos vs. continuos**: si es finita la cantidad de percepciones y acciones posibles, el ambiente es discreto.

La importancia del esquema anterior para este trabajo está en la posibilidad de categorizar al asesor inteligente propuesto, en el contexto del ambiente que va a enfrentar:

* **No es accesible**, pues no se tiene toda la información posible sobre el estudiante; esto es especialmente notorio cuando el estudiante no hace uso del asesor, sino de otros medios; y por la dificultad de conocer los estados afectivos que influyen la conducta del mismo \[29\].
* **No es determinista**, pues el estado siguiente del estudiante no solamente depende de su estado actual y la conducta del asesor; existen factores de variabilidad \[32\] entre los usuarios que nos impiden conocer _a priori_ la reacción del estudiante hacia un estímulo \[39\].
* **No es episódico**, pues los efectos de las decisiones de un asesor afectarán las decisiones posteriores. Para clarificar este punto, que pudiera ser controversial, se propone el ejemplo del aprendizaje de conceptos del lenguaje por parte de un alumno, como se describió al hablar de Coach \[33\]. Es distinta la decisión que el asesor tomará para explicar el concepto "_listas ligadas_", si el usuario no conoce el concepto "_CONS_", la cual posiblemente consistiría en presentarle primero dicho concepto; que la decisión que tomaría al regresar al mismo estado, una vez que tomé la decisión de presentar el concepto anterior, pues ahora debe asumir que se conoce el concepto "_CONS_", y tomar la decisión de presentar nueva información.
* **Es dinámico**, pues los factores externos que afectan al estudiante, especialmente los afectivos y el proceso de enseñanza independiente al asesor (inclúyanse en este apartado, entre otros factores, la asesoría del profesor, Así como la clase que imparte; la consulta a libros, y la observación de ejemplos) pueden variar y modificar en cualquier momento la situación del estudiante. Sin embargo, en el contexto del problema que se busca atacar, **_el asesor puede suponer un comportamiento estático durante la sesión_**, pues es altamente improbable que los factores externos hagan que el conocimiento del estudiante se modifique **_mientras está interactuando con el asesor_**. Además, afortunadamente, la mayor parte de los factores descritos tienden a mejorar el desempeño o al menos el área de conocimiento del estudiante, por lo que el asesor tenderá más a subestimar al estudiante que a sobrestimarlo, por lo que tal vez tome acciones adicionales de explicación pero es menos probable que omita acciones de explicación suponiendo que el estudiante tiene cierto conocimiento.
* Finalmente, **no es discreto**; la medición de si un estudiante conoce o no un concepto, no es un valor discreto sí/No, ni 0-10; sino una medida difusa, además de continua para todos los propósitos prácticos.

La edición de julio de 1994 de "_Communications of the ACM_", dedicada al tema de agentes inteligentes, es una de las referencias más importantes en el campo, pues en ella se presentaron tanto conceptos futuristas como aplicaciones recientes.

Entre los paradigmas que recientemente han tomado popularidad podemos encontrar los Sistemas Multiagentes, los cuales han sido uno de los pilares de los que ha nacido la rama de la Inteligencia Artificial Distribuida; en ellos, se aplican conceptos como la cooperación, negociación y especialización a las interacciones entre los agentes, para conseguir una meta común. Si puede compararse un agente con un ser humano, en el manejo de una función, de la misma manera puede compararse un sistema multiagentes con un grupo de trabajo humano.

Algunas de las aplicaciones de estos sistemas incluyen:

* Un Sistema de Apoyo a la Toma de Decisiones, basado en un comité de agentes inteligentes, cada uno con un dominio de conocimiento distinto (asociado a roles tales como el socio - economista, el ecologista, el abogado), que en conjunto "deliberan" la factibilidad de un proyecto en asociación a un Sistema de información Geográfica. \[20\]
* Modelado y simulación de Organizaciones. \[26\]
* Coordinación de agendas de actividades en un grupo de trabajo. \[12\]

Respecto a la arquitectura, se puede mencionar la propuesta por Wittig \[20\], que consiste en dos capas:

* Capa de cooperación, que contiene el conocimiento sobre las capacidades del agente, Así como del ambiente y términos de negociación con otros agentes para la consecución de metas comunes y particulares.
* Capa del sistema inteligente, que contiene los mecanismos de inferencia y las bases de conocimiento.

**2.7.3.6 Asesores Inteligentes: Características, Ejemplos y arquitectura.**

En este apartado, solamente se tratarán sistemas que corresponden a Interfases Inteligentes basadas en Agentes, y Asesores Inteligentes que no se han orientado a la enseñanza de Lenguajes de programación, pues los ejemplos de Asesores Inteligentes orientados a la enseñanza de Lenguajes de programación ocuparon un apartado especial al inicio de la sección de Estado del Arte.

Dentro del área de Interfases Inteligentes, pueden mencionarse:

* El asistente personal para filtrar los mensajes de correo electrónico \[19\], cuyo objetivo es crear un filtro para el usuario, que reduzca la incidencia de información no importante para él, por medio de recomendaciones. Una de las contribuciones particulares a este trabajo es su enfoque de aprendizaje en base a la interacción con el usuario, y la clasificación de las fuentes de dicho aprendizaje:
  * *   Monitoreo de las acciones del usuario, reconocimiento de patrones en las mismas, e imitación.
  * retroalimentación directa e indirecta, que refuerce o desaliente el comportamiento del agente. Cuando el usuario efectúa las acciones recomendadas por el agente, esto refuerza; mientras que cuando cancela una de ellas, o directamente le indica al agente su desacuerdo, el agente tomará el caso como una falla que le permite ajustar su comportamiento. Este entrenamiento puede equipararse a algunos conceptos de sistemas evolutivos, tanto redes neuronales como algoritmos genéticos.
  * El agente puede aprender directamente al ser "programado por ejemplos" en forma explícita. El usuario, al reconocer un mensaje de su interés, puede indicarle al agente cuél es la característica que lo distingue, y que aplicada a cualquier otro mensaje le dará interés.
  * La comunicación con agentes similares que asisten a otros usuarios.
* El Internet Softbot \[11\]: la Internet es una enorme fuente de información, tanto útil como inútil. De ahí que los autores de este agente decidieron implementar un "Softbot", es decir, robot en software, el cual tiene una interfaz como sensor, y cuyos efectores son los programas y protocolos de la Red. En esta aplicación, los principales problemas que se enfrentan y que pueden ser transportables a problemas como el tema de esta propuesta, incluyen: la planeación de acciones del agente, los objetivos de la interfase, la integración de múltiples recursos como alternativas para conseguir sus metas, el razonamiento con conocimiento incompleto, y la seguridad en los efectos del Softbot.
* El asesor de calendario o CAP \[21\], el cual es un aprendiz que al igual que el asistente personal de correo aprende por la observación y el entrenamiento basado en los ejemplos observados; en este caso por medio del algoritmo ID3.
* Un nuevo punto de vista para el asesor de calendario \[12\] ha utilizado la técnica de sistemas multiagentes y negociación entre los agentes del sistema, para simular en forma más natural el comportamiento de los seres humanos para coordinar sus citas.

Además de los sistemas anteriores, vale la pena mencionar al sistema Gracile \[1\], el cual es un asesor inteligente, orientado a la enseñanza, pero que basa su enfoque en el aprendizaje colaborativo asistido por computadora. Podemos, por tanto, decir que combina de entre las alternativas de solución que se definieron, las de Asesor Automatizado y práctica en Grupo; la única razón que lo separa del área de investigación de este trabajo, está en el dominio tratado: el aprendizaje de la gramática japonesa.

![](line1.gif)

### 3 - Objetivos {#3---objetivos}

Para este trabajo, se pretende demostrar la tesis:

_Los asesores inteligentes son una alternativa viable para apoyar la enseñanza de una materia del área de lenguajes de programación, tomando el papel del profesor en la asesoría a los alumnos cuando no está disponible; y por medio de su uso, se puede conseguir mayor oportunidad en la asesoría al alumno, elevar el nivel de impartición de la materia, y apoyar la virtualización de la enseñanza._

El objetivo general de la tesis propuesta, será el siguiente:

_Implementar e implantar una arquitectura base, sobre la cual puedan construirse fácil y eficientemente asesores inteligentes que apoyen los procesos repetitivos de asesoría de la enseñanza tradicional, automatizándolos; y comprobar su funcionalidad, construyendo sobre dicha arquitectura un asesor que apoye la enseñanza de una materia del área de lenguajes de programación._

Para llegar a este objetivo, deberemos cumplir ciertos objetivos específicos:

* Búsqueda de un modelo teórico de los procesos de asesoría.
* Diseño de la arquitectura requerida para el asesor automatizado
* Selección detallada de las herramientas de las distintas áreas de las Ciencias Computacionales (Inteligencia Artificial, Teoría de la Computación y Autómatas, Diseño de Interfase, Algorítmica) apropiadas para implementar la arquitectura.
* Investigación sobre las herramientas de otras disciplinas (Psicología, Pedagogía) que pueden complementar los modelos teóricos y la aplicación del asesor.
* Construir o implementar el asesor prototipo, en la materia de Ensamblador.
* Implantación el uso del asesor, durante la impartición del curso Virtual de la materia, ya programado en el Campus Ciudad de México del ITESM, durante el semestre 9701.
* Publicación de reportes o avances de investigación, para su evaluación interna y externa.
* Descripción y documentación del uso de la arquitectura, dirigida a profesores.
* Prueba de la construcción rápida y sencilla de asesores limitados en otro dominio (lenguaje).
* Evaluación de los cambios ocurridos en el desempeño del estudiante y la impartición del curso.
* Establecimiento de nuevas líneas de investigación, para trabajos posteriores.
* Finalización y defensa del documento de investigación.

![](line1.gif)

### 4 - Trabajo propuesto {#4---trabajo-propuesto}

Para definir apropiadamente el trabajo que se propone realizar como tesis, hay que mencionar:

* Arquitectura del proyecto propuesto.
* Contexto en el que será implementado
* Por qué es interesante la investigación en el área, y por consiguiente el proyecto.
* Plan de trabajo: dividido en actividades ya realizadas y actividades por realizar.

**4.1 Arquitectura del proyecto propuesto.**

El proyecto propuesto cumplirá las características de una Interfase Inteligente, pues será una ayuda al usuario (alumno) para facilitarle el manejo del software; pero irá más allá, pues contará con modelos apropiados del alumno y del conocimiento, para dirigir el comportamiento del usuario y convertirlo en un proceso enseñanza-aprendizaje.

Se puede considerar que el proyecto entra dentro de la categoría de los Sistemas Tutores Inteligentes, pues cumple las definiciones que se han examinado\[3\] \[16\]; pero no sustituirá la enseñanza por parte del profesor; sino que apoyará al mismo, durante el proceso de ejercitación del alumno (en este caso, práctica de programación); para lograr esto, deberá contar con la capacidad inteligente, de observar qué está intentando realizar el usuario (alumno programando), para determinar su comportamiento, encontrar sus fallas y aciertos, retroalimentar al usuario; crear su perfil, y alimentar con dicha información una base de conocimiento, la cual será usada tanto por el profesor como por el alumno para guiar el proceso de aprendizaje. Específicamente, el papel del profesor como Transmisor de Conocimiento no será cubierto por el proyecto propuesto; se enfoca al proceso de Asesor, que apoya al alumno después de haber pasado la etapa de Receptor.

Así, de acuerdo a los alcances propuestos, y a la clasificación mostrada en la figura 1, presentada en la sección de Alternativas de solución, el sistema propuesto puede contextualizarse como un Asesor Inteligente aplicado a la enseñanza de la programación.

Si bien es perfectamente posible integrar la información del comportamiento del usuario con un ITS que cubra el papel de Transmisor, no será objetivo de este trabajo el hacerlo; puede modelarse la situación como un sistema de múltiples agentes inteligentes; de acuerdo a sus metas, se pueden enumerar los indicados en la Tabla 5.

_Tabla 5: Algunos agentes que se proponen para el modelado del proceso enseñanza-aprendizaje._

| **Meta principal** | **Nombre del agente** |
|---|---|
| Transmitir el conocimiento del lenguaje de programación | **_Transmisor_** |
| Adquirir el conocimiento del lenguaje de programación | **_Alumno_** |
| Reconocer y corregir los errores del Alumno al realizar prácticas de programación | **_Asesor_** |

![Figura 4: Gráfica de Roles propuestos](Image4.gif)

**_Figura 4: Roles existentes en el modelo de funciones en el proceso enseñanza-aprendizaje de la programación._**

Por supuesto, esta es una simplificación de la situación real; generalmente, un Profesor humano hace los papeles de los agentes Transmisor y Asesor, y existen múltiples agentes Alumnos. Sin embargo, esta modelación permite describir a qué parte se dedicará este trabajo: la automatización, por medio del paradigma de agente, del papel del Asesor. Se busca que el agente apoye a un Profesor Humano en su enseñanza a Alumnos Humanos; pero para conseguir esto, deberá previamente tomarse en cuenta un modelo más complejo, tanto del Profesor como del Alumno, que estudie sus partes integrantes, tales como "Profesor del Lenguaje", "Profesor del Paradigma", "Profesor de técnicas", "Motivador", "Examinador"; "Memorizador", "Generador de Algoritmos", "Analista", "Diseñador", "Codificador", "Depurador".

Con esto, se pretende mostrar que este trabajo forma parte de un sistema más complejo, el cual no se está automatizando en esta instancia; sin embargo, particularmente los agentes que realicen los papeles de un Profesor Humano pueden integrarse en un futuro próximo; y el modelo de múltiples agentes se considera como una técnica apropiada para representar la interactividad que deberá existir entre los elementos. Tomando una definición clásica de "agente": una entidad que tiene sus propias metas y negocia con agentes externos para llegar a las mismas.

Para desarrollar los perfiles de los usuarios, se utilizarán dos bases: el modelo COACH, que cuenta con respaldo estadístico; y el modelo EMI, el cual se está buscando validar en el ITESM-CCM; durante el desarrollo del trabajo, se buscará discriminar qué factores de ambos modelos han resultado útiles para el razonamiento que realice el Asesor Inteligente de programación.

Se puede ver también que un resultado intermedio de la investigación será un macromodelo del proceso enseñanza-aprendizaje de la programación, basado en Agentes Inteligentes, que servirá para la extensión futura del trabajo.

El primer lenguaje al que se va a enfocar el asesor, por razones del contexto de implantación en el ITESM-CCM, será Ensamblador.

La arquitectura general será la propuesta por Kaplan para un ITS \[16\], pues como se mencionó en el Estado del Arte, integra los aspectos generales de la mayoría de los sistemas estudiados. De hecho, puede considerarse una especialización de la arquitectura para sistemas adaptativos \[3\]de Benyon y Murray; además de ser compatible con sistemas similares al propuesto, tales como Coach \[33\] y CAPRA \[34\], y con otros ITS no orientados a la enseñanza de la programación, incluyendo HyperTutor y WebTutor \[27\], Así como Gracile \[1\].

Siendo Coach \[33\] el trabajo más parecido al propuesto, y mejor documentado, además de haber resultado exitoso y completamente implementado, es natural que sea una de las principales fuentes. De él se tomará buena parte del detalle de la arquitectura:

* En el modelo del dominio, la definición de las unidades de enseñanza: _estatutos, tokens, conceptos y grupos de contextos_; Así como la clasificación de los elementos de conocimiento de la materia: _descripciones, ejemplos, y sintaxis_. Todos estos conceptos se toman por ser una descripción clara y fácilmente implementable, además de visible para el usuario, lo que facilitará su adaptación a otras materias. En el trabajo propuesto, por razones que se explicarán a continuación, la sintaxis y los estatutos se consideran como un solo grupo de conceptos.  
    Además, se considera clasificar el conocimiento del tema en requerido y relacionado, y construir las relaciones entre las partículas de conocimiento. Si bien Selker utiliza una red semántica, es probable que se tome un enfoque alterno; por ejemplo, los mapas cognitivos son atractivos, por tener las características de visibilidad, representación compacta, fácil implementación, y fácil explotación de la información.
* En el modelo del usuario, se toman los mismos 4 niveles o grados de conocimiento. No hay una razón particular que nos indique por qué preferir 4 niveles, y no 3 o 5; pero se toma dicho número dado que experimentalmente Coach tuvo buenos resultados con esa jerarquéa. Además, se incluyen como elementos de los _frames_ que describen al modelo del estudiante, la experiencia, latencia, desempeño, razón de cambio en la calificación, y el concepto de historial de errores.
* El modelo pedagógico, en cambio, se considera muy primitivo; considera tendencias muy simples, y no toma en cuenta, al menos en su reporte de investigación, aspectos tales como una metodología bien definida \[13\] y la situación afectiva del estudiante \[29\].
* Por otro lado, la interfase está orientada al sistema de aprendizaje, y no al dominio que se va a aprender en sí mismo; esto puede hacer la interfase menos efectiva \[7\]. Además, siempre interviene en ayudar al usuario, lo cual no necesariamente es bienvenido \[34\], especialmente al variar el nivel de conocimientos del estudiante \[32\].
* Una última pero muy importante contribución está en el sistema experimental. En él, se comparan dos grupos que tienen acceso a los mismos recursos, con excepción del asesor inteligente, para determinar los efectos que este tuvo en el aprendizaje. Si bien hay que considerar que dicho experimento puede ser sesgado, dados los factores fuera del control del experimentador, como la amplia diversidad de los sujetos, nos proporciona información útil; además, se cuenta con herramientas tales como las encuestas, donde se puede medir el éxito del sistema en base a la satisfacción subjetiva del cliente; y experimentar mediante el tiempo requerido para completar una tarea. \[32\]

Algunas de las deficiencias de Coach son puestas de manifiesto al observar CAPRA \[34\], el otro tutor de programación con funciones avanzadas que se tomará como base importante de la arquitectura. Entre los puntos con los que contribuirá, para que el trabajo propuesto sea más completo que Coach, además de la observación del grado de intervención del tutor, dentro de CAPRA se tienen:

* En el modelo del dominio, el apoyo de un detector/diagnosticador de errores de programación. CAPRA usa el enfoque basado en intenciones, que se deberá considerar si bien no se busca limitarse al mismo, pues (al menos en la implementación descrita) no permite que apoye el alumno en la realización de trabajos que no son previamente definidos. Por ello, también se busca seguir el enfoque de ejecución simbélica, mencionado en dicho trabajo. De esta manera, también se debe agregar el conocimiento formado por los errores, las preguntas y conceptos incorrectos que comúnmente ocurren.
* En el modelo del usuario, existen algunos conceptos no considerados por Coach, que en el presente trabajo se considera conveniente agregar: la lista de recursos utilizados, el historial de problemas que ha resuelto, y los planes que el alumno siguió para resolver los problemas. Estos últimos forman un problema interesante, pues no se cuenta con medios para conocerlos con exactitud, por lo que se deberán inferir o predecir.
* El modelo pedagógico, dentro del reporte de investigación indicado, no se menciona.
* En la interfase solamente se menciona la integración de un ambiente de desarrollo. Debido a la necesidad de "observar por encima del hombro" al usuario \[19\], es más sencilla la implementación de muchas de las características mencionadas (por ejemplo, la depuración automática y la intervención del sistema en forma adaptativa), bajo dicho ambiente; por lo que se considera para este trabajo dicho ambiente de desarrollo.

Sin considerar completa la definición del modelo del dominio y del usuario, cuyo alcance total es parte del trabajo de investigación e implementación que se está proponiendo; se puede notar que los principales elementos faltantes hasta aquí son la interfase y el modelo cognitivo.

Dentro de los elementos de interfase, naturalmente se tomarán como base los ejemplos de asesores inteligentes del tipo "interfases": entre ellos, se han revisado extensamente el asistente de correo \[19\] y de agenda \[21\]. Entre las características que se retomarán para el proyecto propuesto, como se mencionó en el Estado del Arte:

* El asistente realizará un monitoreo y registro de las acciones del usuario.
* El asistente contará con opciones de retroalimentación, directas e indirectas, por parte del usuario.
* El asistente podrá comunicarse con otros similares. Para ello, dado el contexto en que trabajan los alumnos, sería ideal contar con un servidor central del conocimiento obtenido por los asistentes, y que estos automáticamente se conectaran y le transmitieran información, para que en forma automática el servidor central seleccionara la más importante. Sin embargo, hacerlo por red resulta demasiado complejo, por las limitantes de recursos con las que se desarrolla el proyecto, y por introducir el problema adicional de que el servidor central clasificara en forma automática. Por ello, la comunicación se hará en una forma manual, a través de la obtención periódica de la información generada por el asistente personal de cada alumno, por medios magnéticos (probablemente, aprovechando la sesión semanal de clase)
* El asistente deberá ser capaz de trabajar con conocimiento incompleto, mediante un esquema apropiado de suposiciones.
* El asistente deberá adaptarse al usuario; para ello, utilizará algoritmos de aprendizaje apropiados. Entre las alternativas que se deberán considerar, pero que aun no se definen, tenemos al algoritmo ID3, el uso de algoritmos genéticos y mapas cognitivos.

Además, se propone seguir el enfoque de GOMS \[32\] para la representación de las acciones del usuario. Esto porque la representación de varios niveles, de metas hacia operadores de selección, es directamente traducible a una gramática, con lo que el parser embebido en el asesor podráa ir comprimiendo las acciones del usuario, iniciando por las teclas que presiona y dirigiéndose hacia el reconocimiento de las metas, que es un requisito ya mencionado para la detección de errores y que además es obviamente de utilidad como un dato de entrada para el modelo pedagógico.

Por otro lado, en el modelo pedagógico, aun se requiere investigar más para su definición. Sin embargo, y tomando como base teórica el enfoque de IA de simular el comportamiento del asesor humano \[30\], se propone tomar la misma metodología que sigue el profesor humano de la materia (el autor), basada en la microenseñanza \[13\]. Esto, además de permitir una simulación más cercana del profesor humano como asesor, puede reducir el sesgo en la comparación entre los dos grupos. Por otro lado, se tiene que tomar en cuenta la posibilidad de integrar al modelo EMI \[5\] para su validación \[9\], entre otras razones, porque se tiene una propuesta definida para su uso en sistemas de navegación \[6\], y en base a las metas comunes que tienen ambos proyectos como componentes del megaproyecto de Universidad Virtual. De ser Así, el modelo EMI no sería sino una sofisticación al sistema de mapeo de conceptos relacionados usado por Coach y CAPRA.

**4.2 Contexto de implementación.**

Este trabajo puede considerarse como una parte de un sistema mayor, el cual consistiría de un conjunto de herramientas para la enseñanza de lenguajes de programación. Específicamente dentro del modelo de Universidad Virtual, se está considerando que se haga uso de los recursos de multimedia, hipertexto y el World Wide Web, para la transmisión de la información al alumno. Así, como trabajo futuro se puede considerar la integración de un ambiente inteligente, que conste de varios asesores o agentes interconectados.

El trabajo presente será un agente cuyo papel consiste en observar la programación del alumno, retroalimentarlo en dicha actividad, y proporcionar con ello información a los agentes "examinadores", "presentadores de la información", etcétera. Por ello, este trabajo se deberá realizar en forma modular, para su posterior integración con dichos agentes. Específicamente, puede mencionarse la posibilidad (futura) de que el asesor inteligente dispare la acción de presentar un tema o capítulo del libro de texto virtual, con la que apoye el aprendizaje del alumno.

**4.3 Interés de la investigación.**

Dentro del proyecto de Universidad Virtual del ITESM, y específicamente dentro del Campus Ciudad de México, se ha propuesto la investigación en **_Tutores Inteligentes Basados en Sistemas Multiagentes_**. \[10\]. Si bien el presente no es un sistema multiagente en el sentido tradicional de la palabra, si entra dentro de la definición de Kaplan para Tutores Inteligentes; y se ha basado en el enfoque de Agentes Inteligentes; si se toma el sentido amplio de agentes, donde un ser humano puede ser un agente, y el interactuar con un ser humano es similar a la negociación entre agentes, podráa contextualizarse dentro del área.

Se han descrito en el capítulo 1 las razones que motivan el desarrollo de este proyecto de investigación; debido a su impacto en el alumnado, Así como a las diversas áreas de investigación que concurren para el buen término de este proyecto.

Como se vio en la sección de comparación de alternativas (2.4), la que se va a investigar resulta significativa por la poca difusión que existe de herramientas similares; además de que es un concepto novedoso que puede resolver algunos de los problemas que han afectado a los alumnos del Departamento de Computación del ITESM-CCM.

![](line1.gif)

### 5 - BIBLOGRAFÍA {#5---biblografía}

**5.1 Bibliografía utilizada**

> \[1\] Ayala, Gerardo y Yano, Yoneo:  
> _"Agentes Inteligentes para Ambientes de Aprendizaje Colaborativo".  
> Memorias del V Congreso Iberoamericano de Inteligencia Artificial, Iberamia 96_.
>
> \[2\] Bates, Joseph:  
> _"The Role of Emotion in Believable Agents".  
> Communications of the ACM_, July 1994, Vol. 37, No. 7, pp. 122-125.
>
> \[3\] Benyon, D. y Murray, D.  
> _"Adaptive systems: from intelligent tutoring to autonomous agents"_.  
> _Knowledge-Based Systems,_ Volume 6, Number 4, December, 1993.
>
> \[4\] Boden, Margaret A.:  
> _"Agents and Creativity".  
> Communications of the ACM_, July 1994, Vol. 37, No. 7, pp. 122-125.
>
> \[5\] Boumedine, Marc; Chirino, Ivonne y Espinosa, Enrique  
> _"A Formal Approach to the EMI Model and Case Study"_.  
> _Proceedings of ED-Media 96, AACE._
>
> \[6\] Boumedine, Marc; Chirino, Ivonne y Espinosa, Enrique  
> _"Towards the Definition of a General Model for Aiding in the Design of Hypermedia-Based Learning Systems"_.  
> _Proceedings of ED-Telecomm 96, AACE._
>
> \[7\] Cooper, Alan:  
> _"Goal-Directed Software Design".  
> Dr. Dobb's Journal_, September 1996, pp. 16-23.
>
> \[8\] Espinosa Carrillo, Enrique David.  
> _"GUIas Visuales para Estructuras de Datos I y II"_.  
> _XII Reunión de Intercambio de Experiencias en la Educación, Sistema ITESM_  
> Monterrey, México. Agosto, 1994.
>
> \[9\] Espinosa Carrillo, Enrique David y Brito, Alejandro.  
> _"Multiplatform Implementations of the EMI Model using the JAVA Technology"_.  
> ITESM CCM, 1995.
>
> \[10\] Espinosa Carrillo, Enrique David; Medina-Mora Icaza, Teresa; y Vallejo Ramírez, Isabel.  
> _"Una Propuesta para un Modelo Universitario Virtual a través del Transporte Situacional"_.  
> V Reunión de Intercambio de Experiencias Docentes  
> ITESM CCM, Julio de 1995.
>
> \[11\] Etzioni, Oren & Weld, Daniel:  
> _"A Softbot-based interface to the Internet".  
> Communications of the ACM_, July 1994, Vol. 37, No. 7, pp. 72-76.
>
> \[12\] Garrido, Leonardo y Sycara, Katia  
> _"Multi-Agent Meeting Scheduling:An Experimental System"_.  
> _Memorias del V Congreso Iberoamericano de Inteligencia Artificial, Iberamia 96_.
>
> \[13\] _"Manual de Microenseñanza"_.  
> Centro para la Excelencia Académica, ITESM-CCM, 1995.
>
> \[14\] _"Misión del Sistema Instituto Tecnológico y de Estudios Superiores de Monterrey: hacia el 2005"_.  
> ITESM, 1996.
>
> \[15\] Jaramillo, Wuilbert; Leal, Antonio; Ahuactzin, Juan M.; y sínchez, Antonio.  
> _"aplicación de Mapas Cognitivos en Realidad Virtual y en Inteligencia Artificial Distribuida"_.  
> _Memorias del V Congreso Iberoamericano de Inteligencia Artificial, Iberamia 96_.
>
> \[16\] Kaplan, Randy y Rock, Denny.  
> _"New Directions for Intelligent Tutoring"_.  
> _AI Expert_, February, 1995.
>
> \[17\] Kay, Alan C.  
> _"Computers, Networks and Education"_.  
> _Scientific American_, September, 1991.
>
> \[18\] Logsdon, Tom:  
> _"Robots: Una revolución"  
>_Ediciones Orbis, 1986.
>
> \[19\] Maes, Pattie.:  
> _"Agents that Reduce Work and Information Overload"  
> Communications of the ACM_, July 1994, Vol. 37, No. 7, pp. 81-91.
>
> \[20\] Malheiro, Benedita y Oliveira, Eugenio  
> _"Distributed Belief Revision and Enviromental Decision Support"_.  
> _Memorias del V Congreso Iberoamericano de Inteligencia Artificial, Iberamia 96_.
>
> \[21\] Mitchel, Tom et al.:  
> _"Experience with a Learning Personal Assistant"  
> Communications of the ACM_, July 1994, Vol. 37, No. 7, pp. 81-91.
>
> \[22\] Minsky, Marvin  
> _"Logical versus Analogical or Simbolic vs. Connectionist or Neat vs. Scruffy"  
> AI Magazine_, Summer 1991
>
> \[23\] Naisbitt, John:  
> _"Macrotendencias"  
>_Editorial Diana, 1985.
>
> \[24\] Naisbitt, John y Aburdene, Patricia:  
> _"Megatendencias 2000: diez nuevos rumbos para los años 90"  
>_Norma, 1990.
>
> \[25\] Norman, Donald A.:  
> _"How Might People Interact with Agents".  
> Communications of the ACM_, July 1994, Vol. 37, No. 7, pp. 68-71.
>
> \[26\] Oliveira, Eugenio y Hochuli Shmeil, Marcos Augusto  
> _"Applying Multiagent Methodologies to Organization Modeling"_.  
> _Memorias del V Congreso Iberoamericano de Inteligencia Artificial, Iberamia 96_.
>
> \[27\] Pérez, Tomás A. y Gutiérrez, Julián:  
> _"Web Tutor. Un Sistema Hipermedia Adaptativo para la educación en WWW".  
> Memorias del V Congreso Iberoamericano de Inteligencia Artificial, Iberamia 96_.
>
> \[28\] Press, Larry:  
> _"Tomorrow Campus".  
> Communications of the ACM_, July 1994, Vol. 37, No. 7, pp. 13-17.
>
> \[29\] Ramos Quintana, Fernando y Espinosa Carrillo, Enrique David.  
> _"Educational Placement of Agent Characterizations: Imposed vs. Autonomous Planification".  
> Memorias del V Congreso Iberoamericano de Inteligencia Artificial, Iberamia 96_.
>
> \[30\] Russell, Stuart y Norvig, Peter.  
> _"Inteligencia Artificial: un Enfoque Moderno"_.  
> Prentice-Hall, 1996.
>
> \[31\] Sánchez, Jesús y Quintana, Maricela.  
> ["Página de la Materia de análisis de Algoritmos", en http://research.cem.itesm.mx/jesus/.](http://research.cem.itesm.mx/jesus/) Agosto 1995.
>
> \[32\] Schneiderman, Ben.  
> _"Designing the User Interface: strategies for effective human-computer interaction"_.  
> Addison-Wesley, 1992.
>
> \[33\] Selker, Ted:  
> _"Coach: A Teaching Agent that Learns".  
> Communications of the ACM_, July 1994, Vol. 37, No. 7, pp. 92-99.
>
> \[34\] Urretavizcaya, Maite y Verdejo, M. Felisa  
> _"Sistema interactivo de detección y diagnóstico adaptado para un Tutor Inteligente de programación".  
> Memorias del II Congreso Iberoamericano de Inteligencia Artificial, Iberamia 90_.
>
> \[35\] Yourdon, Edward.  
> _"Análisis Estructurado Moderno"_.  
> Prentice-Hall, 1993.

**5.2 Bibliografía electrónica**

> \[36\] The Virtual Tutor Project  
> [http://www.uq.edu.au/~zzredcol/V.T.Proj.html](http://www.uq.edu.au/~zzredcol/V.T.Proj.html)
>
> \[37\] Intelligent Tutoring Systems (ITSs)  
> [http://ott.sc.ist.ucf.edu/1\_2/1\_2\_1/](http://ott.sc.ist.ucf.edu/1_2/1_2_1/)
>
> \[38\] Archivo ITS sobre el Workshop Montreal 96  
> [http://advlearn.lrdc.pitt.edu/its-arch/](http://advlearn.lrdc.pitt.edu/its-arch/)

**5.3 Referencias por Analizar**

> \[36\] Adam A., Laurent J.P.  
> _"LAURA: A system to debug student programs"_.  
> _Artificial Intelligence, 15_ \*
>
> \[37\] Reiser B.J., Anderson, J. R. y Farrell, R.G.  
> _"Dynamic student modelling in an intelligent tutor for LISP programming"_.  
> y otras referencias, en general respecto al desarrollo del LISP Tutor o ACTP, por J. Anderson.\*
>
> \[38\] Anderson, J. R. y Skwarecki, E.  
> _"The automated tutoring of introductory computer programming"_.  
> _Communications of the ACM_, Sept. 1986, Vol. 29, No. 9, pp. 842-849.  
> _<http://www.acm.org/pubs/toc/Abstracts/cacm/6593.html>_
>
> \[39\] Araújo, Joäo B. y Chadwick, Clifton B.  
> _"tecnología Educacional: Teorías de Instrucción"_.  
> Paids, 1980. \*
>
> \[40\] Goldberg, D.E.  
> _"Genetic Algoritms in Search, Optimization and Machine Learning"_.  
> Addison Wesley, 1989. \*
>
> \[41\] Greer, Jim; McCalla, Gordon; Neufeld, Eric y otros:  
> _"Intelligent Tutoring/Training Systems - The Aries Laboratory"_.  
> _<http://www.cs.usask.ca/projects/ITS.html>_.
>
> \[42\] Johnson,W.L..  
> _"Intention-based diagnosis of novice programming errors"_.  
> Morgan.-Kauffman, 1986; y otras referencias, en general respecto al desarrollo del PROUST.
>
> \[43\] Karras, Chester L.  
> _"The Negotiating Game"_.  
> Harper Collins, 1992.
>
> \[44\] Katz, S. y Lesgold, A.  
> _"Implementing Post-problem Reflection within Coached Practice Environments"_.  
> y otras referencias, en general respecto al desarrollo del ITS Sherlock.  
> también la página WWW mencionada en el punto (2) de BIBLOGRAFÍA Electrónica contiene referencias a este sistema. \*
>
> \[45\] Koza, John R.  
> _"Genetic Programming II: Automatic Discovery of Reusable Programs"_.  
> The MIT Press, 1992. \*
>
> \[46\] Negroponte, Nicholas  
> _"Ser Digital"_.  
> Océano, 1996. \*
>
> \[47\] Woolf, Beverly Park  
> _"Intelligent multimedia tutoring systems"_.  
> _Communications of the ACM_, April. 1996, Vol. 39, No. 4, pp. 30-31.  
> [_http://www.acm.org/pubs/toc/Abstracts/cacm/227217.html_](http://www.acm.org/pubs/toc/Abstracts/cacm/227217.html)

![](line1.gif)

### Lista de tablas {#lista-de-tablas}

1. [Tabla 1: Sistemas que entran dentro de la clasificación presentada](I-Antecedentes.md#tabla-1-conocimientos-y-habilidades-que-se-adquieren-en-la-programación)

2. [Tabla 2: Comparación entre los papeles en esquemas de enseñanza de programación teórico vs. en laboratorio, vs. apoyado en asesor inteligente](propuesta.md#tabla-2-comparación-entre-los-papeles-en-esquemas-de-enseñanza-de-programación-teórico-vs-en-laboratorio-vs-apoyado-en-asesor-inteligente)
3. [Tabla 3: Tabla de comparación entre alternativas](II-Proceso.md#tabla-3-procesos-que-gobiernan-el-aprendizaje-por-observación-tomada-de-araujo-13)
4. [Tabla 4: Clasificación de Sistemas Adaptativos según Benyon-Murray](II-Proceso.md#tabla-4-algunos-agentes-que-se-proponen-para-el-modelado-del-proceso-enseñanza---aprendizaje)
5. [Tabla 5: Algunos agentes que se proponen para el modelado del proceso enseñanza-aprendizaje](II-Proceso.md#tabla-5-similitud-y-diferencia-entre-las-teorías-instruccionales-y-el-proceso-observado-en-la-enseñanza-de-la-programación)

**![](line1.gif)**

### Lista de figuras {#lista-de-figuras}

1. [Figura 1: Relación entre las áreas de investigación sobre Sistemas Tutores Inteligentes, Agentes Inteligentes e Interfase Hombre-Máquina.](I-Antecedentes.md#figura-1-diagrama-de-contexto-del-proceso-de-aprendizaje-de-un-lenguaje-de-programación)
2. [Figura 2: Arquitectura de Sistemas Adaptativos](II-Proceso.md#figura-2-modelo-básico-de-aprendizaje-y-memoria-en-un-enfoque-de-procesamiento-de-la-información-tomado-de-chadwick-13)
3. [Figura 3: Arquitectura de Sistemas Tutores Inteligentes](II-Proceso.md#figura-3-fases-y-sucesos-del-aprendizaje-según-gagné-adaptada-de-araujo-13)
4. [Figura 4: Roles existentes en el modelo de funciones en el proceso enseñanza-aprendizaje de la programación.](II-Proceso.md#figura-4-proceso-de-la-enseñanza-de-lenguajes-de-programación)