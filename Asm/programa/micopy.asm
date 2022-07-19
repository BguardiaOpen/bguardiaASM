;
; Programa ejemplo: similar al copy, copiar un archivo fuente a uno destino
; Basado en MITYPE.ASM
;
.model small
.stack 100h
.data

; El Nombre est  fijo para el ejemplo
Nombre  DB      'c:\autoexec.bat', 0
; El Nombre del destino tambi‚n est  fijo para el ejemplo
Nombre2 DB      'autoexec.cpy', 0

;
; Ahora necesitamos 2 handles
;
Archivo DW      ?
Archivo2 DW      ?

Buffer  DB      ?

.code
        MOV     AX, @data
        MOV     DS, AX
        ;
        ; 1a. parte, insertada: Crear el archivo
        ;
        MOV     AH, 3Ch         ; Servicio fopen para crear
        LEA     DX, Nombre2     ; Apuntar a la cadena con el nombre destino
        MOV     CX, 0           ; Atributo normal (no de solo-lectura ni 
                                ; similares)
        INT     21h             ; En este momento se crea
        JC      Error           ; L¢gica negada. En caso de error, terminar;
                                ; de lo contrario, abrir el otro archivo
        MOV     Archivo2, AX    ; Guardar el handle de destino
        ;
        ; 2a. parte: Abrir el archivo
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
        ; 3a. parte: ciclo, leer un caracter y en vez de mostrarlo en
        ; pantalla, guardarlo en el segundo archivo
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
        ; Escribir
        ;
        MOV     AH, 40h         ; Servicio para escribir
        LEA     DX, Buffer      ; Buffer de donde se toma la informaci¢n
        MOV     BX, Archivo2    ; Handle
        MOV     CX, 1           ; Voy a escribir 1 caracter a la vez
        INT     21h
        JC      Error
        JMP SHORT Ciclo         ; Ciclarse. Uso SHORT porque est  a menos
                                ; de 127 bytes de distancia

FinDeArchivo:
        ;
        ; Cerrar los archivos
        ;
        MOV     AH, 3Eh         ; Servicio fclose
        MOV     BX, Archivo     ; Handle
        INT     21h
        MOV     BX, Archivo2    ; Handle
        INT     21h
        MOV     AX, 4C00h       ; Terminar el programa con c¢digo 0
        INT     21h
        END

