## Apéndice B: Reglas planteadas para el modelo del dominio

<span lang="ES">Existen dos tipos de "reglas" dentro del modelo del dominio: las gramaticales, y las del sistema experto de diagnóstico. Ambas están relacionadas y se presentan en este apéndice.</span>

<span lang="ES"></span>

<span lang="ES">Se anexa a continuación la gramática simplificada de Lenguaje Ensamblador, utilizada para invocar las primeras reglas, corresponde al archivo ASM.GRM que utiliza LALR para generar el archivo PARSER.C.</span>

<span lang="ES"></span>

<div style="border:solid windowtext 1.0pt;mso-border-alt:solid windowtext .5pt;
padding:1.0pt 4.0pt 1.0pt 4.0pt">

<span lang="ES">/* gramática TASM - modo MASM */</span>

<span lang="ES">/* Basada en manual de referencia TASM 2.0 */</span>

<span lang="ES"></span>

<span lang="ES">/* TOKENS. */</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <error></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <identificador><span style="mso-spacerun:yes"> </span> => KW_SEARCH</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <operador><span style="mso-spacerun:yes">   </span> => OP_SEARCH</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <puntuacion><span style="mso-spacerun:yes"> </span> => OP_SEARCH</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <numero><span style="mso-spacerun:yes">    </span> => RegistraNumero</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <cadena></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <caracter></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <eol></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <eof></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <comentario></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> <backslash></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> /* Tokens de identificadores especiales regresados por la búsqueda</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> en la tabla de símbolos */</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> </span><span style="mso-ansi-language:EN-US"><id_constante><span style="mso-spacerun:yes">      </span></span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> <id_variable><span style="mso-spacerun:yes">      </span></span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> <id_macro><span style="mso-spacerun:yes">         </span></span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> <id_etiqueta><span style="mso-spacerun:yes">         </span></span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> <id_proc><span style="mso-spacerun:yes">     </span></span>

<span style="mso-ansi-language:EN-US"></span>

<span style="mso-ansi-language:EN-US">/* KEYWORDS. */</span>

<span style="mso-ansi-language:EN-US"></span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> .MODEL TINY SMALL MEDIUM COMPACT LARGE HUGE TPASCAL NEARSTACK FARSTACK</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> END</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> DB DW DD DQ DT DF DP</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> </span><span lang="ES">AH AL BH BL CH CL DH DL</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> AX BX CX DX</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> SI DI</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> SP BP</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> CS DS ES SS</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> </span><span style="mso-ansi-language:EN-US">BYTE WORD DWORD QWORD TBYTE NEAR FAR SHORT</span> st1:place <span style="mso-ansi-language:EN-US">PARA</span></st1:place> <span style="mso-ansi-language:
EN-US">PAGE</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> /* AND OR XOR NOT */ /* son instrucciones adem s de directivas */</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> @CODE @CODESIZE @CPU @CURSEG @DATA @DATASIZE ??DATE @FARDATA</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> @FARDATA? @FILENAME ??FILENAME @MODEL @STARTUP ??TIME ??VERSION</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> @WORDSIZE</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> DUP ?</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> PROC ENDP</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> NOTHING</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> .186 .286 .286C .286P .287 .386 .386C .386P .387 .8086 .8087</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> = ALIGN .ALPHA ARG ASSUME %BIN .CODE CODESEG COMM</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> %CONDS .CONST CONST .CREF %CREF %CREFALL %CREFREF %CREFUREF %CTLS</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> .DATA .DATA? DATASEG %DEPTH DISPLAY DOSSEG</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> ELSE ELSEIF EMUL ENDIF ENDM ENDS EQU .ERR ERR .ERR1 .ERR2</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> </span><span lang="ES">.ERRB .ERRDEF .ERRDIF .ERRDIFI .ERRE .ERRIDN .ERRIDNI ERRIF ERRIF1</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ERRIF2 ERRIFB ERRIFDEF ERRIFDIF ERRIFDIFI ERRIFE ERRIFIDN ERRIFIDNI</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ERRIFNB ERRIFNDEF .ERRNB .ERRNDEF .ERRNZ EVEN EVENDATA EXITM EXTRN</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> </span><span style="mso-ansi-language:EN-US">.FARDATA .FARDATA? FARDATA GLOBAL GROUP IDEAL IF IF1 IF2 IFB IFDEF</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes"> </span><span style="mso-spacerun:yes"> </span> IFDIF IFDIFI</span> <st1:city><st1:place><span style="mso-ansi-language:EN-US">IFE</span></st1:place></st1:city> <span style="mso-ansi-language:EN-US">IFIDN IFIDNI IFNB IFNDEF %INCL INCLUDE INCLUDELIB</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> IRP IRPC JUMPS LABEL .LALL .LFCOND %LINUM %LIST .LIST LOCAL</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> LOCALS MACRO %MACS MASM MASM51 MODEL MULTERRS %NEWPAGE</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> %NOCONDS %NOCREF %NOCTLS NOEMUL %NOINCL NOJUMPS %NOLIST NOLOCALS</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> %NOMACS NOMASM51 NOMULTERRS %NOSYMS %NOTRUNC NOWARN ORG %OUT P186</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> P286 P286N P286P P287 P386 P386N P386P P387 P8086 P8087</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> %PAGESIZE %PCNT PNO87 %POPLCTL PUBLIC PUBLICDLL PURGE %PUSHLCTL</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> QUIRKS .RADIX RADIX RECORD REPT .SALL SEGMENT .SEQ .SFCOND SIZESTR</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> .STACK STACK .STARTUP STARTUPCODE STRUC SUBTTL %SUBTTL</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> %SYMS %TABSIZE %TEXT .TFCOND TITLE %TITLE %TRUNC UDATASEG UFARDATA</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> </span><st1:place><span style="mso-ansi-language:
 EN-US">UNION</span></st1:place> <span style="mso-ansi-language:EN-US">USES WARN .XALL .XCREF .XLIST</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> AT COMMON MEMORY PRIVATE VIRTUAL</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> ALN ASS BRK ICG LCO OPI OPP OPS OVF PDC PRO PQK RES TPI</span>

