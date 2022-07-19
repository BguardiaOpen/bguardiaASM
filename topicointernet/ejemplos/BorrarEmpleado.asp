<%@ LANGUAGE="VBSCRIPT" %>
<%
	Set Conn=Server.CreateObject("ADODB.Connection")
	Conn.Open "prueba"

	NoEmpleado=CStr(Request("numempleado"))

	SQL="delete from Employees"
	SQL=SQL & " where EmployeeID = " & NoEmpleado

	'Response.Write SQL
	Set Empleados=Conn.Execute(SQL)	
	Response.Redirect "ReporteEmpleados.asp"
%>
