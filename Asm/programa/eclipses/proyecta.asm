.model small
.stack  100h
.data

; Definicion de constantes

FRAME_COPIADO   EQU     0
FRAME_NULO      EQU     1
FRAME_VACIO     EQU     2
FRAME_BRUN      EQU     3
FRAME_DELTA     EQU     4

; Mensajes de error
Mensaje1        DB      'No se pudo abrir el archivo.', 13, 10, 13, 10, '$'
Mensaje2        DB      'Error de lectura.', 13, 10, 13, 10, '$'
Mensaje3        DB      'Error en seek.', 13, 10, 13, 10, '$'

; Variables de archivos

NombreArchivo   DB      'eclipses.cmp',0, 115 DUP(?)

HandleArchivo   DW      ?

OffsetBase      DW      ?

Buffer          DB      64000 DUP(?)    ; Buffer de 64000 bytes

; Variables para tercera version
BanderaLeerMas  DB      0
BaseBloque      DW      OFFSET Buffer
LimiteBloque    DW      OFFSET Buffer + 31999

; Variables para graficos
Rojo            DB      0
Verde           DB      0
Azul            DB      0

Contador        DW      0

.code

TerminaPrograma MACRO
	MOV     AH, 4Ch
	INT     21h
	ENDM

; Rutinas de inicializacion grafica, usan INT 10h

; Estas dos son macros, para mayor eficiencia

InicializaGraficos      MACRO   Modo
	MOV     AH, 0
	MOV     AL, Modo
	INT     10h
	ENDM

PonColor        MACRO   Indice, Red, Green, Blue
	MOV     AH, 10h
	MOV     AL, AH
	MOV     BL, Indice
	XOR     BH, BH
	MOV     CH, Green
	MOV     CL, Blue
	MOV     DH, Red
	INT     10h
	ENDM

InicializaPaleta        PROC
	XOR     CX, CX
CicloInicializaPaleta:
	PUSH    CX
	MOV     BL, CL
	MOV     Rojo, 0
	AND     BL, 128
	JE      RevisaVerde
	MOV     BL, CL
	AND     BL, 31
	MOV     Rojo, BL
RevisaVerde:
	MOV     BL, CL
	MOV     Verde, 0
	AND     BL, 64
	JE      RevisaAzul
	MOV     BL, CL
	AND     BL, 31
	MOV     Verde, BL
RevisaAzul:
	MOV     BL, CL
	MOV     Azul, 0
	AND     BL, 32
	JE      FinPaleta
	AND     BL, 31
	MOV     Azul, BL
FinPaleta:
	PonColor        CL, Rojo, Verde, Azul
	POP     CX
	INC     CX
	CMP     CX, 256
	JB      CicloInicializaPaleta
	RET
InicializaPaleta        ENDP

; Rutinas de archivos

ObtenParametro  PROC
	MOV     AH, 62h
	INT     21h             ; Obtiene PSP
	PUSH    DS
	POP     ES
	MOV     DS, BX
	LEA     DI, NombreArchivo
	MOV     SI, 80h
	MOV     CL, [DS:SI]
	XOR     CH, CH
	JCXZ    FinObtenParametro       ; Si CX = 0, deja por defecto 
					; "ECLIPSES.CMP"
	INC     SI      ; Apunta al primer espacio
	INC     SI      ; Apunta al nombre de archivo
	DEC     CX
	REP     MOVSB   ; Mueve byte por byte del string al nombre del archivo
	MOV     [ES:DI], BYTE PTR 0
FinObtenParametro:
	PUSH    ES
	POP     DS
	RET
ObtenParametro  ENDP

AbreArchivo     PROC
	MOV     AH, 3Dh
	MOV     AL, 0   ; Solo lectura
	LEA     DX, NombreArchivo
	INT     21h
	JC      ErrorAbreArchivo
	MOV     HandleArchivo, AX
	RET
ErrorAbreArchivo:
	LEA     DX, Mensaje1
	MOV     AH, 9
	INT     21h
	TerminaPrograma
	RET
