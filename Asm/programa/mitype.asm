;
; Programa ejemplo: similar al type, mostrar un archivo en pantalla
;
.model small
.stack 100h
.data

; El Nombre est  fijo para el ejemplo
Nombre  DB      'c:\autoexec.bat', 0

;
Archivo DW      ?

Buffer  DB      ?

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
        ;    
        ; 2a. parte: ciclo, leer un caracter y mostrarlo en pantalla
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
        ;
        ; Imprimir
        ;
        MOV     AH, 2           ; Servicio de imprimir un caracter
        MOV     DL, Buffer
        INT     21h
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
        END

