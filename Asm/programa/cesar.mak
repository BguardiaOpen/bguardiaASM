# Las l¡neas que inician con # son comentarios
#
# Makefile ejemplo
#
# Genera CESAR.EXE a partir de CESAR.ASM
#
# Primera linea: indica el "objetivo" y las "dependencias"
# Sintaxis es
#       Objetivo: [dependencia1 [dependencia2 ...] ]
cesar.exe: cesar.asm
        # Las siguientes l¡neas deben iniciar con un Tab
        # e indican las instrucciones necesarias para llegar al objetivo
        # a partir de las dependencias
        # En este caso, primero ensamblamos el .ASM -> .OBJ
        tasm cesar /zi
        # y luego ligamos .OBJ -> .EXE
        tlink cesar /v
        # No se admiten l¡neas en blanco, salvo entre dos objetivos
        # diferentes
