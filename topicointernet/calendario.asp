<%@ LANGUAGE="VBSCRIPT" %>
<%
if Session("UsuarioValidado")<>1 then
	Response.Redirect("entrada.asp")
end if

Set Conn=Server.CreateObject("ADODB.Connection")
Conn.Open Application("Clases_ConnectionString")

Dim AbreviaturasMes(12)
AbreviaturasMes(0)="Ene"
AbreviaturasMes(1)="Feb"
AbreviaturasMes(2)="Mar"
AbreviaturasMes(3)="Abr"
AbreviaturasMes(4)="May"
AbreviaturasMes(5)="Jun"
AbreviaturasMes(6)="Jul"
AbreviaturasMes(7)="Ago"
AbreviaturasMes(8)="Sep"
AbreviaturasMes(9)="Oct"
AbreviaturasMes(10)="Nov"
AbreviaturasMes(11)="Dic"

BanderaSiguienteClase=0

%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 5.0">

<meta HTTP-EQUIV="Expires" content="0">
<LINK REL="stylesheet" TYPE="text/css" HREF="../Clases.css">
<title>Planeación <%=Session("Materia")%> Semestre <%=Session("Semestre")%> </title>
</head>

<body background="../images/fondo-uv.gif" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#0000A0">

<h1 align="center">Planeación del Semestre <%=Session("Semestre")%> </h1>
<div align="center"><center>

<table border="0" cellpadding="2">
  <tr>
    <td><p align="center"><a href="syllabus.asp">Verla en formato Syllabus</a></td>
    <td><a href="temario.asp">Ver temario analítico</a> (oficial)</td>
  </tr>
</table>
</center></div>

<table border="0" cellpadding="2">
  <tr>
    <td valign="top" align="center">
	
	<table border="2" cellpadding="2">
<%
	SQL="select * from SesionesBruno"
	SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
	SQL=SQL & " order by NumeroSesion"
	Contador=1
	set Sesiones=Conn.Execute(SQL)
	FechaCheca=DateAdd("d",-1,Now)
	'Response.Write ("Checar Fecha: " & FormatDateTime(FechaCheca))
	do while not Sesiones.EOF
		if Sesiones("Fecha1")>=FechaCheca or Sesiones("Fecha2")>=FechaCheca then
			BanderaSiguienteClase=BanderaSiguienteClase+1
		end if
		if contador mod 6=1 then
%>
      <tr>
<%
		end if
		Fecha=CStr(Day(Sesiones("Fecha1"))) & "/" 
		Fecha=Fecha & AbreviaturasMes(Month(Sesiones("Fecha1"))-1) 
		if not isnull(Sesiones("Fecha2")) then
			Fecha=Fecha & " y " & CStr(Day(Sesiones("Fecha2"))) & "/" 
			Fecha=Fecha & AbreviaturasMes(Month(Sesiones("Fecha2"))-1) 
			
		end if
%>
        <td align="center" valign="top">
		<%
		if BanderaSiguienteClase=1 then
		%>
		<strong>
		<%
		end if
		%>
		<small><a href="sesion.asp?Numero=<%=Contador%>">
		<!--		<img src="../images/califica.jpg" border="0" width="32" height="32">		-->
		<br><%=Fecha%></a>
		<br><%=Sesiones("TituloSesion")%></small>
				<%
		if BanderaSiguienteClase=1 then
		%>
		</strong>
		<%
			BanderaSiguienteClase=BanderaSiguienteClase+1
		end if
		%>
</td>
<%
		if contador mod 6=0 then
%>
      </tr>
<%
		end if
		Contador=contador+1
		Sesiones.MoveNext
	loop
	
	Conn.Close
%>
    </table>
	<!--    <p>Leyenda: </p>    <table border="0">      <tr>        <td><img src="../images/Pc.gif" width="32" height="32"></td>        <td>Principalmente práctica en laboratorio</td>        <td><img src="../images/califica.jpg" width="32" height="32"></td>        <td>Clase con teoría</td>      </tr>    </table>	-->
    </td>
    <td valign="top"><h4><%=Session("Materia")%>-<%=Session("NombreMateria")%></h4>
    <table border="1" cellpadding="2">
      <tr>
        <th><p align="center"><small>Semestre </small></th>
        <th><p align="center"><small>Grupo </small></th>
        <th><p align="center"><small>Horario </small></th>
        <th><p align="center"><small>Salón </small></th>
      </tr>
      <tr>
        <td><p align="center"><small><%=Session("Semestre")%></small></td>
        <td><p align="center"><small>01</small></td>
        <td><p align="center"><small>Martes 19-22</small></td>
        <td><small>SC08</small></td>
      </tr>
    </table>
    <p align="center"><small>Página por <a href="../default.htm" target="_top">Bruno Guardia
    Robles</a>. </small></p>
    <p align="center"><small><a href="mailto:bguardia@sinergia-web.com.mx"><img src="../images/mail.gif" alt="Correo" border="0" width="32" height="32">
    bguardia@sinergia-web.com.mx</a></small></p>
    <hr>
    <p><em>Creada: Sa 9/Ene/1999</em><br>
	Se actualiza dinámicamente
</td>
  </tr>
</table>
</body>
</html>

</body>
</html>