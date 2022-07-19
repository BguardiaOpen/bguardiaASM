; Programa para resolver la pregunta 2 del 3er. examen parcial
;
; Programa que compare archivos
;
.model small
.stack 100h
.data

; Definici¢n de constante

TAMANO_BUFFER   EQU     8192

;
; Variables para los manejadores de los archivos
;
Archivo1        DW      ?
Archivo2        DW      ?

;
; Variables para indicar n£mero de bytes le¡dos
;
Bytes1          DW      ?
Bytes2          DW      ?

Mensaje1        DB      'Los archivos son iguales$'
Mensaje2        DB      'Los archivos son diferentes$'
Mensaje3        DB      'Los archivos son similares$'

;
Nombre1         DB      'ex3-1.asm', 0
Nombre2         DB      'ex3-1b.asm', 0

;
; Buffer de cada archivo, vac¡o por el momento, de 8 Kb.
;
Buffer1         DB      TAMANO_BUFFER DUP(0)
Buffer2         DB      TAMANO_BUFFER DUP(0)

.code

LOCALS          ; Directiva para activar etiquetas locales

;
; Las macros las pongo al principio del c¢digo, como parte de la organizaci¢n
;
; N¢tese que se usan ;; para los comentarios dentro de macros; esto evita
; que se expandan los comentarios.
; 
; Tambi‚n usamos la etiqueta local, para evitar problemas de redefinici¢n
;

Fopen   MACRO   Archivo, Nombre
        LOCAL   @@NoError               ;; Etiqueta local al macro
        MOV     AH, 3Dh
        MOV     AL, 0   ;; Modo de lectura
        LEA     DX, Nombre
        INT     21h
        JNC     @@NoError
        ;; Aqu¡ hay un error, termino el programa
        MOV     AX, 4C01h
        INT     21h
@@NoError:
        MOV     Archivo, AX
ENDM

Fclose  MACRO   Archivo
        MOV     AH, 3Eh
        MOV     BX, Archivo
        INT     21h
ENDM

Lee     MACRO   Archivo, Buffer
        LOCAL   @@NoError               ;; Etiqueta local al macro
        MOV     AH, 3Fh
        MOV     BX, Archivo
        LEA     DX, Buffer
        MOV     CX, TAMANO_BUFFER 
        INT     21h
        JNC     @@NoError
        ;; Aqu¡ hay un error, termino el programa
        MOV     AX, 4C02h
        INT     21h
@@NoError:
ENDM

;
; STRCMP modificado para comparar los buffer de los archivos
;
ComparaArchivos MACRO   NumBytes
        CLD
        MOV     CX, NumBytes
        LEA     SI, Buffer1
        LEA     DI, Buffer2
        ;
        ; Comparar con instrucci¢n de String
        ;
        REPE    CMPSB
ENDM

;
;
;
Principal       PROC
        ;
        ; Ajustar el segmento de datos, y el extra porque voy a usar
        ; instrucciones de strings sobre los mismos datos
        ;
        MOV     AX, @data
        MOV     DS, AX
        MOV     ES, AX
        ;
        ; Llamado a funciones por Macros
        ;
        Fopen   Archivo1, Nombre1
        Fopen   Archivo2, Nombre2

Ciclo:  Lee     Archivo1, Buffer1
        MOV     Bytes1, AX
        Lee     Archivo2, Buffer2
        MOV     Bytes2, AX
        CMP     Bytes1, AX
        JE      TamanoIgual
        ;
        ; Encontramos que el tama¤o es distinto
        ; Hay que comparar el menor tama¤o
        ;
        JB      Archivo1Menor
        ComparaArchivos Bytes2
        JE      Similares
        ; No son iguales
        JMP     SHORT Diferentes
Archivo1Menor:
        ComparaArchivos Bytes1
        JE      Similares
Diferentes:
        MOV     AH, 9
        LEA     DX, Mensaje2
        INT     21h
        JMP     SHORT   FinCompara
Similares:
        MOV     AH, 9
        LEA     DX, Mensaje3
        INT     21h
        JMP     SHORT   FinCompara
TamanoIgual:
        ComparaArchivos Bytes1
        JNE     Diferentes
        ;
        ; Debemos checar el fin de archivo. Si lleg¢, son iguales; si no,
        ; seguir leyendo
        ;
        CMP     Bytes1, 0
        JNE     Ciclo
        MOV     AH, 9
        LEA     DX, Mensaje1
        INT     21h
FinCompara:
        Fclose  Archivo1
        Fclose  Archivo2
        ;
        ; Terminar con el programa, regresar a DOS
        ;
        MOV     AX, 4C00h
        INT     21h
Principal       ENDP

        END
