; RESIDE.ASM: Pequeño programa residente
; Se ejecuta, y cuando se presiona Ctrl + N invierte los colores de fondo y frente
; en toda la pantalla, usando la memoria de video para modificar el atributo.
;

PushA Macro
      PUSH AX
      PUSH BX
      PUSH CX
      PUSH DX
      PUSH SI
      PUSH DI
      PUSH DS
      PUSH ES
      EndM
POPA  Macro
      POP ES
      POP DS
      POP DI
      POP SI
      POP DX
      POP CX
      POP BX
      POP AX
      EndM

; Buffer del teclado de BIOS

BiosData Segment AT 40h
         ORG 1Ah
Head     DW ?
Tail     DW ?
Buffer   DW 16 DUP (?)
Buffer_End  Label Word
BiosData EndS

; Segmento de código

Code Segment
Assume CS:Code
Assume DS:Code
Assume SS:Code
Assume ES:Code
       ORG 100h
Start:
    JMP   Inicio

; Variables

OldInt Label Word
DirAnt 		DD	?

BanderaLleno 	DB 0

; Rutina de atención de Interrupción

ParteRes Proc Near
    Assume CS:Code,DS:Code
    PushA
    PushF
    CALL  CS:DirAnt		; IMPORTANTE: Es una llamada FAR a la rutina que
				; anteriormente atendía al teclado; es necesaria,
				; pues esa rutina se encarga de manejar el buffer
				; de teclado y yo lo voy a usar. Otros programas 
				; posiblemente en vez de CALL hagan un 
				; JMP FAR [CS:DirAnt]
				; DESPUÉS de realizar su función
    ASSUME DS:BiosData
    MOV   BX,BiosData
    MOV   DS,BX
    MOV   BX,Tail
    CMP   BX,Head
    JE    Fin
    CALL  ChecaTecla
    CMP   AX,310Eh ; ^N
    JNE   Fin
    MOV   Tail,BX
    ; Invertir color de pantalla
    MOV   CX,2000
    MOV   AX,0B800h
    MOV   ES,AX
    MOV   DI,0
Ciclo:
    MOV   AX,ES:[DI]
    XOR   AH,07Fh  ; Invierte atributo, todos los bits correspondientes a colores
    MOV   ES:[DI],AX
    INC   DI
    INC   DI
    LOOP  Ciclo
Fin:PopA
    IRET
ParteRes EndP

ChecaTecla Proc Near
    MOV   DX,Tail
    SUB   DX,2
    CMP   DX,OFFSET Buffer
    JAE   OK
    MOV   DX,OFFSET Buffer_End
    SUB   DX,2
OK: MOV   BX,DX
    MOV   AX,[BX]
    RET
ChecaTecla EndP

Inicio:
    PUSH   DS
    PUSH   CS
    POP    DS
    CLI
    PUSH   ES
    XOR    AX,AX
    MOV    ES,AX
    MOV    DI,36 ; 9*4	; Pues estamos interceptando la interrupción 9 (reloj)
    LEA    BX,ParteRes
    MOV    AX,ES:[DI]
    MOV    OldInt,AX
    MOV    ES:[DI],BX
    MOV    AX,ES:[DI+2]
    MOV    OldInt+2,AX
    MOV    ES:[DI+2],DS
    POP    ES
    STI
    LEA    DX,Fin2
    INT    27h
    RET
Fin2:
Code EndS
END Start
