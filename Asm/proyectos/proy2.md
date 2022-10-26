

Proyecto 2 Lenguaje Ensamblador
-------------------------------

### Reemplazo de cadenas en archivo

Fecha de entrega: 10 de noviembre de 2004, 19:00 horas.

En equipo de dos personas.

*   El programa tomara un archivo fuente, el cual es de texto, y reemplazará todas las ocurrencias de una cadena (original) por un nuevo valor (reemplazar por...); el resultado lo mostrará en la salida estándar, y opcionalmente lo depositará en un archivo.

*   Deberá recibir como parametro, en la línea de comandos, el nombre del archivo origen, la cadena original a reemplazar, la cadena por la que se va a sustituir (ambas dentro de comillas); y opcionalmente, el nombre del archivo de destino. Se usará la siguiente sintaxis:  
    SED <Archivo origen> <Cadena original> <Cadena sustituida> \[<Archivo destino>\]  
    Si se omite el archivo destino, se asumirá la salida estándar (archivo con handle 1, o usar los servicios 2 y 9 de la INT 21h).  
    Ejemplos:  
    **SED TEXTO1.TXT "ING" "ISC"**; En este caso, la salida va a la consola (salida estandar), y consistirá del texto que contiene TEXTO1.TXT, con el cambio de que todas las ocurrencias de ING en dicho texto, serán sustituidas por ISC**  
    SED TEXTO1.TXT "ING" "ISE" TEXTO2.TXT**; En este caso la salida va al nuevo archivo "TEXTO2.TXT", y consiste del texto que hay en TEXTO1.TXT, donde todas las ocurrencias de ING han sido cambiadas por ISE
*   Se sugiere usar una máquina de estados para hacer sencilla la programación; queda a investigación el revisar libros de compiladores para buscar la mejor manera de hacer el análisis léxico.
*   Puntos extras (10): incluir opciones en la línea de comandos para
    1.  Manejar palabra completa o no (por defecto, no se usa palabra completa sino la búsqueda literal de la cadena de caracteres).
    2.  Hacer sensitiva o insensitiva a mayúsculas la búsqueda (por defecto, debe ser insensitiva)