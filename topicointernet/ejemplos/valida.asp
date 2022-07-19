





<%@ LANGUAGE="VBSCRIPT" %>
<%
Matricula=Request("Matricula")
Password=Request("Password")

Usuarios=Application("Usuarios")
Matriculas=Application("Matricula")
Passwords=Application("Passwords")

Valido=0
for i=0 to 4
	if Matriculas(i)=Matricula and Passwords(i)=Password then
		Session("Nombre")=Usuarios(i)
		Session("Matricula")=Matricula
		Session("Password")=Password
		Valido=1
		exit for
	end if
next

if Valido=0 then
	Response.Redirect("noautorizado.htm")
else
	Response.Redirect("saludo.asp")
end if
%>