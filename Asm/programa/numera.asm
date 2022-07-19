;
; Programa ejemplo: leer un archivo de texto, l¡nea a l¡nea, y generar la
; salida (en este caso, a la salida est ndar, que puedo redireccionar), con
; l¡neas numeradas
; Basado en MITYPE.ASM
;
.model small
.stack 100h
.data

; El Nombre est  fijo para el ejemplo
Nombre  DB      'c:\autoexec.bat', 0

;
Archivo DW      ?

Buffer  DB      ?

; Contador de l¡neas
Linea   DW      1

TextoNumero     DB      13, 10, 5 DUP (' '),': $'     ; 5 espacios

.code
        MOV     AX, @data
        MOV     DS, AX
        ;
        ; 1a. parte: Abrir el archivo
        ;
        MOV     AH, 3Dh         ; Servicio fopen
        LEA     DX, Nombre      ; Apuntar a la cadena con el nombre
        MOV     AL, 0           ; Abrir para lectura
        INT     21h             ; En este momento se abre
        JNC     Lectura
Error:  MOV     AX, 4C01h       ; Terminar el programa con c¢digo 1
        INT     21h
Lectura:
        MOV     Archivo, AX     ; Guardar el manejador o handle en la variable
        
        CALL    ImprimeLinea
        INC     Linea
        ;    
        ; 2a. parte: ciclo, leer un caracter y mostrarlo en
        ; pantalla; si es un ENTER, mostrar l¡nea e incrementarla
        ;
Ciclo:
        MOV     AH, 3Fh         ; Servicio para leer
        LEA     DX, Buffer      ; Buffer donde quedar  la informaci¢n
        MOV     BX, Archivo     ; Handle
        MOV     CX, 1           ; Voy a leer 1 caracter a la vez
        INT     21h
        JC      Error
        CMP     AX, 0           ; Caracteres le¡dos
        JE      FinDeArchivo    ; Si son 0, terminar

        MOV     DL, Buffer
        CMP     DL, 13          ; Ver si es un ENTER
        JE      NuevaLinea      ; Si es as¡, imprimir nueva l¡nea

        CMP     DL, 10          ; Ver si es un Salto de l¡nea
        JE      Ciclo           ; Si es as¡, ignorarlo.

        MOV     AH, 2
        INT     21h
        JMP SHORT Ciclo         ; Ciclarse. Uso SHORT porque est  a menos
                                ; de 127 bytes de distancia
NuevaLinea:
        ; Es un ENTER, llamamos a impresi¢n de l¡nea
        CALL    ImprimeLinea
        INC     Linea

        JMP SHORT Ciclo         ; Ciclarse. Uso SHORT porque est  a menos
                                ; de 127 bytes de distancia

FinDeArchivo:
        ;
        ; Cerrar los archivos
        ;
        MOV     AH, 3Eh         ; Servicio fclose
        MOV     BX, Archivo     ; Handle
        INT     21h
        MOV     AX, 4C00h       ; Terminar el programa con c¢digo 0
        INT     21h

ImprimeLinea    PROC
        ;
        ; Imprimir el n£mero de l¡nea, usando el buffer TextoNumero
        ;
        MOV     AX, Linea
        ; 
        ; Apuntar al £ltimo espacio en el buffer
        ;
        LEA     SI, TextoNumero + 6
        ;
        ; Ciclo: mientras AX > 0
        ;
CicloImprimeLinea:
        CMP     AX, 0
        JE      FinCicloLinea
        ;
        ; Dividir el word / 10 puede dar word, por ello extiendo a doble
        ; palabra la divisi¢n, para lo que limpio DX
        ;
        XOR     DX, DX
        ;
        ; Divido entre 10
        ;
        MOV     BX, 10
        DIV     BX
        ;
        ; En AX tenemos el cociente, que seguiremos dividiendo; y en DX el
        ; residuo. Sabemos que el residuo va de 0 a 9 (teorema del residuo
        ; nos dice que si dividimos entre 10, no puede sobrar 10 ni m s);
        ; por ello, sabemos que todo el residuo queda en DL, de donde lo
        ; tomaremos y colocaremos, como d¡gito ASCII, en el buffer.
        ;
        ADD     DL, '0' ; Convertir DL, valor 0-9, al ASCII correspondiente
        MOV     [SI], DL        ; Almacenarlo en buffer
        DEC     SI              ; Decrementar mi apuntador
        JMP SHORT       CicloImprimeLinea       ; Ciclarse
FinCicloLinea:
        ;
        ; Imprimir el buffer
        ;
        MOV     AH, 9
        LEA     DX, TextoNumero
        INT     21h
        RET
ImprimeLinea    ENDP

        END

