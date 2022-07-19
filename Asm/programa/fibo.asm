.model small
.stack 100h
.data
        a    DW  0
        b    DW  0
        c    DW  0
        Temp DW  0
        ZeroIzq DW 0
        Convierte DW 10000,1000,100,10,1
        linefeed DB 13,10,'$'

InicioProg  DB 'Serie de Fibonacci V2.',13,10,'$'
Peticion    DB 'Dame el n£mero de elementos de la serie(1-25): ','$'
Buffer      DB 32,32,'$'
Longitud    DW 0
Tecla       DB 0
FinProg  DB 13,10,'Fin de programa.',13,10,'$'

.code
Inicio: 
        MOV      AX,@Data
        MOV      DS,AX
        MOV      AH,0 ;Borrar Pantalla
        MOV      AL,2
        INT      10h
        MOV      AH,09h
        LEA      DX,InicioProg
        INT      21h
        MOV      AH,09h
        LEA      DX,Peticion
        INT      21h
        CALL     Entrada
        MOV      AH,09h
        LEA      DX,linefeed
        INT      21h
        MOV      a,0
        MOV      b,1
        CMP      CX,0
        JE      Final
        CMP     CX,1
        JE      Final1
        DEC     CX
Ciclo:  MOV     AX,a
        MOV     BX,b
        ADD     AX,BX
        MOV     c,AX
        PUSH    CX
        CALL    PrintA
        POP     CX
        MOV     AX,b
        MOV     a,AX
        MOV     AX,c
        MOV     b,AX
        LOOP    Ciclo     ; Si no se han completado los ciclos indicados
Final1: CALL    PrintA
Final:  MOV     AH,09h
        MOV     DX,OFFSET FinProg
        INT     21h
        MOV     AH,4Ch    ; Terminar programa y volver a DOS
        INT     21h
        RET

Entrada Proc Near
IniEnt: MOV     Longitud,0
        MOV     Buffer,32  ; Pon espacios en el Buffer
        MOV     Buffer+1,32
CicloEnt:
        MOV     AH,02h
        MOV     BH,0
        MOV     DH,1
        MOV     DL,47
        INT     10h    ; Gotoxy
        MOV     AH,09h
        LEA     DX,Buffer
        INT     21h
        MOV     AH,07h  ; Entrada de car cter sin eco en pantalla
        INT     21h
        CMP     AL,39h ; ¨Es mayor que 9?
        JG      CicloEnt
        CMP     AL,0dh ; ¨Es Enter?
        JE      FinEntrada
        CMP     AL,08h ; ¨Es BackSpace?
        JNE     Sigue
        CMP     Longitud,0
        JNE     QuitaCar
        MOV     Buffer,32
        JMP     CicloEnt
QuitaCar:
        LEA     BX,Buffer
        MOV     SI,Longitud
        MOV     DL,32
        MOV     [BX+SI],DL ; Rellena con espacios
        DEC     Longitud
        JMP     CicloEnt
Sigue:  CMP     AL,30h ; ¨Es menor que 0?
        JL      CicloEnt
        CMP     Longitud,2
        JE      CicloEnt
        ; Aqu¡ ya es un n£mero entre 0 y 9, y son solo dos caracteres
        LEA     BX,Buffer
        MOV     SI,Longitud
        MOV     [BX+SI],AL ; Pone la tecla en el Buffer
        INC     Longitud
        JMP     CicloEnt
AyudaSalto:     
        JMP     IniEnt
FinEntrada:
        CMP     Longitud,0
        JE      IniEnt
        ; Convertimos a binario
        CMP     Longitud,1
        JE      ConvierteUno
        MOV     AL,Buffer
        SUB     AL,30h
        MOV     BL,10
        MUL     BL
        CMP     AH,0
        JNE     AyudaSalto
        ADD     AL,Buffer+1
        SUB     AL,30h
        CMP     AL,25
        JG      AyudaSalto
        MOV     CL,AL
        MOV     CH,0
        RET
        
ConvierteUno:
        MOV     AL,Buffer
        SUB     AL,30h
        MOV     CL,AL
        MOV     CH,0
        RET
Entrada EndP

PrintA  Proc Near
        MOV     ZeroIzq,0
        MOV     BX,OFFSET Convierte
        MOV     DI,0
        MOV     AX,a
        MOV     Temp,AX
CicloPrint:
        MOV     AX,Temp
        MOV     DX,0
        MOV     CX,[BX+DI]
        DIV     CX
        MOV     Temp,DX ; Guarda el residuo en Temp
        ADD     AX,48   ; 48=ASCII del 0. En AX est  el resultado de la divisi¢n
        CMP     AL,48   ; ¨Es cero?
        JE      Imprime
        MOV     ZeroIzq,1  ; Si no fue cero,
        ; hay que desactivar la bandera de cero a la izquierda
Imprime:
        CMP     ZeroIzq,0
        JZ      NoImprimir
        MOV     DL,AL   ; En AL est  el c¢digo a imprimir
        MOV     AH,02h  ; Servicio de imprimir caracter
        INT     21h
NoImprimir:
        INC     DI
        INC     DI
        CMP     DI,8
        JL      CicloPrint
        MOV     ZeroIzq,1  ; Para que el £ltimo cero si imprima
        CMP     DI,8
        JE      CicloPrint
; Imprimir tambi‚n el valor en hexadecimal
        MOV     DL,'='  ; Igual a
        MOV     AH,2    ; Imprimir caracter
        INT     21h
        MOV     DL,' '  ; Espacio
        MOV     AH,2    ; Imprimir caracter
        INT     21h
        MOV     BX,a
        MOV     AL,BH   ; Primer d¡gito hexadecimal
        CALL    PrintHexa
        MOV     AL,BL
        CALL    PrintHexa
        MOV     DL,'h'  ; Indica hexadecimal
        MOV     AH,2    ; Imprimir caracter
        INT     21h
        MOV     AH,09h  ; Imprimir salto de l¡nea y return.
        MOV     DX,OFFSET linefeed
        INT     21h
        RET
PrintA  EndP

PrintHexa Proc Near
        PUSH    AX
        AND     AL,240
        SHR     AL,1
        SHR     AL,1
        SHR     AL,1
        SHR     AL,1
        CALL    PrintHexaChar
        POP     AX
        AND     AL,0Fh
        CALL    PrintHexaChar
        RET
PrintHexa EndP

PrintHexaChar Proc Near
        CMP     AL,0Ah
        JGE     Letra
        ADD     AL,30h
        MOV     DL,AL
        MOV     AH,2
        INT     21h
        RET
Letra:  ADD     AL,37h
        MOV     DL,AL
        MOV     AH,2
        INT     21h
        RET
PrintHexaChar EndP

        END     Inicio

