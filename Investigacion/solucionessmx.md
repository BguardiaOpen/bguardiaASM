# Código del ejemplo de Seleccionar productos, usando SMX

```
%expand%

%form%

%gset(DSN,BaseDatos)

<HTML>

<HEAD>

<TITLE>Seleccionar productos</TITLE>

</HEAD>

<BODY BGCOLOR=#FFFFFF TEXT=#0000cc LINK=#ff0000 VLINK=#FF0000 ALINK=#FF0000>

<CENTER><H2> Selecciona un producto</H2>

 

<table border>

<tr><th>Producto</th><th>Precio</th>

%sql(%BaseDatos%,

"SELECT ProductName, Price FROM Items",

 

<a href="BagItem.htm?%NumCliente%&Product=%ProductName%">

<tr><td>%column(ProductName)</td>

<td>$ %fmt(%column(Price))</td></tr></a>

)

</table>

 </BODY>

</HTML>

```
