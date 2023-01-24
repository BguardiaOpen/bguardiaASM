## Apéndice C: Reglas planteadas para el modelo pedagógico

<span lang="ES">Las técnicas utilizadas en la asesoría, basadas en la experiencia del profesor y en las sugeridas por las técnicas de Microenseñanza [8] incluyen las siguientes:</span>

<span lang="ES"></span>

<span lang="ES" style="font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol"><span style="mso-list:Ignore">-<span style="font:7.0pt &quot;Times New Roman&quot;"></span> </span></span><span lang="ES">Felicitar al alumno cuando tiene un desempeño excelente.</span>

<span lang="ES" style="font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol"><span style="mso-list:Ignore">-<span style="font:7.0pt &quot;Times New Roman&quot;"></span> </span></span><span lang="ES">Indicar a un alumno un error y el proceso para su solución.</span>

<span lang="ES" style="font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol"><span style="mso-list:Ignore">-<span style="font:7.0pt &quot;Times New Roman&quot;"></span> </span></span><span lang="ES">Indicar a un alumno la existencia de un error, dejándole como ejercicio encontrarlo y solucionarlo.</span>

<span lang="ES" style="font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol"><span style="mso-list:Ignore">-<span style="font:7.0pt &quot;Times New Roman&quot;"></span> </span></span><span lang="ES">Registrar que el alumno está cayendo en un error, y esperar a ver si él mismo lo soluciona en un tiempo determinado.</span>

<span lang="ES" style="font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol"><span style="mso-list:Ignore">-<span style="font:7.0pt &quot;Times New Roman&quot;"></span> </span></span><span lang="ES">Hacer una pregunta al alumno que permita su reflexión y que él mismo se de cuenta de la existencia de un error.</span>

<span lang="ES" style="font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol"><span style="mso-list:Ignore">-<span style="font:7.0pt &quot;Times New Roman&quot;"></span> </span></span><span lang="ES">Hacer una pregunta al alumno que permita su reflexión y que con ello confirme que su solución es correcta.</span>

<span lang="ES" style="font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol"><span style="mso-list:Ignore">-<span style="font:7.0pt &quot;Times New Roman&quot;"></span> </span></span><span lang="ES">Hacer una pregunta al alumno que le indique y haga reflexionar sobre oportunidades de mejorar su trabajo o prevenir errores (programación defensiva).</span>

<span lang="ES"></span>

<span lang="ES">De acuerdo al modelo del estudiante planteado, estas técnicas, expresadas en lenguaje natural, se traduce a reglas, las que se encuentran en el archivo <span class="SpellE">GAGNE.CLP</span>, la primera versión de este archivo se presenta a continuación.</span>

</div>

<span lang="ES-TRAD" style="font-size:12.0pt;mso-bidi-font-size:10.0pt;
font-family:&quot;Times New Roman&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-ansi-language:ES-TRAD;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">  
</span>

<div class="Section2">

<span lang="ES"></span>

<div style="border:solid windowtext 1.0pt;mso-border-alt:solid windowtext .5pt;
padding:1.0pt 4.0pt 1.0pt 4.0pt">

<span lang="ES">;;======================================================</span>

<span class="GramE"><span lang="ES">;;;</span></span><span lang="ES"><span style="mso-spacerun:yes">--</span> <span class="SpellE">GAGNE.CLP</span>:</span>

<span class="GramE"><span lang="ES">;;;</span></span><span lang="ES"><span style="mso-spacerun:yes">----</span> Reglas del modelo <span class="SpellE">instruccional</span>, decide cuándo c asesorar</span>

<span lang="ES">;;;</span>

<span class="GramE"><span lang="ES">;;;</span></span><span lang="ES"><span style="mso-spacerun:yes">----</span> CLIPS <span class="SpellE">Version</span> 6.0</span>

<span lang="ES">;;;</span>

<span class="GramE"><span lang="ES">;;;</span></span><span lang="ES"><span style="mso-spacerun:yes">----</span> Requiere de las funciones externas de <span class="SpellE">asesoría</span></span>

<span lang="ES">;;;======================================================</span>

<span lang="ES"></span>

<span class="GramE"><span lang="ES">;;;</span></span> <span lang="ES">Determinar si se asesora en este momento o no...</span>

<span lang="ES"></span>

<span class="GramE"><span lang="ES">;;;</span></span> <span lang="ES">Primero, <span class="SpellE">checar</span> la experiencia en los conceptos <span class="SpellE">asesorables</span>...</span>

<span lang="ES"></span>

