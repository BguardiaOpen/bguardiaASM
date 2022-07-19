.model small
.stack  100h
.data
Temporal        DB      100 DUP(?)
Valores         DW      10000, 1000, 100, 10
.code

; Todas las rutinas en este programa estan dise¤adas para no destruir el
; contenido de los registros.

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
Ciclo:  XOR     DX, DX  ; Pone DX en 0, esta en el ciclo porque DIV cambia DX
        DIV     WORD PTR [BX]
        ADD     AL, 30h
        MOV     [SI], AL        ; BYTE PTR ¡mplicito
        MOV     AX, DX          ; Pasa el residuo de DX a AX
        INC     BX              ; Mueve BX al siguiente Word
        INC     BX
        INC     SI
        LOOP    Ciclo
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

; Rutina que convierte a decimal el valor recibido en AX, y lo coloca en
; el buffer apuntado por DS:DX
ConvierteHexa PROC NEAR
        PUSH    DX
        PUSH    AX
        MOV     SI,DX
        AND     AX,0F000h
        MOV     CL,12
        SHR     AX,CL
        CALL    GuardaHexa
        POP     AX
        PUSH    AX
        AND     AX,0F00h
        MOV     CL,8
        SHR     AX,CL
        CALL    GuardaHexa
        POP     AX
        PUSH    AX
        AND     AX,00F0h
        MOV     CL,4
        SHR     AX,CL
        CALL    GuardaHexa
        POP     AX
        PUSH    AX
        AND     AX,000Fh
        CALL    GuardaHexa
        MOV     BYTE PTR [SI],'$'
        POP     AX
        POP     DX
        RET
ConvierteHexa ENDP

GuardaHexa      PROC
        CMP     AL,10
        JB      EsDigito
        ADD     AL,7
EsDigito:ADD    AL,'0'
        MOV     [SI],AL
        INC     SI
        RET
GuardaHexa      ENDP

; Rutina que convierte a decimal el valor recibido en AX, lo coloca en
; el buffer apuntado por DS:DX y lo imprime
ImprimeDecimal  PROC NEAR
        CALL    ConvierteDecimal
        MOV     AH, 9
        INT     21h
        RET
ImprimeDecimal  ENDP

; Rutina que convierte a hexadecimal el valor recibido en AX, lo coloca en
; el buffer apuntado por DS:DX y lo imprime
ImprimeHexa     PROC NEAR
        CALL    ConvierteHexa
        MOV     AH, 9
        INT     21h
        RET
ImprimeHexa     ENDP

SaltaLinea      PROC
        MOV     AH,2
        MOV     DL,13
        INT     21h
        MOV     DL,10
        INT     21h
        RET
SaltaLinea      ENDP

Inicio:
        MOV     AX, @data
        MOV     DS, AX
        MOV     AX, 2000        ; Numero a convertir
        LEA     DX, Temporal    ;Arreglo de 100 bytes
        CALL    ImprimeDecimal
        CALL    SaltaLinea
        MOV     AX, 2000        ; Numero a convertir
        LEA     DX, Temporal    ;Arreglo de 100 bytes
        CALL    ImprimeHexa
        MOV     AH, 4Ch
        INT     21h
        END Inicio            
