.model small
.stack 100h
.data
XC      DW      ?       
YC      DW      ?       
RADIO   DW      ?
D       DW      0

.code
MAIN    PROC
        MOV     AX, @data
        MOV     DS, AX
        MOV     AH, 0
        MOV     AL, 13h
        INT     10h
        MOV     XC, 100
        MOV     YC, 100
        MOV     RADIO, 50
        CALL    CIRCULO
        MOV     AH, 1
        INT     21h
        MOV     AH, 0
        MOV     AL, 3
        INT     10h
        MOV     AX, 4C00h
        INT     21h
MAIN    ENDP

CIRCULO PROC
        MOV     AX, 0A000h
        MOV     ES, AX
        ; CX sera X, DX sera Y
        XOR     CX, CX
        MOV     DX, RADIO
        MOV     AX, DX
        ADD     AX, YC
        MOV     BX, 320
        MUL     BX
        ADD     AX, XC
        ; AX contiene el desplazamiento
        MOV     DI, AX
        ; A partir de aqui, AX contiene a D = (1 - RADIO) * 2
        MOV     AX, 1
        SUB     AX, RADIO
        MOV     BX, 2
        IMUL    BX
        MOV     DX, RADIO
Ciclo:
        CMP     DX, CX  ; Y > X ?
        JNG     FinCirculo
        MOV     BYTE PTR [ES:DI], 0Fh      ; Color blanco
        MOV     BX, AX  ; Toma D
        ADD     BX, DX  ; Sumale Y
        CMP     BX, 0           ; D + Y > 0?
        JLE     Compara2        ; No mayor, brinca
        DEC     DX      ; Decrementa Y
        SUB     DI, 320
        SUB     AX, DX  ; D = D - 2 * Y + 1
        SUB     AX, DX
        INC     AX
Compara2:       ; X > D?
        CMP     CX, AX
        JLE     Ciclo
        INC     CX      ; Incrementa X
        INC     DI
        ADD     AX, CX  ; D = D + 2 * X + 1
        ADD     AX, CX
        INC     AX
        JMP     Ciclo
FinCirculo:
        RET
CIRCULO ENDP

        END     MAIN
