;**********************************************************************;
;*                             T S R C A                              *;
;*--------------------------------------------------------------------*;
;*    Tarea          : representa el interface del ensamblador a un   *;
;*                     programa C, que se puede activar como programa *;
;*                     TSR mediante una Hotkey                        *;
;*--------------------------------------------------------------------*;
;*    Autor          : MICHAEL TISCHER                                *;
;*    desarrollado el: 10.08.1988                                     *;
;*    £ltimo update  : 18.11.1991                                     *;
;*--------------------------------------------------------------------*;
;*    ensamblar      : MASM -mx TSRCA;    o    TASM /mx TSRCA;        *;
;*                     ... enlazar con programa C                     *;
;**********************************************************************;

IGROUP group _text                ;Resumen de los segmentos de programa
DGROUP group _bss,  _data         ;Resumen de los segmentos de datos
       assume CS:IGROUP, DS:DGROUP, ES:DGROUP, SS:DGROUP

_BSS   segment word public 'BSS'  ;Este segmento acoge todas las variables
_BSS   ends                       ;est ticas no inicializadas

_DATA  segment word public 'DATA' ;Todas las variables globales y est ticas
				  ;inicializadas se guardan en este
				  ;segmento

extrn  __psp : word               ;direcci¢n de segmento del PSP del programa C

_DATA  ends

;== Constantes =========================================================

TC_STACK   equ 512                ;Stack para Turbo C
ARG_WORDS  equ 32                 ;Stack-Words copiados en TsrCall

I2F_FKT_0  equ 0AAh               ;C¢digo para INT 2F, Funci¢n 0
I2F_FKT_1  equ 0BBh               ;C¢digo para INT 2F, Funci¢n 1
TIME_OUT   equ 9                  ;Time-Out para activaci¢n en Ticks

;== Programa ===========================================================

_TEXT  segment byte public 'CODE' ;el segmento de datos

;-- Referencia a funciones (C) externas --------------------------------

extrn      _GetHeapEnd:near             ;develve la direcci¢n final del Heap

;-- Declaraciones  Public de funciones internas ------------------------

public     _TsrInit               ;permite la llamada del programa C
public     _TsrIsInst
public     _TsrUnInst
public     _TsrCanUnInst
public     _TsrCall
public     _TsrSetHotkey
public     _TsrSetPtr

