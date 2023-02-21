# 7.Conclusiones y trabajo futuro

Después de diseñar, implementar y probar en forma preliminar al asesor inteligente ANGEL, en este último capítulo se hace un repaso de los resultados obtenidos durante esta investigación; se presentan las conclusiones del trabajo; se explica la línea de investigación que continuará, y la experimentación en curso; y se proponen varias líneas de investigación para trabajos futuros.

## 7.1.Resumen del trabajo

En este trabajo se ha presentado la arquitectura base ANGEL (Asesor iNteligente Genérico para la Enseñanza de Lenguajes de Programación), la cual permite implementar en forma flexible un asesor inteligente que asista al alumno; con la capacidad de adaptarse a distintos lenguajes de programación, o distintos modelos de enseñanza.

Se justificó la necesidad de utilizar asesores inteligentes para reducir las limitantes a las que se enfrenta el profesor humano en una materia donde se aprende un lenguaje de programación, ya que no puede estar disponible en el tiempo o lugar oportuno, cuando el alumno realiza su práctica fuera del aula.

Se realizó una observación de los procesos que intervienen en la enseñanza - aprendizaje de un lenguaje de programación, y una investigación sobre los modelos pedagógicos que se pudieran adaptar para mejorar este proceso, y especialmente para ser usados por un asesor inteligente.

Se presentó un panorama general de los sistemas tutores inteligentes, identificando a los asesores inteligentes dentro de este tipo de sistemas; lo que permitió fundamentar la arquitectura general necesaria para la construcción de ANGEL.

Posteriormente, se diseñó detalladamente la arquitectura general de ANGEL, en una forma completa y abierta a desarrollos futuros, utilizando para ella las herramientas seleccionadas de los tutores inteligentes y de la Pedagogía.

La implementación de ANGEL en forma computacional, basada en la arquitectura presentada, se desarrolló al nivel de un prototipo funcional que demuestra la factibilidad de utilizar ANGEL en el salón de clases.

Se realizaron pruebas preliminares sobre la aplicación de ANGEL en el salón de clases, con resultados prometedores. Se mostró que las pruebas y afinación de ANGEL serán una actividad continua, como lo es la preparación de todo curso educativo.

## 7.2.Conclusiones generales del trabajo.

El trabajo pretendía demostrar la tesis:

_Los asesores inteligentes son una alternativa viable para apoyar la enseñanza de una materia del área de lenguajes de programación, tomando el papel del profesor en la asesoría a los alumnos cuando no está disponible; y por medio de su uso, se puede conseguir mayor oportunidad en la asesoría al alumno, elevar el nivel de impartición de la materia, y apoyar la virtualización de la enseñanza._

Además, se ha obtenido retroalimentación positiva por parte de los alumnos, algunos de los cuales han expresado que ANGEL será una herramienta que los apoyará positivamente en su aprendizaje.

Se considera que a lo largo de este trabajo, se ha mostrado que si bien es compleja la implementación de un asesor inteligente, es factible y viable. Falta experimentación que respalde la teoría de que se puede sustituir parte del papel del profesor cuando no está disponible; sin embargo, los resultados preliminares, especialmente el 64% de errores detectados, resultan prometedores y permiten esperar que ANGEL haga un buen papel cuando el profesor humano no está disponible, al informar al alumno sobre los conceptos que aplica correcta e incorrectamente.

Se requerirá de un tiempo amplio de pruebas, para comprobar la segunda parte de la tesis: la aspiración a conseguir mayor oportunidad en la asesoría, elevar el nivel de impartición de la materia, y la virtualización de la enseñanza. Esto se conseguirá a largo plazo, cuando ANGEL cuente con un cuerpo de conocimiento superior al actual, y se integre completamente en el curso virtual.

El objetivo general que se buscaba, para demostrar la tesis, se planteó de la forma siguiente:

_"Implementar e implantar una arquitectura base, sobre la cual puedan construirse fácil y eficientemente asesores inteligentes automatizados que apoyen los procesos repetitivos de asesoría de la enseñanza; y comprobar su funcionalidad, construyendo sobre dicha arquitectura un asesor que apoye la enseñanza de una materia del área de lenguajes de programación"._

