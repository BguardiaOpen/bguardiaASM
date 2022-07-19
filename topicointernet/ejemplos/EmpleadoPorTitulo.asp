<%@ LANGUAGE="VBSCRIPT" %>
<%
	Set Conn=Server.CreateObject("ADODB.Connection")
	Conn.Open "prueba"

	Titulo=CStr(Request("titulo"))

	SQL="select * from Employees"
	SQL=SQL & " where Title like '%" & Titulo & "%'"

	Set Empleados=Conn.Execute(SQL)

%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual InterDev 1.0">

<title>Reporte de Empleados</title>
</head>
<body BGCOLOR="WHITE">

<h3>Reporte de Empleados</h3>
<table BORDER>
<tr>
<th>#</th>
<th>Nombre</th>
<th>Apellido</th>
<th>Título</th>
<th>Extensión</th>
<th>Teléfono trabajo</th>
</tr>
<%
do while not Empleados.EOF
%>
<!--<TR><TD><%=Empleados("EmployeeID")%></TD><TD><%=Empleados("FirstName")%></TD><TD><%=Empleados("LastName")%></TD>-->
<%
for i=0 to 5
	if isnull(Empleados(i)) then
%>
<td>&nbsp;</td>
<%
else
%>
<td><%=Empleados(i)%></td>
<%
end if
next
%>

</tr>
<%
	Empleados.MoveNext
loop
%>
</table>

<%
	Conn.Close
%>
</body>
</html>
