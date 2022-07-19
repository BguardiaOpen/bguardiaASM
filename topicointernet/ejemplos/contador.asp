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
Contador=CStr(Application("contador"))
for i=1 to len(Contador)
	Digito=Mid(Contador,i,1)
	%>
	<img src="../../images/<%=Digito%>.bmp" alt="<%=Digito%>">
	<%
next

%>
visitas desde que se prendió el servidor

</body>
</html>
