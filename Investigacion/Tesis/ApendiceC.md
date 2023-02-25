# Apéndice C: Reglas planteadas para el modelo pedagógico

Las técnicas utilizadas en la asesoría, basadas en la experiencia del profesor y en las sugeridas por las técnicas de Microenseñanza [8] incluyen las siguientes:

- Felicitar al alumno cuando tiene un desempeño excelente.

- Indicar a un alumno un error y el proceso para su solución.

- Indicar a un alumno la existencia de un error, dejándole como ejercicio encontrarlo y solucionarlo.

- Registrar que el alumno está cayendo en un error, y esperar a ver si él mismo lo soluciona en un tiempo determinado.

- Hacer una pregunta al alumno que permita su reflexión y que él mismo se de cuenta de la existencia de un error.

- Hacer una pregunta al alumno que permita su reflexión y que con ello confirme que su solución es correcta.

- Hacer una pregunta al alumno que le indique y haga reflexionar sobre oportunidades de mejorar su trabajo o prevenir errores (programación defensiva).

De acuerdo al modelo del estudiante planteado, estas técnicas, expresadas en lenguaje natural, se traduce a reglas, las que se encuentran en el archivo GAGNE.CLP, la primera versión de este archivo se presenta a continuación.

<div style="border:solid windowtext 1.0pt;mso-border-alt:solid windowtext .5pt;
padding:1.0pt 4.0pt 1.0pt 4.0pt">

;;======================================================

;;;-- GAGNE.CLP:

;;;---- Reglas del modelo instruccional, decide cuándo c asesorar

;;;

;;;---- CLIPS Version 6.0

;;;

;;;---- Requiere de las funciones externas de asesoría

;;;======================================================

;;; Determinar si se asesora en este momento o no...

;;; Primero, checar la experiencia en los conceptos asesorables...

(defrule checa-experiencia "Checar la experiencia en los conceptos asesorables"

- -(concepto-asesorable ?x ?numlin)

-- =>

-- (assert (tiene-experiencia ?x =( experiencia ?x) ) )

)

(defrule checar-poca-experiencia "Ver si tiene poca experiencia"

-- (tiene-experiencia ?x ?exp )

-- =>

-- (if (< ?exp 20) then

------- (assert (poca-experiencia ?x ) )

-- )

)

;;;

;;; REGLAS PARA DECIDIR SI ASESORAR YA!!!

;;;

(defrule asesorar-ahorita-1 "decidir si se debe asesorar sobre el concepto"

-- (poca-experiencia ?x )

-- (concepto-asesorable ?x ?numlin)

-- =>

-- (bind ?na (nivelasesoria ?x) )

-- (if ( > ( calificacion ?x ) 5000 )

------- then-- (bind ?na (- ?na 1) )

-- )

-- (asesora ?x (+ 1 ?na) ?numlin) ;;; Asesorar sobre el concepto x con la

-------------------------- ;;; estrategia y, indicando la l-nea numlin

;;;-- (assert (se-asesora ?x (+ 1 (nivelasesoria ?x)) ?numlin)) ;;; Hecho para depurar

)

(defrule asesorar-ahorita-2 "decidir si se debe asesorar sobre el concepto"

-- (asesoria-solicitada)

-- (concepto-asesorable ?x ?numlin)

;;;-- (estrategia-asesoria ?y)

-- =>

-- (bind ?na (nivelasesoria ?x) )

-- (if ( > ( calificacion ?x ) 7000 )

------- then-- (bind ?na (- ?na 1) )

-- )

-- (if ( > ( calificacion ?x ) 3000 )

------- then-- (bind ?na (- ?na 1) )

-- )

-- (asesora ?x (+ 1 ?na) ?numlin) ;;; Asesorar sobre el concepto x con la

----------------- ---------;;; estrategia y, indicando la l-nea numlin

;;;-- (assert (se-asesora ?x (+ 1 (nivelasesoria ?x)) ?numlin)) ;;; Hecho para depurar

-- )
