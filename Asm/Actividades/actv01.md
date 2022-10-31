## Actividades Sesión 1

*   Revisar el material de la clase 1.
*   Conseguir libro de texto o libros de referencia, según el gusto de cada quien.
*   Leer y tratar de resolver los ejercicios.
*   Probar la comunicación por correo.
*   Preguntar sus dudas por medio del correo.
*   Leer los temas de la sesión 2
*   Repasar sus apuntes de Organización o Arquitectura Computacional
*   Probar los ejercicios, especialmente el del Ciclo de Fetch.
*   Revisar la bibliografía para complementar los temas de la sesión 2.

La tarea consiste en la codificación de 3 rutinas, utilizando el lenguaje ensamblador de la calculadora propuesto en el material en línea y ejemplificado en clase, que implementen las siguientes fórmulas:

1.  y = mx + b
2.  y = ( x + 3 ) <sup>2</sup>
3.  x1 = (-b + sqrt(b<sup>2</sup> - 4ac))/2a  
    x2 = (-b - sqrt(b<sup>2</sup> - 4ac))/2a

<span lang="en-us">Los mnemónicos y opcodes a manejar para la calculadora serán los siguientes:</span>

<table border="1" cellpadding="2" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber1">

<tbody>

<tr>

<th><span lang="es-mx">Mnemónico</span></th>

<th><span lang="es-mx">Opcode</span></th>

<th><span lang="es-mx">Descripción</span></th>

</tr>

<tr>

<td><span lang="es-mx">0</span></td>

<td><span lang="es-mx">0</span></td>

<td><span lang="es-mx">Teclear el dígito 0</span></td>

</tr>

<tr>

<td><span lang="es-mx">1</span></td>

<td><span lang="es-mx">1</span></td>

<td><span lang="es-mx">Teclear el dígito 1</span></td>

</tr>

<tr>

<td><span lang="es-mx">2</span></td>

<td><span lang="es-mx">2</span></td>

<td><span lang="es-mx">Teclear el dígito 2</span></td>

</tr>

<tr>

<td><span lang="es-mx">3</span></td>

<td><span lang="es-mx">3</span></td>

<td><span lang="es-mx">Teclear el dígito 3</span></td>

</tr>

<tr>

<td><span lang="es-mx">4</span></td>

<td><span lang="es-mx">4</span></td>

<td><span lang="es-mx">Teclear el dígito 4</span></td>

</tr>

<tr>

<td><span lang="es-mx">5</span></td>

<td><span lang="es-mx">5</span></td>

<td><span lang="es-mx">Teclear el dígito 5</span></td>

</tr>

<tr>

<td><span lang="es-mx">6</span></td>

<td><span lang="es-mx">6</span></td>

<td><span lang="es-mx">Teclear el dígito 6</span></td>

</tr>

<tr>

<td><span lang="es-mx">7</span></td>

<td><span lang="es-mx">7</span></td>

<td><span lang="es-mx">Teclear el dígito 7</span></td>

</tr>

<tr>

<td><span lang="es-mx">8</span></td>

<td><span lang="es-mx">8</span></td>

<td><span lang="es-mx">Teclear el dígito 8</span></td>

</tr>

<tr>

<td><span lang="es-mx">9</span></td>

<td><span lang="es-mx">9</span></td>

<td><span lang="es-mx">Teclear el dígito 9</span></td>

</tr>

<tr>

<td><span lang="es-mx">+</span></td>

<td><span lang="es-mx">10</span></td>

<td><span lang="es-mx">Operación aritmética, en infija. Tiene prioridad igual a la resta (en cuyo caso se aplica de izquierda a derecha), pero menor a la multiplicación, división y raíz cuadrada</span></td>

</tr>

<tr>

<td><span lang="es-mx">-</span></td>

<td><span lang="es-mx">11</span></td>

<td><span lang="es-mx">Operación aritmética, en infija. Tiene prioridad igual a la suma (en cuyo caso se aplica de izquierda a derecha), pero menor a la multiplicación, división y raíz cuadrada</span></td>

</tr>

<tr>

<td><span lang="es-mx">*</span></td>

<td><span lang="es-mx">12</span></td>

<td><span lang="es-mx">Operación aritmética, en infija. Tiene prioridad igual a la división, mayor a la suma y resta, pero no inmediata (menor a la raíz y el igual)</span></td>

</tr>

<tr>

<td><span lang="es-mx">/</span></td>

<td><span lang="es-mx">13</span></td>

<td><span lang="es-mx">Operación aritmética, en infija. Tiene prioridad igual a la multiplicación, mayor a la suma y resta, pero no inmediata (menor a la raíz y el igual)</span></td>

</tr>

<tr>

<td><span lang="es-mx">=</span></td>

<td><span lang="es-mx">14</span></td>

<td><span lang="es-mx">Igual; tiene máxima prioridad, en el momento que se da, aplica todas las operaciones pendientes</span></td>

</tr>

<tr>

<td><span lang="es-mx"><font face="Times New Roman">√</font></span></td>

<td><span lang="es-mx">15</span></td>

<td><span lang="es-mx">raíz cuadrada; es inmediata por tener máxima prioridad</span></td>

</tr>

<tr>

<td><span lang="es-mx">STO</span></td>

<td><span lang="es-mx">16</span></td>

<td><span lang="es-mx">STORE: Guardar en una celda de memoria (numeradas de la 0 a la 9) el resultado en el Display; deja el número en el display sin afectar, por lo que se puede seguir usando. Requiere el parámetro (0 a 9) a continuación del código de RCL.</span></td>

</tr>

<tr>

<td><span lang="es-mx">RCL</span></td>

<td><span lang="es-mx">17</span></td>

<td><span lang="es-mx">RECALL: Presentar en el display lo que hay en una celda de memoria (de la 0 a la 9); lo que había antes en el Display se pierde, no se afecta la celda de memoria. Requiere el parámetro (0 a 9) a continuación del código de RCL.</span></td>

</tr>

</tbody>

</table>

Para evaluar esta tarea, se ponderarán 25 puntos para la primera rutina, 25 para la segunda y 50 para la tercera.

La participación de esta tarea en su evaluación es de 10% dentro del primer parcial.