<span style="mso-ansi-language:EN-US"></span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">  </span> </span><span lang="ES">/* hasta aqu  fueron directivas, van las instrucciones propiamente</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> dichas */</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> AAA AAD AAM AAS ADC ADD AND CALL CBW CLC CLD CLI CMC CMP CMPS CMPSB</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> CMPSW CWD DAA DAS DEC DIV ESC HLT IDIV IMUL IN INC INT INTO IRET</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> JA JAE JB JBE JC JCXZ JE JG JGE JL JLE JNA JNAE JNB JNBE JNC JNE</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> JNG JNGE JNL JNLE JNO JNP JNS JNZ JO JP JPE JPO JS JZ JMP LAHF LDS</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> LEA LES LOCK LODS LODSB LODSW LOOP LOOPE LOOPZ LOOPNE LOOPNZ MOV MOVS</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> MOVSB MOVSW MUL NEG NOP NOT OR OUT POP POPF PUSH PUSHF RCL RCR REP REPZ</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> REPE REPNE REPNZ RET ROL ROR SAHF SAL SHL SAR SBB SCAS SCASB SCASW</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> SHR STC STD STI STOS STOSB STOSW SUB TEST WAIT XCHG XLAT XOR</span>

<span lang="ES"></span>

<span lang="ES">/* OPERATORS. */</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> LENGTH MASK OFFSET SEG SIZE WIDTH THIS</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> HIGH LOW</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> * / MOD</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> + -</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> EQ GE GT LE LT NE</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> PTR SYMTYPE .TYPE TYPE</span>

<span lang="ES"></span>

<span lang="ES">/* PUNCTUATORS. */</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> . , : [ ] { } ( ) < ></span>

<span lang="ES"></span>

