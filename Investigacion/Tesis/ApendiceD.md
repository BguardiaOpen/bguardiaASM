## Apéndice D: Descripción de archivos usados en ANGEL.

- Asesor.c: Programa principal del asesor ANGEL, en la interfase con el alumno, que inicializa al sistema de inferencia, la interfase, y llama a la edición de un archivo.

- Asesora.c: funciones invocadas por el editor y las reglas del modelo instruccional, para asesorar al estudiante.

- Asesora.h: encabezados de funciones de Asesora.c

- Asm.clp: archivo en el lenguaje de CLIPS, que describe las reglas sobre el dominio del lenguaje Ensamblador, reconociendo los errores comunes y algunos de los usos acertados de los conceptos del lenguaje.

- Asmgagne.bcl: archivo ''compilado'' de CLIPS; contiene las reglas de ASM.CLP y GAGNE.CLP, combinadas en un solo archivo, en el formato binario de CLIPS.

- Asm.grm: gramática del lenguaje ensamblador, utilizada por LALR para generar PARSER.C, combinando la tabla de estados obtenida de procesar la gramática con PARSER.SKL.

- Concept.c: funciones para manejar el archivo CONCEPT.DAT y describir los conceptos en forma general.

- Concept.dat: archivo de datos que describe los conceptos de Lenguaje Ensamblador implementados.

- Concept.h: encabezado de las funciones en Concept.c

- Editconc.h: programa principal de la interfase con el desarrollador; en esta versión, solamente permite editar los conceptos y su descripción, que se encuentran en Concept.dat.

- Editor.c: contiene las funciones que manejan un archivo de texto, en forma encapsulada, para editarlo en forma independiente del lenguaje.

- Editor.h: encabezados de las funciones en Editor.c

- Factsasm.c: funciones que son llamadas por la gramática del lenguaje, y presentan hechos obtenidos del análisis léxico yá del programa.

- Factsasm.h: encabezados de las funciones en Factsasm.c.

- Gagne.clp: reglas en el lenguaje de CLIPS, las cuales se refieren al modelo instruccional.

- Interfaz.c: funciones de apoyo para la interfase con el usuario.

- Interfaz.h: encabezados de las funciones en Interfaz.c.

- Makefile: reglas para la compilación del sistema ANGEL.

- Parser.c: archivo generado por LALR que se encarga del análisis sintáctico.

- Parser.h: encabezados de las funciones incluidas en Parser.c.

- Parser.skl: esqueleto de Parser.c, usado por LALR para generar el análisis sintáctico.

- Scanner.c: funciones para el análisis léxico, utilizado por Parser.skl y por consiguiente por Parser.c.

- Student.c: funciones que manejan el modelo del estudiante y la historia los conceptos que éste va utilizando.

- Student.h: encabezados de las funciones en Student.c

- Util.c: funciones de utilería, principalmente para manejo de la interfase con el usuario.

- Util.h: encabezados de las funciones en Util.c.

- Viewprf.c: programa principal de la interfase con el profesor humano; le permite ver el estado actual del conocimiento del estudiante.
