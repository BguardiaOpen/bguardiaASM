 

Proyecto 1, semestre 2002-11
----------------------------

### Cuatro en Línea

Fecha de entrega: Martes 12 de Marzo de 2002; 19:00 horas (no se acepta más tarde)

Qué hay que entregar: revisen las [políticas](../politicv.md) del curso...

En equipo de dos personas

*   El programa dibujará un tablero de 7 columnas por 6 renglones.
*   Se juega entre dos jugadores, uno tiene las fichas "blancas" y otro las "negras"
*   Se juega por turnos, primero las blancas, luego las negras y nuevamente las blancas.
*   El programa se manejará usando las teclas 1-7, que indican la columna donde el jugador actual va a tirar.
*   Al presionar una tecla, se deberá poner una ficha en la columna correspondiente, la cual "cae" hasta la posición libre más alta.
*   El objetivo del juego es poner cuatro fichas del mismo color en línea, horizontal, vertical o diagonal. (más o menos similar al gato).
*   El programa deberá anunciar al ganador en cuanto consiga poner 4 en línea.
*   El programa deberá estar en un ciclo que permita jugar otra vez.
*   Para el desarrollo utilizar Ensamblador puro de 80x86, con interrupciones (principalmente 10h, 21h y 16h, según se requieran)

Ejemplos del juego:

<!-- aqui -->

<table border="0" cellpadding="10" cellspacing="10" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">

<tbody>

<tr>

<td width="50%">

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber1">

<tbody>

<tr>

<td><span lang="es-mx">1</span></td>

<td><span lang="es-mx">2</span></td>

<td><span lang="es-mx">3</span></td>

<td><span lang="es-mx">4</span></td>

<td><span lang="es-mx">5</span></td>

<td><span lang="es-mx">6</span></td>

<td><span lang="es-mx">7</span></td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/pazul.gif)</td>

<td> </td>

<td> </td>

</tr>

<tr>

<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>

</tr>

</tbody>

</table>

<span lang="en-us">Despu</span><span lang="es-mx">és de tirar 6 fichas c/u (ejemplo de base)</span></td>

<td width="50%">

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber3">

<tbody>

<tr>

<td><span lang="es-mx">1</span></td>

<td><span lang="es-mx">2</span></td>

<td><span lang="es-mx">3</span></td>

<td><span lang="es-mx">4</span></td>

<td><span lang="es-mx">5</span></td>

<td><span lang="es-mx">6</span></td>

<td><span lang="es-mx">7</span></td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/pazul.gif)</td>

<td> </td>

<td> </td>

</tr>

<tr>

<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>

</tr>

</tbody>

</table>

<span lang="es-mx">Juega el azul en la columna 5</span>

</td>

</tr>

<tr>

<td width="50%">

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber4">

<tbody>

<tr>

<td><span lang="es-mx">1</span></td>

<td><span lang="es-mx">2</span></td>

<td><span lang="es-mx">3</span></td>

<td><span lang="es-mx">4</span></td>

<td><span lang="es-mx">5</span></td>

<td><span lang="es-mx">6</span></td>

<td><span lang="es-mx">7</span></td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>

![](../../images/pazul.gif)</td>

<td>

![](../../images/pazul.gif)</td>

<td>

![](../../images/pazul.gif)</td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>

![](../../images/plila.gif)</td>

<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>

<td> </td>

</tr>

<tr>

<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>

</tr>

</tbody>

</table>

<span lang="es-mx">Juega el morado en la columna 6 (cooperando)</span>

</td>

<td width="50%">

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5">

<tbody>

<tr>

<td><span lang="es-mx">1</span></td>

<td><span lang="es-mx">2</span></td>

<td><span lang="es-mx">3</span></td>

<td><span lang="es-mx">4</span></td>

<td><span lang="es-mx">5</span></td>

<td><span lang="es-mx">6</span></td>

<td><span lang="es-mx">7</span></td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>

<td> </td>

</tr>

<tr>

<td> </td>

<td> </td>

<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td> </td>

</tr>

<tr>

<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/pazul.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>



<td>

![](../../images/plila.gif)</td>

</tr>

</tbody>

</table>

<span lang="es-mx">Y así el azul gana (muy fácilmente)</span>

</td>

</tr>

</tbody>

</table>
