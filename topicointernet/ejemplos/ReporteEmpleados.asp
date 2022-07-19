<%@ LANGUAGE="VBSCRIPT" %>
<%
	Set Conn=Server.CreateObject("ADODB.Connection")
	Conn.Open "prueba"

	Set Empleados=Conn.Execute("select * from Employees")

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
<td>
<a href="BorrarEmpleado.asp?numempleado=<%=Empleados("EmployeeID")%>">
Borrar
</a>
</td>
</tr>
<%
	Empleados.MoveNext
loop
%>
</table>

<a href="NuevoEmpleado.htm">Agregar empleado</a>
<%
	Conn.Close
%>
</body>
</html>
