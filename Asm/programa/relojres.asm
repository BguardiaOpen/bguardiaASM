; Programa de reloj residente
; Bruno Guardia Robles. 

.MODEL TINY ; .COM
; Se ensambla con TASM RELOJRES
;		TLINK RELOJRES /t = COM (ver TLINK para ayuda)

.CODE

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

         ORG   100h
Start:   JMP Inicializa

; Variables
Horas    DB    ?
Minutos  DB    ?
Segundos DB    ?
PMFlag   DB    0
DivHi    DW    0
DivLo    DW    0
ResultHi DW    0
ResultLo DW    0
Actual   DB    0
Divisor  DB    0
Contador DB    0

LeeReloj Proc  Near
         ; Regresa en DX:AX el valor actual del reloj contador interno de BIOS.
         PUSH  ES
         MOV   AX,40h
         MOV   ES,AX
         MOV   DI,6Ch
         MOV   AX,ES:[DI]
         PUSH  AX
         ADD   DI,2
         MOV   AX,ES:[DI]
         POP   DX
         POP   ES
         RET
LeeReloj EndP

DobleDiv Proc Near
         ; Hace una división de Doble Palabra entre Byte dejando Doble Palabra
	; Rutina para estar orgulloso, fue latosa y está basada en corrimientos, tal
	; como se divide binario a mano.
         XOR  AX,AX
         MOV  Actual,AL
         MOV  ResultLo,AX
         MOV  ResultHi,AX
         MOV  CX,33 ; 32 ciclos
Ciclo:   MOV  AL,Actual
         CMP  AL,Divisor
         PUSHF
         JB   NoCarry
         STC  ; Encender el Carry si es mayor o igual
         JMP  SHORT Rotar
NoCarry: CLC  ; Apagar el Carry
Rotar:   RCL  ResultLo,1
         RCL  ResultHi,1
         POPF
         JB   ContCiclos
         ; Si Actual es menor al Divisor, restar Divisor al Actual
         SUB  AL,Divisor
         MOV  Actual,AL
ContCiclos:
         ; Rotar el dividendo
         ROL  DivLo,1
         RCL  DivHi,1
         ; El bit m s significativo entra a Actual
         RCL  Actual,1
         LOOP Ciclo
         ; En Actual qued¢ el residuo
         RET
DobleDiv EndP

; Calcular la hora en base al valor del contador de reloj de BIOS

Calcula2 Proc Near
         ; Primero multiplicar DX:AX por 5
         XCHG  AX,DX
         PUSH  DX
         PUSH  AX
         PUSH  DX
         PUSH  AX
         ROL   AX,1
         RCL   DX,1
         ROL   AX,1
         RCL   DX,1
         POP   BX
         POP   CX
         ADD   AX,BX
         ADC   DX,CX
         ; Ahora, dividir DX:AX entre 91
         MOV   DivHi,DX
         MOV   DivLo,AX
         MOV   Divisor,91
         CALL  DobleDiv
         ; Calcular el factor de correcci¢n como Ciclos/50269
         ; Aproximadamente cada 50000 ciclos se adelanta un segundo
         ; Las pruebas que hice dan resultados entre 50200 y 50300
         ; Como factor promedio usar‚ 50260
         ; Con esto el error se reduce a 1 segundo, 1 segundo y medio
         ; El factor es m s exacto por la noche, mientras que el
         ; c lculo de Ciclos*5/91 es m s exacto temprano, lo que los
         ; equilibra bastante.
         POP   AX
         POP   DX
         MOV   CX,50260
         DIV   CX
         MOV   BX,AX
         ; Sacar el resultado de la doble divisi¢n
         MOV   DX,ResultHi
         MOV   AX,ResultLo
         CLC
         SUB   AX,BX ; Restar factor de correcci¢n
         SBB   DX,0
         ; Dividir entre 60 para obtener minutos y segundos.
         MOV   CX,60
         DIV   CX
         MOV   Segundos,DL
         DIV   CL
         MOV   Minutos,AH
         MOV   Horas,AL
         ; Establecer la bandera de AM/PM
         MOV   PMFlag,0
         CMP   Horas,12
         JL    FinCalcula
         INC   PMFlag
         CMP   Horas,12
         JE    FinCalcula
         SUB   Horas,12
FinCalcula:
         RET
Calcula2 EndP

; Pintar el valor de dos dígitos en la posición actual ES:DI
DespByte Proc Near
         MOV  CL,10
         XOR  AH,AH
         DIV  CL
         ADD  AX,3030h
         MOV  BL,AH
         MOV  AH,31 ; Blanco sobre azul
         MOV  ES:[DI],AX
         ADD  DI,2
         MOV  AL,BL
         MOV  ES:[DI],AX
         ADD  DI,2
         RET
DespByte EndP

; Pintar el reloj por acceso directo a memoria
Despliega Proc  Near
         PUSH   ES
         MOV    AX,0B800h
         MOV    ES,AX
         MOV    DI,138  ; Columna 80-11 de ancho=69*2 bytes c/columna=138
         MOV    AL,Horas
         CALL   DespByte
         MOV    AL,':'
         MOV    ES:[DI],AX
         ADD    DI,2
         MOV    AL,Minutos
         CALL   DespByte
         MOV    AL,':'
         MOV    ES:[DI],AX
         ADD    DI,2
         MOV    AL,Segundos
         CALL   DespByte
         MOV    AL,' '
         MOV    ES:[DI],AX
         ADD    DI,2
         MOV    AL,'a'
         CMP    PMFlag,1
         JNE    ImpAMPM
         MOV    AL,'p'
ImpAMPM: MOV    ES:[DI],AX
         ADD    DI,2
         MOV    AL,'m'
         MOV    ES:[DI],AX
         POP    ES
         RET
Despliega EndP

; Rutina residente!!!
; Podría ser PROC

Inicio:  PUSHA	; Guardar todos los registros
         PUSHF	; y además las banderas
         CALL  LeeReloj
         CALL  Calcula2
         CALL  Despliega
Salir:   POPF	; Restaurar banderas
         POPA	; y registros
         IRET	; Terminar rutina de interrupción; esto solamente porque es la
		; interrupción 1Ch, que no tiene una función predefinida. Si fuera
		; otra, habría que saltar a la rutina que anteriormente atendía la
		; interrupción

; Parte no residente del programa; debe ponerse al final, para que se use la
; Interrupción 27h

Inicializa:
	; Ajustar DS
         PUSH  DS
         PUSH  CS
         POP   DS
         PUSH  ES
	; Apuntar ES al segmento 0
         XOR   AX,AX
         MOV   ES,AX
	; Muy importante: Desactivar Interrupciones cuando vamos a ajustar el vector
         CLI
         LEA   BX,Inicio
         MOV   AX,CS
	; Ajustar el vector de interrupción del Reloj: en BX el desplazamiento de la
	; rutina que atiende al reloj, en AX el segmento.
         MOV   ES:[1Ch*4],BX
         MOV   ES:[1Ch*4+2],AX
         STI
	; Restaurar ES
         POP   ES
	; DS:DX apuntan al final de la zona que va a quedar residente
         LEA   DX,Inicializa
         INT   27h	; Terminar pero dejar parte residente
         END Start
