 Proyecto 1

Proyecto 1, semestre 2001-13
----------------------------

### Simulador de celular

Fecha de entrega: 25 de septiembre de 2001; 19:00 horas (no se acepta más tarde)

Qué hay que entregar: revisen las [políticas](../politicv.md) del curso...

En equipo de dos personas

*   El programa dibujará una representación de un teléfono celular con su teclado básico, con las teclas numéricas, SEND, END y flechas o botones de comando para almacenar una agenda.
*   Quedará en espera de que se presionen teclas, y cada vez que se presione una, cambiará el color de la misma en la representación en pantalla.
*   Los comandos básicos que permitirá serán:
    *   Marcar un teléfono y al registrar SEND "simular" en la pantalla el Llamando, para hacerlo más realista indicar al final "No hay señal"...
    *   Terminar una llamada con END, cuando se presione END sin estar en llamada no debe hacer nada
    *   Guardar un teléfono una vez marcado, con una "etiqueta" o nombre asociado, en un directorio de 40 teléfonos. Para "escribir" el nombre se usarán exclusivamente teclas numéricas, usando la convención de que cada tecla numérica está asociada a tres letras, de acuerdo al número de pulsos de la tecla numérica será la letra que se escoge; existiendo teclas con función de borrar.
    *   Si el nombre ya existe, preguntar si se desea sustituir el teléfono.
    *   Usando las flechas cuando no se está en llamada, recorrer el directorio mostrando un número y al presionar SEND "marcarlo"
*   Todo en una pantalla "mínima" de celular de 4 renglones por 10 columnas.
*   Para el desarrollo utilizar Ensamblador puro de 80x86, con interrupciones (principalmente 10h, 21h y 16h, según se requieran)