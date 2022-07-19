<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Calendario.aspx.vb" Inherits="topicointernet_Calendario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Calendario</title>
    <link rel="stylesheet" type="text/css" href="../Clases.css" />
</head>
<body>
<h1 align="center">Planeación del Semestre <%=Session("Semestre")%> </h1>
<div align="center"><center>
<table border="0" cellpadding="2">
  <tr>
    <td><p align="center"><a href="syllabus.asp">Verla en formato Syllabus</a></td>
    <td><a href="temario.asp">Ver temario analítico</a> (oficial)</td>
  </tr>
</table>
</center></div>   
</body>
</html>