Este objetivo se considera cumplido, pues se cuenta con una arquitectura base, genérica, que permite construir asesores orientados a distintos lenguajes. Sin embargo, también se descubrió que "fácil" y "eficientemente" son conceptos relativos; y se requerirá de un mayor tiempo de desarrollo para contar con una interface más sofisticada, apropiada para permitir que el proceso sea fácil para cualquier profesor de estas materias, sin necesidad de que se vuelva un "experto" en la arquitectura de ANGEL.

Los objetivos especificos planteados al inicio de este trabajo, incluyeron los siguientes:

Búsqueda de un modelo pedagógico que permita modelar los procesos de asesoría, y selección del más apropiado para su aplicación en un asesor inteligente. En el capítulo 2 se describe ampliamente cómo se exploraron algunos de los modelos pedagógicos más conocidos, por qué podría utilizarse cualquiera de ellos, y cómo se escogió el de Gagné para respaldar este trabajo. Se propone que, para aplicar otros modelos, debe trabajar junto con pedagogos para perfeccionar una descripción formal del estudiante dentro del modelo instruccional, que es la principal limitante que se encontró para modelos como el de Ausubel y el de Bruner.

-  Se realizó la investigación sobre las herramientas de otras disciplinas (Psicología, Pedagogía) que pueden complementar los modelos teóricos y la aplicación del asesor. Tanto en el capítulo "Antecedentes" como en el capítulo 2, "El proceso de enseñanza - aprendizaje de un lenguaje en las materias de programación", se cubrieron distintos aspectos acerca de las tendencias de la educación y la modelación de los procesos de aprendizaje y evolución cognitiva; pero principalmente, las teorías instruccionales que fundamentan el comportamiento del asesor.

- Diseño de la arquitectura requerida para el asesor automatizado. Se siguió la recomendación de arquitectura genérica de un sistema tutor inteligente, similar a las presentadas por Kaplan [11] y Clancey [15]. Posteriormente, en el capítulo 4, se detalló haciendo referencia a trabajos anteriores en el área, de los cuales se adaptaron diversas ideas para implementar el modelo del estudiante, el modelo del dominio, y el modelo instruccional, que son los componentes principales de un asesor inteligente, Además de la interface, que se diseñó específicamente para el problema siguiendo los principios del Diseño de Interfaces Hombre - Máquina [6].

- Selección detallada de las herramientas de las distintas áreas de las Ciencias Computacionales (Inteligencia Artificial, Teoría de la Computación y Autómatas, Diseño de Interfase, Algorítmica) apropiadas para implementar la arquitectura. En el capítulo 5, acerca de la implementación de ANGEL, se revisaron distints técnicas utilizadas, tanto en el diseño de la interface, como respecto al uso apropiado del motor de inferencia, y la construcción de la gramática especializada para diagnosticar utilizando el programa que escribe el alumno.

- Construir o implementar el asesor prototipo, en la materia de Ensamblador, que el autor imparte en el ITESM-CCM. El prototipo se construyó en el curso de dos meses, utilizando el lenguaje C, CLIPS como motor de inferencia, y LALR como herramienta para construir los analizadores léxico y sintáctico, al tiempo que se elaboraba este documento, y se describe ampliamente en los capítulos 5 y 6.

- Probar el asesor, apoyando la impartición del curso Virtual de la materia. Las pruebas preliminares se presentan en el capítulo 6; se continúa con la realización de más pruebas. En general, las pruebas buscan analizar los resultados de utilizar ANGEL en el salón de clases.

- Evaluar los cambios ocurridos en el desemoeño del estudiante, como consecuencia directa del uso del asesor. Se cuenta con resultados preliminares respecto a este objetivo, donde se comprueba que algunos alumnos utilizan efectivamente la asesoría, y otros no.

- Publicar reportes o avances de investigación, para obtener retroalimentación por parte de los colegas trabajando en problemas similares. Hay dos papers en proceso de revisión.

- Documentar el uso de la arquitectura, permitiendo que en el futuro otros profesores puedan construir asesores para otros lenguajes, basados en la misma arquitectura. Este trabajo documenta en su mayor parte la construcción de esta arquitectura; se trabajará posteriormente en un manual orientado completamente hacia desarrolladores, que describa cómo modificar el sistema para adaptarlo nuevos lenguajes y modelos de instrucción, o ampliar su base de conocimientos, sin ser un experto en la arquitectura.