<span lang="ES">(<span class="SpellE"><span class="GramE">defrule</span></span> checa-experiencia "<span class="SpellE">Checar</span> la experiencia en los conceptos <span class="SpellE">asesorables</span>"</span>

<span lang="ES"><span style="mso-spacerun:yes">-</span> <span style="mso-spacerun:yes">-</span>(concepto-<span class="SpellE">asesorable</span> ?x ?<span class="SpellE">numlin</span>)</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (<span class="SpellE"><span class="GramE">assert</span></span> (tiene-experiencia ?x =( experiencia ?x) ) )</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(<span class="SpellE"><span class="GramE">defrule</span></span> <span class="SpellE">checar</span>-poca-experiencia "Ver si tiene poca experiencia"</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (tiene-experiencia ?x ?<span class="SpellE"><span class="GramE">exp</span></span> <span class="GramE">)</span></span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (<span class="SpellE"><span class="GramE">if</span></span> (< ?<span class="SpellE">exp</span> 20) <span class="SpellE">then</span></span>

<span lang="ES"><span style="mso-spacerun:yes">-------</span> (<span class="SpellE"><span class="GramE">assert</span></span> (poca-experiencia ?x ) )</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> )</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">;;;</span>

<span class="GramE"><span lang="ES">;;;</span></span> <span lang="ES">REGLAS PARA DECIDIR SI ASESORAR YA!!!</span>

<span lang="ES">;;;</span>

<span lang="ES"></span>

<span lang="ES">(<span class="SpellE"><span class="GramE">defrule</span></span> asesorar-<span class="SpellE">ahorita</span>-1 "decidir si se debe asesorar sobre el concepto"</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (poca-experiencia ?<span class="GramE">x )</span></span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (concepto-<span class="SpellE">asesorable</span> ?x ?<span class="SpellE">numlin</span>)</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (<span class="SpellE"><span class="GramE">bind</span></span> ?<span class="SpellE">na</span> (<span class="SpellE">nivelasesoria</span> ?x) )</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (<span class="SpellE"><span class="GramE">if</span></span> ( > ( <span class="SpellE">calificacion</span> ?x ) 5000 )</span>

<span lang="ES"><span style="mso-spacerun:yes">-------</span> <span class="SpellE"><span class="GramE">then</span></span><span style="mso-spacerun:yes">--</span> (<span class="SpellE">bind</span> ?<span class="SpellE">na</span> (- ?<span class="SpellE">na</span> 1) )</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> )</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (<span class="GramE">asesora</span> ?x (+ 1 ?<span class="SpellE">na</span>) ?<span class="SpellE">numlin</span>) ;;; Asesorar sobre el concepto x con la</span>

<span lang="ES"><span style="mso-spacerun:yes">--------------------------</span> ;;; <span class="GramE">estrategia</span> y, indicando la <span class="SpellE">l-nea</span> <span class="SpellE">numlin</span></span>

<span lang="ES">;;;<span style="mso-spacerun:yes">--</span> (<span class="SpellE"><span class="GramE">assert</span></span> (se-asesora ?x (+ 1 (<span class="SpellE">nivelasesoria</span> ?x)) ?<span class="SpellE">numlin</span>)) ;;; Hecho para depurar</span>

<span lang="ES">)</span>

<span lang="ES"></span>

<span lang="ES">(<span class="SpellE"><span class="GramE">defrule</span></span> asesorar-<span class="SpellE">ahorita</span>-2 "decidir si se debe asesorar sobre el concepto"</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (<span class="SpellE">asesoria</span>-solicitada)</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (concepto-<span class="SpellE">asesorable</span> ?x ?<span class="SpellE">numlin</span>)</span>

<span class="GramE"><span lang="ES">;;;</span></span><span lang="ES"><span style="mso-spacerun:yes">--</span> (estrategia-<span class="SpellE">asesoria</span> ?y)</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> =></span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (<span class="SpellE"><span class="GramE">bind</span></span> ?<span class="SpellE">na</span> (<span class="SpellE">nivelasesoria</span> ?x) )</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> </span><span style="mso-ansi-language:EN-US">(<span class="GramE">if</span> ( > ( <span class="SpellE">calificacion</span> ?x ) 7000 )</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">-------</span> <span class="GramE">then</span><span style="mso-spacerun:yes">--</span> (bind ?<span class="SpellE">na</span> (- ?<span class="SpellE">na</span> 1) )</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">--</span> )</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">--</span> (<span class="GramE">if</span> ( > ( <span class="SpellE">calificacion</span> ?x ) 3000 )</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">-------</span> <span class="GramE">then</span><span style="mso-spacerun:yes">--</span> (bind ?<span class="SpellE">na</span> (- ?<span class="SpellE">na</span> 1) )</span>

<span style="mso-ansi-language:EN-US"><span style="mso-spacerun:yes">--</span> </span><span lang="ES">)</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> (<span class="GramE">asesora</span> ?x (+ 1 ?<span class="SpellE">na</span>) ?<span class="SpellE">numlin</span>) ;;; Asesorar sobre el concepto x con la</span>

<span lang="ES"><span style="mso-spacerun:yes">-----------------</span> <span style="mso-spacerun:yes">---------</span>;;; <span class="GramE">estrategia</span> y, indicando la <span class="SpellE">l-nea</span> <span class="SpellE">numlin</span></span>

<span lang="ES">;;;<span style="mso-spacerun:yes">--</span> (<span class="SpellE"><span class="GramE">assert</span></span> (se-asesora ?x (+ 1 (<span class="SpellE">nivelasesoria</span> ?x)) ?<span class="SpellE">numlin</span>)) ;;; Hecho para depurar</span>

<span lang="ES"><span style="mso-spacerun:yes">--</span> )</span>

</div>

</div>

<span lang="ES" style="font-size:10.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-ansi-language:
ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">  
</span>

<div class="Section3">

<span lang="ES-TRAD" style="mso-ansi-language:ES-TRAD"></span>

</div>