<span lang="ES">/* NONTERMINALS. */</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Linea</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LineaValida <eol></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> LineaValida</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Directiva</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Etiqueta LineaValida2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LineaValida2</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> /* producci n usada solamente para conservar correctamente el</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> nombre del procedimiento */</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> NombreProc</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador><span style="mso-spacerun:yes">                       </span> => RegistraNombrePROC</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Directiva</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .MODEL MemoryModel<span style="mso-spacerun:yes">                    </span> => AssertModel</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .MODEL ModelModifier MemoryModel<span style="mso-spacerun:yes">      </span> => AssertModel</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MODEL MemoryModel<span style="mso-spacerun:yes">                     </span> => AssertModel</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MODEL ModelModifier MemoryModel<span style="mso-spacerun:yes">       </span> => AssertModel</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> = ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> EQU ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> END<span style="mso-spacerun:yes">                                   </span> => AssertEnd</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> END <identificador><span style="mso-spacerun:yes">                   </span> => AssertEnd</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> TipoDato ParamsDatos<span style="mso-spacerun:yes"> </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NombreProc PROC<span style="mso-spacerun:yes">                       </span> => AssertPROC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NombreProc ENDP<span style="mso-spacerun:yes">                       </span> => AssertENDP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NombreProc PROC NEAR<span style="mso-spacerun:yes">                  </span> => AssertPROC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NombreProc PROC FAR<span style="mso-spacerun:yes">                   </span> => AssertPROC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> ENDS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> GROUP ListaSegs</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ALIGN <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ARG ListaArgumentos</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ASSUME ListaAsume</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %BIN <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %DEPTH <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DISPLAY <cadena></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %OUT Texto</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> COMM DefVars<span style="mso-spacerun:yes">                         </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> EXTRN DefVars<span style="mso-spacerun:yes">                        </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> GLOBAL DefVars<span style="mso-spacerun:yes">                       </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PUBLIC ListaArgsMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PUBLICDLL ListaArgsMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> INCLUDE NombreArchivo</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> INCLUDELIB NombreArchivo</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IRP <identificador> < ListaArgsMacro ></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IRPC <identificador> CadenamMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> LABEL Cast</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %LINUM <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOCAL ListaArgsMacro<span style="mso-spacerun:yes">                  </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOCAL ListaArgumentos</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> MACRO<span style="mso-spacerun:yes">                </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> MACRO ListaArgsMacro<span style="mso-spacerun:yes"> </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NOCREF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NOCREF ListaArgsMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ORG ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PAGE <numero> , <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PAGE <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PAGE , <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PAGESIZE <numero> , <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PAGESIZE <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PAGESIZE , <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PAGE +</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %PCNT <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PURGE ListaArgsMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .RADIX ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> RECORD Campo</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> REPT ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .STACK <numero><span style="mso-spacerun:yes">                               </span> => AssertStack</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> SIZESTR <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> SIZESTR CadenaMacro<span style="mso-spacerun:yes">   </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> STRUC<span style="mso-spacerun:yes">                 </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SUBTTL Texto</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %SUBTTL <cadena></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %TABSIZE <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %TEXT <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> TITLE Texto</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %TITLE <cadena></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> UNION</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> USES ListaArgsMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOWARN WarnClass</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> WARN WarnClass</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DirErrorID <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DirErrorArg < ArgumentoMacro ></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DirErrorComp < ArgumentoMacro > , < ArgumentoMacro ></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DirErrorExpr ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DirectivaSimple</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DirectivaSegmento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DefSegmento</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Texto</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Texto ElementoTexto</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ElementoTexto</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ElementoTexto</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <cadena></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> CadenaMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <cadena></span>

<span lang="ES"><span style="mso-spacerun:yes"> </span> <span style="mso-spacerun:yes">    </span>-> < ListaCarsMacro ></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ListaCarsMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CarMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ListaCarsMacro , CarMacro</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> CarMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <caracter></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <numero></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DefSegmento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> SEGMENT</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> SEGMENT Alineacion</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> SEGMENT Alineacion Combinar</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> SEGMENT Alineacion Combinar <cadena></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Alineacion</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> BYTE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> WORD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DWORD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PARA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PAGE</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Combinar</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AT ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> COMMON</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MEMORY</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PRIVATE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PUBLIC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> STACK</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> VIRTUAL</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Campo</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> : <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> : <numero> = <numero></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ListaArgsMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ArgumentoMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ListaArgsMacro , ArgumentoMacro</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ArgumentoMacro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Registro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <caracter></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> NombreArchivo</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NombreArchivoFin</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Trayectoria NombreArchivoFin</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Drive Trayectoria NombreArchivoFin</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Trayectoria</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Trayectoria2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Trayectoria Trayectoria2</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Trayectoria2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NombreArchivoFin <backslash></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> NombreArchivoFin</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> . <identificador></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ListaSegs</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ListaSegs , <identificador></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DirErrorID</span>

