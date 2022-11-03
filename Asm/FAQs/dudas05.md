## Dudas Comunes (Examen Parcial y Herramientas)

1.  _¿Cómo es el examen del primer parcial?_  
    R: Son ejercicios que apliquen la teoría vista, tales como los ejercicios de la sesión 4; es a libro abierto, como todos los exámenes. Ejemplos de ejercicios pueden ser ensamblar a mano, simular el ciclo de fetch, pequeñas secciones de código.
2.  _Usando el Turbo Debugger, al abrir un programa ejecutable generado por TASM y TLINK, no se ven las instrucciones del programa fuente. El mensaje que aparece es "Program has no symbol table". ¿Por qué?_  
    R: Para que el Turbo Debugger relacione el código máquina con el fuente, requiere que el ejecutable contenga "información de depuración". Para esto, debe haberse ensamblado y ligado el programa, con las opciones apropiadas (_/zi_ y _/v_):  
     `TASM fuente /zi  
     TLINK fuente /v`
3.  _¿Cómo uso un makefile?_  
    Se tiene que crear primero el makefile, siguiendo las reglas que se indican en clase; después de eso, se debe colocar en el mismo directorio que los programas fuente, el cual debe ser el actual de DOS, y llamarse exactamente "MAKEFILE"; entonces ejecutamos MAKE y automáticamente esta herramienta checa si se debe recompilar el ejecutable.