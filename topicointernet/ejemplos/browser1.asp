<%@ LANGUAGE="VBSCRIPT" %>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual InterDev 1.0">

<title>Evaluar Browser</title>
</head>
<body BGCOLOR="#FFFFFF">

<%  Set bc = Server.CreateObject("MSWC.BrowserType") %>  
<table border="1"> 
<tr><td>Browser</td><td>  <%= bc.browser  %>  
<tr><td>Version</td><td>  <%= bc.version  %>  </td></tr> 
<tr><td>Frames</td><td>
<%  if (bc.frames = TRUE) then  %>  TRUE
<%  else  %>  FALSE
<%  end if  %> </td></tr> 
<tr><td>Tables</td><td>
<%  if (bc.tables = TRUE) then  %>  TRUE 
<%  else  %> FALSE
<%  end if  %> </td></tr> 
<tr><td>BackgroundSounds</td><td> 
<%  if (bc.BackgroundSounds = TRUE) then  %>  TRUE 
<%  else  %> FALSE
<%  end if  %> </td></tr> 
<tr><td>VBScript</td><td> 
<%  if (bc.vbscript = TRUE) then  %>  TRUE 
<%  else  %> FALSE
<%  end if  %> </td></tr> 
<tr><td>JScript</td><td> 
<%  if (bc.javascript = TRUE) then  %>  TRUE 
<%  else  %> FALSE
<%  end if  %> </td></tr> 
</table> 


</body>
</html>