<span lang="ES"><span style="mso-spacerun:yes">   </span> <span style="mso-spacerun:yes">  </span>-> .ERRDEF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIFDEF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIFNDEF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRNDEF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IFDEF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IFNDEF</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DirErrorArg</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIFB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIFNB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRNB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IFB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IFNB</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DirErrorComp</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRDIF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRDIFI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRIDN</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRIDNI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIFDIF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIFDIFI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIFIDN</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIFIDNI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IFDIF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IFDIFI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IFIDN</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IFIDNI</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DirErrorExpr</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIF1</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERRIF2</span>

<span lang="ES"><span style="mso-spacerun:yes">   </span> <span style="mso-spacerun:yes">  </span>-> ERRIFE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRNZ</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IFE</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ListaAsume</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOTHING</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Segmento : NOTHING</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AsumeSimple</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ListaAsume , AsumeSimple</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> AsumeSimple</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Segmento : <identificador></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ListaArgumentos</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Argumento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ListaArgumentos , Argumento</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Argumento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> : Cast</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> : Cast : <numero></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DirectivaSegmento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DirectivaSegSimple</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DirectivaSegSimple <identificador></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DirectivaSegSimple</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .CODE<span style="mso-spacerun:yes">                                         </span> => AssertCode</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CODESEG<span style="mso-spacerun:yes">                                       </span> => AssertCode</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .DATA<span style="mso-spacerun:yes">                                         </span> => AssertData</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .DATA?<span style="mso-spacerun:yes">                                        </span> => AssertData</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DATASEG<span style="mso-spacerun:yes">                                       </span> => AssertData</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .FARDATA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .FARDATA?</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> FARDATA</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DirectivaSimple</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .186</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .286</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .286C</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .286P</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .287</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .386</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .386C</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .386P</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .387</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .8086</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .8087</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ALPHA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %CONDS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .CONST</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CONST</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .CREF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %CREF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %CREFALL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %CREFREF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %CREFUREF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %CTLS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DOSSEG</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ELSE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ELSEIF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> EMUL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ENDIF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ENDM</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERR</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ERR</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERR1</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERR2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRDEF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRDIF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .ERRDIFI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> EVEN</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> EVENDATA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> EXITM</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IDEAL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IF1</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IF2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %INCL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JUMPS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .LALL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .LFCOND</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %LIST</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .LIST</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOCALS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %MACS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MASM</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MASM51</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MULTERRS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NEWPAGE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NOCONDS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NOCTLS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOEMUL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NOINCL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOJUMPS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NOLIST</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOLOCALS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NOMACS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOMASM51</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOMULTERRS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NOSYMS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %NOTRUNC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOWARN</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P186</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P286</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P286N</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P286P</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P287</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P386</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P386N</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P386P</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P387</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P8086</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> P8087</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PAGE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PNO87</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %POPLCTL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %PUSHLCTL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> QUIRKS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> RADIX</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .SALL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .SEQ</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .SFCOND</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> STACK<span style="mso-spacerun:yes">                                              </span> => AssertStack</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .STARTUP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> STARTUPCODE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %SYMS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .TFCOND</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> %TRUNC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> UDATASEG</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> UFARDATA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .XALL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .XCREF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .XLIST</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> WarnClass</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ALN</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ASS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> BRK</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ICG</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LCO</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OPI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OPP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OPS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OVF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PDC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PRO</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PQK</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> RES</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> TPI</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DefVars</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DefVar</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DefVars , DefVar</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DefVar</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Argumento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> FAR Argumento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NEAR Argumento</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ParamsDatos</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ParamsDatos , ParamDatos</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ParamDatos</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ParamDatos</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ?</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <cadena></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <caracter></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ExpresionConstante DUP ( ParamsDatos )</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> TipoDato</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DW</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DQ</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DT</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DP</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> MemoryModel</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> TINY</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SMALL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> COMPACT</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MEDIUM</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LARGE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> HUGE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> TPASCAL</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes"> </span><span style="mso-spacerun:yes"> </span> ModelModifier</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NEARSTACK</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> FARSTACK</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> LineaValida2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <comentario></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Instruccion</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> <comentario></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> Params</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> Params <comentario></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Params</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Params , Param</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Param</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Etiqueta</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> :<span style="mso-spacerun:yes">     </span></span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Param</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <cadena></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <caracter></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Registro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Memoria</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Memoria . <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Cast PTR Memoria</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Cast</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> BYTE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> WORD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DWORD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> QWORD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> TBYTE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NEAR</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> FAR</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LARGE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SHORT</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Registro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> RegistroByte</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> RegistroWord</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> RegistroByte</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AH</span>

