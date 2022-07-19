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
No se aceptan datos que no sean numèricos
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

<%=C%> º centígrados = <%=F%> º Fahrenheit = <%=K%> º Kelvin

<br>
<%
Response.Write C
Response.Write " º Centígrados = "
Response.Write F & " º Fahrenheit = "
Response.Write CStr(K) & " º Kelvin "

%>

</body>
</html>
