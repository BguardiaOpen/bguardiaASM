; Programa para resolver la pregunta 1 del 2§ examen parcial
;
; Dibujar un patr¢n de l¡neas diagonales en modo de gr ficas.
;
.model small
.stack 100h
.data
.code
        ;
        ; Ajustar el segmento de datos
        ;
        MOV     AX, @data
        MOV     DS, AX
        ;
        ; Inicializar el modo de video = 13h, video de 320 x 200, 256 colores
        ; de VGA y limpia la pantalla
        ;
        MOV     AX, 0013h
        INT     10h
        ;
        ; Inicializar la columna y rengl¢n: (10, 0) a (0, 10), es la primera
        ; l¡nea; debemos seguir hasta la l¡nea (190, 0) a (0, 190)
        ;
        MOV     AL, 1   ; Color para pintar
        MOV     BH, 0   ; P gina 0
        MOV     CX, 10  ; Columna inicial
CicloExterno:
        PUSH    CX      ; Guardar el inicio (10, 0), se guarda el 10 pues
                        ; siempre empezamos en 0; luego, se guardar  20, 30, 
                        ; etc. hasta 190
        MOV     DX, 0   ; Rengl¢n inicial
CicloLinea:
        MOV     AH, 0Ch ; Servicio para pintar pixels
        INT     10h
        INC     DX
        DEC     CX
        JNS     CicloLinea      ; Mientras CX no sea menor a 0, es decir 
                                ; negativo
        ;
        ; Restaurar CX = Columna inicial y cerrar el ciclo l¡nea por l¡nea
        ;
        POP     CX
        ADD     CX, 10
        CMP     CX, 200         ; Si ya es 200, salimos de este ciclo.
        JNE     CicloExterno

        ;
        ; Segunda parte, es igual a la anterior; pero ahora, ser  el grupo
        ; de l¡neas (200, 0) a (1, 199); (210, 0) a (11, 199); y as¡, hasta
        ; (310, 0) a (111, 199).
        ;
CicloExterno2:
        PUSH    CX      ; Guardar la columna inicial (Columna, 0)
        MOV     DX, 0   ; Rengl¢n inicial
CicloLinea2:
        MOV     AH, 0Ch ; Servicio para pintar pixels
        INT     10h
        DEC     CX
        INC     DX
        CMP     DX, 200
        JNE     CicloLinea2     ; Mientras DX sea menor a 200
        ;
        ; Restaurar CX = Columna inicial y cerrar el ciclo l¡nea por l¡nea
        ;
        POP     CX
        ADD     CX, 10
        CMP     CX, 320         ; Si ya es 200, salimos de este ciclo.
        JNE     CicloExterno2

        ;
        ; Tercera parte, es igual a la anterior; pero ahora, ser  el grupo
        ; de l¡neas (319, 1) a (121, 199); (319, 11) a (131, 199); y as¡, hasta
        ; (319, 191) a (311, 199).
        ;
        MOV     DX, 1
CicloExterno3:
        PUSH    DX      ; Guardar el rengl¢n inicial (319, Rengl¢n)
        MOV     CX, 319   ; Rengl¢n inicial
CicloLinea3:
        MOV     AH, 0Ch ; Servicio para pintar pixels
        INT     10h
        DEC     CX
        INC     DX
        CMP     DX, 200
        JNE     CicloLinea3     ; Mientras DX sea menor a 200
        ;
        ; Restaurar DX = Rengl¢n inicial y cerrar el ciclo l¡nea por l¡nea
        ;
        POP     DX
        ADD     DX, 10
        CMP     DX, 201         ; Si ya es 201, salimos de este ciclo.
        JNE     CicloExterno3
        ;
        ; Esperar una tecla, para que el usuario pueda ver el resultado
        ;
        MOV     AH, 1
        INT     21h
        ;
        ; Restaurar el video 80x25 (modo 3).
        ;
        MOV     AX, 0003h
        INT     10h
        ;
        ; Terminar con el programa, regresar a DOS
        ;
        MOV     AX, 4C00h
        INT     21h
        END
