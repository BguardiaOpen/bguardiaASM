; Programa ejemplo: CLS - Limpia pantalla de texto
; Segunda version, optimizada en el ADD
.model small
.stack 100h
.data
Pantalla        EQU     0B800h
Espacio         EQU     ' '
.code
Inicio:
        ; Poner el apuntador ES:DI al segmento de pantalla
        MOV     AX, Pantalla
        MOV     ES, AX
        XOR     DI, DI          ; Pone DI = 0 (desplazamiento)
        MOV     CX, 2000        ; 2000 caracteres en la pantalla
        MOV     AL, Espacio
Ciclo:
        MOV     ES:[DI], AL
        INC     DI
        INC     DI
        DEC     CX
        CMP     CX, 0
        JNE     Ciclo
        ; Terminar el programa
        MOV     AH, 4Ch
        INT     21h
        END     Inicio