<span lang="ES"><span style="mso-spacerun:yes"> </span><span style="mso-spacerun:yes">    </span> -> BL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> BH</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CH</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DH</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> RegistroWordPG</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AX</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> BX</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CX</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DX</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> RegistroWord</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> RegistroWordPG</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> BP</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Segmento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CS</span>

<span lang="ES"><span style="mso-spacerun:yes">   </span> <span style="mso-spacerun:yes">  </span>-> DS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ES</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SS</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Memoria</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Segmento : Memoria2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ Segmento : ExpresionConstante ]</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ Segmento : Indice ]</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ Segmento : Base ]</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ Segmento : Base + Indice ]</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ Segmento : Base + Indice + ExpresionConstante ]</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador> Memoria2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Memoria2</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Memoria2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ ExpresionConstante ]</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ Indice ]</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ Base ]</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ Base + Indice ]</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> [ Base + Indice + ExpresionConstante ]</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Base</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> BX</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> BP</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Indice</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SI<span style="mso-spacerun:yes">                                   </span> => RegistraUsoSI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DI<span style="mso-spacerun:yes">                                   </span> => RegistraUsoDI</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ExpresionConstante2 Op ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OpUnario ExpresionConstante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ( ExpresionConstante )</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ExpresionConstante2</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Op</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> +</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> -</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> *</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> /</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MOD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AND</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OR</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> XOR</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> EQ</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> GT</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> GE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LT</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SHL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SHR</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> OpUnario</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> +</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> -</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOT</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ExpresionConstante2</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <identificador><span style="mso-spacerun:yes">               </span> /* Buscarlo en tabla de constantes */</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OFFSET <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LENGTH <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SEG <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SIZE <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> WIDTH ExpresionContante</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> HIGH <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOW <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MASK <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SYMTYPE <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> .TYPE <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> TYPE <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> THIS Cast</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ConstantePredefinida</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ConstantePredefinida</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> $</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @CODE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @CODESIZE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @CPU</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @CURSEG</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @DATA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @DATASIZE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ??DATE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @FARDATA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @FARDATA?</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @FILENAME</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ??FILENAME</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @MODEL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @STARTUP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ??TIME</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ??VERSION</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> @WORDSIZE</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Instruccion</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JMP <identificador><span style="mso-spacerun:yes">           </span> => AssertJMP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> INT <numero><span style="mso-spacerun:yes">                  </span> => AssertINT</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Instruccion0Par<span style="mso-spacerun:yes">     </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Instruccion1Par Operador1</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> INC SI<span style="mso-spacerun:yes">                        </span> => RegistraIncrementoSI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> INC DI<span style="mso-spacerun:yes">                        </span> => RegistraIncrementoDI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DEC SI<span style="mso-spacerun:yes">                        </span> => RegistraIncrementoSI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DEC DI<span style="mso-spacerun:yes">                        </span> => RegistraIncrementoDI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Rotacion</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> POP Segmento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PUSH Segmento</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Instruccion2Par DosParams</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Salto <identificador></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IN AX , <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IN AL , <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IN AX , DX</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IN AL , DX</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OUT AX , <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OUT AL , <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OUT AX , DX</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OUT AL , DX</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> XCHG DosParamsSinInmediato</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Instruccion0Par</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AAA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AAD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AAM</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AAS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CBW</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CLC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CLD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CLI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CMC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CWD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DAA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DAS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ESC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> HLT</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> INTO</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IRET</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LAHF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOCK</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NOP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> POPF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PUSHF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> InstruccionString</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> REP InstruccionString</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> REPE InstruccionString</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> REPZ InstruccionString</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> REPNE InstruccionString</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> REPNZ InstruccionString</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> RET<span style="mso-spacerun:yes">                           </span> => AssertRET</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SAHF</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> STC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> STD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> STI</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> WAIT</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> XLAT</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> InstruccionString</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CMPS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CMPSB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CMPSW</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LODS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LODSB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LODSW</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MOVS<span style="mso-spacerun:yes">                          </span> => AssertMOVS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MOVSB<span style="mso-spacerun:yes">                         </span> => AssertMOVS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MOVSW<span style="mso-spacerun:yes">    </span> <span style="mso-spacerun:yes">                     </span>=> AssertMOVS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SCAS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SCASB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SCASW<span style="mso-spacerun:yes">  </span></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> STOS<span style="mso-spacerun:yes">                          </span> => AssertSTOS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> STOSB<span style="mso-spacerun:yes">                         </span> => AssertSTOS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> STOSW<span style="mso-spacerun:yes">                         </span> => AssertSTOS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Instruccion1Par</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DEC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DIV</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IDIV</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> IMUL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> INC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MUL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> NEG</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> POP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> PUSH</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Salto</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CALL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JMP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JAE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JBE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JCXZ</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JG</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JGE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JLE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNAE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNBE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNG</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNGE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNL</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNLE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNO</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JNZ</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JO</span>

