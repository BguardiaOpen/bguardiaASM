.model small
.stack 100h

.data
; Variables para las coordenadas del Marco
X1      DB      ?
Y1      DB      ?
X2      DB      ?
Y2      DB      ?

.code

; Procedimiento del problema planteado en clase
; Par metros: CL = X1, CH = Y1, DL = X2, DH = Y2 (coordenadas de las esquinas)
;             BH = Numero de p gina, BL = Color.  
Marco   PROC

        ; Primero, asegurarse de usar la p gina deseada

        MOV     AH, 5   ; Servicio de ajustar p gina activa
        MOV     AL, BH  ; P gina deseada
        INT     10h     ; Llamado a BIOS, se ajusta la p gina

        ; Ahora, limpiar la ventana que queremos trabajar
        ; Esto se har¡a:
        ;MOV     AH, 6   ; Servicio de scroll/limpiar
        ;MOV     AL, 0   ; L¡neas a desplazar 0 = Limpiar
        ; Pero es m s eficiente:
        MOV     AX, 0600h       ; Une las dos instrucciones anteriores
        ; Ajustar el color, sin perder el n£mero de p gina
        XCHG    BH, BL  ; Queda en BH el color, en BL n£mero de p gina

        INT     10h     ; Limpia la ventana con las coordenadas indicadas.

        ; Empezaremos a trazar l¡neas, ya vimos que necesitaremos guardar
        ; las variables

        MOV     X1, CL
        MOV     X2, DL
        MOV     Y1, CH
        MOV     Y2, DH

        ; Esquina inferior derecha:

        ; posicionar el cursor
        MOV     AH, 2   ; Servicio Gotoxy
        ; Ya tengo las coordenadas DL, DH = X2, Y2
        ; Tomo la p gina
        XCHG    BH, BL  ; Queda en BH la p gina y en BL el atributo de color
        INT     10h     ; queda el cursor posicionado

        ; Ya estoy ah¡, ahora pinto la esquina

        MOV     AH, 9   ; Servicio para poner caracter y atributo
        ; Ya tengo en BH la pagina, y en BL el color
        MOV     AL, 217 ; Caracter 217, esquina inferior derecha 'Ù' 
        MOV     CX, 1   ; Colocar un caracter en pantalla
        INT     10h

        ; Ciclo para pintar la l¡nea de la derecha
CicloDerecha:
        ; posicionar el cursor
        MOV     AH, 2   ; Servicio Gotoxy
        DEC     DH      ; Primero, me dirijo al caracter que esta
                        ; un renglon arriba
        CMP     DH, Y1  ; Si llego al renglon Y1, hay que pintar esquina
        JE      EsqSupDer       
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la l¡nea
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 179 ; Caracter 179, linea vertical '³'
        ; BH, BL y CX conservan hasta ahora la pagina, el atributo de color y 
        ; el numero de caracteres a pintar
        INT     10h
        JMP     CicloDerecha
        ; Esto se puede eficientar con una variante del JMP:
        ; JMP SHORT     CicloDerecha
        ; Como pueden imaginarse, esta version usa un solo byte para el
        ; brinco, y puede por tanto brincar 128 bytes atras o 127 adelante.

EsqSupDer:      ; C¢digo para la esquina superior derecha
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la esquina
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 191 ; Caracter 191, esquina superior derecha '¿'
        ; BH, BL y CX conservan hasta ahora la pagina, el atributo de color y 
        ; el numero de caracteres a pintar
        INT     10h

        ; Ahora, toca la l¡nea superior; conservamos el manejo de coordenadas
        ; De hecho, es muy similar a la l¡nea derecha
CicloSuperior:
        MOV     AH, 2   ; Servicio gotoxy
        DEC     DL      ; Disminuye X
        CMP     DL, X1  ; Si llego a la columna X1, hay que pintar esquina
        JE      EsqSupIzq
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la l¡nea
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 196 ; Caracter 196, linea horizontal 'Ä'
        ; BH, BL y CX siguen conservandose 
        INT     10h
        JMP SHORT CicloSuperior

        ; Esquina superior izquierda, igual que con la derecha
EsqSupIzq:      ; C¢digo para la esquina superior izquierda
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la esquina
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 218 ; Caracter 218, esquina superior izquierda 'Ú'
        ; BH, BL y CX conservan hasta ahora la pagina, el atributo de color y 
        ; el numero de caracteres a pintar
        INT     10h

        ; Lo mismo que hemos hecho, pero ahora bajamos por la l¡nea izquierda
CicloIzquierda:
        MOV     AH, 2   ; Servicio Gotoxy
        INC     DH      ; Incrementa Y => hacia abajo
        CMP     DH, Y2  ; Si llego al renglon Y2, hay que pintar esquina
        JE      EsqInfIzq
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la l¡nea
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 179 ; Caracter 179, linea vertical '³'
        ; Se conservan hasta ahora la pagina, el atributo de color y 
        ; el numero de caracteres a pintar
        INT     10h
        JMP SHORT CicloIzquierda

        ; Esquina inferior izquierda
EsqInfIzq:
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la esquina
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 192 ; Caracter 192, esquina inferior izquierda 'À'
        ; BH, BL y CX conservan hasta ahora la pagina, el atributo de color y 
        ; el numero de caracteres a pintar
        INT     10h

        ; Ya solo nos falta repetir lo mismo, en la linea de abajo
CicloInferior:
        MOV     AH, 2   ; Servicio gotoxy
        INC     DL      ; Incrementa X
        CMP     DL, X2  ; Si llego a la columna X2, acab‚
        JE      FinMarco
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la l¡nea
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 196 ; Caracter 196, linea horizontal 'Ä'
        ; BH, BL y CX siguen conservandose 
        INT     10h
        JMP SHORT CicloInferior

FinMarco:
        RET     ; Termino, regreso a donde se llamo la rutina
Marco   ENDP

; Como ver n, el secreto est  en subdividir el problema mayor en partes
; m s manejables. Despu‚s veremos formas m s eficientes de codificar rutinas
; tan reiterativas y largas como ‚sta

; Programa principal para probar el procedimiento

Principal       PROC
        ; Inicio de todo programa que use datos: inicializar DS
        MOV     AX, @data
        MOV     DS, AX

        ; Pruebas
        MOV     CL, 0           ; Marco de casi toda la pantalla
        MOV     CH, 0
        MOV     DL, 79
        MOV     DH, 23
        MOV     BH, 0           ; en p gina 0
        MOV     BL, 1Fh         ; Blanco sobre azul
        CALL    Marco

        ; Otro dentro del anterior
        MOV     CL, 10           
        MOV     CH, 10
        MOV     DL, 40
        MOV     DH, 20
        MOV     BH, 0           ; en p gina 0 - la misma, para visualizar
        MOV     BL, 0Fh         ; Blanco sobre negro
        CALL    Marco

        ; Fin de programa, regresar control a DOS
        MOV     AH, 4Ch
        INT     21h
Principal       ENDP

        ; Fin del programa fuente, indicar al TLINK que el arranque del
        ; ejecutable ser  la rutina Principal

        END     Principal


