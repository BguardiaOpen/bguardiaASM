<%@ LANGUAGE="VBSCRIPT" %>
<%
Application("contador")=Application("contador")+1
%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual InterDev 1.0">

<title>Document Title</title>
</head>
<body>

<%
Contador=Application("contador")
Cantidad=1000
for i=1 to 4
	Digito=Contador \ Cantidad
	%>
	<img src="../../images/<%=Digito%>.bmp" alt="<%=Digito%>">
	<%
	Contador=Contador mod Cantidad
	Cantidad=Cantidad/10
next

%>
visitas desde que se prendió el servidor

</body>
</html>
