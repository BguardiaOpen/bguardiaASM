## Apéndice B: Reglas planteadas para el modelo del dominio

Existen dos tipos de "reglas" dentro del modelo del dominio: las gramaticales, y las del sistema experto de diagnóstico. Ambas están relacionadas y se presentan en este apéndice.

Se anexa a continuación la gramática simplificada de Lenguaje Ensamblador, utilizada para invocar las primeras reglas, corresponde al archivo ASM.GRM que utiliza LALR para generar el archivo PARSER.C.

<div style="border:solid windowtext 1.0pt;mso-border-alt:solid windowtext .5pt;
padding:1.0pt 4.0pt 1.0pt 4.0pt">

/*gramática TASM - modo MASM*/

/*Basada en manual de referencia TASM 2.0*/

/*TOKENS.*/

   _<error>_

   <identificador>  => KW_SEARCH

   <operador>    => OP_SEARCH

   <puntuacion>  => OP_SEARCH

   <numero>     => RegistraNumero

   <cadena>

   <caracter>

   <eol>

   <eof>

   <comentario>

   <backslash>

   /*Tokens de identificadores especiales regresados por la búsqueda en la tabla de símbolos*/

   <id_constante>

   <id_variable>

   <id_macro>

   <id_etiqueta>

   <id_proc>

/*KEYWORDS.*/

   .MODEL TINY SMALL MEDIUM COMPACT LARGE HUGE TPASCAL NEARSTACK FARSTACK

   END

   DB DW DD DQ DT DF DP

   AH AL BH BL CH CL DH DL

   AX BX CX DX

   SI DI

   SP BP

   CS DS ES SS

   BYTE WORD DWORD QWORD TBYTE NEAR FAR SHORT st1:place PARA PAGE

   /* AND OR XOR NOT */ /*son instrucciones adem s de directivas*/

   @CODE @CODESIZE @CPU @CURSEG @DATA @DATASIZE ??DATE @FARDATA

   @FARDATA? @FILENAME ??FILENAME @MODEL @STARTUP ??TIME ??VERSION

   @WORDSIZE

   DUP ?

   PROC ENDP

   NOTHING

   .186 .286 .286C .286P .287 .386 .386C .386P .387 .8086 .8087

   = ALIGN .ALPHA ARG ASSUME %BIN .CODE CODESEG COMM

   %CONDS .CONST CONST .CREF %CREF %CREFALL %CREFREF %CREFUREF %CTLS

   .DATA .DATA? DATASEG %DEPTH DISPLAY DOSSEG

   ELSE ELSEIF EMUL ENDIF ENDM ENDS EQU .ERR ERR .ERR1 .ERR2

   .ERRB .ERRDEF .ERRDIF .ERRDIFI .ERRE .ERRIDN .ERRIDNI ERRIF ERRIF1

   ERRIF2 ERRIFB ERRIFDEF ERRIFDIF ERRIFDIFI ERRIFE ERRIFIDN ERRIFIDNI

   ERRIFNB ERRIFNDEF .ERRNB .ERRNDEF .ERRNZ EVEN EVENDATA EXITM EXTRN

   .FARDATA .FARDATA? FARDATA GLOBAL GROUP IDEAL IF IF1 IF2 IFB IFDEF

   IFDIF IFDIFI <st1:city><st1:place>IFE</st1:place></st1:city> IFIDN IFIDNI IFNB IFNDEF %INCL INCLUDE INCLUDELIB

   IRP IRPC JUMPS LABEL .LALL .LFCOND %LINUM %LIST .LIST LOCAL

   LOCALS MACRO %MACS MASM MASM51 MODEL MULTERRS %NEWPAGE

   %NOCONDS %NOCREF %NOCTLS NOEMUL %NOINCL NOJUMPS %NOLIST NOLOCALS

   %NOMACS NOMASM51 NOMULTERRS %NOSYMS %NOTRUNC NOWARN ORG %OUT P186

   P286 P286N P286P P287 P386 P386N P386P P387 P8086 P8087

   %PAGESIZE %PCNT PNO87 %POPLCTL PUBLIC PUBLICDLL PURGE %PUSHLCTL

   QUIRKS .RADIX RADIX RECORD REPT .SALL SEGMENT .SEQ .SFCOND SIZESTR

   .STACK STACK .STARTUP STARTUPCODE STRUC SUBTTL %SUBTTL

   %SYMS %TABSIZE %TEXT .TFCOND TITLE %TITLE %TRUNC UDATASEG UFARDATA

   <st1:place>UNION</st1:place> USES WARN .XALL .XCREF .XLIST

   AT COMMON MEMORY PRIVATE VIRTUAL

   ALN ASS BRK ICG LCO OPI OPP OPS OVF PDC PRO PQK RES TPI

   /* hasta aqu  fueron directivas, van las instrucciones propiamente

      dichas */

   AAA AAD AAM AAS ADC ADD AND CALL CBW CLC CLD CLI CMC CMP CMPS CMPSB

   CMPSW CWD DAA DAS DEC DIV ESC HLT IDIV IMUL IN INC INT INTO IRET

   JA JAE JB JBE JC JCXZ JE JG JGE JL JLE JNA JNAE JNB JNBE JNC JNE

   JNG JNGE JNL JNLE JNO JNP JNS JNZ JO JP JPE JPO JS JZ JMP LAHF LDS

   LEA LES LOCK LODS LODSB LODSW LOOP LOOPE LOOPZ LOOPNE LOOPNZ MOV MOVS

   MOVSB MOVSW MUL NEG NOP NOT OR OUT POP POPF PUSH PUSHF RCL RCR REP REPZ

   REPE REPNE REPNZ RET ROL ROR SAHF SAL SHL SAR SBB SCAS SCASB SCASW

   SHR STC STD STI STOS STOSB STOSW SUB TEST WAIT XCHG XLAT XOR

