; respuesta del 3er examen parcial
;
; HTML2TXT.ASM - Programa que convierte un archivo HTML a un archivo
; de texto legible, simplemente eliminando tags.
;
.model small
.stack 100h
.data
NombreArchivoOrigen     DB      128 DUP(?)
NombreArchivoDestino    DB      128 DUP(?)
HandleOrigen    DW      ?
HandleDestino   DW      ?
Linea           DB      255 DUP(0) ; Ejemplo '<HTML><TITLE>Esto es HTML</TITLE>
                                   ; <BODY>Hola MUNDO!!!</BODY></HTML>'
Linea2          DB      255 DUP(0) ; Ejemplo quedar¡a 'Esto es HTMLHola Mundo'
EOF             DB      0

.code
Principal       PROC
        MOV     AX, @data
        MOV     DS, AX
        CALL    LeeParametros
        CALL    AbreArchivoOrigen
        CALL    CreaArchivoDestino
Ciclo:  CALL    LeeLinea
        CMP     EOF, 1
        JE      Salir
        CALL    EliminaTags
        CALL    EscribeLinea2
        JMP     Ciclo
        CALL    CierraArchivos
Salir:
        MOV     AH, 4Ch
        INT     21h
Principal       ENDP

; procedimientos que se ped¡an

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

LeeLinea        PROC
        LEA     DX, Linea
        MOV     SI, DX
        CLD
CicloLeer:
        MOV     AH, 3Fh
        MOV     CX, 1
        MOV     BX, HandleOrigen
        INT     21h
        JC      ErrorLeer
        CMP     AX, 0
        JE      FinArchivo
        INC     DX      ; proxima vez, leemos la siguiente posicion...
        LODSB           ; checar el caracter que se leyo e incrementa SI
        CMP     AL, 13  ; si es Enter, se acaba la linea...
        JNE     CicloLeer
        RET
FinArchivo:
        MOV     EOF, 1  ; prende la bandera...
        RET
ErrorLeer:
        MOV     AH, 4Ch
        INT     21h
LeeLinea        ENDP

EliminaTags     PROC
        ; Cuenta de caracteres:
        MOV     CX, 0
        LEA     SI, Linea
        LEA     DI, Linea2
        ; por instrucciones de strings...
        CLD
        MOV     AX, DS
        MOV     ES, AX
Estado1:
        LODSB   ; Traerse un caracter
        CMP     AL, '<' ; checa inicio de tag
        JE      Estado2
        STOSB           ; no es tag, guarda el caracter
        INC     CX      ; y cuentalo
        CMP     AL, 13  ; si no es fin de linea
        JNE     Estado1 ; siguele
FinLinea:
        ; fue fin de linea, salir
        ; Queda en CX el n£mero de caracteres en Linea2, para
        ; que funcione bien EscribeLinea2
        RET
Estado2:LODSB
        CMP     AL, 13
        JE      FinLinea        ; caso de que termine la linea
        CMP     AL, '>'
        JNE     Estado2
        JMP     Estado1
EliminaTags     ENDP

EscribeLinea2    PROC
        MOV     AH, 40h ; Servicio para escribir
        LEA     DX, Linea2      ; Buffer del que se toma lo que escribo
        MOV     BX, HandleDestino       ; Donde escribo...
        INT     21h     ; Escribe!!!
        RET             ; ya acabe
EscribeLinea2    ENDP

;
; PROCEDIMIENTOS DE APOYO: NO SE PIDIERON EN EL EXAMEN
;

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
