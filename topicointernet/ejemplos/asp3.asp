<%@ LANGUAGE="VBSCRIPT" %>
<html>

<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">

<title>Ejemplo 3 de ASP</title>
</head>

<body>
<%
Hora=Hour(Now)
if Hora<5 then
%>

<h3>¡¡Feliz madrugada!!</h3>
<%
elseif Hora<12 then
%>

<h3>¡¡Buenos días!!</h3>
<%
elseif Hora<18 then
%>

<h3>¡¡Buenas tardes!!</h3>
<%
else
%>

<h3>¡¡Buenas noches!!</h3>
<%
end if
%>

<h3>Código fuente:</h3>
<div align="center"><center>

<table border="1" cellpadding="2">
  <tr>
    <td><pre>&lt;%@ LANGUAGE=&quot;VBSCRIPT&quot; %&gt;
&lt;HTML&gt;
&lt;HEAD&gt;
&lt;META NAME=&quot;GENERATOR&quot; Content=&quot;Microsoft Visual InterDev 1.0&quot;&gt;
&lt;META HTTP-EQUIV=&quot;Content-Type&quot; content=&quot;text/html; charset=iso-8859-1&quot;&gt;
&lt;TITLE&gt;Ejemplo 3 de ASP&lt;/TITLE&gt;
&lt;/HEAD&gt;
&lt;BODY&gt;
&lt;%
Hora=Hour(Now)
if Hora&lt;5 then
%&gt;
&lt;h3&gt;¡¡Feliz madrugada!!&lt;/h3&gt;
&lt;%
elseif Hora&lt;12 then
%&gt;
&lt;h3&gt;¡¡Buenos días!!&lt;/h3&gt;
&lt;%
elseif Hora&lt;18 then
%&gt;
&lt;h3&gt;¡¡Buenas tardes!!&lt;/h3&gt;
&lt;%
else
%&gt;
&lt;h3&gt;¡¡Buenas noches!!&lt;/h3&gt;
&lt;%
end if
%&gt;
&lt;/body&gt;
&lt;/html&gt;</pre>
    </td>
  </tr>
</table>
</center></div>
</body>
</html>
