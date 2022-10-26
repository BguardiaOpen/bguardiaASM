
Proyecto 1, semestre 9808
-------------------------

### Prueba del Teclado

Fecha de entrega: 29 de septiembre de 1998, según el grupo; 19:00 horas (no se acepta más tarde)

Qué hay que entregar: revisen las [políticas](../politicv.md) del curso...

En equipo de dos personas (se vale hacer equipos con integrantes de ambos grupos de la materia)

*   El programa dibujará una representación del teclado estándar (101 á 104 teclas) de su computadora PC compatible.
*   Quedará en espera de que se presionen teclas, y cada vez que se presione una, cambiará el color de la misma.
*   Las teclas deberán pasar al menos por tres colores: uno el original; uno en el momento que están presionadas; y uno cuando ya han sido presionadas, pero en este momento ya no lo están.
*   De esta manera, se podrá ver claramente qué teclas ya se probaron y cuales no...
*   La interfase será agradable a la vista y totalmente validada.
*   Se podrá salir del programa en cualquier momento que se desee, presionando tres veces seguidas la tecla ESC.
*   Mientras no se use ESC tres veces seguidas, el programa estará ciclado, reaccionando a las teclas que se presionen. Cuando todo el teclado haya sido probado, mostrará un mensaje al respecto..
*   Aplicar las instrucciones, herramientas y lógica vistas en el curso.
*   Aplicar la interrupción 10h para tener pantallas bien hechas.
*   Aplicar la interrupción 16h para obtener información del teclado.
*   Para cubrir el 100, solamente se requiere detectar las teclas "normales" (es decir, no necesitan Shift, Caps Lock, etc.)

### Puntos extras:

Se puede evaluar el proyecto sobre 110, siempre y cuando se cubran los dos puntos siguientes:

*   Reconocer teclas especiales (Shift, Alt, Ctrl)
*   Mostrar el estado de los LEDs del teclado (los foquitos de "Num Lock", "Caps Lock" y "Scroll Lock")