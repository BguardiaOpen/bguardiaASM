;
; Resoluci¢n del Proyecto 1
; Bruno Guardia Robles
;
.model small
.stack 100h

.data
MensajeBien     DB      'La memoria est  correcta$'
MensajeMal      DB      'La memoria tiene un problema. Programa interrumpido.$'
SegmentoSaltar  DW      ?
DesplazamientoSaltar    DW      ?
TamanoPrograma          DW      ?

.code
        ;
        ; Inicializar el segmento de datos
        ;
        MOV     AX, @data
        MOV     DS, AX
        ; 
        ; L¢gica para validar que no sobreescribamos el programa
        ;
        MOV     AX, CS
        ;
        ; Dividir el valor de AX para tener el segmento tal como lo
        ; usar  la l¢gica de mi programa
        ;
        MOV     BX, AX
        AND     AX, 0F000h
        MOV     SegmentoSaltar, AX
        AND     BX, 00FFFh
        SHL     BX, 1
        SHL     BX, 1
        SHL     BX, 1
        SHL     BX, 1
        MOV     DesplazamientoSaltar, BX
        ;
        ;
        ; L¢gica del programa: primero inicializamos ES y DI para que
        ; apunten a la direcci¢n F¡sica 00400h
        ;
        ; Para esto, necesitamos poner ES en 0 y DI en 400h
        ;
        MOV     AX, 0
        MOV     ES, AX  ; Pongo ES en 0, tengo que hacerlo a trav‚s de AX
                        ; Los registros de segmento no soportan el modo
                        ; inmediato.
        ; Ahora, DI en 400h
        MOV     DI, 0400h
        ;
        ; Ciclo interno: recorrer dentro del mismo segmento,
        ; para lo cual iremos incrementando DI hasta llegar a 0, despu‚s
        ; de dar la vuelta. (Despu‚s de llegar a FFFF, cuando incremente
        ; llegar‚ a 0)
        ;

Ciclo:
        ;
        ; Validaci¢n
        ;
        ; Checar si el segmento se va a saltar
        ;
        MOV     AX, ES
        CMP     AX, SegmentoSaltar

        JNE     NoHayProblema
        CMP     DI, DesplazamientoSaltar
        JNE     NoHayProblema
        ;
        ; Aqu¡ s¡ hay problema, as¡ que saltemos
        ;
        ADD     DI, 01E0h       ; Lo que calculamos que ocupan todos los
                                ; segmentos de mi programa, ayudados por
                                ; el Turbo Debugger
NoHayProblema:
        ;
        ; Ya tenemos apuntada la localidad que queremos checar, por medio
        ; del segmento ES y el desplazamiento DI. Ahora, guardemos su
        ; contenido temporalmente
        ;
        MOV     BL, [ES:DI]     ; !Entre corchetes! porque es el contenido
                                ; indicado por el apuntador.
        ; En BL queda para recuperarlo despu‚s
        ;
        ; Probar que se escriba un 0 bien en la memoria
        ;
        MOV     BYTE PTR [ES:DI], 0     ; Tengo que poner byte ptr, para
                                        ; indicar que solo accese un byte
        CMP     BYTE PTR [ES:DI], 0     ; Checar que haya quedado un 0 en
                                        ; memoria
        JNE     Error                   ; Si no fue igual, la memoria est 
                                        ; mal!!!
        ;
        ; Probar que se escriban 1s bien en la memoria
        ;
        MOV     BYTE PTR [ES:DI], 0FFh  ; Tengo que poner byte ptr, para
                                        ; indicar que solo accese un byte
        CMP     BYTE PTR [ES:DI], 0FFh  ; Checar que haya quedado un 0 en
                                        ; memoria
        JNE     Error                   ; Si no fue igual, la memoria est 
                                        ; mal!!!
        ; Restaurar lo que estaba
        MOV     [ES:DI], BL

        ;
        ; Todo bien hasta ahora, esta localidad de memoria est  bien, ahora
        ; chequemos la siguiente
        ;
        INC     DI

        ; No necesito hacer comparaci¢n, uso la bandera de 0 resultado del
        ; incremento.

        JNZ     Ciclo

        ; Ya chequ‚ un segmento, ahora voy por el que sigue.
        ; La siguiente direcci¢n es 10000h bytes m s adelante, luego el
        ; segmento se tiene que mover de 1000h en 1000h, por la f¢rmula
        ; DF = S * 10h + D

        MOV     BX, ES  ; No puedo sumarle directo al segmento
        ADD     BX, 1000h       ; Pero s¡ al registro de prop¢sito general
        MOV     ES, BX  ; que se usa como intermediario

        CMP     BX, 0A000h      ; Ya acabamos de recorrer la memoria asignada
                                ; para el usuario = 640 Kb.???
        JNE     Ciclo           ; Si no es igual, regresar
        ;
        ; Si todo lleg¢ hasta aqu¡, mandar mensaje de ‚xito
        ;
        MOV     AH, 9
        MOV     DX, OFFSET MensajeBien
        INT     21h
        ;
        ; Terminar el programa
        ;
        MOV     AH, 4Ch
        INT     21h
Error:
        MOV     AH, 9
        MOV     DX, OFFSET MensajeMal
        INT     21h
        ;
        ; Terminar el programa
        ;
        MOV     AH, 4Ch
        INT     21h
        END