- Prueba de la construcción rápida y sencilla de asesores básicos en otro dominio (lenguaje).

- Se está preparando esta prueba para el lenguaje C.

- Preparar nuevas líneas de investigación, para trabajos posteriores. Se han delineado nuevas líneas de investigación, las cuales se presentan en el resto de este capítulo.

Se cumplieron los objetivos iniciales, de acuerdo a las restricciones de tiempo y recursos. Al iniciar el trabajo, parecía que el construir un asesor inteligente resultaría un trabajo, si no sencillo, menos complejo que lo que realmente es. Se descubrió que a pesar de los avances en las herramientas, aún no es un proceso suficientemente sencillo como para empezar a utilizar extensamente los asesores inteligentes [25]; sin embargo, la arquitectura base con la que se cuenta es susceptible de ser reutilizada para hacer un poco más sencillo este desarrollo; se considera que dentro de unos dos años, la arquitectura probablemente habrá evolucionado lo suficiente como para contar con un verdadero  '_shell_ ' de construcción de asesores inteligentes, no solamente para la enseñanza de lenguajes de programación sino inclusive para la enseñanza de otros dominios con características similar. Se descubrió también la necesidad de formar equipos de desarrollo que permitan la realización eficiente de asesores inteligentes, pues es difícil que una sola persona cuente con todos los talentos, que permitan cubrir todos los elementos del asesor inteligente, con el mismo nivel de profundidad.

## 7.3. Continuación de este trabajo.

Este trabajo no está concluido; se requiere continuarlo para llegar a contar con una implementación total de ANGEL como auxiliar del profesor humano.

Dentro del contexto académico de la materia de Lenguaje Ensamblador, se continuará complementando y mejorando la implementación de ANGEL para apoyar dicha materia.

Durante los próximos meses, el tiempo que abarcan las vacaciones de invierno y el primer parcial de la materia, hay oportunidad de complementar la base de conocimientos; un objetivo para estos dos meses, es el de que la base de conocimientos sea lo suficientemente completa para diagnosticar todos los errores planteados en el apéndice A; probablemente también se trabaje en ampliar dicha lista de errores, e incluir todos los conceptos que se observan como unidades de aprendizaje dentro del _syllabus_ de la materia.

Se debe trabajar en dos aspectos de la interface con el alumno, para conseguir que la retroalimentación sea de mejor calidad:

- En el modelo instruccional, de modo que la asesoría sea más oportuna.

- Y en la redacción de los mensajes de asesoría; en este momento, son mensajes fijos. Se considera que se puede trabajar con algunas de las técnicas de lenguaje natural, para generar un texto más natural en la retroalimentación que ANGEL ofrece al alumno.

Con la base de conocimientos apropiadamente complementada, y una mejor interface, se tendrán los elementos apropiados para realizar una experimentación similar a la propuesta en forma original. Esta experimentación consistirá en realizar pruebas durante todo un semestre, en el cual Además los alumnos contarán con ANGEL durante su tiempo de práctica externa y no solamente en las clases de laboratorio; y medir los cambios en el desemoeño de los alumnos. Por otro lado, al final del semestre se puede practicar una encuesta de satisfacción para el alumno, por el uso de ANGEL como herramienta pedagógica.

De este modo, se espera que dentro de un semestre (mediados de 1998), se pueda contar con conclusiones confiables sobre el grado de funcionalidad que cubre ANGEL; y con una mejor visión sobre sus cualidades y defectos.

Para implementar el prototipo de ANGEL, se tomaron algunas decisiones de diseño que limitan su desemoeño. En el futuro, puede mejorarse el desemoeño atacando una o varias de estas restricciones de diseño; por ejemplo, se pueden integrar:

- El manejo de memoria superior y extendida; este reduciría el acceso al disco, permitiría aumentar el número de reglas en el sistema de producción; o facilitaría el manejo de archivos múltiples.

- Ajustar la implementación del diagnóstico, para que sea no monótono, evitando así el reproceso completo del razonamiento.

## 7.4. Líneas de investigación propuestas para trabajos futuros.

De este trabajo se puede derivar investigación en distintas líneas; algunas de las que se han considerado interesantes, se presentan a continuación.

Hasta ahora, se ha probado ANGEL con programas específicos, y solamente unos cuantos. Para considerar robusto su diagnóstico, es necesario exponerlo a una gran cantidad de programas, con un distinto estilo de programación, de diversos alumnos.

