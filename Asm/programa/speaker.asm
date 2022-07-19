;
; Programa de Ejemplo en Ensamblador para ligar con C.
; Objetivo: Librer¡a para manejo del Speaker
; ADVERTENCIA: est  hecho para ligarse con un programa en modelo SMALL
; Autor: Bruno Guardia Robles, 30/11/96
;

.model small
.stack 100h
.data
HoraEspera      DB      ?
MinutoEspera    DB      ?
SegundoEspera   DB      ?
CentesimaEspera DB      ?

.code

; Muy importante: funciones que puede llamar C
PUBLIC  _ActivaSpeaker, _DesactivaSpeaker, _SuenaSpeaker, _AjustaSpeaker
PUBLIC  _PlaySpeaker

;
; Prototipo: void ActivaSpeaker(void);
; Funci¢n: Enciende el Speaker y empieza a sonar, hasta que el programador
;          lo apague expl¡citamente
;

_ActivaSpeaker  PROC
        ; Como no recibe par metros, no necesitamos hacer el protocolo de
        ; uso de la pila
        IN      AL, 61h
        OR      AL, 11B
        OUT     61h, AL
        ; Como no regresa resultado, no importa lo que quede en AX/AL
        RET
_ActivaSpeaker  ENDP

;
; Prototipo: void DesactivaSpeaker(void);
; Funci¢n: Apaga el Speaker
;

_DesactivaSpeaker  PROC
        ; Como no recibe par metros, no necesitamos hacer el protocolo de
        ; uso de la pila
        IN      AL, 61h
        AND     AL, 11111100b
        OUT     61h, AL
        ; Como no regresa resultado, no importa lo que quede en AX/AL
        RET
_DesactivaSpeaker  ENDP

;
; Prototipo: void SuenaSpeaker(unsigned short CentesimasSegundo);
; Funci¢n: Activa el Speaker, espera tantas Cent‚simas de Segundo como se le 
;          indique (hasta 65535, aproximadamente 655 segundos= 10 minutos), 
;          y entonces lo apaga. 
;          Puede decirse que es b sicamente un BEEP con control de duraci¢n
;

_SuenaSpeaker  PROC
        PUSH    BP      ; Protocolo necesario para ver los par metros
        MOV     BP, SP  ; a trav‚s de BP
        CALL    _ActivaSpeaker
        ; Obtener la hora actual
        MOV     AH, 2Ch
        INT     21h
        ; En CH la hora, CL el minuto, DH el segundo y DL las cent‚simas
        ; Calcular la hora final
        ; Primero las centesimas
        MOV     AX, [BP+4]
        ADD     AL, DL
        ADC     AH, 0
        ; Ahora, dejar solo cent‚simas y sumar segundos: dividir entre 100,
        ; como hay riesgo de desbordamiento, extiendo a Double Word. 
        PUSH    DX      ; Conservar el segundo original
        XOR     DX, DX  ; Limpiar la parte alta p/dividir.
        MOV     BX, 100
        DIV     BX      ; DX:AX / 100, queda en AX el resultado = #Segundos,
                        ; en DX el residuo = #Centesimas que sobran
        ; Guardar centesimas
        MOV     CentesimaEspera, DL     ; Sabemos que va de 0 a 99
        POP     DX
        ; Calcular los segundos de destino
        MOV     DL, DH          ; Pasar los segundos a la parte baja
        XOR     DH, DH          ; y limpiar la alta
        ADD     AX, DX          ; Cu ntos segundos tendremos?
        ; Ahora, sacar minutos y segundos.
        MOV     BL, 60
        DIV     BL              ; AX / 60
        ; Los segundos quedan en AH = residuo
        MOV     SegundoEspera, AH
        ; En AL, los minutos que representa el sobrante.
        ADD     AL, CL          ; Nuevos minutos: los hasta 10 que espera,
                                ; m s la hora actual
        XOR     AH, AH          ; Por si pasa de 60, para dividir
        MOV     BL, 60
        DIV     BL
        ; En AH los minutos, en AL las horas...
        MOV     MinutoEspera, AH
        ADD     CH, AL          ; Nuevas horas
        ; Lo £nico que queda es validar que no hayamos usado el servicio
        ; despu‚s de las 11:50 PM, y que las horas nos dieran 24...
        CMP     CH, 24
        JB      Final
        SUB     CH, 24          ; Dar la vuelta
