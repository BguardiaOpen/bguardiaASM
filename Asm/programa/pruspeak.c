/* Programa de prueba de la librer¡a de Speaker en Ensamblador */

#include <stdio.h>
#include <conio.h>
#include "speaker.h"    /* Prototipos de funciones */

/*
extern void ActivaSpeaker(void);
extern void DesactivaSpeaker(void);
extern void SuenaSpeaker(unsigned short CentesimasSegundo);
extern void AjustaSpeaker(unsigned short Frecuencia);
extern void PlaySpeaker(unsigned short Frecuencia, unsigned short 
        CentesimasSegundo);
*/

static void EfectoUno(void)
{
        PlaySpeaker(1000, 100);
}

static void EfectoDos(void)
{
        unsigned short  i, j;

        ActivaSpeaker();
        for ( i = 5000; i > 20; i--)
                {
                AjustaSpeaker(i);
                for ( j = 5000; j; j--);
                }
        DesactivaSpeaker();
}

void main(void)
{
        clrscr();
        printf("Prueba del speaker\n");
        printf("Presiona una tecla para el efecto uno (beep simple)\n");
        getch();
        EfectoUno();
        printf("Presiona una tecla para el efecto dos (variando frecuencia)\n");
        getch();
        EfectoDos();
}
