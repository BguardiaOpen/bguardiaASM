/* Programa para comprimir los Frames, en un solo archivo de
	animacion */

#include <stdio.h>
#include <dos.h>
#include <conio.h>
#include "comprime.h"

char far *Pantalla;

FILE *Archivo;
char Frame[64000];

void InicializaGraficos(unsigned char Modo);
void PonColor(unsigned short Cont, unsigned short Red,
		unsigned short Green, unsigned short Blue);
void InicializaPaleta(void);

void InicializaGraficos(unsigned char Modo)
{       union REGS Registros;

	Registros.h.ah = 0; /* Servicio para fijar modo de video */
	Registros.h.al = Modo; /* Modo 13 */

	int86( 0x10, &Registros, &Registros );
}

void PonColor(unsigned short Cont, unsigned short Red,
		unsigned short Green, unsigned short Blue)
{
	union REGS Registros;

	Registros.h.ah = 0x10;
	Registros.h.al = 0x10;
	Registros.h.bl = Cont;
	Registros.h.bh = 0;
	Registros.h.ch = Green;
	Registros.h.cl = Blue;
	Registros.h.dh = Red;

	int86( 0x10, &Registros, &Registros );
}

void InicializaPaleta(void)
{
	unsigned short Cont, Red, Green, Blue;

	for (Cont=0; Cont<256; Cont++)
		{
		if (Cont & 128)
			Red = Cont & 31;
			else
			Red = 0;
		if (Cont & 64)
			Green = Cont & 31;
			else
			Green = 0;
		if (Cont & 32)
			Blue = Cont & 31;
			else
			Blue = 0;
		PonColor(Cont, Red, Green, Blue);
		}
}

void DesComprime_Delta(void)
{
	unsigned int Diferencias = 0, Desplazamiento = 0;
	char Temporal;

	fread(&Diferencias, 2, 1, Archivo);
	while (Diferencias)
		{
		fread(&Desplazamiento, 2, 1, Archivo);
		Pantalla = MK_FP(0xA000, Desplazamiento);
		fread(&Temporal, 1, 1, Archivo);
		*(Pantalla) = Temporal;
		Diferencias -= 3;
		}
}

void DesComprime_BRUN(void)
{
	unsigned char NumeroRepeticiones, Contador2;
	char Caracter;
	unsigned int Contador = 0;

	fread(&NumeroRepeticiones, 1, 1, Archivo);
	fread(&Caracter, 1, 1, Archivo);
	while (Contador<64000)
		{
		Contador2 = 0;
		while (Contador2++ < NumeroRepeticiones)
			{
			*(Pantalla++) = Caracter;
			Contador++;
			}
		if (Contador<64000)
			{
			fread(&NumeroRepeticiones, 1, 1, Archivo);
			fread(&Caracter, 1, 1, Archivo);
			}
		}
}

void DesComprime_Cambio(void)
{
	int BRUN, Delta1;
	char Temporal;

	/* Poner Frame Actual en el archivo, en el formato mas apropiado */
	/* Intenta comprimirlo tipo BYTE_RUN */
	Pantalla = MK_FP(0xA000, 0);
	fread (&Temporal, 1, 1, Archivo);
	switch(Temporal)
		{
		case FRAME_BRUN:
			DesComprime_BRUN();
			break;
		case FRAME_COPIADO:
			fread(Pantalla, 64000, 1, Archivo);
			break;
		case FRAME_DELTA:
			DesComprime_Delta();
			break;
		}
	return;
}

void DesComprime_Primer_Cuadro(void)
{
	int Menor;
	char Temporal;

	/* Poner Frame Actual en el archivo, en el formato mas apropiado */
	/* Intenta comprimirlo tipo BYTE_RUN */
	Pantalla = MK_FP(0xA000, 0);
	fread (&Temporal, 1, 1, Archivo);
	switch(Temporal)
		{
		case FRAME_BRUN:
			DesComprime_BRUN();
			break;
		case FRAME_COPIADO:
			fread(Pantalla, 64000, 1, Archivo);
			break;
		}
}


void main(int argc, char *argv[])
{
	FILE *Archivo2;
	int NumeroFrame = 0;
	char NombreDestino[20];
	long PosicionBase = 0;

	if (argc != 2)
		{
		printf ("Uso: proyecta <archivo animaci¢n >\n");
		exit(0);
		}
	InicializaGraficos(0x13);
	InicializaPaleta();
	strcpy(NombreDestino, argv[1]);
	Archivo = fopen(NombreDestino, "rb");
	if (!Archivo)
		{
		perror("No se pudo abrir el archivo\n");
		exit(-1);
		}

	DesComprime_Primer_Cuadro();
	while (1)
		{
		PosicionBase = ftell(Archivo);
		while (!feof(Archivo))
			{
			NumeroFrame++;
			DesComprime_Cambio();
			}
		while (!kbhit());
		fseek(Archivo, PosicionBase, SEEK_SET);
		}
	fclose(Archivo);
	InicializaGraficos(0x03);
}