<span lang="ES"><span style="mso-spacerun:yes">    </span> <span style="mso-spacerun:yes"> </span>-> JP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JPE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JPO</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> JZ</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOOP<span style="mso-spacerun:yes">                          </span> => AssertLOOP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOOPE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOOPNE</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOOPZ</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LOOPNZ</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Instruccion2Par</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ADC</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ADD</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> AND</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> CMP</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LDS</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LEA</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> LES</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> MOV</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> OR</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SBB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SUB</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> TEST</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> XOR</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Rotacion</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> RCL ParametroRot</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> RCR ParametroRot</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ROR ParametroRot</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ROL ParametroRot</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SAL ParametroRot</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SHL ParametroRot</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SAR ParametroRot</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> SHR ParametroRot</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ParametroRot</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Operador1 , <numero><span style="mso-spacerun:yes">           </span> /* => Aqui ir a el que procese el error com n en SHifts */</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Operador1 , CL</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Operador1</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Registro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Memoria</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DosParams</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Registro , Inmediato</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Memoria , Inmediato</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Memoria , Memoria<span style="mso-spacerun:yes">              </span> => AssertErrorMem</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> DosParamsSinInmediato</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> DosParamsSinInmediato</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Registro , Registro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Registro , Segmento</span>

<span lang="ES"><span style="mso-spacerun:yes">   </span> <span style="mso-spacerun:yes">  </span>-> Registro , Memoria</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Memoria , Registro</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> Segmento , Registro</span>

<span lang="ES"></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> Inmediato</span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> <numero></span>

<span lang="ES"><span style="mso-spacerun:yes">     </span> -> ExpresionConstante</span>

<span lang="ES"></span>

<span lang="ES">/* END. */</span>

<span lang="ES"></span>

</div>

<span lang="ES"></span>

<span lang="ES"></span>

<span lang="ES">Se anexa a continuación, un resumen del archivo de reglas del dominio (ASM.CLP), tal como se utiliz  en las primeras pruebas. Se encuentran en el lenguaje propio de CLIPS.</span>

<span lang="ES"></span>

<div style="border:solid windowtext 1.0pt;mso-border-alt:solid windowtext .5pt;
padding:1.0pt 4.0pt 1.0pt 4.0pt">

<span lang="ES">;;;======================================================</span>

<span lang="ES">;;;<span style="mso-spacerun:yes">    </span> Diagnostica algunos ejemplos simples de fallas del</span>

<span lang="ES">;;;<span style="mso-spacerun:yes">    </span> conocimiento que ha absorbido el alumno</span>

<span lang="ES">;;;</span>

<span lang="ES">;;;<span style="mso-spacerun:yes">    </span> CLIPS Version 6.0</span>

<span lang="ES">;;;</span>

<span lang="ES">;;;<span style="mso-spacerun:yes">    </span> To execute, merely load, reset and run.</span>