AbreArchivo     ENDP

CierraArchivo   PROC
	MOV     AH, 3Eh
	MOV     BX, HandleArchivo
	INT     21h
	RET
CierraArchivo     ENDP

Lee64000Bytes   PROC
	MOV     AH, 3Fh
	MOV     BX, HandleArchivo
	MOV     CX, 64000
	XOR     DX, DX          ; A partir del desplazamiento 0
	PUSH    DS
	MOV     AX, 0A000h      ; Apuntamos DS a la pantalla!
	MOV     DS, AX
	INT     21h
	JC      ErrorLectura64
	POP     DS              ; Recuperamos DS
	LEA     SI, Buffer
	MOV     CX, [SI]
	RET
ErrorLectura64:
	POP     DS
	LEA     DX, Mensaje2
	MOV     AH, 9
	INT     21h
	TerminaPrograma
Lee64000Bytes   ENDP

; Primera version de las funciones: no es optima, pues no hace buffereo.
; Pero funciona, y es una buena forma de hacer una primera aproximacion
;
;LeeWordEnAX     PROC
;        MOV     AH, 3Fh
;        MOV     BX, HandleArchivo
;        MOV     CX, 2
;        LEA     DX, Buffer
;        INT     21h
;        JC      ErrorLectura
;        LEA     SI, Buffer
;        MOV     AX, [SI]
;        RET
;ErrorLectura:
;        LEA     DX, Mensaje2
;        MOV     AH, 9
;        INT     21h
;        TerminaPrograma
;LeeWordEnAX     ENDP

;LeeByteEnAL     PROC
;        MOV     AH, 3Fh
;        MOV     BX, HandleArchivo
;        MOV     CX, 1
;        LEA     DX, Buffer
;        INT     21h
;        JC      ErrorLectura
;        MOV     AL, Buffer
;        RET
;LeeByteEnAL     ENDP

; Segunda version: lee bloques de 64Kb. a la vez
;LeeBloque       PROC
;        MOV     AH, 3Fh
;        MOV     BX, HandleArchivo
;        MOV     CX, 64000
;        LEA     DX, Buffer
;        INT     21h
;        JC      ErrorBloque
;        RET
;ErrorBloque:
;        LEA     DX, Mensaje2
;        MOV     AH, 9
;        INT     21h
;        TerminaPrograma
;LeeBloque   ENDP
;
;LeeWordEnAX     PROC
;        CMP     SI, OFFSET Buffer + 63999
;        JE      WordPartido
;        JB      TomaWordSimple
;        ; Aqui, hay que leer un bloque nuevo y tomar el Word de ahi
;        CALL    LeeBloque
;        LEA     SI, Buffer      ; Reinicializa el apuntador al principio bloque
;TomaWordSimple:
;        ; LODSW
;        MOV     AX, [SI]
;        INC     SI
;        INC     SI
;        RET
;WordPartido:
;        MOV     AL, [SI]
;        PUSH    AX
;        CALL    LeeBloque
;        POP     AX
;        LEA     SI, Buffer      ; Reinicializa el apuntador al principio bloque
;        MOV     AH, [SI]
;        INC     SI
;        RET
;LeeWordEnAX     ENDP
;
;LeeByteEnAL     PROC
;        CMP     SI, OFFSET Buffer + 64000
;        JNE     TomaByteSimple
;        ; Aqui, hay que leer un bloque nuevo y tomar el Word de ahi
;        CALL    LeeBloque
;        LEA     SI, Buffer      ; Reinicializa el apuntador al principio bloque
;TomaByteSimple:
;        ; LODSB
;        MOV     AL, [SI]
;        INC     SI
;        RET
;LeeByteEnAL     ENDP

; Tercera version: lee bloques de 32Kb. a la vez
LeeBloque       PROC
	MOV     AH, 3Fh
	MOV     BX, HandleArchivo
	MOV     CX, 32000
	MOV     DX, BaseBloque
	INT     21h
	JC      ErrorBloque
	CMP     LimiteBloque, OFFSET Buffer + 63999
	JE      PonBloqueALaMitad
	MOV     LimiteBloque, OFFSET Buffer + 63999
	MOV     BaseBloque, OFFSET Buffer + 32000
	RET
