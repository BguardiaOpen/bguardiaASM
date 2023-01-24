## Ejemplos

![](../../images/waveline.gif)

### Números sin signo:

10011000b = 98 hexadecimal (1001=9, 1000=8).

10011000b = 128+16+8 = 152 (decimal)

9A0Bh = 9 * 4096 + 10 (A) * 256 + 0 * 16 + 11 (B) =  
36864 + 2560 + 11 = 39435\.

9A0Bh = 1001 1010 0000 1011 binario.

1500 decimal a hexadecimal:  
1500 / 16 = 93 y sobran 12\. El sobrante (12) es el dígito C.  
93 / 16 = 5 y sobran 13\. El sobrante (13) es el dígito D.  
5 / 16 = 0 y sobran 5\. En realidad ya no se necesitaba.  
1500 = 5DCh.

1500 decimal a binario:  
1500 / 2 = 750 y sobran **0**  
750 / 2 = 375 y sobran **0**  
375 / 2 = 187 y sobra **1**  
187 / 2 = 93 y sobra **1**  
93 / 2 = 46 y sobra **1**  
46 / 2 = 23 y sobran **0**  
23 / 2 = 11 y sobra **1**  
11 / 2 = 5 y sobra **1**  
5 / 2 = 2 y sobra **1**  
2 / 2 = **1** y sobra **0**  
Con esto, vemos que 1500 = 10111011100b. (Lee los dígitos de abajo arriba).

![](../../images/waveline.gif)

### Números con signo

-5 en binario 8 bits con signo:

5 decimal a binario:

5 / 2 = 2 y sobra **1**

2 / 2 = **1** y sobra **0**

Así que el 5 positivo es 101b (leer dígitos de abajo hacia arriba)

Para hacerlo negativo, debemos tomar los 8 bits y hacer el complemento a 2:

<table border="0">

<tbody>

<tr>

<td width="50%">5 positivo a 8 bits:</td>

<td width="50%">00000101b = 05h</td>

</tr>

<tr>

<td width="50%">Complemento a 1:</td>

<td width="50%">11111010b = FAh</td>

</tr>

<tr>

<td width="50%">Le sumamos 1:</td>

<td width="50%">11111011b = FB h</td>

</tr>

</tbody>

</table>

![](../../images/waveline.gif)

### Representación

Se desea hacer un juego donde el jugador recorre una pista de carreras. Para ello, el juego contará con mapas las pistas más famosas del mundo, de manera que el conductor recorra la pista con sus curvas tal como aquellos de Fórmula 1.

¿Cómo se puede representar una pista, de manera que describamos la información necesaria para hacer el juego?

##### Solución:

Hay muchas maneras; lo importante es comprender que la pista debe "estirarse" para convertirse en un objeto lineal, que se pueda acomodar en la memoria unidimensional.

Desde el punto de vista del conductor, podríamos describir la pista en una forma relativa, donde se recorre cierta cantidad de metros en línea recta, y después de eso se puede tomar una curva a la izquierda o a la derecha, la que cambia la dirección del auto en "n" grados, y si suponemos una curva uniforme, ese cambio de "n" grados ocurre en X metros. Si vemos esto en conjunto, puede ocurrírsenos una representación para cada segmento de la pista:

<table border="1" width="100%">

<tbody>

<tr>

<th align="left">Tipo de Segmento</th>

<th align="left">Distancia</th>

<th align="left">Ángulo</th>

</tr>

<tr>

<td>Recta, Curva a la Derecha o a la Izquierda</td>

<td>Metros que mide el segmento</td>

<td>Grados (-180° a +180°) en que se cambia la dirección</td>

</tr>

</tbody>

</table>

Con esto, nada más tenemos que analizar ahora como representar cada uno de los datos de cada segmento:

*   El Tipo de Segmento puede ser un caracter, 'R' cuando sea recta, 'D' cuando sea curva a la derecha, e 'I' cuando sea a la izquierda.
*   La distancia puede ser un entero de 16 bits sin signo; no requerimos distancias negativas, y con 65536 metros parece suficiente. Podría ser de 8 bits, pero 255 metros me pareció que podría resultar insuficiente para muchas rectas.
*   El ángulo sería un entero de 16 bits con signo, que es lo mínimo suficiente para representar el rango requerido.

De esta manera, cada segmento de la pista requeriría 5 bytes para representarse (1 por el tipo de segmento, 2 por la distancia, y 2 por el ángulo).

Si una pista se puede describir con 8 segmentos, ocuparía 40 bytes; si requiere 125 segmentos, ocuparía 625 bytes; y así, según que tantas curvas alternativas tenga la pista.