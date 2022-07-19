<%@ LANGUAGE="VBSCRIPT" %>
<%
if Session("UsuarioValidado")<>1 then
	Response.Redirect("entrada.asp")
end if
if Request("Numero").Count=0 then
	Response.Redirect("calendario.asp")
end if
NumeroSesion=Request("Numero")

Set Conn=Server.CreateObject("ADODB.Connection")
Conn.Open Application("Clases_ConnectionString")

SQL="select * from SesionesBruno"
SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
SQL=SQL & " and NumeroSesion=" & CStr(NumeroSesion)
Set SesionActual=Conn.Execute(SQL)
if SesionActual.EOF then
	Response.Redirect("calendario.asp")
end if

SQL="select TituloSesion from SesionesBruno"
SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
SQL=SQL & " and NumeroSesion=" & CStr(NumeroSesion-1)
Set SesionAnterior=Conn.Execute(SQL)
SQL="select TituloSesion from SesionesBruno"
SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
SQL=SQL & " and NumeroSesion=" & CStr(NumeroSesion+1)
Set SesionSiguiente=Conn.Execute(SQL)


Dim AbreviaturasMes(12)
AbreviaturasMes(0)="Enero"
AbreviaturasMes(1)="Febrero"
AbreviaturasMes(2)="Marzo"
AbreviaturasMes(3)="Abril"
AbreviaturasMes(4)="Mayo"
AbreviaturasMes(5)="Junio"
AbreviaturasMes(6)="Julio"
AbreviaturasMes(7)="Agosto"
AbreviaturasMes(8)="Septiembre"
AbreviaturasMes(9)="Octubre"
AbreviaturasMes(10)="Noviembre"
AbreviaturasMes(11)="Diciembre"
%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual InterDev 1.0">

<meta HTTP-EQUIV="Expires" content="0">
<title>Sesión <%=NumeroSesion%>: <%=SesionActual("TituloSesion")%></title>
<LINK REL="stylesheet" TYPE="text/css" HREF="../Clases.css">
</head>

<body background="../images/fondo-uv.gif" bgcolor="#FFFFFF" text="#000000" vlink="#0000FF">

<h1 align="center">Sesión <%=NumeroSesion%>: <%=SesionActual("TituloSesion")%></h1>

<%
if SesionActual("EnConstruccion")<>0 then
%>
<p align="center">
En construcción
</p>
<%
end if
%>
<div align="center"><center>

<table border="1" cellpadding="2">
<tr>
<td align="center">
<%
if SesionAnterior.EOF then
%>
<a href="Politicv.htm">Políticas del Curso</a>
<%
else
%>
<a href="sesion.asp?Numero=<%=NumeroSesion-1%>">Sesión Anterior:<br><%=SesionAnterior(0)%></a>
<%
end if 
%>
</td>
<td>
<%
Fecha=CStr(Day(SesionActual("Fecha1"))) & "/" 
Fecha=Fecha & AbreviaturasMes(Month(SesionActual("Fecha1"))-1) 
Fecha=Fecha & "/" & CStr(Year(SesionActual("Fecha1"))) 
if not isnull(SesionActual("Fecha2")) then
	Fecha=Fecha & " y " & CStr(Day(SesionActual("Fecha2"))) & "/" 
	Fecha=Fecha & AbreviaturasMes(Month(SesionActual("Fecha2"))-1) 
	Fecha=Fecha & "/" & CStr(Year(SesionActual("Fecha2"))) 
end if
%>
<h3 align="center"><%=Fecha%></h3></td>
<td align="center">
<%
if not SesionSiguiente.EOF then
%>
<a href="sesion.asp?Numero=<%=NumeroSesion+1%>">Sesión Siguiente:<br><%=SesionSiguiente(0)%></a>
<%
end if 
%>
</td>
</tr>
  <tr>
    <td><h2>Objetivos </h2>
    </td>
    <td colspan="2"><ol>
	<%
	SQL="select * from ObjetivosBruno"
	SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
	SQL=SQL & " and NumeroSesion=" & CStr(NumeroSesion)
	Set Objetivos=Conn.Execute(SQL)
	do while not Objetivos.EOF
	%>
      <li><small><%=Objetivos("TextoObjetivo")%></small></li>
	<%
		Objetivos.MoveNext
	loop
	%>
    </ol>
	</td>
  </tr>
  <tr>
    <td><h2>Teoría </h2>
    </td>
    <td colspan="2">
	<%
	SQL="select * from TeoriaBruno"
	SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
	SQL=SQL & " and NumeroSesion=" & CStr(NumeroSesion)
	Set Teoria=Conn.Execute(SQL)
	do while not Teoria.EOF
	%>
      <p><small>
<%
if not isnull(Teoria("URLTema")) then
%>	  
<a href="<%=Teoria("URLTema")%>"><%=Teoria("NombreTema")%></a>
<%else%>
<%=Teoria("NombreTema")%>
<%end if%>
</small></p>
	<%
		Teoria.MoveNext
	loop
	%>
	</td>
  </tr>
  <tr>
    <td><h2>Ejercicios</h2>
    </td>
    <td colspan="2">
	<%
	SQL="select * from EjerciciosBruno"
	SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
	SQL=SQL & " and NumeroSesion=" & CStr(NumeroSesion)
	Set Ejercicios=Conn.Execute(SQL)
	do while not Ejercicios.EOF
	%>
      <p><small>
<%=Teoria("NombreEjercicio")%>
<%
if not isnull(Ejercicios("URLEjercicios")) then
%>
<a href="<%=Ejercicios("URLEjercicio")%>">
Planteamiento
</a>
<%
end if
%>
<%=Ejercicios("TextoEjercicio")%>
</small></p>
	<%
		Ejercicios.MoveNext
	loop
	%>
	</td>
  </tr>
  <tr>
    <td><h2>Ejemplos </h2>
    </td>
    <td colspan="2">
	</td>
  </tr>
  <tr>
    <td><h2>Actividades </h2>
    </td>
    <td colspan="2">
	</td>
  </tr>
  <tr>
    <td><h2>Dudas</h2>
    </td>
    <td colspan="2">
	</td>
  </tr>
</table>
</center></div>
</body>
</html>
<%
Conn.Close
%>