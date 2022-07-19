;
; Programa de ejemplo que muestra el uso de la l¡nea de comandos,
; as¡ como del bloque de ambiente
;

.model small
.stack  100h
.data
Environment     EQU     002Ch
Mensaje1        DB      13, 10, "Recibo la l¡nea de comandos: ", 13, 10, '$'
Mensaje2        DB      13, 10, "El bloque de ambiente es: ", 13, 10, '$'
Mensaje3        DB      13, 10, "Par metro $"
.code
Inicio  PROC
        ; Inicializar el segmento de datos, normalmente
        mov     ax, @data
        mov     ds, ax
        ; Obtener el PSP
        mov     ah, 62h
        int     21h
        mov     es, bx  ; Apunta ES al PSP
        ; Mensaje 1
        LEA     DX, Mensaje1
        MOV     AH, 9
        INT     21h
        ; Recorrer la cadena de la l¡nea de comandos
        mov     si, 80h
        mov     cl, [es:si]
        xor     ch, ch
        ; Ciclo
        jcxz    FinCiclo
        mov     ah, 2h
Ciclo:  inc     si
        mov     dl, [es:si]
        int     21h
        loop    Ciclo
FinCiclo:
        ; Segunda parte: mostrar la l¡nea de comandos, separada
        ; por palabras (espacios y/o tabs)

        mov     si, 80h
        mov     cl, [es:si]
        xor     ch, ch
        ; Ciclo
        jcxz    FinParametros
        MOV     CL, '0'
        INC     SI
        ; Mensaje indicando qu‚ par metro va
CicloParametro:
        LEA     DX, Mensaje3
        MOV     AH, 9
        INT     21h
        MOV     DL, CL
        MOV     AH, 2
        INT     21h
        ; en la siguiente l¡nea
        MOV     DL, 13
        INT     21h
        MOV     DL, 10
        INT     21h
        ; Imprimir el par metro, hasta encontrar un espacio
EstadoEspacio:
        MOV     DL, [ES:SI]
        INC     SI
        CMP     DL, ' ' ; Mientras sea espacio, ignorar
        JE      EstadoEspacio
        CMP     DL, 9 ; Mientras sea tabulador, ignorar
        JE      EstadoEspacio
        CMP     DL, 13
        JE      FinParametros
        ; Imprimir el caracter
        INT     21h
EstadoNoEspacio:
        MOV     DL, [ES:SI]
        INC     SI
        CMP     DL, ' ' ; si es espacio
        JE      SiguienteParametro
        CMP     DL, 9 ; si es tabulador
        JE      SiguienteParametro
        CMP     DL, 13
        JE      FinParametros
        INT     21h
        JMP     EstadoNoEspacio
SiguienteParametro:
        INC     CL
        JMP     CicloParametro
FinParametros:
        ; Mensaje para indicar el bloque de variables de ambiente
        LEA     DX, Mensaje2
        MOV     AH, 9
        INT     21h
        ; Ver el Environment block
        mov     bx, [es:Environment]
        mov     es, bx
        ; Es un bloque que puede variar en tama¤o, se muestra aqu¡
        mov     si, 0
        mov     ah, 2h
        MOV     CX, 0
Ciclo2: mov     dl, [es:si]
        CMP     DL, 0
        JE      FinEnvironment
SigueEnvironment:
        int     21h
        inc     si
        loop    Ciclo2
FinEnvironment:
        INC     SI
        MOV     DL, [es:si]
        CMP     DL, 0
        JE      Fin
        ; Saltar l¡nea entre cada variable de ambiente
        PUSH    DX
        MOV     DL, 13
        INT     21h
        MOV     DL, 10
        INT     21h
        POP     DX
        JMP     SigueEnvironment
Fin:
        ; Fin de programa
        mov     ah, 4ch
        int     21h
Inicio  ENDP

        end     Inicio