;-- Variables para los controladores de interrupciones -----------------
;-- (s¢lo accesible mediante el segmento de c¢digo ---------------------

call_ptr   equ this dword
call_ofs   dw 0                   ;Direcc. de offset para TSRCall
call_seg   dw 0                   ;Direcc. de segmento a£n no inicializada

ret_ax     dw 0                   ;Guardar el resultado de funci¢n en
ret_dx     dw 0                   ;TSR-Call

;-- variables que neceseitan para la activaci¢n del programa C -----------

c_ss       dw 0                   ;Segmento de Stack C
c_sp       dw 0                   ;Puntero de Stack C
c_ds       dw 0                   ;Segmento de datos C
c_es       dw 0                   ;Segmento extra C

c_dta_ofs  dw 0                   ;direcci¢n DTA de los programas C
c_dta_seg  dw 0

c_psp      dw 0                   ;direcci¢n de segmento del PSP del programa C
break_adr  dw 0                   ;direcci¢n Break de Heap
fkt_adr    dw 0                   ;direcci¢n de la funci¢n TSR del C

;-- Variables, para el control de actuvaci¢n del Hotkey ----------------

key_mask   dw 3                   ;M scara Hotkey para la bandera de teclado de la BIOS
				  ;Defecto: Shift izq. + Shift dcho.
sc_code    db 128                 ;C¢digo Scan del Hotkey
				  ;Defecto: ninguna tecla
i2F_code   db 0                   ;N£mero de funci¢n para INT 2F

;-- Variables para la activaci¢n TSR -----------------------------------

tsrnow     db 0                   ;¨espera TSR la activaci¢n?
tsractive   db 0                  ;¨est  TSR activo?
in_bios    db 0                   ;indica actividad de disco BIOS

daptr      equ this dword         ;Puntero al DOS Indos-Flag
daptr_ofs  dw 0                   ;Direcci¢n de offset
daptr_seg  dw 0                   ;Direcci¢n de segmento

;-- las siguientes variables acogen las direcciones antiguas de los  ---
;-- control. de interrupci¢n, que ha sido sustituidos por los nuevos ---

int8_ptr   equ this dword         ;ant¡guo vector de interr. 8h
int8_ofs   dw 0                   ;direcci¢n de offset del control. antiguo
int8_seg   dw 0                   ;direcci¢n de segmento del control. antiguo

int9_ptr   equ this dword         ;vector de interr. antiguo 9h
int9_ofs   dw 0                   ;direcci¢n de offset del control. antiguo
int9_seg   dw 0                   ;direcci¢n de segmento del control. antiguo

int13_ptr  equ this dword         ;vector de interr. antiguo 13h
int13_ofs  dw 0                   ;direcci¢n de offset del control. antiguo
int13_seg  dw 0                   ;direcci¢n de segmento del control. antiguo

int28_ptr  equ this dword         ;vector de interrupci¢n antiguo 28h
int28_ofs  dw 0                   ;direcci¢n de offset del control. antiguo
int28_seg  dw 0                   ;direcci¢n de segmento del control. antiguo

int2F_ptr  equ this dword         ;vector de interr. antiguo 2Fh
int2F_ofs  dw 0                   ;direcci¢n de offset del control. antiguo
int2F_seg  dw 0                   ;direcci¢n de segmento del control. antiguo

;-- Variables, que acogen las informaciones sobre el programa ----------
;-- interrumpido                                              ----------

u_dta_ofs  dw 0                   ;Direcci¢n DTA del prog. interr.
u_dta_seg  dw 0

u_psp      dw 0                   ;Direcci¢n de segmento del PSP del prog. interr.

uprg_ss    dw 0                   ;SS y SP del prog. interr.
uprg_sp    dw 0

;-----------------------------------------------------------------------
;-- TSRINIT: termina el Programa C y activa el nuevo controlador de  ---
;--          interrupciones
;-- Llamada desde C: void TsrInit(  bool TC
;--                              void (fkt *)(void),
;--                              unsigned heap_byte );

_TsrInit  proc    near

sframe0    struc                  ;Estructura para el acceso al Stack
bp0        dw ?                   ;acoge BP
ret_adr0   dw ?                   ;direcci¢n de retorno
tc0        dw ?                   ;Compilador (1 = TURBO-C, 0 = MSC )
fktptr0    dw ?                   ;puntero a la funci¢n TSR de C
heap0      dw ?                   ;bytes del Heap necesitados
sframe0    ends                   ;Fin de la estructura

frame      equ [ bp - bp0 ]

	   push bp                ;Guardar BP en el Stack
	   mov  bp,sp             ;Transferir SP aBP

	   ;-- guardar el registro de segmentos del C ------------------

	   mov  c_ss,ss           ;guardar los registros en las
	   mov  c_sp,sp           ;guardar variables
	   mov  c_es,es
	   mov  c_ds,ds

	   ;-- guardar los par metros pasados --------------------------

	   mov  ax,frame.fktptr0  ;obtener puntero a la funci¢n TSR de C
	   mov  fkt_adr,ax        ;y guardarlo

	   ;-- obtener la direcci¢n DTA del programa C -----------------

	   mov  ah,2fh            ;N§ Func.: obtener direcc. DTA
	   int  21h               ;llamar interrupci¢n DOS
	   mov  c_dta_ofs,bx      ;Direcci¢n en los correspondientes
	   mov  c_dta_seg,es      ;guardar variables

	   ;-- Obtener la direcc. del INDOS Flag -----------------------

	   mov  ah,34h            ;N§ Func.: Obtener direcc. INDOS Flag
	   int  21h               ;llamar interrupci¢n DOS
	   mov  daptr_ofs,bx      ;Direcci¢n en los correspondientes
	   mov  daptr_seg,es      ;guardar variables

	   ;-- obtener las direcciones de los control. de interr. a desviar

	   mov  ax,3508h          ;obtener vector de interr. 8h
	   int  21h               ;llamar interrupci¢n DOS
	   mov  int8_ofs,bx       ;guardar la direcci¢n del controlador en
	   mov  int8_seg,es       ;las variables correspondientes

	   mov  ax,3509h          ;obtener vector de interr. 9h
	   int  21h               ;llamar interrupci¢n DOS
	   mov  int9_ofs,bx       ;guardar la direcci¢n del controlador en
	   mov  int9_seg,es       ;las variables correspondientes

	   mov  ax,3513h          ;obtener vector de interr. 13h
	   int  21h               ;llamar interrupci¢n DOS
	   mov  int13_ofs,bx      ;guardar la direcci¢n del controlador en
	   mov  int13_seg,es      ;las variables correspondientes

	   mov  ax,3528h          ;obtener vector de interr. 28h
	   int  21h               ;llamar interrupci¢n DOS
	   mov  int28_ofs,bx      ;guardar la direcci¢n del controlador en
	   mov  int28_seg,es      ;las variables correspondientes

	   mov  ax,352Fh          ;obtener vector de interr. 2Fh
	   int  21h               ;llamar interrupci¢n DOS
	   mov  int2F_ofs,bx      ;guardar la direcci¢n del controlador en
	   mov  int2F_seg,es      ;las variables correspondientes

	   ;-- intalar los nuevos control. de interr. ------------------

	   push ds                ;guardar segmento de datos
	   mov  ax,cs             ;cargar CS a AX y despu‚s a DS
	   mov  ds,ax

	   mov  ax,2508h          ;N§ Func.: fijar interr. 8h
	   mov  dx,offset int08   ;DS:DX acoge la direcci¢n del controlador
	   int  21h               ;llamar interrupci¢n DOS

	   mov  ax,2509h          ;N§ Func.: fijar interrupci¢n 9h
	   mov  dx,offset int09   ;DS:DX acoge la direcci¢n del controlador
	   int  21h               ;llamar interrupci¢n DOS

	   mov  ax,2513h          ;N§ Func.: fijar interr. 13h
	   mov  dx,offset int13   ;DS:DX acoge la direcci¢n del controlador
	   int  21h               ;llamar interrupci¢n DOS

	   mov  ax,2528h          ;N§ Func.: fijar interr. 28h
	   mov  dx,offset int28   ;DS:DX acoge la direcci¢n del controlador
	   int  21h               ;llamar interrupci¢n DOS

	   mov  ax,252Fh          ;fijar n£mero de funci¢n de la interrupci¢n 2Fh
	   mov  dx,offset int2F   ;DS:DX acoge la direcci¢n del controlador
	   int  21h               ;llamar interrupci¢n DOS

	   pop  ds                ;recuperar DS del stack

	   ;-- calcular n£mero de p rrafos que se han de quedar en la ----
	   ;-- memoria                                                ----

	   call _GetHeapEnd       ;llamar funci¢n C en el m¢dulo TSR
	   add  ax,frame.heap0    ;sumar memoria Heap necesitada

	   ;-- en TURBO-C el Stack se encuentra detr s del Heap y      -
	   ;-- comienza con el fin de segmento, por ello se ha de
	   ;-- traer hasta el Heap.

	   cmp  byte ptr frame.tc0,0  ;¨Se trabaja con TURBO-C?
	   je   msc2                  ;NO, con MSC

	   add  ax,TC_STACK-1     ;calcular nuevo puntero del Stack para TC
	   mov  c_sp,ax           ;y guardarlo
	   inc  ax                ;fijar direcci¢n Break

	   ;-- calcular n£mero de p rrafos que se han de quedar   ------
	   ;-- residentes en memoria

msc2:      mov  dx,ax             ;obtener direcci¢n de Break desde DX
	   add  dx,15             ;evitar p‚rdidas por divisi¢n de enteros
	   mov  cl,4              ;desplazar 4 veces a la derecha y con
	   shr  dx,cl             ;ello dividirlo entre 16
	   mov  ax,ds             ;obtener DS de AX
	   mov  bx,__psp          ;obtener direcci¢n de segmento del PSP
	   mov  c_psp,bx          ;guardar en una variable
	   sub  ax,bx             ;restar DS del PSP
	   add  dx,ax             ;y sumarlo a la cantidad de los p rrafos
	   mov  ax,3100h          ;N§ Func.: terminar programa residente
	   int  21h               ;Llamar interr. DOS y terminar con ello
				  ;el progama

_TsrInit  endp

	  assume CS:IGROUP, DS:nothing, ES:nothing, SS:nothing

;-----------------------------------------------------------------------
;-- TSRSETHOTKEY: Fija el Hotkey de un programa
;-- Llamada desde C : void TsrSetHotKey( unsigned KeyMask,
;--                                  byte     ScanCode );
;-- Info            : Este procedimiento es FAR, para que tambi‚n
;--                   pueda ser llamada desde un prog. TSR ya instalado
;--

_TsrSetHotkey  proc far

sframe1    struc                  ;Estructura para el acceso al Stack
bp1        dw ?                   ;acoge BP
ret_adr1   dd ?                   ;direcci¢n de retorno
keymask1   dw ?                   ;m scara para hotkey
sc_code1   dw ?                   ;C¢digo Scan del hotkey
sframe1    ends                   ;Fin de la estructura

frame      equ [ bp - bp1 ]

	   push bp                ;Guardar BP en el Stack
	   mov  bp,sp             ;Transferir SP aBP

	   ;-- guardar los par metros pasados --------------------------

	   mov  ax,frame.keymask1 ;obtener m scara para hotkey y
	   mov  key_mask,ax       ;guardarla
	   mov  al,byte ptr frame.sc_code1 ;obtener c¢digo scan del hotkey
	   mov  sc_code,al                 ;guardarla

	   pop  bp                ;BP de nuevo del stack
	   ret                    ;de vuelta

_TsrSetHotkey  endp

;-----------------------------------------------------------------------
;-- TSRISINST: determina, si el programa ya est  instalado -------------
;-- Llamada desde C: bool TsrIsInst( byte i2f:fktnr);
;-- Valor Return: TRUE, cuando el prog. ya estaba instalado,
;--               sino FALSE

_TsrIsInst proc    near

sframe2    struc                  ;Estructura para el acceso al Stack
bp2        dw ?                   ;acoge BP
ret_adr2   dw ?                   ;direcci¢n de retorno
i2F_code2  dw ?                   ;N£mero de funci¢n para INT 2F
sframe2    ends                   ;Fin de la estructura

frame      equ [ bp - bp2 ]

	   push bp                ;Guardar BP en el Stack
	   mov  bp,sp             ;Transferir SP aBP

	   mov  ah,byte ptr frame.i2F_code2 ;N§ func: para INT 2F
	   mov  i2F_code,ah                 ;guardarla
	   mov  al,I2F_FKT_0                ;n§ subfunci¢n
	   mov  bx,ax                       ;guardar ambos n£meros
	   int  2Fh
	   xchg bh,bl                       ;girar n£meros
	   cmp  ax,bx                       ;comparar con retorno
	   mov  ax,0                        ;no partir de la instal.
	   jne  isi_end                     ;diferente --> no instalar

	   ;-- direcci¢n de segmento de la copia ya instalada

	   mov  ah,i2f_code       ;No, cargar direcci¢n de segmento
	   mov  al,I2F_FKT_1      ;mediante INT 2Fh, subfunci¢n 01h
	   int  2Fh
	   mov  call_seg,ax       ;y guardar en variables
	   mov  ax,-1             ;est  instalado

isi_end:   pop  bp                ;BP de nuevo del stack
	   ret                    ;de vuelta

_TsrIsInst endp                   ;Fin del procedimiento

;-----------------------------------------------------------------------
;-- TSRCANUNIST: Determinar si la copia instalada del TSR puede    -----
;--              ser reinstalada
;-- Llamada desde C: bool TsrCanUnInst( void );
;-- Salida      : TRUE si es posible la reinstalaci¢n, sino FALSE
;-- Info        : el progrma s¢lo se puede reinstalar si ninguno
;--               de los vectores de interrupci¢n del programa
;--               ha sido redireccionado en ese tiempo a otro
;--               programa.

tsrlist    db  08h,09h,13h,28h,2Fh,00h ;lista de las INT redireccionadas
				       ;00h marca el fin
_TsrCanUninst proc  near

	   push di                  ;guardar DI (si es variable de registro)
	   mov  dx,call_seg         ;cargar segmento de la copia instalada
	   mov  di,offset tsrlist-1 ;DI a la lista

tcu_1:     inc  di                ;DI al siguiente n§ de Interr.
	   mov  al,cs:[di]        ;siguiente n§ de interr. a AL
	   or   al,al             ;¨Fin de la lista?
	   je   tcu_ok            ;Si, todos los vectores OK

	   mov  ah,35h            ;N§ de func: para "Get Interrupt"
	   int  21h               ;llamar interrupci¢n DOS
	   mov  cx,es             ;ES para comaparar en CX
	   cmp  dx,cx             ;¨en el mismo segmento?
	   je   tcu_1             ;Si, no es posible reistalaci¢n

	   xor  ax,ax             ;NO, no es posible reinstalaci¢n
	   pop  di                ;recuperar DI
	   ret

tcu_ok:    mov  ax,-1
	   pop  di                ;recuperar DI
	   ret

_TsrCanUninst endp

;-----------------------------------------------------------------------
;-- TSRUNINST: reinstala el programa TSR y devuelve la memoria
;--            alojada.
;-- Llamada desde C: void TsrUnInst( void );
;-- Info             : Esta rutina s¢lo se puede llamar despu‚s de
;--                    una llamada con ‚xito de la rutina
;--                    TSRCANUNINST()

_TsrUninst    proc    near

	   push ds
	   mov  es,call_seg       ;Cargar segmento del TSR instalado

	   ;-- reinstalar los controladores de interrupciones del ------
	   ;-- programa TSR                                       ------

	   cli                    ;no permitir interrupciones
	   mov  ax,2508h          ;N§ func: fijar control. a INT 8h
	   mov  ds,es:int8_seg    ;direcci¢n de segmento del controlador antiguo
	   mov  dx,es:int8_ofs    ;direcci¢n de offset del controlador antiguo
	   int  21h               ;instalar de nuevo el controlador antiguo

	   mov  ax,2509h          ;N§ Func.: fijar controlador para INT 9
	   mov  ds,es:int9_seg    ;direcci¢n de segmento del controlador antiguo
	   mov  dx,es:int9_ofs    ;direcci¢n de offset del controlador antiguo
	   int  21h               ;instalar de nuevo el controlador antiguo

	   mov  ax,2513h          ;N§ Func.: fijar controlador para INT 13
	   mov  ds,es:int13_seg   ;direcci¢n de segmento del controlador antiguo
	   mov  dx,es:int13_ofs   ;direcci¢n de offset del controlador antiguo
	   int  21h               ;instalar de nuevo el controlador antiguo

	   mov  ax,2528h          ;N§ Func.: fijar controlador para INT 28
	   mov  ds,es:int28_seg   ;direcci¢n de segmento del controlador antiguo
	   mov  dx,es:int28_ofs   ;direcci¢n de offset del controlador antiguo
	   int  21h               ;instalar de nuevo el controlador antiguo

	   mov  ax,252Fh          ;N§ Func.: fijar controlador para INT 2F
	   mov  ds,es:int2F_seg   ;direcci¢n de segmento del controlador antiguo
	   mov  dx,es:int2F_ofs   ;direcci¢n de offset del controlador antiguo
	   int  21h               ;instalar de nuevo el controlador antiguo

	   sti                    ;permitir interrupciones

	   ;-- Liberar memoria de nuevo --------------------------------

	   mov  es,es:c_psp       ;Direcc. de segm. del PSP del prog. TSR
	   mov  cx,es             ;guardar el CX
	   mov  es,es:[ 02ch ]    ;direcc. de segm. del environmente del PSP
	   mov  ah,49h            ;Liberar memoria alojada
	   int  21h               ;llamar interrupci¢n DOS

	   mov  es,cx             ;recuperar ES de CX
	   mov  ah,49h            ;Liberar memoria alojada
	   int  21h               ;llamar interrupci¢n DOS

	   pop  ds                ;recuperar DS y BP del stack
	   ret                    ;volver al invocador

_TsrUninst endp                   ;Fin del procedimiento

;-----------------------------------------------------------------------
;-- TSRSETPTR: Guarda la direcci¢n de la rutina, que ha de ser llamada -
;--            en la siguiente llamada de TSRCALL
;--            y devuelve un puntero a TSRCALL
;-- Llamada desde C: void (*)(void) TsrSetPtr( void far * Fkt );

_TsrSetPtr  proc    near

sframe3    struc                  ;Estructura para el acceso al Stack
bp3        dw ?                   ;acoge BP
ret_adr3   dw ?                   ;direcci¢n de retorno
fktptr3    dd ?                   ;puntero a la rutina a llamar
sframe3    ends                   ;Fin de la estructura

frame      equ [ bp - bp3 ]

	   push bp                ;Guardar BP en el Stack
	   mov  bp,sp             ;Transferir SP aBP

	   mov  ax,word ptr frame.fktptr3  ;direcc. de offset a AX
	   mov  call_ofs,ax                ;y guardarlo

	   mov  ax,offset _TsrCall;devolver puntero Near a TSRCall
	   pop  bp                ;BP de nuevo del stack

	   ret                    ;y argumentos del stack

_TsrSetPtr endp                   ;Fin del procedimiento

;-----------------------------------------------------------------------
;-- TSRCALL: Llama una rutina de la copia -antes instalada- del --------
;--          programa TSR.
;-- Llamada desde c: void TsrCall( void )
;-- Atenci¢n         : - los argumentos del Stack del invocador se
;--                      copian en esta rutina al Stack del programa
;--                      invocador, y conmutando el Stack para que
;--                      DS=SS

_TsrCall   proc near

	   ;-- realizar cambio de contexto del programa turbo y  -------
	   ;-- y llamar el procedimiento indicado

	   push di                ;guardar DS, SI y DI
	   push si
	   push ds

	   mov  ah,2fh            ;N§ Func.: obtener direcc. DTA
	   int  21h               ;llamar interrupci¢n DOS
	   mov  u_dta_ofs,bx      ;guardar direcci¢n del DTA del programa
	   mov  u_dta_seg,es      ;interrumpido

	   mov  es,call_seg       ;direcc. de segmento del TSR instalado
				  ;a ES
	   mov  ah,50h            ;N§ func.: fijar direcci¢n del PSP
	   mov  bx,es:c_psp       ;obtener direcci¢n de segmento del PSP
	   int  21h               ;llamar interrupci¢n DOS

	   mov  ah,1ah            ;N§ func.: fijar direcc. DTA
	   mov  dx,es:c_dta_ofs   ;obtener direcc. de offset del nuevo DTA
	   mov  ds,es:c_dta_seg   ;y direcc. de segmento del nuevo DTA
	   int  21h               ;llamar interrupci¢n DOS

	   ;-- copiar argumentos al Stack del TSR instalado ------------

	   push ss                ;colocar DS:SI a los aargumentos
	   pop  ds                ;del Stack actual
	   mov  si,sp
	   add  si,8              ;a trav‚s de RET y PUSH DS, DI, SI

	   mov  cx,ARG_WORDS*2
	   mov  di,es:c_sp        ;ES:DI al Stack del
	   sub  di,cx
	   mov  es,es:c_ss
	   rep movsb              ;copiar argumentos

	   ;-- ajustar y llamar el registro de segmento del TSR instalado

	   mov  es,call_seg       ;direcc. de segmento del TSR instalado
				  ;a ES

	   cli                    ;no permitir interr.
	   mov  uprg_ss,ss        ;guardar segm. de stack y puntero
	   mov  uprg_sp,sp        ;de stack

	   mov  ss,es:c_ss        ;activar el Stack de la copia instalada
	   mov  sp,es:c_sp        ;del programa
	   sub  sp,ARG_WORDS*2    ;a trav‚s de los argumentos
	   sti                    ;permitir interrupciones

	   mov  ds,es:c_ds        ;fijar registro de segmento para
	   mov  es,es:c_es        ;el programa

	   call [call_ptr]        ;la funci¢n llamada mediante TSRSETPTR
	   mov  ret_ax,ax         ;guardar resultado de funci¢n
	   mov  ret_dx,dx

	   cli                    ;no permitir interr.
	   mov  ss,uprg_ss        ;conmutar de nuevo al Stack
	   mov  sp,uprg_sp        ;propio
	   sti                    ;permitir interrupciones

	   ;-- realizar cambio de contexto al programa actual ----------

	   mov  ah,1ah            ;N§ func.: fijar direcc. DTA
	   mov  dx,u_dta_ofs      ;cargar direcc. de offset y segmento del
	   mov  ds,u_dta_seg      ;DTA del programa interrumpido
	   int  21h               ;llamar interrupci¢n DOS

	   mov  es,call_seg       ;recuperar ES y DS
	   pop  ds                ;recuperar

	   mov  ah,50h            ;N§ func.: fijar direcci¢n del PSP
	   mov  bx,cs             ;CS a BX
	   sub  bx,10h            ;calcular direcc. de segm. del PSP
	   int  21h               ;llamar interrupci¢n DOS

	   mov  ax,ret_ax         ;recuperar resultado de funci¢n
	   mov  dx,ret_dx

	   pop  si                ;recuperar registro
	   pop  di
	   ret                    ;volver al invocador

_TsrCall   endp                   ;Fin del procedimiento

;-----------------------------------------------------------------------
;-- DOSactive: determina con ayuda del DOS-INDOS-Flag, si DOS se puede
;--           interrumpir ahora
;-- Entrada:  no tiene
;-- Salida :  Zero-Flag = 1 : DOS se puede interrumpir

dosactive   proc near

	   push ds                ;guardar DS y BX en el stack
	   push bx
	   lds  bx,daptr          ;DS:BX apuntan ahora al INDOS-Flag
	   cmp  byte ptr [bx],0   ;¨activa funci¢n DOS?
	   pop  bx                ;recuperar BX y DS del stack
	   pop  ds

	   ret                    ;volver al invocador

dosactive   endp

;-----------------------------------------------------------------------
;-- siguen los nuevos controladores de interrupciones ------------------
;-----------------------------------------------------------------------

;-- el nuevo controlador de interr. 98h (Timer) ------------------------

int08      proc far

	   cmp  tsrnow,0          ;¨debe activarse TSR?
	   je   i8_end            ;No, seguir al control. antiguo

	   dec  tsrnow            ;Si, decrementar bandera de activaci¢n

	   ;-- TSR debe activarse, pero ¨es posible? -------------------

	   cmp  in_bios, 0        ;¨Interrupci¢n BIOS de disco activa en este momento?
	   jne  i8_end            ;SI --> no se puede activar

	   call dosactive         ;¨se puede interrumpir DOS?
	   je   i8_tsr            ;Si, llamar TSR

i8_end:    jmp  [int8_ptr]        ;saltar al controlador antiguo

	   ;-- activar TSR ---------------------------------------------

i8_tsr:    mov  tsrnow,0          ;TSR ya no espera a la activaci¢n
	   mov  tsractive,1       ;TSR est  activo
	   pushf                  ;simular llamada del controlador antiguo
	   call [int8_ptr]        ;mediante el comando INT 8h
	   call start_tsr         ;ejecutar el programa TSR
	   iret                   ;volver al programa interrumpido

int08      endp

;-- el nuevo control. de interr. (Teclado) -----------------------------

int09      proc far

	   push ax
	   in   al,60h            ;leer port de teclado

	   cmp  tsractive,0       ;¨est  activo el prog. TSR?
	   jne  i9_end            ;SI: llamar controlador antiguo, despu‚s volver

	   cmp  tsrnow,0          ;¨espera TSR a su activaci¢n?
	   jne  i9_end            ;SI: llamar controlador antiguo, despu‚s volver

	   ;-- comprobar hotkey ----------------------------------------

	   cmp  sc_code,128       ;¨existe un c¢digo de scan?
	   je   i9_ks             ;No, comprobar s¢lo teclas de cambio

	   cmp  al,128            ;¨si, un c¢digo release?
	   jae  i9_end            ;Si, no es hotkey

	   cmp  sc_code,al        ;C¢digo Make, comparar con tecla
	   jne  i9_end            ;no cuadra, no hay activaci¢n

i9_ks:     ;-- comprobar estado de las teclas de cambio ----------------

	   push ds
	   mov  ax,040h              ;DS al segmento de variables de la
	   mov  ds,ax                ;ROM-BIOS
	   mov  ax,word ptr ds:[17h] ;obtener bandera de teclado de BIOS
	   and  ax,key_mask          ;apagar los bit no-hotkey
	   cmp  ax,key_mask          ;¨s¢lo quedan los hotkey-bits?
	   pop  ds
	   jne  i9_end            ;¨hotkey descubierto? NO --> volver

	   cmp  in_bios, 0        ;¨Interrupci¢n BIOS de disco activa en este momento?
	   jne  i9_e1             ;SI --> no se puede activar

	   call dosactive         ;¨se puede interrumpir DOS?
	   je   i9_tsr            ;Si, arrancar TSR

i9_e1:     mov  tsrnow,TIME_OUT;TSR espera su activaci¢n

i9_end:    pop   ax               ;recuperar AX
	   jmp   [int9_ptr]       ;saltar al controlador antiguo

i9_tsr:    mov   tsractive,1      ;TSR est  activo
	   mov   tsrnow,0         ;no se desea un arranque retardado
	   pushf
	   call  [int9_ptr]       ;llamar controlador antiguo
	   pop   ax               ;recuperar AX
	   call  start_tsr        ;ejecutar el programa TSR
	   iret                   ;volver al programa interrumpido

int09      endp

;-- el nuevo control. de interr. 13h (disquete/disco duro) -------------

int13      proc far

	   inc  in_bios           ;incrementar BIOS-Disk-Flag
	   pushf                  ;llamada del control. de interr. antiguo
	   call [int13_ptr]       ;simular mediante INT 13h
	   dec  in_bios           ;reponer BIOS-Disk-Flag

	   sti                    ;permitir llamadas de interr.
	   ret  2                 ;volver al invocador, pero no recuperar
				  ;el registro antes del stack
int13      endp

;-- el nuevo control. de interr. 28h -----------------------------------

int28      proc far

	   cmp  tsrnow,0          ;¨espera TSR la activaci¢n?
	   je   i28_end           ;No, volver al invocador

	   cmp  in_bios, 0        ;¨Si, pero est  activo el Disk-Intr?
	   je   i28_tsr           ;Si, as¡ que no activarlo

i28_end:   jmp  [int28_ptr]       ;al antiguo controlador

	   ;-- Ejecutar TSR --------------------------------------------

i28_tsr:   mov  tsrnow,0          ;TSR ya no espera a la activaci¢n
	   mov  tsractive,1        ;TSr est  activo
	   pushf                  ;Llamada del control. de interr. antiguo
	   call [int28_ptr]       ;simular sobre INT 28h
	   call start_tsr         ;ejecutar el programa TSR
	   iret                   ;volver al invocador

int28      endp

;-- el nuevo controlador de interr. 2Fh --------------------------------

int2F      proc far

	   cmp  ah,i2F_code       ;¨Llamada a este TSR?
	   jne  i2F_end           ;No, al controlador antiguo

	   cmp  al,I2F_FKT_0      ;¨Si, es la subfunci¢n 00h?
	   je   i2F_0             ;Si, ejecutar

	   cmp  al,I2F_FKT_1      ;¨A lo mejor subfunci¢n 01h?
	   je   i2F_1             ;Si, ejecutar

	   iret                   ;No, ignorar llamada

i2F_end:   ;-- No es el TSR, continuar llamada -------------------------

	   jmp  [int2F_ptr]       ;al antiguo controlador

i2F_0:     ;-- Subfunci¢n 00: Installation-Check -----------------------

	   xchg ah,al             ;Intercambiar n§ de funci¢n y subfunci¢n
	   iret                   ;volver al invocador

i2F_1:     ;-- Subfunci¢n 01: devolver la direcci¢n de segmento --------

	   mov  ax,cs             ;Direcc. de segm. a AX
	   iret                   ;volver al invocador

int2F      endp

;-- START_TSR: activar programa TSR ------------------------------------

start_tsr  proc near

	   ;-- realizar cambio de contexto al programa C ---------------

	   cli                    ;no permitir interr.
	   mov  uprg_ss,ss        ;guardar segm. de stack y puntero
	   mov  uprg_sp,sp        ;de stack

	   mov  ss,c_ss           ;activar el Stack del programa C
	   mov  sp,c_sp
	   sti                    ;permitir interrupciones

	   push ax                ;los registros de procesador al Stack de C
	   push bx                ;al Stack
	   push cx
	   push dx
	   push bp
	   push si
	   push di
	   push ds
	   push es

	   ;-- guardar 64 Words en el Stack del DOS ----------------------

	   mov  cx,64             ;contador de bucle
	   mov  ds,uprg_ss        ;color DS:SI al final del Stack del DOS
	   mov  si,uprg_sp

tsrs1:     push word ptr [si]     ;Word del Stack del DOS al Stack del C
	   inc  si                ;y colocar SI a la siguiente
	   inc  si                ;palabra
	   loop tsrs1             ;procesar los 64 Words

	   mov  ah,51h            ;N§ Func.: obtener la direcci¢n del PSP
	   int  21h               ;llamar interrupci¢n DOS
	   mov  u_psp,bx          ;guardar la direcci¢n de segm. del PSP

	   mov  ah,2fh            ;N§ Func.: obtener direcc. DTA
	   int  21h               ;llamar interrupci¢n DOS
	   mov  u_dta_ofs,bx      ;guardar direcci¢n del DTA del programa
	   mov  u_dta_seg,es      ;interrumpido

	   mov  ah,50h            ;N§ func.: fijar direcci¢n del PSP
	   mov  bx,c_psp          ;obtener direcci¢n de segmento PSP del Programa C
	   int  21h               ;llamar interrupci¢n DOS

	   mov  ah,1ah            ;N§ func.: fijar direcc. DTA
	   mov  dx,c_dta_ofs      ;obtener direcc. de offset del nuevo DTA
	   mov  ds,c_dta_seg      ;y direcc. de segmento del nuevo DTA
	   int  21h               ;llamar interrupci¢n DOS

	   mov  ds,c_ds           ;registro de segmento para el Programa C
	   mov  es,c_es           ;pantalla

	   call [fkt_adr]         ;llamar la funci¢n icicial del programa C

	   ;-- realizar cambio de contexto del prog. interr. -----------

	   mov  ah,1ah            ;N§ func.: fijar direcc. DTA
	   mov  dx,u_dta_ofs      ;cargar direcc. de offset y segmento del
	   mov  ds,u_dta_seg      ;DTA del programa interrumpido
	   int  21h               ;llamar interrupci¢n DOS

	   mov  ah,50h            ;N§ func.: fijar direcci¢n del PSP
	   mov  bx,u_psp          ;direcc. de segm. PSP del prog. interr.
	   int  21h               ;llamar interrupci¢n DOS

	   ;-- restaurar de nuevo el Stack del DOS -----------------------

	   mov  cx,64             ;contador de bucle
	   mov  ds,uprg_ss        ;DS:SI con la direcci¢n final del Stack del DOS
	   mov  si,uprg_sp        ;del stack DOS
	   add  si,128            ;colocar SI al incio del Stack del DOS
tsrs2:     dec  si                ;SI a la palabra de Stack anterior
	   dec  si
	   pop  word ptr [si]     ;traer Word del Stack del C al Stack del DOS
	   loop tsrs2             ;procesar los 64 Words

	   pop  es                ;recuperar los registros guardados
	   pop  ds                ;recuperar Stack del C
	   pop  di
	   pop  si
	   pop  bp
	   pop  dx
	   pop  cx
	   pop  bx
	   pop  ax

	   cli                    ;no permitir interrupciones
	   mov  ss,uprg_ss        ;Volver a colocar el puntero de stack y
	   mov  sp,uprg_sp        ;el segm. de stack del prog. interr.

	   mov  tsractive,0       ;TSR ya no est  activo
	   sti                    ;permitir llamadas de interr.

	   ret                    ;volver al invocador

start_tsr  endp

;-------------------------------------------------------------------------

_text      ends                   ;Fin del segmento de c¢digo
	   end                    ;Fin del programa
