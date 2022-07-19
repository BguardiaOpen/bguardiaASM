<%@ LANGUAGE="VBSCRIPT" %>
<%
	Set Conn=Server.CreateObject("ADODB.Connection")
	Conn.Open "prueba"

	Nombre=CStr(Request("Nombre"))
	Apellido=CStr(Request("Apellido"))
	Titulo=CStr(Request("Titulo"))

	SQL="insert into Employees"
	SQL=SQL & " (FirstName, LastName, Title) "
	SQL=SQL & " values ('" & Nombre & "','" & Apellido & "','" & Titulo & "') "

	'Response.Write SQL
	Set Empleados=Conn.Execute(SQL)	
	Response.Redirect "ReporteEmpleados.asp"
%>
