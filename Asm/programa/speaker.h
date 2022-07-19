/* Archivo de encabezado para prototipos de funciones de la librer¡a del
   Speaker */

/* Sentry: esto lo debiera tener todo .H, y previene que se incluya dos
   veces. */

#ifndef _SPEAKER_H
#define _SPEAKER_H

extern void ActivaSpeaker(void);
extern void DesactivaSpeaker(void);
extern void SuenaSpeaker(unsigned short CentesimasSegundo);
extern void AjustaSpeaker(unsigned short Frecuencia);
extern void PlaySpeaker(unsigned short Frecuencia, unsigned short 
        CentesimasSegundo);

#endif /* _SPEAKER_H */
