<%@ LANGUAGE="VBSCRIPT" %>
<%
if Session("UsuarioValidado")<>1 then
	Response.Redirect("entrada.asp")
end if

Set Conn=Server.CreateObject("ADODB.Connection")
Conn.Open Application("Clases_ConnectionString")

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
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<html>

<head>

<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<meta HTTP-EQUIV="Expires" content="0">
<title>Syllabus <%=Session("NombreMateria")%> Semestre <%=Session("Semestre")%></title>
<LINK REL="stylesheet" TYPE="text/css" HREF="../Clases.css">
</head>

<body background="../images/fondo-uv.gif" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#0000A0">

<h1 align="center">Syllabus - Semestre <%=Session("Semestre")%></h1>

<p align="center"><a href="calendario.asp">Ver formato de Calendario</a></p>
<div align="left">

<table border="1" cellpadding="0" height="377">
  <tr>
    <th><small>Sesión</small></th>
    <th><small>Fecha</small></th>
    <th><small>Temas</small></th>
    <th><small>Objetivos específicos</small></th>
    <th><small>Bibliografía</small></th>
    <th><small>Tareas y/o Actividades ExtraClase</small></th>
  </tr>

<%
	SQL="select * from SesionesBruno"
	SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
	SQL=SQL & " order by NumeroSesion"
	Contador=1
	set Sesiones=Conn.Execute(SQL)
	do while not Sesiones.EOF
		Fecha=CStr(Day(Sesiones("Fecha1"))) & " de " 
		Fecha=Fecha & AbreviaturasMes(Month(Sesiones("Fecha1"))-1) 
		if not isnull(Sesiones("Fecha2")) then
			Fecha=Fecha & " y " & CStr(Day(Sesiones("Fecha2"))) & " de " 
			Fecha=Fecha & AbreviaturasMes(Month(Sesiones("Fecha2"))-1) 
			
		end if
%>
  <tr>
    <td align="right"><small>
	<a href="sesion.asp?Numero=<%=Sesiones("NumeroSesion")%>"><%=Sesiones("NumeroSesion")%></a></small></td>
    <td><small><%=Fecha%></small></td>
    <td><font SIZE="2"><%=Sesiones("TituloSesion")%></font></td>
    <td><ol>
	<%
	SQL="select * from ObjetivosBruno"
	SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
	SQL=SQL & " and NumeroSesion=" & CStr(Sesiones("NumeroSesion"))
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
    <td></td>
    <td></td>
  </tr>
<%
		Contador=contador+1
		Sesiones.MoveNext
	loop
	
Conn.Close
%>
</table>
</div>

<p align="center">Página por <a href="../index.htm" target="_top">Bruno Guardia Robles</a>.
</p>

<p align="center"><a href="mailto:bguardia@campus.ccm.itesm.mx"><img src="../images/mail.gif" alt="Correo" border="0" width="32" height="32">
bguardia@itesm.mx</a></p>

<hr>

<p align="center"><em>Creada: Sa 9/Ene/1999</em><br>
<em>Se actualiza dinámicamente</em></p>
</body>
</html>
