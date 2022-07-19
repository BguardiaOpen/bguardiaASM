; Rutina para sacar raiz cuadrada
.model small
.stack 100h
.data

SIZE_BUFFER     EQU     32
BACK_SPACE      EQU     8
KEY_ENTER       EQU     13

Temporal        DB      17 DUP(?)
Salto           DB      13, 10, '$'
Valores         DW      10000, 1000, 100, 10
Buffer          DB      SIZE_BUFFER DUP (?)
Longitud        DW      0
Tecla           DB      0

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
;        POP     DX
        POP     AX
        POP     BX
        POP     CX
        POP     SI
        RET
ConvierteDecimal ENDP

; Rutina que convierte a decimal el valor recibido en AX, lo coloca en
; el buffer apuntado por DS:DX y lo imprime
ImprimeDecimal  PROC NEAR
        CALL    ConvierteDecimal
        PUSH    AX
        MOV     AH, 9
        INT     21h
        POP     AX
        RET
ImprimeDecimal  ENDP

; Rutina que salta una linea
SaltaLinea     PROC NEAR
        PUSH    DX
        PUSH    AX
        LEA     DX, Salto
        MOV     AH, 9
        INT     21h
        POP     AX
        POP     DX
        RET
SaltaLinea     ENDP


Raiz    PROC
        MOV     BX, AX
        MOV     CX, 0
Ciclo:
        MOV     AL, CL
        MUL     CL
        CMP     AX, BX
        JA      FinRaiz
        INC     CL
        CMP     CL, 255
        JNE     Ciclo
FinRaiz:
        DEC     CL
        ; En CL queda el valor de la raiz
        RET
Raiz    ENDP

Inicio:
        MOV     AX, @data
        MOV     DS, AX
        MOV     AX, 225
        CALL    Raiz
        MOV     AL, CL
        XOR     AH, AH
        CALL    ImprimeDecimal
        MOV     AH, 4Ch
        INT     21h
        END     Inicio