/*OPERATORS.*/

   LENGTH MASK OFFSET SEG SIZE WIDTH THIS

   HIGH LOW

* / MOD

  * -

   EQ GE GT LE LT NE

   PTR SYMTYPE .TYPE TYPE

/*PUNCTUATORS.*/

   . , : [ ] { } ( ) < >

/*NONTERMINALS.*/

   Linea

      -> LineaValida <eol>

   LineaValida

      -> Directiva

      -> Etiqueta LineaValida2

      -> LineaValida2

   /* producci n usada solamente para conservar correctamente el

      nombre del procedimiento */

   NombreProc

      -> <identificador>                        => RegistraNombrePROC

   Directiva

      -> .MODEL MemoryModel                     => AssertModel

      -> .MODEL ModelModifier MemoryModel       => AssertModel

      -> MODEL MemoryModel                      => AssertModel

      -> MODEL ModelModifier MemoryModel        => AssertModel

      -> <identificador> = ExpresionConstante

      -> <identificador> EQU ExpresionConstante

      -> END                                    => AssertEnd

      -> END <identificador>                    => AssertEnd

      -> <identificador> TipoDato ParamsDatos 

      -> NombreProc PROC                        => AssertPROC

      -> NombreProc ENDP                        => AssertENDP

      -> NombreProc PROC NEAR                   => AssertPROC

      -> NombreProc PROC FAR                    => AssertPROC

      -> <identificador> ENDS

      -> <identificador> GROUP ListaSegs

      -> ALIGN <numero>

      -> ARG ListaArgumentos

      -> ASSUME ListaAsume

      -> %BIN <numero>

      -> %DEPTH <numero>

      -> DISPLAY <cadena>

      -> %OUT Texto

      -> COMM DefVars                         

      -> EXTRN DefVars                        

      -> GLOBAL DefVars                       

      -> PUBLIC ListaArgsMacro

      -> PUBLICDLL ListaArgsMacro

      -> INCLUDE NombreArchivo

      -> INCLUDELIB NombreArchivo

      -> IRP <identificador> < ListaArgsMacro >

      -> IRPC <identificador> CadenamMacro

      -> <identificador> LABEL Cast

      -> %LINUM <numero>

      -> LOCAL ListaArgsMacro                  

      -> LOCAL ListaArgumentos

      -> <identificador> MACRO                

      -> <identificador> MACRO ListaArgsMacro 

      -> %NOCREF

      -> %NOCREF ListaArgsMacro

      -> ORG ExpresionConstante

      -> PAGE <numero> , <numero>

      -> PAGE <numero>

      -> PAGE , <numero>

      -> PAGESIZE <numero> , <numero>

      -> PAGESIZE <numero>

      -> PAGESIZE , <numero>

      -> PAGE +

      -> %PCNT <numero>

      -> PURGE ListaArgsMacro

      -> .RADIX ExpresionConstante

      -> <identificador> RECORD Campo

      -> REPT ExpresionConstante

      -> .STACK <numero>                                => AssertStack

      -> <identificador> SIZESTR <identificador>

      -> <identificador> SIZESTR CadenaMacro   

      -> <identificador> STRUC                 

      -> SUBTTL Texto

      -> %SUBTTL <cadena>

      -> %TABSIZE <numero>

      -> %TEXT <numero>

      -> TITLE Texto

      -> %TITLE <cadena>

      -> <identificador> UNION

      -> USES ListaArgsMacro

      -> NOWARN WarnClass

      -> WARN WarnClass

      -> DirErrorID <identificador>

      -> DirErrorArg < ArgumentoMacro >

      -> DirErrorComp < ArgumentoMacro > , < ArgumentoMacro >

      -> DirErrorExpr ExpresionConstante

      -> DirectivaSimple

      -> DirectivaSegmento

      -> DefSegmento

   Texto

      -> Texto ElementoTexto

      -> ElementoTexto

   ElementoTexto

      -> <cadena>

   CadenaMacro

      -> <cadena>

      -> < ListaCarsMacro >

   ListaCarsMacro

      -> CarMacro

      -> ListaCarsMacro , CarMacro

   CarMacro

      -> <caracter>

      -> <numero>

   DefSegmento

      -> <identificador> SEGMENT

      -> <identificador> SEGMENT Alineacion

      -> <identificador> SEGMENT Alineacion Combinar

      -> <identificador> SEGMENT Alineacion Combinar <cadena>

   Alineacion

      -> BYTE

      -> WORD

      -> DWORD

      -> PARA

      -> PAGE

   Combinar

      -> AT ExpresionConstante

      -> COMMON

      -> MEMORY

      -> PRIVATE

      -> PUBLIC

      -> STACK

      -> VIRTUAL

   Campo

      -> <identificador> : <numero>

      -> <identificador> : <numero> = <numero>

   ListaArgsMacro

      -> ArgumentoMacro

      -> ListaArgsMacro , ArgumentoMacro

   ArgumentoMacro

      -> <identificador>

      -> Registro

      -> <caracter>

   NombreArchivo

      -> NombreArchivoFin

      -> Trayectoria NombreArchivoFin

      -> Drive Trayectoria NombreArchivoFin

   Trayectoria

      -> Trayectoria2

      -> Trayectoria Trayectoria2

   Trayectoria2

      -> NombreArchivoFin <backslash>

   NombreArchivoFin

      -> <identificador>

      -> <identificador> . <identificador>

   ListaSegs

      -> <identificador>

      -> ListaSegs , <identificador>

   DirErrorID

      -> .ERRDEF

      -> ERRIFDEF

      -> ERRIFNDEF

      -> .ERRNDEF

      -> IFDEF

      -> IFNDEF

   DirErrorArg

      -> .ERRB

      -> ERRIFB

      -> ERRIFNB

      -> .ERRNB

      -> IFB

      -> IFNB

   DirErrorComp

      -> .ERRDIF

      -> .ERRDIFI

      -> .ERRIDN

      -> .ERRIDNI

      -> ERRIFDIF

      -> ERRIFDIFI

      -> ERRIFIDN

      -> ERRIFIDNI

      -> IFDIF

      -> IFDIFI

      -> IFIDN

      -> IFIDNI

   DirErrorExpr

      -> .ERRE

      -> ERRIF

      -> ERRIF1

      -> ERRIF2

      -> ERRIFE

      -> .ERRNZ

      -> IF

      -> IFE

   ListaAsume

      -> NOTHING

      -> Segmento : NOTHING

      -> AsumeSimple

      -> ListaAsume , AsumeSimple

   AsumeSimple

      -> Segmento : <identificador>

   ListaArgumentos

      -> Argumento

      -> ListaArgumentos , Argumento

   Argumento

      -> <identificador> : Cast

      -> <identificador> : Cast : <numero>

   DirectivaSegmento

      -> DirectivaSegSimple

      -> DirectivaSegSimple <identificador>

   DirectivaSegSimple

      -> .CODE                                          => AssertCode

      -> CODESEG                                        => AssertCode

      -> .DATA                                          => AssertData

      -> .DATA?                                         => AssertData

      -> DATASEG                                        => AssertData

      -> .FARDATA

      -> .FARDATA?

      -> FARDATA

   DirectivaSimple

      -> .186

      -> .286

      -> .286C

      -> .286P

      -> .287

      -> .386

      -> .386C

      -> .386P

      -> .387

      -> .8086

      -> .8087

      -> .ALPHA

      -> %CONDS

      -> .CONST

      -> CONST

      -> .CREF

      -> %CREF

      -> %CREFALL

      -> %CREFREF

      -> %CREFUREF

      -> %CTLS

      -> DOSSEG

      -> ELSE

      -> ELSEIF

      -> EMUL

      -> ENDIF

      -> ENDM

      -> .ERR

      -> ERR

      -> .ERR1

      -> .ERR2

      -> .ERRDEF

      -> .ERRDIF

      -> .ERRDIFI

      -> EVEN

      -> EVENDATA

      -> EXITM

      -> IDEAL

      -> IF1

      -> IF2

      -> %INCL

      -> JUMPS

      -> .LALL

      -> .LFCOND

      -> %LIST

      -> .LIST

      -> LOCALS

      -> %MACS

      -> MASM

      -> MASM51

      -> MULTERRS

      -> %NEWPAGE

      -> %NOCONDS

      -> %NOCTLS

      -> NOEMUL

      -> %NOINCL

      -> NOJUMPS

      -> %NOLIST

      -> NOLOCALS

      -> %NOMACS

      -> NOMASM51

      -> NOMULTERRS

      -> %NOSYMS

      -> %NOTRUNC

      -> NOWARN

      -> P186

      -> P286

      -> P286N

      -> P286P

      -> P287

      -> P386

      -> P386N

      -> P386P

      -> P387

      -> P8086

      -> P8087

      -> PAGE

      -> PNO87

      -> %POPLCTL

      -> %PUSHLCTL

      -> QUIRKS

      -> RADIX

      -> .SALL

      -> .SEQ

      -> .SFCOND

      -> STACK                                               => AssertStack

      -> .STARTUP

      -> STARTUPCODE

      -> %SYMS

      -> .TFCOND

      -> %TRUNC

      -> UDATASEG

      -> UFARDATA

      -> .XALL

      -> .XCREF

      -> .XLIST

   WarnClass

      -> ALN

      -> ASS

      -> BRK

      -> ICG

      -> LCO

      -> OPI

      -> OPP

      -> OPS

      -> OVF

      -> PDC

      -> PRO

      -> PQK

      -> RES

      -> TPI

   DefVars

      -> DefVar

      -> DefVars , DefVar

   DefVar

      -> Argumento

      -> FAR Argumento

      -> NEAR Argumento

   ParamsDatos

      -> ParamsDatos , ParamDatos

      -> ParamDatos

   ParamDatos

      -> ?

      -> ExpresionConstante

      -> <cadena>

      -> <caracter>

      -> ExpresionConstante DUP ( ParamsDatos )

   TipoDato

      -> DB

      -> DW

      -> DD

      -> DF

      -> DQ

      -> DT

      -> DP

   MemoryModel

      -> TINY

      -> SMALL

      -> COMPACT

      -> MEDIUM

      -> LARGE

      -> HUGE

      -> TPASCAL

   ModelModifier

      -> NEARSTACK

      -> FARSTACK

   LineaValida2

      ->

      -> <comentario>

      -> Instruccion

      -> <identificador>

      -> <identificador> <comentario>

      -> <identificador> Params

      -> <identificador> Params <comentario>

   Params

      -> Params , Param

      -> Param

   Etiqueta

      -> <identificador> :     

   Param

      -> ExpresionConstante

      -> <cadena>

      -> <caracter>

      -> Registro

      -> Memoria

      -> Memoria . <identificador>

      -> Cast PTR Memoria

   Cast

      -> BYTE

      -> WORD

      -> DWORD

      -> QWORD

      -> TBYTE

      -> NEAR

      -> FAR

      -> LARGE

      -> SHORT

   Registro

      -> RegistroByte

      -> RegistroWord

   RegistroByte

      -> AL

      -> AH

      -> BL

      -> BH

      -> CL

      -> CH

      -> DL

      -> DH

   RegistroWordPG

      -> AX

      -> BX

      -> CX

      -> DX

   RegistroWord

      -> RegistroWordPG

      -> SI

      -> DI

      -> SP

      -> BP

   Segmento

      -> CS

      -> DS

      -> ES

      -> SS

   Memoria

      -> Segmento : Memoria2

      -> [ Segmento : ExpresionConstante ]

      -> [ Segmento : Indice ]

      -> [ Segmento : Base ]

      -> [ Segmento : Base + Indice ]

      -> [ Segmento : Base + Indice + ExpresionConstante ]

      -> <identificador>

      -> <identificador> Memoria2

      -> Memoria2

   Memoria2

      -> [ ExpresionConstante ]

      -> [ Indice ]

      -> [ Base ]

      -> [ Base + Indice ]

      -> [ Base + Indice + ExpresionConstante ]

   Base

      -> BX

      -> BP

   Indice

      -> SI                                    => RegistraUsoSI

      -> DI                                    => RegistraUsoDI

   ExpresionConstante

      -> ExpresionConstante2 Op ExpresionConstante

      -> OpUnario ExpresionConstante

      -> ( ExpresionConstante )

      -> ExpresionConstante2

   Op

      -> +

      -> -

      -> *

      -> /

      -> MOD

      -> AND

      -> OR

      -> XOR

      -> EQ

      -> GT

      -> GE

      -> LE

      -> LT

      -> NE

      -> SHL

      -> SHR

   OpUnario

      -> +

      -> -

      -> NOT

   Expresión Constante 2

      -> <numero>

      -> <identificador>                /* Buscarlo en tabla de constantes */

      -> OFFSET <identificador>

      -> LENGTH <identificador>

      -> SEG <identificador>

      -> SIZE <identificador>

      -> WIDTH ExpresionContante

      -> HIGH <identificador>

      -> LOW <identificador>

      -> MASK <identificador>

      -> SYMTYPE <identificador>

      -> .TYPE <identificador>

      -> TYPE <identificador>

      -> THIS Cast

      -> ConstantePredefinida

   ConstantePredefinida

      -> $

      -> @CODE

      -> @CODESIZE

      -> @CPU

      -> @CURSEG

      -> @DATA

      -> @DATASIZE

      -> ??DATE

      -> @FARDATA

      -> @FARDATA?

      -> @FILENAME

      -> ??FILENAME

      -> @MODEL

      -> @STARTUP

      -> ??TIME

      -> ??VERSION

      -> @WORDSIZE

   Instruccion

      -> JMP <identificador>            => AssertJMP

      -> INT <numero>                   => AssertINT

      -> Instruccion0Par     

      -> Instruccion1Par Operador1

      -> INC SI                         => RegistraIncrementoSI

      -> INC DI                         => RegistraIncrementoDI

      -> DEC SI                         => RegistraIncrementoSI

      -> DEC DI                         => RegistraIncrementoDI

      -> Rotacion

      -> POP Segmento

      -> PUSH Segmento

      -> Instruccion2Par DosParams

      -> Salto <identificador>

      -> IN AX , <numero>

      -> IN AL , <numero>

      -> IN AX , DX

      -> IN AL , DX

      -> OUT AX , <numero>

      -> OUT AL , <numero>

      -> OUT AX , DX

      -> OUT AL , DX

      -> XCHG DosParamsSinInmediato

   Instruccion0Par

      -> AAA

      -> AAD

      -> AAM

      -> AAS

      -> CBW

      -> CLC

      -> CLD

      -> CLI

      -> CMC

      -> CWD

      -> DAA

      -> DAS

      -> ESC

      -> HLT

      -> INTO

      -> IRET

      -> LAHF

      -> LOCK

      -> NOP

      -> POPF

      -> PUSHF

      -> InstruccionString

      -> REP InstruccionString

      -> REPE InstruccionString

      -> REPZ InstruccionString

      -> REPNE InstruccionString

      -> REPNZ InstruccionString

      -> RET                            => AssertRET

      -> SAHF

      -> STC

      -> STD

      -> STI

      -> WAIT

      -> XLAT

   InstruccionString

      -> CMPS

      -> CMPSB

      -> CMPSW

      -> LODS

      -> LODSB

      -> LODSW

      -> MOVS                           => AssertMOVS

      -> MOVSB                          => AssertMOVS

      -> MOVSW                          => AssertMOVS

      -> SCAS

      -> SCASB

      -> SCASW  

      -> STOS                           => AssertSTOS

      -> STOSB                          => AssertSTOS

      -> STOSW                          => AssertSTOS

   Instruccion1Par

      -> DEC

      -> DIV

      -> IDIV

      -> IMUL

      -> INC

      -> MUL

      -> NEG

      -> POP

      -> PUSH

   Salto

      -> CALL

      -> JMP

      -> JA

      -> JAE

      -> JB

      -> JBE

      -> JC

      -> JCXZ

      -> JE

      -> JG

      -> JGE

      -> JL

      -> JLE

      -> JNA

      -> JNAE

      -> JNB

      -> JNBE

      -> JNC

      -> JNE

      -> JNG

      -> JNGE

      -> JNL

      -> JNLE

      -> JNO

      -> JNP

      -> JNS

      -> JNZ

      -> JO

      -> JP

      -> JPE

      -> JPO

      -> JS

      -> JZ

      -> LOOP                           => AssertLOOP

      -> LOOPE

      -> LOOPNE

      -> LOOPZ

      -> LOOPNZ

   Instruccion2Par

      -> ADC

      -> ADD

      -> AND

      -> CMP

      -> LDS

      -> LEA

      -> LES

      -> MOV

      -> OR

      -> SBB

      -> SUB

      -> TEST

      -> XOR

   Rotacion

      -> RCL ParametroRot

      -> RCR ParametroRot

      -> ROR ParametroRot

      -> ROL ParametroRot

      -> SAL ParametroRot

      -> SHL ParametroRot

      -> SAR ParametroRot

      -> SHR ParametroRot

   ParametroRot

      -> Operador1 , <numero>            /* => Aqui ir a el que procese el error com n en SHifts */

      -> Operador1 , CL

   Operador1

      -> Registro

      -> Memoria

   DosParams

      -> Registro , Inmediato

      -> Memoria , Inmediato

      -> Memoria , Memoria               => AssertErrorMem

      -> DosParamsSinInmediato

   DosParamsSinInmediato

      -> Registro , Registro

      -> Registro , Segmento

      -> Registro , Memoria

      -> Memoria , Registro

      -> Segmento , Registro

   Inmediato

      -> <numero>

      -> ExpresionConstante

