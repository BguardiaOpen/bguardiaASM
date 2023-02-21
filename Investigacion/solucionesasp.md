Código fuente de la página de Selección de Productos, usando [ASP](http://www.microsoft.com/asp)
================================================================================================

```

<HTML>

<HEAD><TITLE>Seleccionar productos</TITLE>

</HEAD>

<BODY BGCOLOR=#FFFFFF>

<H2>Selecciona un producto</H2>

<%

   Set Conn = Server.CreateObject("ADODB.Connection")

   Conn.Open "ADOSamples"

   sql="SELECT * FROM Items"

   Set RS = Conn.Execute(sql)

%>

<TABLE BORDER>

<TR>

   <%  For i = 0 to RS.Fields.Count - 1 %> ‘ Títulos de los campos

      <TD><B><%= RS(i).Name %></B></TD>

   <%  Next %>

</TR>

<%

   ' Crea 100 filas en una segunda matriz variante

   v=RS.GetRows(100) ‘v es la matriz variante, que se dimensiona de acuerdo a cuántos renglones existieron realmente

   RS.close

   Conn.close

%>

<P>

<%for row = 0 to UBound(v,2) ' repetición a través de las filas en la matriz variante%>

<TR>

      <%for col = 0 to UBound(v,1)%>  

      <TD> <%=v(col,row)%>  </TD>

      <%next%>

</TR>

<%next%>

</TABLE>

</BODY>

</HTML>

```