PonBloqueALaMitad:
	MOV     BaseBloque, OFFSET Buffer
	MOV     LimiteBloque, OFFSET Buffer + 31999
	RET
ErrorBloque:
	LEA     DX, Mensaje2
	MOV     AH, 9
	INT     21h
	TerminaPrograma
LeeBloque   ENDP

LeeWordEnAX     PROC
	CMP     SI, LimiteBloque
	JE      WordPartido
	JB      TomaWordSimple

	; Eliminado, esto era en la segunda version
	; Aqui, hay que leer un bloque nuevo y tomar el Word de ahi
	; CALL    LeeBloque
	; Fin eliminado

	; Si ya se activo la bandera, ignorar el limite del bloque
	CMP     BanderaLeerMas, 1
	JE      TomaWordSimple
	MOV     BanderaLeerMas, 1
	CMP     LimiteBloque, OFFSET Buffer + 63999
	JNE     TomaWordSimple  ; Si esta a la mitad, podemos leer sin 
				; regresar el apuntador
	LEA     SI, Buffer      ; Reinicializa el apuntador al principio
	; LEA     SI, Buffer      ; Reinicializa el apuntador al principio bloque
TomaWordSimple:
	; LODSW
	MOV     AX, [SI]
	INC     SI
	INC     SI
	; Caso especial, agregado en tercera version
	CMP     SI, OFFSET Buffer + 64000
	JNE     Regresa
	MOV     BanderaLeerMas, 1
	LEA     SI, Buffer
Regresa:
	RET
WordPartido:
	MOV     BanderaLeerMas, 1
	; LODSB
	MOV     AL, [SI]
	INC     SI
	; Determina los limites
	CMP     LimiteBloque, OFFSET Buffer + 63999
	JNE     LeeSiguiente    ; Si esta a la mitad, podemos leer sin 
				; regresar el apuntador
	LEA     SI, Buffer      ; Reinicializa el apuntador al principio
LeeSiguiente:
	MOV     AH, [SI]
	INC     SI
	RET
LeeWordEnAX     ENDP

LeeByteEnAL     PROC
	CMP     SI, LimiteBloque
	JNE     TomaByteSimple
	; Si ya se activo la bandera, ignorar el limite del bloque
	CMP     BanderaLeerMas, 1
	JE      TomaByteSimple
	; Determina los limites
	MOV     BanderaLeerMas, 1
	CMP     LimiteBloque, OFFSET Buffer + 63999
	JNE     TomaByteSimple  ; Si esta a la mitad, podemos leer sin 
				; regresar el apuntador
	; Agregado en Tercera Version
	MOV     AL, [SI]        ; Todavia el limite se incluye
	; Fin agregado en Tercera Version
	LEA     SI, Buffer      ; Reinicializa el apuntador al principio bloque
	; Agregado en Tercera Version
	RET
	; Fin agregado en Tercera Version
TomaByteSimple:
	; LODSB
	MOV     AL, [SI]
	INC     SI
	RET
LeeByteEnAL     ENDP

; Rutinas de descompresion

DescomprimeDelta        PROC
	CALL    LeeWordEnAX     ; Aqui leo el # de diferencias
	MOV     CX, AX
CicloDelta:
	PUSH    CX
	CALL    LeeWordEnAX     ; Aqui leo el desplazamiento
	MOV     DI, AX  ; Pone el desplazamiento sobre la pantalla
	CALL    LeeByteEnAL
	STOSB   ; Pone el byte AL en memoria [ES:DI]
	POP     CX
	SUB     CX, 3
	CMP     CX, 0
	JNE     CicloDelta
	RET
DescomprimeDelta        ENDP

DescomprimeBRUN         PROC
	XOR     DI, DI          ; Llevaremos el contador y apuntador en DI = 0
