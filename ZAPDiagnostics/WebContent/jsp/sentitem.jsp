<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");//downcasting
userid= userid.toUpperCase();
%>
<title>Hello <%=userid %></title>
<style type="text/css">

    </style>
    <script src="/bs/js1/bootstrap.js"></script>
</head>
<body>
<body style="background-color:green;font-size: 12px">

<%
	String strsql="select * from sentitems where senderId=?";
	ResultSet rs=CrudOperation.getData(strsql,userid);

%>
	<div>
		<form action="/ZAPDiagnostics/jsp/startcommunication.jsp">
		<table border="1" style="width:1150px;height: auto;" >
		<%
while(rs.next())
{%>
<tr><th>MsgId:</th><th style="color:blue"><%=rs.getString("msgId") %></th></tr>
<tr><th>Date of Message:</th><th style="color:blue"><%=rs.getString("dateOFMessage") %></th></tr>
<tr><th>SenderId:</th><th style="color:blue"><%=rs.getString("senderId") %></th></tr>
<tr><th>ReceiverId:</th><th style="color:blue"><%=rs.getString("recieverId") %></th></tr>
<tr><th>Subject:</th><th style="color:blue"><%=rs.getString("subject") %></th></tr>
<tr><th>Message:</th><th style="color:blue"><%=rs.getString("message") %></th></tr>
<!-- <tr> <th colspan="2" ><button type="submit" style="width: 100%" >Continue Communication</button></th></tr> -->
<tr><th colspan="2" style="background-color: black "><br/></th></tr>

<%}%>
		
		
		</table>
		</form>
		</div>


</body>
</html>