/*END.*/

</div>

Se anexa a continuación, un resumen del archivo de reglas del dominio (ASM.CLP), tal como se utiliz  en las primeras pruebas. Se encuentran en el lenguaje propio de CLIPS.

<div style="border:solid windowtext 1.0pt;mso-border-alt:solid windowtext .5pt;
padding:1.0pt 4.0pt 1.0pt 4.0pt">

;;;======================================================

;;;     Diagnostica algunos ejemplos simples de fallas del

;;;     conocimiento que ha absorbido el alumno

;;;

;;;     CLIPS Version 6.0

;;;

;;;     To execute, merely load, reset and run.

;;;======================================================

;;****************

;;*DEFFUNCTIONS*

;;****************

;;;

;;; Funciones, espec ficamente para registrar errores/aciertos y ligar con

;;; el modelo instruccional

;;;

(deffunction registra-error (?numconcepto ?numlinea)

   (incrementaexperiencia ?numconcepto 0 )

   (assert (concepto-asesorable ?numconcepto ?numlinea) )

)

(deffunction registra-acierto (?numconcepto)

   (incrementaexperiencia ?numconcepto 1 )

)

;;;******************************************************

;;;* REGLA 1: Falta una directiva base de estructura del programa

;;;******************************************************

;;; Primero, reglas que permitan subir el n mero de aciertos cuando se

