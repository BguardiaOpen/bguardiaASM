Proyecto 1 

Proyecto 1, Semestre Agosto 2002
--------------------------------

### Explorador

Fecha de entrega (tope): Lunes 30 de septiembre de 2002, 19:00 horas, siguiendo las políticas generales de entrega de proyectos.

En equipo de dos personas.

Este juego consiste en un mundo desconocido, en el cual aterrizan dos exploradores (no en el mismo punto). En este mundo hay 10 tesoros, repartidos al azar en el mapa.

El objetivo del juego es ganar más tesoros que el otro explorador. Es posible un empate, y la puntuación es equivalente al número de tesoros obtenidos.

Al inicio el tablero está oscuro y sólo se ve el lugar donde esté cada explorador, y el "terreno" que rodea al mismo (en las 8 direcciones posibles en un plano de 2 dimensiones, hasta 2 "cuadros" de distancia).

En el mapa podrán existir los siguientes terrenos:

*   Arena
*   Piedras
*   Montaña
*   Agua
*   Bosque
*   Tesoro

Según el terreno es la velocidad de desplazamiento: se requiere 1/2 turno para pasar una región de arena (así que se pueden desplazar 2 unidades en un turno, si ambas son en arena), 2 para piedras, 3 para montaña, y 1 para el bosque; para moverse en el agua bastara 1 turno pero se requerirá una balsa; cuando no se tiene una balsa el jugador requerirá 5 turnos para construirla. Cuando el terreno es un tesoro el jugador lo recoge al pasar sobre él, quedando arena en su lugar.

Los comandos del jugador, por tanto, serán: 

*   Flechas (o números 4, 6, 8, 2) - movimiento a la izquierda, derecha, arriba y abajo.
*   Home (o número 7) - Arriba a la izquierda
*   End  (o número 1) - Abajo a la izquierda
*   PgUp (o número 9) - Arriba a la derecha
*   PgDn (o número 3) - Abajo a la derecha
*   B - Construir balsa (requiere estar junto al agua)

Reglas generales:

*   Deberás dibujar la representación del mundo visible (el explorado solamente) así como de los dos jugadores, los tesoros
*   Cada jugador alternará su turno
*   Se llevará cuenta de los tesoros de cada jugador, mostrándose este "score" continuamente
*   Usarás completamente Lenguaje Ensamblador en el desarrollo del proyecto
*   Usarás los servicios de la interrupción 10h para manejar la imagen y colores en el monitor
*   Se recomienda que uses arreglos para describir los datos de cada casilla (terreno, si es o no visible...)