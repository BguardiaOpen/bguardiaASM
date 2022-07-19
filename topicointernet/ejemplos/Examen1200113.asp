<%@ Language=VBScript %>
<%
option explicit
dim N, i

N=Request("N")

if isnumeric(N) then
	N=Cint(N)
	if N=0 then
		N=5
	end if
else
%>
Error! Debe ser numerico
<%
	N=0
end if

%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<TABLE BORDER>
<TR>
<th>x</th>
<%
for i=1 to N
%>
<td><%=i%></td>
<%
next
%>
</TR>
<TR>
<th>y</th>
<%
for i=1 to N
%>
<td><%=F(i)%></td>
<%
next
%>
</TR>
</TABLE>

<TABLE BORDER>
<TR>
<th>x</th><th>y</th></tr>
<%
for i=1 to N
%>
<tr>
<td><%=i%></td><td><%=F(i)%></td>
</tr>
<%
next
%>
</TABLE>

</BODY>
</HTML>
<%
function F(x)
	F=3*x+10
end function
%>