;;; define alguna directiva correctamente...

(defrule hay-directiva-model "Se define un modelo de memoria"

   (definida directiva modelo)

   =>

   ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto

   (registra-acierto 6)

)

(defrule hay-directiva-stack "Se define la pila"

   (definida directiva stack)

   =>

   ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto

   (registra-acierto 7)

)

(defrule hay-directiva-data "Se define el segmento de datos"

   (definida directiva data)

   =>

   ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto

   (registra-acierto 8)

)

(defrule hay-directiva-code "Se define el segmento de c digo"

   (definida directiva code)

   =>

   ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto

   (registra-acierto 9)

)

(defrule hay-directiva-end "Se define el final del c digo fuente"

   (definida directiva end)

   =>

   ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto

   (registra-acierto 10)

)

(defrule falta-directiva-model "Falta definir un modelo de memoria"

   (not (definida directiva modelo))

   =>

   (assert (estado estructura-programa F))

   ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo

   (registra-error 6 0) ;;; Ideal si se pudiera poner la  ltima l nea

)

(defrule falta-directiva-stack "Falta reservar espacio para la pila"

   (not (definida directiva stack))

   =>

   (assert (estado estructura-programa F))

   ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo

   (registra-error 7 0) ;;; Ideal si se pudiera poner la  ltima l nea

)

