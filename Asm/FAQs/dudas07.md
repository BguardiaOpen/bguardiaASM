## Dudas Comunes (Manejo de video)

1.  _¿Por qué mi programa funciona en mi máquina, pero no en la de la escuela (la de la escuela es IBM)?_  
    R: Hay un "bug" en la interrupción 10h en el BIOS de muchas IBM, que MODIFICA el valor de AH, cuando según la especificación de la interrupción, no debiera hacerlo. De manera que cuando sea una máquina IBM, no se puede asumir que AH no se destruye; para solucionarlo, asegúrense de que cada vez que se va a usar la interrupción 10h, el valor de AH se vuelva a cargar.