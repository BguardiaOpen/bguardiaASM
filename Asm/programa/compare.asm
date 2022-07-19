.model small
.stack 100h
.data
Valores DW      10000, 1000, 100, 10, 1
Nombre1 DB      128 DUP (?)
Nombre2 DB      128 DUP (?)

File1   DW      ?
File2   DW      ?

Buffer  DB      6 DUP(?)

Temporal1       DB      ?
Temporal2       DB      ?

Resultado       DB      0       ; Valor Default: son iguales

LetreroError    DB      'Uso: COMPARE <archivo1> <archivo2>',13, 10
                DB      '­No se aceptan espacios extras!', 13, 10, '$'
LetreroError1   DB      'No se pudo abrir el archivo '
ContinuaLetrero DB      128 DUP(?), 13, 10, '$'

LetreroDif1     DB      'Diferencia en offset ', '$'
SaltoLinea      DB      13, 10, '$'

LetreroIguales  DB      'Los archivos son iguales o uno es parte de otro'
                DB      13, 10, '$'
LetreroDiferentes DB    'Los archivos son diferentes', 13, 10, '$'

ErrorLectura    DB      'Error leyendo los archivos', 13, 10, '$'

.code

; Rutina que convierte a decimal el valor recibido en AX, y lo coloca en
; el buffer apuntado por DS:DX
ConvierteDecimal PROC NEAR
        ; Inicializacion de la rutina
        PUSH    SI
        PUSH    CX
        PUSH    BX
        PUSH    AX
        ; Inicia la conversion
        MOV     SI, DX
        PUSH    DX
        MOV     CX, 4 
        LEA     BX, Valores
CicloDec:  XOR     DX, DX  ; Pone DX en 0, esta en el ciclo porque DIV cambia DX
        DIV     WORD PTR [BX]
        ADD     AL, 30h
        MOV     [SI], AL        ; BYTE PTR ¡mplicito
        MOV     AX, DX          ; Pasa el residuo de DX a AX
        INC     BX              ; Mueve BX al siguiente Word
        INC     BX
        INC     SI
        LOOP    CicloDec
        ADD     AL, 30h
        MOV     AH, '$' ; Para marcar fin del string
        MOV     [SI], AX
        ; Fin de la rutina
        POP     DX
        POP     AX
        POP     BX
        POP     CX
        POP     SI
        RET
ConvierteDecimal ENDP

UsoPrograma     PROC
        MOV     AH, 9
        LEA     DX, LetreroError
        INT     21h
        ; Terminar programa
        MOV     AH, 4Ch
        INT     21h
UsoPrograma     ENDP

ErrorArchivo1   PROC
        ; Poner el nombre del archivo al final (ya esta apuntado por SI)
        LEA     DI, ContinuaLetrero
        MOV     CX, 128
CicloError1:  
        MOV     AL, [DS:SI]
        CMP     AL, 0
        JE      SalCicloErr1
        MOV     [DS:DI], AL
        INC     SI
        INC     DI
        LOOP    CicloError1
SalCicloErr1:
        ; Pone el salto de linea y fin de String
        MOV     [DS:DI], BYTE PTR 13
        INC     DI
        MOV     [DS:DI], BYTE PTR 10
        INC     DI
        MOV     [DS:DI], BYTE PTR '$'
        MOV     AH, 9
        LEA     DX, LetreroError1
        INT     21h
        ; Terminar programa
        MOV     AH, 4Ch
        INT     21h
ErrorArchivo1   ENDP

TomaParametros  PROC
        ; Obtener el PSP
        MOV     AH, 62h
        INT     21h
        MOV     ES, BX
        MOV     DI, 80h
        LEA     SI, Nombre1
        MOV     CL, [ES:DI]
        XOR     CH, CH
        ; Saltar el espacio al principio
        INC     DI
        MOV     AL, [ES:DI]
        CMP     AL, ' '
        JNE     DemasiadosPar   ; Si no es espacio, marcar error
CicloPar1:
        INC     DI
        MOV     AL, [ES:DI]
        CMP     AL, ' '
        JE      TomaPar2
        MOV     [DS:SI], AL
        INC     SI
        LOOP    CicloPar1
        ; Si llega aqui, saliendo del LOOP, es que no hay m s par metros
        ; Si llega por JMP, es que hay par metros de m s
DemasiadosPar:
        CALL    UsoPrograma
        RET
TomaPar2:
        ; Terminar la cadena del 1er. par metro con 0
        MOV     BYTE PTR [DS:SI], 0
        LEA     SI, Nombre2
