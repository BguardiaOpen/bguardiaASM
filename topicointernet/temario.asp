<%LANGUAGE=VBSCRIPT%>
<%
if Session("UsuarioValidado")<>1 then
	Response.Redirect("entrada.asp")
end if

Set Conn=Server.CreateObject("ADODB.Connection")
Conn.Open Application("Clases_ConnectionString")

%>
<html>

<head><!--BRUNO GUARDIA ROBLES-->
<LINK REL="stylesheet" TYPE="text/css" HREF="../Clases.css">
<title>Programa Analítico de <%=Session("NombreMateria")%></title>
</head>

<body bgcolor="#FFFFFF" text="#000000" link="#000066" vlink="#808080" alink="#FF0000" topmargin="0">

<h2 align="center">Programa Analítico</h2>

<h4 align="center"><%=Session("NombreMateria")%></h4>
<div align="center"><center>

<table border="1">
  <tr>
    <th>&nbsp;</th>
    <th>Curso normal </th>
  </tr>
  <tr>
    <td>Horas de Clase: </td>
    <td>3 </td>
  </tr>
  <tr>
    <td>Laboratorio: </td>
    <td>0 </td>
  </tr>
  <tr>
    <td>Unidades: </td>
    <td>8 </td>
  </tr>
</table>
</center></div>

<div align="center"><center>

<table>
  <tr>
    <td><h2><a href="temario.asp#temas">Temas </a></h2>
    </td>
  </tr>
</table>
</center></div>

<p align="center"><img src="../images/waveline.gif" width="756" height="16"> <a name="og"></a>
</p>

<h2 align="center"><a name="temas">Temas</a> </h2>

<p align="center"><a href="calendario.asp">Calendario de actividades del semestre</a></p>

<p align="center"><a href="syllabus.asp">Syllabus - Calendario por temas</a></p>

<p><font SIZE="2">&nbsp;</p>

<%
SQL="select TituloSesion from SesionesBruno"
SQL=SQL & " where ClaveMateria='" & Session("Materia") & "'"
SQL=SQL & " order by NumeroSesion"
set Temas=Conn.Execute(SQL)
do while not Temas.EOF
%>
<p><%=Temas("TituloSesion")%></p>
<%
	Temas.MoveNext
loop

Conn.Close
%>

<p align="center"><img src="../images/waveline.gif" width="756" height="16"></p>

<p align="center">Página por Bruno Guardia R. <a href="mailto:bguardia@campus.ccm.itesm.mx"></a> </p>
<div align="center"><center>

<address>
  <a href="mailto:bguardia@campus.ccm.itesm.mx"><img src="../images/mail.gif" width="32" height="32" border="0"> bguardia@itesm.mx </a>
</address>
</center></div>

<p align="center"><em>Creada: 16-Feb-96 </em><br>
<em>Última actualización: Mi 7-Ago-96 </em></p>
</body>
</html>
