/* LIGA-C.C */

/* Archivo principal para ejemplo de ligar Ensamblador con C */
/* Se llama distinto para que no haya problema con los .OBJ */
/* Autor: Bruno Guardia Robles */

#include "liga.h"       /* Definiciones del programa */
#include <conio.h>      /* por el getch() */

void main(void)
{
        IniciaGraficos();                   
        DibujaLineaHoriz ( 10, 300, 20, 1 );
        DibujaLineaHoriz ( 10, 300, 30, 2 );
        /* Esperar una tecla */
        getch();
        TerminaGraficos();
}