CicloBRUN:
	CALL    LeeByteEnAL     ; Lee el numero de repeticiones
	XOR     CH, CH
	MOV     CL, AL          ; Pone # repeticiones en CX
	PUSH    CX
	CALL    LeeByteEnAL     ; Lee el caracter que se repite
	POP     CX
	REP     STOSB           ; Pone el byte CX veces, de paso incrementa DI
	CMP     DI, 64000       ; Llegamos al final?
	JNE     CicloBRUN
	RET
DescomprimeBRUN         ENDP

DescomprimeCuadro       PROC
	CALL    LeeByteEnAL     ; Lee el tipo de frame
	CMP     AL, FRAME_BRUN
	JNE     EntoncesCopiado
	CALL    DescomprimeBRUN
	RET
EntoncesCopiado:
	CMP     AL, FRAME_COPIADO
	JNE     EntoncesDelta
	CALL    Lee64000Bytes
	RET
EntoncesDelta:
	CALL    DescomprimeDelta
	RET
DescomprimeCuadro       ENDP

; Programa principal

Principal       PROC
	MOV     AX, @data       ; Inicializa el Data Segment
	MOV     DS, AX
	CALL    ObtenParametro
	MOV     AX, 0A000h      ; y de una vez el Extra Segment
	MOV     ES, AX
	CALL    AbreArchivo
	InicializaGraficos 13h  ; Modo 320 x 200 x 256 colores
	CALL    InicializaPaleta
	; En este momento, se hace el ciclo para pasar una sola vez la
	; animacion, no continuamente
	MOV     Contador, 359
	; Optimizacion #1: lectura por bloques.
	LEA     SI, Buffer
	CALL    LeeBloque

	; Inicia agregado tercera version

	; Ahora, como son de 32000, hay que leer un bloque mas
	CALL    LeeBloque
	; Pero inicializamos los limites como si solamente hubieramos leido
	; uno

	; MOV     BaseBloque, OFFSET Buffer
	; MOV     LimiteBloque, OFFSET Buffer + 31999

	; Termina agregado tercera version

	; Descomprime el primer cuadro, fuera del ciclo
	CALL    DescomprimeCuadro
	; Obten el Offset de base: SI - OFFSET Buffer
	; es el offset en archivo donde inicia el 2o. cuadro
	MOV     OffsetBase, SI
	SUB     OffsetBase, OFFSET Buffer

CicloPrincipal:

	CALL    DescomprimeCuadro
	; Agregado en tercera version
	CMP     BanderaLeerMas, 1
	JNE     ContinuaConSiguienteCuadro
	MOV     BanderaLeerMas, 0
	CALL    LeeBloque

ContinuaConSiguienteCuadro:
	; Fin agregado tercera version

	DEC     Contador
	CMP     Contador, 0
	JNE     CicloPrincipal
	; Aqui espera una tecla
	MOV     AH, 7
	INT     21h
	CMP     AL, 27  ; Es un ESCAPE?
	JE      FinPrograma
	; Para repetir el ciclo, volvemos al segundo cuadro 
	MOV     AH, 42h
	MOV     AL, 0   ; SEEK_SET
	MOV     BX, HandleArchivo
	MOV     DX, OffsetBase
	XOR     CX, CX
	INT     21h             ; FSEEK
	MOV     Contador, 359
	; Agregado en tercera version
	MOV     BaseBloque, OFFSET Buffer
	MOV     LimiteBloque, OFFSET Buffer + 31999
	CALL    LeeBloque       ; Se necesita empezar con 2 bloques
	; Fin agregado
	CALL    LeeBloque
	LEA     SI, Buffer
	JMP     CicloPrincipal
FinPrograma:
	CALL    CierraArchivo
	InicializaGraficos  3h  ; Modo Texto
	TerminaPrograma
ErrorImposible:
	MOV     AH, 9
	LEA     DX, Mensaje3
	INT     21h
	TerminaPrograma
Principal       ENDP

	END     Principal
