<%@ LANGUAGE="VBSCRIPT" %>
<html>

<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">

<title>Ejemplo 1 de ASP</title>
</head>

<body>

<h3>Un contador del lado del servidor</h3>
<%
for i=1 to 10
%>

<p><%=i%></p>
<%
next
%>

<h3>Código fuente:</h3>
<div align="center"><center>

<table border="1" cellpadding="2">
  <tr>
    <td>&lt;%@ LANGUAGE=&quot;VBSCRIPT&quot; %&gt;<br>
    &lt;HTML&gt;<br>
    &lt;HEAD&gt;<br>
    &lt;META NAME=&quot;GENERATOR&quot; Content=&quot;Microsoft Visual InterDev 1.0&quot;&gt;<br>
    &lt;META HTTP-EQUIV=&quot;Content-Type&quot; content=&quot;text/html;
    charset=iso-8859-1&quot;&gt;<br>
    &lt;TITLE&gt;Ejemplo 1 de ASP&lt;/TITLE&gt;<br>
    &lt;/HEAD&gt;<br>
    &lt;BODY&gt;<br>
    &lt;h3&gt;Un contador del lado del servidor&lt;/h3&gt;<br>
    &lt;%<br>
    for i=1 to 10<br>
    %&gt;<br>
    &lt;p&gt;&lt;%=i%&gt;&lt;/p&gt;<br>
    &lt;%<br>
    next<br>
    %&gt;<br>
    &lt;/BODY&gt;<br>
    &lt;/HTML&gt;</td>
  </tr>
</table>
</center></div>
</body>
</html>