(defrule falta-directiva-data "Falta definir el segmento donde ir n las variables"

   (not (definida directiva data))

   =>

   (assert (estado estructura-programa F))

   ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo

   (registra-error 8 0) ;;; Ideal si se pudiera poner la  ltima l nea

)

(defrule falta-directiva-code "Falta definir el segmento de c digo"

   (not (definida directiva code))

   =>

   (assert (estado estructura-programa F))

   ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo

   (registra-error 9 0) ;;; Ideal si se pudiera poner la  ltima l nea

)

(defrule falta-directiva-end "Falta definir el final del c digo fuente"

   (not (definida directiva end))

   =>

   (assert (estado estructura-programa F))

   ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo

   (registra-error 10 0) ;;; Ideal si se pudiera poner la  ltima l nea

)

(defrule sabe-estructurar-programa "El alumno ya cuenta con el esqueleto de estructura del programa"

   (not (estado estructura-programa ?))

   =>

   (assert (estado estructura-programa V))

   ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto

   (registra-acierto 4) ;;; Ideal si se pudiera poner la  ltima l nea

)

;;;******************************************************

;;;* REGLA 5: No se cerr  un PROC

;;;******************************************************

(defrule no-cerro-proc "Falta cerrar el procedimiento"

   (definida directiva proc ?nombre ?linea1)

   (not (definida directiva endp ?nombre ?linea2))

   =>

   (assert (falta-cerrar-procedimiento ?nombre))

   ;;; Concepto 3 = manejo de procedimientos, marcar un error

   (registra-error 11 ?linea1)

)

