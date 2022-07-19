.model small
.stack 100h
.data
; A de 10 x 10 palabras
A       DW      100
.code
MAIN    PROC
        MOV     AX, @data
        MOV     DS, AX
        MOV     AX, 5
        MOV     BX, 5
        MOV     CX, 10
        LEA     DX, A
        CALL    FIND_IJ
        MOV     AX, 4C00h
        INT     21h
MAIN    ENDP

FIND_IJ PROC
        ; Regresa el offset que corresponde
        DEC     AX
        DEC     BX
        MUL     CX
        ADD     AX, BX
        ADD     AX, DX
        ; Regresa el valor en AX
        RET
FIND_IJ ENDP

        END     MAIN