Se cuenta con un inventario de más de 500 programas fuentes, desarrollados por más de 200 alumnos que han tomado la materia de Ensamblador en los últimos 4 años. Entre ellos hay una gran variedad, desde los que ni siquiera ensamblan correctamente, hasta programas multimódulos con un excelente funcionamiento. Si bien requerirá un tiempo muy amplio, se planea hacer el diagnóstico de cada uno de los programas, tanto por parte de expertos humanos como de ANGEL, para comparar sus resultados, y descubrir nuevos conceptos o errores al aplicarlos, que no han sido considerados en la versión prototipo de ANGEL.

Como se menciona en el capítulo 5, aún no se completa el desarrollo de la base de conocimientos sobre el dominio. Se pueden ocupar técnicas formales para asegurar la completez y consistencia de la base de conocimientos.

La interface con el desarrollador es limitada, lo que no permite que un profesor sin conocimientos amplios sobre la arquitectura, implemente un asesor inteligente para otro lenguaje. Sería útil desarrollar una interface gráfica, que no requiriera programación, para hacer más flexible a ANGEL y poder adaptarlo a nuevos lenguajes con menor esfuerzo.

En la parte adaptativa surgen diversas ideas para facilitar que el modelo instruccional evolucione de acuerdo al comportamiento del alumno.

- Reglas o heurísticas de adaptación tales como las sugeridas por Lenat [5], las cuales serían procesadas por el motor de inferencia incluido en CLIPS pero generarían como resultado nuevas reglas.

- Por medio de algoritmos genéticos, que busquen optimizar una forma general de regla, de acuerdo a una función de ajuste tal como la tasa de aprendizaje del estudiante.

- Por medio de algoritmos de reconocimiento de patrones tales como ID3 o C4.5 que hagan una clasificación para determinar en qué casos es efectivo usar una técnica de asesoría y en qué casos otra técnica.

- Por medio de redes neuronales o métodos conexionistas similares que busquen reconocer el patrón efectivo de uso de reglas.

La Inteligencia Artificial Distribuida (DAI) trata sobre la integración entre sistemas distribuidos e Inteligencia Artificial. Uno de los paradigmas más utilizados en esta área de estudio, es el de "sistemas multiagentes" [12], donde existen múltiples "agentes", cada uno con ciertas capacidades y necesidades; en esta área de investigación, se tratan problemas como la cooperación, competencia y negociación entre los agentes.

De acuerdo al modelo de 3 roles en la enseñanza - aprendizaje, presentado en el capítulo 2, existen múltiples agentes en un aula con una meta común. Siguiendo el paradigma de sistemas multiagentes, en un laboratorio virtual que cuente con la conectividad requerida entre computadoras [41][10][31][12], donde cada alumno tenga acceso a una computadora, y cada alumno cuente con su ANGEL observándolo, la cooperación entre los distintos agentes ANGEL, los alumnos y el profesor humano, permitirían alcanzar beneficios educativos. Existen diversos trabajos en esta área, que se denomina "educación cooperativa asistida por computadora"; se integraría la línea de investigación presentada en este trabajo, con aquella.

## 7.5. Contribución esperada

Este trabajo no es el fin, sino el principio, de un desarrollo más amplio, en el cual se aplica la tecnología de la Inteligencia Artificial y las Ciencias Computacionales en la mejora del proceso de enseñanza - aprendizaje; sus alcances van más allá del entorno de aprendizaje de lenguajes de programación, donde se realizó el estudio.

Espero que los conceptos vertidos en esta tesis puedan interesar a otros profesores, en el desarrollo de sistemas tutores inteligentes, así como introducir la aplicación de modelos instruccionales combinados con tecnología computacional; para apoyar el proceso de mejora continua en la enseñanza - aprendizaje.

Considero que durante los próximos años asistiremos al desarrollo de diversos trabajos en el campo de Ciencias Computacionales Aplicadas a la Educación, lo que permitirá hacer que la educación llegue a más personas, alrededor del mundo, disminuyendo y quizá hasta eliminando muchas de las barreras actuales, como pueden ser la discriminación, la distancia geográfica, y sus costos, al mismo tiempo que aumentar su nivel. Citando a un filósofo, "qué excelente" poca para vivir nos ha tocado!

