<%@ LANGUAGE="VBSCRIPT" %>
<%
grados=Request("grados")
if not isnumeric(grados) or len(grados)=0 then
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual InterDev 1.0">

<title>Convertido</title>
</head>
<body>
No se aceptan datos que no sean num�ricos
</body>
</html>
<%
	Response.End
end if

F=grados * 9/5 + 32
K = grados + 273
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual InterDev 1.0">

<title>Convertido</title>
</head>
<body>

<%=C%> � cent�grados = <%=F%> � Fahrenheit = <%=K%> � Kelvin

<br>
<%
Response.Write C
Response.Write " � Cent�grados = "
Response.Write F & " � Fahrenheit = "
Response.Write CStr(K) & " � Kelvin "

%>

</body>
</html>