<span lang="ES">;;;======================================================</span>

<span lang="ES"></span>

<span lang="ES">;;****************</span>

<span lang="ES">;;* DEFFUNCTIONS *</span>

<span lang="ES">;;****************</span>

<span lang="ES"></span>

<span lang="ES">;;;</span>

<span lang="ES">;;; Funciones, espec ficamente para registrar errores/aciertos y ligar con</span>

<span lang="ES">;;; el modelo instruccional</span>

<span lang="ES">;;;</span>

<span lang="ES"></span>

<span lang="ES">(deffunction registra-error (?numconcepto ?numlinea)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (incrementaexperiencia ?numconcepto 0 )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (concepto-asesorable ?numconcepto ?numlinea) )</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(deffunction registra-acierto (?numconcepto)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (incrementaexperiencia ?numconcepto 1 )</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">;;;******************************************************</span>

<span lang="ES">;;;* REGLA 1: Falta una directiva base de estructura del programa</span>

<span lang="ES">;;;******************************************************</span>

<span lang="ES"></span>

<span lang="ES">;;; Primero, reglas que permitan subir el n mero de aciertos cuando se</span>

<span lang="ES">;;; define alguna directiva correctamente...</span>

<span lang="ES">(defrule hay-directiva-model "Se define un modelo de memoria"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva modelo)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-acierto 6)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule hay-directiva-stack "Se define la pila"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva stack)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-acierto 7)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule hay-directiva-data "Se define el segmento de datos"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva data)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-acierto 8)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule hay-directiva-code "Se define el segmento de c digo"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva code)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-acierto 9)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule hay-directiva-end "Se define el final del c digo fuente"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva end)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-acierto 10)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule falta-directiva-model "Falta definir un modelo de memoria"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (definida directiva modelo))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (estado estructura-programa F))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 6 0) ;;; Ideal si se pudiera poner la  ltima l nea</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule falta-directiva-stack "Falta reservar espacio para la pila"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (definida directiva stack))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (estado estructura-programa F))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 7 0) ;;; Ideal si se pudiera poner la  ltima l nea</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule falta-directiva-data "Falta definir el segmento donde ir n las variables"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (definida directiva data))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (estado estructura-programa F))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 8 0) ;;; Ideal si se pudiera poner la  ltima l nea</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule falta-directiva-code "Falta definir el segmento de c digo"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (definida directiva code))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (estado estructura-programa F))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 9 0) ;;; Ideal si se pudiera poner la  ltima l nea</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule falta-directiva-end "Falta definir el final del c digo fuente"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (definida directiva end))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (estado estructura-programa F))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo err neo</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 10 0) ;;; Ideal si se pudiera poner la  ltima l nea</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule sabe-estructurar-programa "El alumno ya cuenta con el esqueleto de estructura del programa"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (estado estructura-programa ?))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (estado estructura-programa V))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 4 = manejo de la estructura del programa, manejo correcto</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-acierto 4) ;;; Ideal si se pudiera poner la  ltima l nea</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">;;;******************************************************</span>

<span lang="ES">;;;* REGLA 5: No se cerr  un PROC</span>

<span lang="ES">;;;******************************************************</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span></span>

<span lang="ES">(defrule no-cerro-proc "Falta cerrar el procedimiento"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva proc ?nombre ?linea1)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (definida directiva endp ?nombre ?linea2))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (falta-cerrar-procedimiento ?nombre))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 3 = manejo de procedimientos, marcar un error</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 11 ?linea1)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">;;;******************************************************</span>

<span lang="ES">;;;* REGLA 6: Se cerr  un PROC que no se hab a abierto</span>

<span lang="ES">;;;******************************************************</span>

<span lang="ES"></span>

<span lang="ES">(defrule no-abrio-proc "Se cierra un procedimiento no definido"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva endp ?nombre ?lin)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (definida directiva proc ?nombre ?lin2))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (falta-abrir-procedimiento ?nombre))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 3 = manejo de procedimientos, marcar un error</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 12 ?lin )</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">;;;******************************************************</span>

<span lang="ES">;;;* REGLA 7: No se termin  apropiadamente un PROC con RET, JMP o INT 21h</span>

