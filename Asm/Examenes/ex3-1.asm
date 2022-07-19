; Programa para resolver la pregunta 1 del 3er. examen parcial
;
; Rutina que dibuje una l¡nea horizontal por acceso directo a memoria, en
; el modo de texto.
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
        ; Limpiar pantalla, sin uso de interrupciones (s¢lo para ejemplificar)
        ;
        MOV     AX, 0B800h
        MOV     ES, AX
        XOR     DI, DI
        CLD
        MOV     CX, 2000        ; 80 x 25 = 2000 elementos en pantalla
        MOV     AX, 1F20h       ; 20h = espacio; 1Fh = Atributo fondo azul,
                                ; letras blancas
        REP     STOSW           ; Ponemos estos 2000 caracteres en memoria
        ;
        ; Poner los par metros para la rutina y llamarla
        ;
        MOV     BL, 7           ; La l¡nea la pondr‚ en gris claro sobre negro
        MOV     CX, 20          ; Vamos a hacer una l¡nea de ancho 20
        MOV     DL, 10          ; Coordenada X
        MOV     DH, 10          ; Coordenada Y
        CALL    LineaHorizontal
        ;
        ; Llamarla otra vez, para probar correctamente
        ;
        MOV     BL, 1Fh         ; La l¡nea la pondr‚ en blanco sobre azul
        MOV     CX, 30          ; Vamos a hacer una l¡nea de ancho 20
        MOV     DL, 25          ; Coordenada X
        MOV     DH, 15          ; Coordenada Y
        CALL    LineaHorizontal
        ;
        ; Terminar con el programa, regresar a DOS
        ;
        MOV     AX, 4C00h
        INT     21h

; 
; Rutina que pinta la l¡nea horizontal.
; Par metros:   DL, DH: Coordenadas X y Y
;               CX: Ancho de la l¡nea
;               BL: Atributo de color
; Destruye los registros: AX, DI y ES.
;
LineaHorizontal PROC
        ; 
        ; Primero, ajustar el segmento; aunque este programa no lo
        ; necesita, para que la rutina sea general.
        ;
        MOV     AX, 0B800h
        MOV     ES, AX
        ;
        ; Calcular la posici¢n
        ;
        MOV     AL, 80
        MUL     DH
        ; En AX tenemos 80 * Y; le sumamos la X
        ADD     AL, DL
        ADC     AH, 0
        ;
        ; Multiplicar el desplazamiento calculado, por 2 bytes que ocupa
        ; cada caracter en pantalla
        ;
        SHL     AX, 1
        ; 
        ; AX queda entre 0 y 3998, por ello no me preocupo por DX. 
        ;
        MOV     DI, AX
        ; 
        ; Word que voy a poner: la parte alta es el atributo, la baja el
        ; caracter
        ;
        MOV     AH, BL
        MOV     AL, 196
        ;
        ; Ponerla en memoria, CX veces
        ;
        REP     STOSW
        RET
LineaHorizontal ENDP

        END
