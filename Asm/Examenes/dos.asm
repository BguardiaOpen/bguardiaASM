; Programa para resolver las pregunta 2 y de rescate, del 2§ examen parcial
;
; Rutina para imprimir en pantalla, con control de color
;
.model small
.stack 100h
.data
ColorFondo      DB      ?
ColorFrente     DB      ?
Mensaje         DB      'Hola mundo!!!', '$'

Atributo        DB      ?

.code

Principal       PROC
        ;
        ; Ajustar el segmento de datos
        ;
        MOV     AX, @data
        MOV     DS, AX
        ;
        ; Limpiar pantalla
        ;
        MOV     AX, 0600h
        MOV     BH, 7   ; Atributo "normal" de DOS
        MOV     CX, 0   ; Columna y rengl¢n 0, esquina superior izquierda
        MOV     DX, 184Fh ; Rengl¢n 24, columna 79 = esquina inferior derecha
        INT     10h

        ;
        ; Para probar las rutinas: En la posici¢n (1, 3) poner el mensaje,
        ; en fondo azul y letras blancas.
        ;
        ; Primero gotoxy ( 1, 3)
        ; 
        MOV     AH, 2
        MOV     BH, 0
        MOV     DH, 3
        MOV     DL, 1
        INT     10h
        ;
        ; Luego rutinas
        ;
        MOV     AH, 15  ; Blanco
        CALL    TextColor
        MOV     AH, 1   ; Azul
        CALL    TextBackground

        ; Apuntar la cadena y llamar la rutina de la pregunta 2
        ;
        MOV     DX, OFFSET Mensaje
        CALL    ImprimeCadenaColor

        ;
        ; Otra prueba: En la posici¢n (1, 5) poner el mensaje,
        ; en fondo gris claro y letras negras.
        ;
        ; Primero gotoxy ( 1, 5)
        ; 
        MOV     AH, 2
        MOV     BH, 0
        MOV     DH, 5
        MOV     DL, 1
        INT     10h
        ;
        ; Luego rutinas
        ;
        MOV     AH, 0  ; Negro
        CALL    TextColor
        MOV     AH, 7  ; Gris claro
        CALL    TextBackground

        ; Apuntar la cadena y llamar la rutina de la pregunta 2
        ;
        MOV     DX, OFFSET Mensaje
        CALL    ImprimeCadenaColor

        ;
        ; Terminar con el programa, regresar a DOS
        ;
        MOV     AX, 4C00h
        INT     21h
Principal       ENDP

ImprimeCadenaColor      PROC
        ; 
        ; En DX no nos sirve el offset, por ello lo llevo a SI
        ;
        MOV     SI, DX
CicloImprime:
        CMP     BYTE PTR [SI], '$'
        JNE     ContinuaImprime
        RET
ContinuaImprime:
        MOV     AH, 9
        MOV     AL, [SI]
        MOV     BH, 0
        MOV     BL, Atributo
        MOV     CX, 1
        INT     10h
        ; 
        ; Moverse al siguiente caracter en el ciclo
        ;
        INC     SI
        ; 
        ; Mover el cursor
        ;
        MOV     AH, 3
        MOV     BH, 0
        INT     10h
        INC     DL
        CMP     DL, 80
        JNE     NoEsFinRenglon
        INC     DH
        MOV     DL, 0
NoEsFinRenglon:
        ;
        ; Ajustar el cursor ahora, que ya actualizamos las coordenadas
        ;
        MOV     AH, 2
        INT     10h
        ;
        ; Ciclarse
        ;
        JMP SHORT       CicloImprime
ImprimeCadenaColor      ENDP

TextColor       PROC
        MOV     ColorFrente, AH
        CALL    AjustaAtributo
        RET
TextColor       ENDP

TextBackground  PROC
        MOV     ColorFondo, AH
        CALL    AjustaAtributo
        RET
TextBackground  ENDP

AjustaAtributo  PROC
        MOV     BH, ColorFondo
        SHL     BH, 1
        SHL     BH, 1
        SHL     BH, 1
        SHL     BH, 1
        OR      BH, ColorFrente
        MOV     Atributo, BH
        RET
AjustaAtributo  ENDP

        END