Final:  MOV     HoraEspera, CH
Ciclo:  NOP                     ; Solamente perder tiempo
        ; Obtener la hora actual
        MOV     AH, 2Ch
        INT     21h
        ; En CH la hora, CL el minuto, DH el segundo y DL las cent‚simas
        ; Comparar hora actual con estimada
        CMP     DL, CentesimaEspera
        JB      Ciclo
        CMP     DH, SegundoEspera           ; Aqui no use "JB", pues seguro
                                            ; el procedimiento debe ser
                                            ; exacto por la velocidad de
                                            ; la m quina
        JNE     Ciclo
        CMP     CL, MinutoEspera
        JNE     Ciclo
        CMP     CH, HoraEspera
        JNE     Ciclo
        ; Ya pas¢ el tiempo
        CALL    _DesactivaSpeaker
        POP     BP      ; Deja la pila como al inicio (balancea)
        RET
_SuenaSpeaker  ENDP

;
; Prototipo: void AjustaSpeaker(unsigned short Frecuencia);
; Funci¢n: Ajusta la frecuencia; se espera que la pasen en Hertzios, y hace
;          el c lculo necesario. El unsigned short cubre el alcance del o¡do
;          humano, que est  m s o menos entre 16 hertzios (muy grave) hasta
;          20000 (muy agudo).
;

_AjustaSpeaker  PROC
        PUSH    BP
        MOV     BP, SP
        MOV     DX, 18      ; 1.193 Mhz. hay que codificarlo 
        MOV     AX, 13353   ; en 32 bits; se divide entre 65536 y residuo.
        ; Lo dividimos entre la frecuencia
        MOV     BX, [BP + 4]
        DIV     BX
        ; En AX queda el factor que hay que colocar a trav‚s del puerto 42h.
        MOV     BX, AX  ; Respaldar
        MOV     AL, 0B6h
        OUT     43h, AL
        MOV     AX, BX  ; Restaurar
        ; Poner la frecuencia en el Timer
        OUT     42h, AL ; Byte Bajo
        MOV     AL, AH
        OUT     42h, AL
        POP     BP
        RET
_AjustaSpeaker  ENDP

;
; Prototipo: void PlaySpeaker(unsigned short Frecuencia, 
;               unsigned short CentesimasSegundo);
; Funci¢n: Combina las dos anteriores, y toca un sonido con la frecuencia
;               indicada durante el tiempo indicado
;
_PlaySpeaker  PROC      
        ; Antes de alterar la pila, para aprovecharla, llamar a AjustaSpeaker
        CALL    _AjustaSpeaker
        PUSH    BP
        MOV     BP, SP
        MOV     AX, [BP+6]      ; Segundo parametro
        PUSH    AX
        CALL    _SuenaSpeaker
        POP     AX      ; Dejar la pila como al principio
        POP     BP
        RET
_PlaySpeaker  ENDP


        END     ; Para cuando ya no quiero usar el procedimiento para probar
                ; funciones

; Para prueba
Principal       PROC
        MOV     AX, @data
        MOV     DS, AX
        ; T‚cnica mala: con contador depende de la velocidad de la m quina
        ; En una m quina muy r pida, apenas si se oye.
        MOV     CX, 5   ; Mandar 5 veces
CicloExt:
        PUSH    CX
        CALL    _ActivaSpeaker
        MOV     CX, 0
CicloPpal:
        LOOP    CicloPpal
        CALL    _DesactivaSpeaker
        MOV     CX, 0
CicloPpal2:
        LOOP    CicloPpal2
        POP     CX
        LOOP    CicloExt
        ;
        ; Esperar una tecla
        ;
        MOV     AH, 1
        INT     21h
        ; T‚cnica mejor: con SuenaSpeaker
        MOV     AX, 30  ; Sonido muy grave
        PUSH    AX
        CALL    _AjustaSpeaker
        MOV     AX, 100  ; 1 Segundo
        PUSH    AX
        CALL    _SuenaSpeaker
        ; T‚cnica mejor: con SuenaSpeaker
        MOV     AX, 1000  ; Sonido normal de BEEP
        PUSH    AX
        CALL    _AjustaSpeaker
        MOV     AX, 100  ; 1 Segundo
        PUSH    AX
        CALL    _SuenaSpeaker
        MOV     AX, 10000  ; Sonido muy agudo
        PUSH    AX
        CALL    _AjustaSpeaker
        MOV     AX, 100  ; 1 Segundo
        PUSH    AX
        CALL    _SuenaSpeaker
        MOV     AX, 4C00h
        INT     21h
Principal       ENDP

        END Principal