;;;******************************************************

;;;* REGLA 6: Se cerr  un PROC que no se hab a abierto

;;;******************************************************

(defrule no-abrio-proc "Se cierra un procedimiento no definido"

   (definida directiva endp ?nombre ?lin)

   (not (definida directiva proc ?nombre ?lin2))

   =>

   (assert (falta-abrir-procedimiento ?nombre))

   ;;; Concepto 3 = manejo de procedimientos, marcar un error

   (registra-error 12 ?lin )

)

;;;******************************************************

;;;* REGLA 7: No se termin  apropiadamente un PROC con RET, JMP o INT 21h

;;;* servicio 4Ch

;;;******************************************************

(defrule termino-bien-proc "No se termina apropiadamente el procedimiento"

   (definida directiva endp ?nombre ?lin)

;;;   (accion-instruccion (verbo "existe") (instruccion "RET") (numlinea =(- ?lin 1) ))

   (accion-instruccion "existe" "RET" =(- ?lin 1) )

   =>

   (assert (termino-bien-procedimiento ?nombre))

   ;;; Concepto 3 = manejo de procedimientos, manejo correcto

   (registra-acierto 13 )

)

(defrule termino-bien-proc-2 "No se termina apropiadamente el procedimiento"

   (definida directiva endp ?nombre ?lin)

;;;   (accion-instruccion (verbo "existe") (instruccion "JMP") (numlinea =(- ?lin 1) ) )

   (accion-instruccion "existe" "JMP" =(- ?lin 1) )

   =>

   (assert (termino-bien-procedimiento ?nombre))

   ;;; Concepto 3 = manejo de procedimientos, manejo correcto

   (registra-acierto 13 )

)

