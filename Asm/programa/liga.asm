;
; Programa para mostrar como ligar Ensamblador con C
;

;
; Rutinas en ensamblador para dibujar formas triviales en modo 13h
;

; 
; Debe ensamblarse con distinci¢n entre may£sculas y min£sculas:
;
;       TASM liga /ml
;

.model small
.stack 100h
.data
.code

; 
; Procedimientos que ser n p£blicos (podr n usarse desde C)
;
PUBLIC  _IniciaGraficos, _TerminaGraficos, _DibujaLineaHoriz

; Prototipo en C:
; void IniciaGraficos(void);
; 
; No requiere par metros, no regresa un resultado, lo £nico que requiere es
; iniciar el s¡mbolo con Underscore (subgui¢n) y hacerlo p£blico
;
_IniciaGraficos  PROC
        ; 
        ; Ajustar el modo 13h de video
        ;
        MOV     AH, 0
        MOV     AL, 13h
        INT     10h
        RET
_IniciaGraficos  ENDP

; Prototipo en C:
; void TerminaGraficos(void);
;
_TerminaGraficos  PROC
        ; 
        ; Ajustar el modo 3 de video
        ;
        MOV     AH, 0
        MOV     AL, 3
        INT     10h
        RET
_TerminaGraficos  ENDP

; Prototipo en C:
; void DibujaLineaHoriz( int X1, int X2, int Y, int Color );
; 
; Como usa par metros, se tiene que hacer el manejo de la pila
;
_DibujaLineaHoriz  PROC
        ; Ajustar contexto de pila
        PUSH    BP
        MOV     BP, SP
        ; Primero, checar cual X es menor

        MOV     CX, [BP+4]      ; X1 est  en ese lugar de la pila
        MOV     SI, [BP+6]      ; Y en esta X2

        CMP     CX, SI          ; X1 es menor a X2?
        JBE     Ok
        ; Est n al rev‚s de lo que nos conviene. As¡ que ahora CX y BX se
        ; invierten
        XCHG    CX, SI

Ok:     ; Ciclo, del menor al mayor:
        ; Pintar punto
        MOV     BH, 0           ; P gina
        MOV     DX, [BP+8]      ; Y1 en [bp+8], 3er. par metro

CicloPinta:                     ; Est  aqu¡ por el problema de las IBM
        MOV     AL, [BP+10]     ; Color en esa posici¢n, 4o. par metro
        MOV     AH, 0Ch ; Servicio
        INT     10h

        INC     CX
        CMP     CX, SI
        JNE     CicloPinta

        ; Dejar la pila como al principio
        POP     BP
        RET
_DibujaLineaHoriz  ENDP

        END