<span lang="ES">;;;* servicio 4Ch</span>

<span lang="ES">;;;******************************************************</span>

<span lang="ES"></span>

<span lang="ES">(defrule termino-bien-proc "No se termina apropiadamente el procedimiento"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva endp ?nombre ?lin)</span>

<span lang="ES">;;;<span style="mso-spacerun:yes">  </span> (accion-instruccion (verbo "existe") (instruccion "RET") (numlinea =(- ?lin 1) ))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (accion-instruccion "existe" "RET" =(- ?lin 1) )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (termino-bien-procedimiento ?nombre))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 3 = manejo de procedimientos, manejo correcto</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-acierto 13 )</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule termino-bien-proc-2 "No se termina apropiadamente el procedimiento"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva endp ?nombre ?lin)</span>

<span lang="ES">;;;<span style="mso-spacerun:yes">  </span> (accion-instruccion (verbo "existe") (instruccion "JMP") (numlinea =(- ?lin 1) ) )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (accion-instruccion "existe" "JMP" =(- ?lin 1) )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (termino-bien-procedimiento ?nombre))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 3 = manejo de procedimientos, manejo correcto</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-acierto 13 )</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule termino-bien-proc-3 "No se termina apropiadamente el procedimiento"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva endp ?nombre ?lin)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (termino-bien-procedimiento ?nombre))</span>

<span lang="ES">;;;<span style="mso-spacerun:yes">  </span> (accion-instruccion (verbo "existe") (instruccion "INT")</span>

<span lang="ES">;;;<span style="mso-spacerun:yes">       </span> (numlinea =(- ?lin 1) ) (parametro_numero "21H") )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (accion-instruccion "existe" "INT" =(- ?lin 1) "21H" )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Checar que el servicio sea el 4Ch...</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (termino-bien-procedimiento ?nombre))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 3 = manejo de procedimientos, manejo correcto</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-acierto 13 )</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule no-termino-bien-proc "No se termina apropiadamente el procedimiento"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva proc ?nombre ?lin)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (not (termino-bien-procedimiento ?nombre))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (definida directiva endp ?nombre ?lin2)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (assert (no-termino-bien-procedimiento ?nombre))</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 3 = manejo de procedimientos, error com n</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 13 ?lin2)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule checar "hay error de sintaxis?"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (error-sintaxis ?x)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 5 ?x)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">;;;***************************************************************</span>

<span lang="ES">;;;* REGLA 64: Reglas de optimizaci n de instrucciones de Strings</span>

<span lang="ES">;;;***************************************************************</span>

<span lang="ES">;;;* Faltante: validar que la etiqueta del loop corresponda...</span>

<span lang="ES">;;;***************************************************************</span>

<span lang="ES"></span>

<span lang="ES">(defrule se-puede-rep-1 "Puede usarse REP"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (accion-instruccion "existe" "LOOP" ?lin )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (accion-instruccion "existe" "STOS" =(- ?lin 1) )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 14 - uso de REP para optimizar instr. Strings</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 14 ?lin)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule se-puede-rep-2 "Puede usarse REP"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (accion-instruccion "existe" "LOOP" ?lin )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (accion-instruccion "existe" "MOVS" =(- ?lin 1) )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ;;; Concepto 14 - uso de REP para optimizar instr. Strings</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 14 ?lin)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule memoria-memoria "hay error de memoria-memoria"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (error-memoria ?x)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (registra-error 15 ?x)</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(defrule se-puede-usar-string-1 "Puede usarse instruccion de string"</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (accion-instruccion "usado-indice" ?lin ?indice )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> (accion-instruccion "avanza-indice" ?lin2 ?indice )</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> ( if ( < (abs (- ?lin ?lin2)) 5 ) then</span>

<span lang="ES"><span style="mso-spacerun:yes">          </span> ;;; Concepto 1 - manejo de instrucciones de strings</span>

<span lang="ES"><span style="mso-spacerun:yes">          </span> (registra-error 1 ?lin)</span>

<span lang="ES"><span style="mso-spacerun:yes">  </span> )</span>

<span lang="ES">)</span>

</div>

<span lang="ES"></span>

</div>

</o:smarttagtype></o:smarttagtype>