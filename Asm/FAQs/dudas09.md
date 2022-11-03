## Dudas Comunes (Instrucciones básicas y modos de direccionamiento)

### ¡En espera de las que manden!

1.  _¿Cómo se manejan los errores al usar las funciones de archivos?_  
    R: Cuando hay un error, al regresar de la interrupción 21h la bandera de Carry se encontrará prendida. De este modo, solamente hay que validarla usando un salto condicional; si no hay Carry (JNC), podemos continuar realizando procesamiento, pues hubo éxito en la operación; si el carry quedó prendido (caso contrario); hay que revisar el error, para lo cual se consulta AX donde se encuentra el código del error específico.
2.  _¿Siempre se tiene que avanzar el apuntador al archivo?_  
    R: No, cada vez que se hace una operación de lectura o de escritura, automáticamente la posición sobre el archivo avanza a la siguiente, después de la zona leída o escrita. De esta manera, sólo se deberá usar el servicio 42h de la INT 21h cuando no se quiera recorrer el archivo en forma secuencial.