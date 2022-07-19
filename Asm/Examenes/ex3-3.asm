; Programa para resolver la pregunta 3 (rescate) del 3er. examen parcial
;
; Macro que cuente el n£mero de palabras en una cadena compleja
;
.model small
.stack 100h
.data
Cadena  DB      'Esta es una cadena compleja(con distintos tipos de separadores)'
        DB      'Debemos aceptar como separadores,varios caracteres, incluyendo'
        DB      'espacios, par‚ntesis (como ‚stos), corchetes[como ‚stos}, y '
        DB      'llaves, ej. {main}', 0

.code

LOCALS
; Esta macro en BX lleva la cuenta
CuentaPalabras  MACRO   DeQueCadena
        LOCAL   CuentaCiclo, FinContar
        ;;
        LEA     SI, DeQueCadena
        MOV     BX, 0
CuentaCiclo:
        LODSB   ;; En AL traemos el caracter
        ;; Casos posibles
        CMP     AL, ' '
        JE      @@Separador
        IRPC    Caso, (){}[]
                CMP     AL, '&Caso&'
                JE      @@Separador
        ENDM
        ;;
        ;; Si no fue ninguno de los anteriores, no es separador
        ;;
        CMP     AL, 0
        JE      FinContar
        JMP SHORT       CuentaCiclo
@@Separador:
        INC     BX      ;; Incrementar la cuenta
@@CicloSeparador:
        LODSB
        ;; Casos posibles de separador repetido
        CMP     AL, ' '
        JE      @@CicloSeparador
        IRPC    Caso, (){}[]
                CMP     AL, '&Caso&'
                JE      @@CicloSeparador
        ENDM
        ;;
        ;; Si no fue ninguno de los anteriores, no es separador
        ;;
        CMP     AL, 0
        JE      FinContar
        JMP SHORT       CuentaCiclo
FinContar:
ENDM    

        ;
        ; Ajustar el segmento de datos
        ;
        MOV     AX, @data
        MOV     DS, AX
        ; 
        ; Llamada a la macro 
        ;
        CuentaPalabras  Cadena
        ;
        ; Terminar con el programa, regresar a DOS
        ;
        MOV     AX, 4C00h
        INT     21h

        END