(defrule termino-bien-proc-3 "No se termina apropiadamente el procedimiento"

   (definida directiva endp ?nombre ?lin)

   (not (termino-bien-procedimiento ?nombre))

;;;   (accion-instruccion (verbo "existe") (instruccion "INT")

;;;        (numlinea =(- ?lin 1) ) (parametro_numero "21H") )

   (accion-instruccion "existe" "INT" =(- ?lin 1) "21H" )

   ;;; Checar que el servicio sea el 4Ch...

   =>

   (assert (termino-bien-procedimiento ?nombre))

   ;;; Concepto 3 = manejo de procedimientos, manejo correcto

   (registra-acierto 13 )

)

(defrule no-termino-bien-proc "No se termina apropiadamente el procedimiento"

   (definida directiva proc ?nombre ?lin)

   (not (termino-bien-procedimiento ?nombre))

   (definida directiva endp ?nombre ?lin2)

   =>

   (assert (no-termino-bien-procedimiento ?nombre))

   ;;; Concepto 3 = manejo de procedimientos, error com n

   (registra-error 13 ?lin2)

)

(defrule checar "hay error de sintaxis?"

   (error-sintaxis ?x)

   =>

   (registra-error 5 ?x)

)

;;;***************************************************************

;;;* REGLA 64: Reglas de optimizaci n de instrucciones de Strings

