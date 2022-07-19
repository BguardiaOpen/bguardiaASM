<%@ LANGUAGE="VBSCRIPT" %>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual InterDev 1.0">

<meta HTTP-EQUIV="Expires" content="0">
<title>Referencia</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="../Clases.css">
</head>
<body background="../images/fondo-uv.gif" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#0000A0">

<h1 align="center">Referencia para <%=Session("Materia")%></h1>

<%
' Primera sección: libro de texto y libros de referencia
Set Conn=Server.CreateObject("ADODB.Connection")
Conn.Open Application("Clases_ConnectionString")

%>

<h3>Referencias electrónicas</h3>
<ul>
<%
' Segunda sección: ligas electrónicas
SQL="select * from ReferenciasBruno where NombreLibro is null"
SQL=SQL & " and Materia='" & Session("Materia") & "'"
set Ligas=Conn.Execute (SQL)
do while not Ligas.EOF
%>
<li><a href="<%=Ligas("URLReferencia")%>"><%=Ligas("TituloReferencia")%></a></li>
<%
	Ligas.MoveNext
loop

%>
</ul>

</body>
</html>
<%
Conn.Close
%>
