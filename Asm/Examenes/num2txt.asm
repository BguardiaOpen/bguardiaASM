; respuesta del 3er examen parcial
;
; NUM2TXT.ASM - Programa que convierte un archivo de enteros a un archivo
; de texto legible.
;
.model small
.stack 100h
.data
NombreArchivoOrigen     DB      128 DUP(?)
NombreArchivoDestino    DB      128 DUP(?)
HandleOrigen    DW      ?
HandleDestino   DW      ?
Linea           DB      10 DUP(0)
Numero          DW      ?
EOF             DB      0

.code
Principal       PROC
        MOV     AX, @data
        MOV     DS, AX
        CALL    LeeParametros
        CALL    AbreArchivoOrigen
        CALL    CreaArchivoDestino
Ciclo:  CALL    LeeNumero
        CMP     EOF, 1
        JE      Salir
        CALL    ConvierteATexto
        CALL    EscribeLinea
        JMP     Ciclo
        CALL    CierraArchivos
Salir:
        MOV     AH, 4Ch
        INT     21h
Principal       ENDP

; procedimientos que se ped¡an

CreaArchivoDestino      PROC
        MOV     AH, 3Ch ; Servicio para crear
        LEA     DX, NombreArchivoDestino
        MOV     CX, 0   ; Atributo normal
        INT     21h
        JC      ErrorCrea
        MOV     HandleDestino, AX
        RET
ErrorCrea:
        MOV     AH, 4Ch
        INT     21h
CreaArchivoDestino      ENDP

LeeNumero       PROC
        MOV     AH, 3Fh
        MOV     CX, 2
        MOV     BX, HandleOrigen
        LEA     DX, Numero
        INT     21h
        JC      ErrorLeer
        CMP     AX, 0
        JNE     NoHayProblema
        MOV     EOF, 1  ; prende la bandera...
NoHayProblema:
        RET
ErrorLeer:
        MOV     AH, 4Ch
        INT     21h
LeeNumero       ENDP

ConvierteATexto PROC
        ; Tomar n£mero y dividirlo entre 10 para convertirlo a ASCII
        LEA     DI, Linea
        ADD     DI, 6
        ; Poner el fin de l¡nea
        MOV     BYTE PTR [DI],10
        DEC     DI
        MOV     BYTE PTR [DI],13
        DEC     DI
        ; Ahora s¡, van los n£meros
        MOV     AX, Numero
        MOV     BX, 10
        MOV     CX, 5 ; Procesar 5 d¡gitos.
CicloDivide:
        XOR     DX, DX  ; limpiar parte alta (DX:AX/BX)
        DIV     BX      ; AX/10 = AX cociente, DX residuo
        ; El residuo
        ADD     DX, '0' ; Convertir el residuo de n£mero a c¢digo ASCII
        MOV     [DI], DL        ; guardar el ASCII
        DEC     DI      ; pr¢xima vez al siguiente caracter, de derecha
                        ; a izquierda
        LOOP    CicloDivide     ; ciclate 5 veces...
        ; ya acabamos, puede verificarse Linea
        RET
ConvierteATexto ENDP

EscribeLinea    PROC
        MOV     AH, 40h ; Servicio para escribir
        MOV     CX, 7   ; total de caracteres que se van a escribir...
        LEA     DX, Linea       ; Buffer del que se toma lo que escribo
        MOV     BX, HandleDestino       ; Donde escribo...
        INT     21h     ; Escribe!!!
        RET             ; ya acabe
EscribeLinea    ENDP

;
; PROCEDIMIENTOS DE APOYO: NO SE PIDIERON EN EL EXAMEN
;

AbreArchivoOrigen       PROC
        MOV     AH, 3Dh
        LEA     DX, NombreArchivoOrigen
        MOV     AL, 0   ; Solo lectura!!!
        INT     21h
        MOV     HandleOrigen, AX
        RET
ErrorAbrir:
        MOV     AH, 4Ch
        INT     21h
AbreArchivoOrigen       ENDP

CierraArchivos  PROC
        MOV     AH, 3Eh
        MOV     BX, HandleOrigen
        INT     21h
        MOV     BX, HandleDestino
        INT     21h
        RET
CierraArchivos  ENDP

LeeParametros   PROC
        MOV     AH, 62h
        INT     21h
        MOV     ES, BX
        MOV     SI, 82h
; Estado espacios
Ciclo1: MOV     AL, [ES:SI]
        INC     SI
        CMP     AL, ' '
        JE      Ciclo1
        CMP     AL, 13
        JE      ErrorP
        LEA     DI, NombreArchivoOrigen
Ciclo2: MOV     [DI], AL
        MOV     AL, [ES:SI]
        INC     SI
        INC     DI
        CMP     AL, ' '
        JE      Siguiente
        CMP     AL, 13
        JNE     Ciclo2
ErrorP: MOV     AH, 4Ch
        INT     21h
Siguiente:
        MOV     BYTE PTR [DI], 0
Ciclo3:
        MOV     AL, [ES:SI]
        INC     SI
        CMP     AL, ' '
        JE      Ciclo3
        LEA     DI, NombreArchivoDestino
Ciclo4: MOV     [DI], AL
        MOV     AL, [ES:SI]
        INC     SI
        INC     DI
        CMP     AL, ' '
        JE      FinPar
        CMP     AL, 13
        JNE     Ciclo4
FinPar:
        MOV     BYTE PTR [DI], 0
        RET
LeeParametros   ENDP

        END     Principal
