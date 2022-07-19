;
; Programa ejemplo para mostrar la operaci¢n del rat¢n a trav‚s del uso
; de la interrupci¢n 33h.
; Bruno Guardia Robles
; 30/XII/96
;

LOCALS  ; Habilita etiquetas locales

.model small
.stack 100h
.data

MsgNoInstalado  DB      "Error: No hay rat¢n instalado", 13, 10, "$"
MsgValoresBotones DB    "                        I M D", 0
MsgBotonRaton   DB      "BX (Botones del rat¢n): ", 0

.code

EsperaTecla     MACRO
        MOV     AH, 1
        INT     21h
        ENDM

; Macro que ejemplifica el uso de etiquetas locales

PintaMensaje    MACRO   QueMensaje
        LOCAL   @@CicloMsg1, @@FinCicloMsg1
        LEA     SI, QueMensaje
@@CicloMsg1:
        LODSB
        CMP     AL, 0
        JE      @@FinCicloMsg1
        STOSW
        JMP     @@CicloMsg1
@@FinCicloMsg1:
        ENDM

InicializaRaton       PROC
        MOV     AX, 0000h
        INT     33h
        CMP     AX, 0FFFFh
        JNE     ErrorInicializa
        RET
ErrorInicializa:
        MOV     AH, 9
        LEA     DX, MsgNoInstalado
        INT     21h
        ; Fin de programa con error
        MOV     AX, 4C01h
        INT     21h
InicializaRaton       ENDP

MuestraRaton       PROC
        MOV     AX, 0001h
        INT     33h
        RET
MuestraRaton       ENDP

DesactivaRaton       PROC
        MOV     AX, 0002h
        INT     33h
        RET
DesactivaRaton       ENDP

Presentar       PROC
        MOV     AX, 0B800h
        MOV     ES, AX
        CLD
        ; Limpiar pantalla
        XOR     DI, DI
        MOV     AX, 0720h
        MOV     CX, 2000
        REP     STOSW
        ; Pintar mensaje sin cambiar atributo
        XOR     DI, DI  ; En la posici¢n 0 = esquina
        ; AH sigue teniendo 7 como atributo
        ; Macro para pintar mensaje en memoria con acceso directo
        PintaMensaje    MsgValoresBotones
        MOV     DI, 160 ; En Y = 1
        PintaMensaje    MsgBotonRaton
        RET
Presentar       ENDP

MuestraBit      MACRO
        LOCAL @@PintaBit
        MOV     AL, '1'
        SHR     BX, 1   ; Sacar un bit por la derecha
        JC      @@PintaBit
        MOV     AL, '0'
@@PintaBit:
        STOSB
        ENDM

EstadoRaton     PROC
        MOV     AX, 0003h
        INT     33h
        STD
        ; Mostrar BX, pintandolo en memoria
        MOV     DI, 160 + 29 * 2        ; X = 29 en Y = 1
        MuestraBit
        SUB     DI, 3
        MuestraBit
        SUB     DI, 3
        MuestraBit
        RET
EstadoRaton     ENDP

Principal       PROC
        ; Inicializar DS
        MOV     AX, @data
        MOV     DS, AX
        CALL    Presentar
        CALL    InicializaRaton
        CALL    MuestraRaton
Ciclo:
        EsperaTecla
        CMP     AL, 27  ; Escape
        JE      Salir
        CALL    EstadoRaton
        JMP     Ciclo
Salir:
        CALL    DesactivaRaton
        ; Fin de programa
        MOV     AX, 4C00h
        INT     21h
Principal       ENDP

        END     Principal
