/* LIGA.H */

/* Archivo de encabezado para ejemplo de ligar Ensamblador con C */
/* Autor: Bruno Guardia Robles */

/* Esto que viene a continuaci¢n se llama un "Sentry", y sirve para
   evitar la inclusi¢n del mismo archivo dos veces. Esto suele ocurrir cuando
   dos archivos distintos llaman al mismo .H, puede causar definiciones
   duplicadas */

#ifndef _LIGA_H
#define _LIGA_H

/* Aqu¡ se declaran los "prototipos" que indican al compilador de C qu‚ 
   par metros tendr n las funciones que se van a ligar */

extern void IniciaGraficos(void);
extern void TerminaGraficos(void);
extern void DibujaLineaHoriz( int X1, int X2, int Y, int Color );

#endif /* _LIGA_H */