CicloPar2:
        INC     DI
        MOV     AL, [ES:DI]
        CMP     AL, ' '
        JE      DemasiadosPar
        CMP     AL, 13  ; Es un ENTER?
        JE      FinParametros
        MOV     [DS:SI], AL
        INC     SI
        LOOP    CicloPar2
        ; Aqui termin¢ con el segundo parametro, y est  todo bien
        ; Terminar la cadena del 2o. par metro con 0
FinParametros:
        MOV     BYTE PTR [DS:SI], 0
        RET
TomaParametros  ENDP

AbreArchivos    PROC
        ; Abrir el primer archivo
        MOV     AH, 3Dh
        MOV     AL, 0
        LEA     DX, Nombre1
        INT     21h
        JNC     AbreSegundo
        LEA     SI, Nombre1
        CALL    ErrorArchivo1
AbreSegundo:
        ; Guardar el Handle del archivo 1
        MOV     File1, AX
        ; Abrir el segundo archivo
        MOV     AH, 3Dh
        MOV     AL, 0
        LEA     DX, Nombre2
        INT     21h
        JNC     TodoBien
        ; Hay que cerrar primero el archivo 1
        MOV     BX, File1
        MOV     AH, 3Eh
        INT     21h
        LEA     SI, Nombre2
        CALL    ErrorArchivo1
TodoBien:
        ; Guardar el Handle del archivo 2
        MOV     File2, AX
        RET
AbreArchivos    ENDP

CierraArchivos  PROC
        MOV     BX, File1
        MOV     AH, 3Eh
        INT     21h
        MOV     BX, File2
        MOV     AH, 3Eh
        INT     21h
        RET
CierraArchivos  ENDP

RecorreComparando       PROC
CicloRecorre:
        ; Lee un byte de cada archivo
        MOV     AH, 3Fh
        MOV     BX, File1
        MOV     CX, 1
        LEA     DX, Temporal1
        INT     21h
        JC      ErrorRecorre      ; error al leer
        CMP     AX, 0
        JE      FinRecorre      ; Si le¡mos 0 bytes, es fin de archivo
        MOV     AH, 3Fh
        MOV     BX, File2
        MOV     CX, 1
        LEA     DX, Temporal2
        INT     21h
        JC      ErrorRecorre      ; error al leer
        CMP     AX, 0
        JE      FinRecorre      ; Si le¡mos 0 bytes, es fin de archivo
        MOV     AL, Temporal1
        CMP     AL, Temporal2
        JE      CicloRecorre
        MOV     Resultado, 1    ; Son diferentes              
        CALL    Diferencia
        JMP     CicloRecorre
FinRecorre:
        RET
ErrorRecorre:
        ; Si se quisiera ser m s espec¡fico, podr¡a tomarse el valor de
        ; AX para determinar que letrero desplegar
        MOV     AH, 9
        LEA     DX, ErrorLectura
        INT     21h
        MOV     AH, 4Ch
        INT     21h
        RET
RecorreComparando       ENDP

Diferencia      PROC
        MOV     AH, 9
        LEA     DX, LetreroDif1
        INT     21h
        ; Imprime la posici¢n actual del archivo
        ; La obtiene en base al SEEK
        ; Est  limitado a archivos de hasta 64K.
        MOV     AH, 42h
        MOV     AL, 1   ; SEEK_CUR
        MOV     BX, File1
        XOR     CX, CX
        XOR     DX, DX
        INT     21h
        ; En AX tenemos el desplazamiento, suponemos DX 0 (archivos < 64K)
        LEA     DX, Buffer
        CALL    ConvierteDecimal
        MOV     AH, 9
        INT     21h
        MOV     AH, 9
        LEA     DX, SaltoLinea
        INT     21h
        RET
Diferencia      ENDP

ImprimeResultado        PROC
        LEA     DX, LetreroIguales
        CMP     Resultado, 1
        JNE     ImprimeIguales
        LEA     DX, LetreroDiferentes
ImprimeIguales:
        MOV     AH, 9
        INT     21h
        RET
ImprimeResultado        ENDP

Inicio:
        ; Inicio del programa
        MOV     AX, @data
        MOV     DS, AX
        CALL    TomaParametros
        CALL    AbreArchivos
        CALL    RecorreComparando
        CALL    CierraArchivos
        CALL    ImprimeResultado
        ; Terminar Programa
        MOV     AH, 4Ch
        INT     21h
        END     Inicio