;;;***************************************************************

;;;* Faltante: validar que la etiqueta del loop corresponda...

;;;***************************************************************

(defrule se-puede-rep-1 "Puede usarse REP"

   (accion-instruccion "existe" "LOOP" ?lin )

   (accion-instruccion "existe" "STOS" =(- ?lin 1) )

   =>

   ;;; Concepto 14 - uso de REP para optimizar instr. Strings

   (registra-error 14 ?lin)

)

(defrule se-puede-rep-2 "Puede usarse REP"

   (accion-instruccion "existe" "LOOP" ?lin )

   (accion-instruccion "existe" "MOVS" =(- ?lin 1) )

   =>

   ;;; Concepto 14 - uso de REP para optimizar instr. Strings

   (registra-error 14 ?lin)

)

(defrule memoria-memoria "hay error de memoria-memoria"

   (error-memoria ?x)

   =>

   (registra-error 15 ?x)

)

(defrule se-puede-usar-string-1 "Puede usarse instruccion de string"

   (accion-instruccion "usado-indice" ?lin ?indice )

   (accion-instruccion "avanza-indice" ?lin2 ?indice )

   =>

   ( if ( < (abs (- ?lin ?lin2)) 5 ) then

           ;;; Concepto 1 - manejo de instrucciones de strings

           (registra-error 1 ?lin)

   )

)
