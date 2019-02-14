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
<%
	String strsql="select * from inbox where recieverId=?";
	ResultSet rs=CrudOperation.getData(strsql,userid);
	

%>
<title>Hello <%=userid %> !</title>
<style type="text/css">

    </style>
    <script src="/bs/js1/bootstrap.js"></script>
</head>
<body>
<body style="background-color:green;font-size: 12px">


	<div>
	<form action="/ZAPDiagnostics/WebContent/jsp/startcommunication.jsp">
		<table border="1" style="width:1150px;height: auto;">
		<%
while(rs.next())
{%>
<%-- <tr><th>MsgId:</th><th style="color:red"><%=rs.getString("msgId") %></th></tr> --%>
<tr><th>Date of Message:</th><th style="color:blue"><%=rs.getString("dateOFMessage") %></th></tr>
<tr><th>SenderId:</th><th style="color:yellow"><%=rs.getString("senderId") %></th></tr>
<tr><th>Subject:</th><th style="color:blue;font-style: italic;"><%=rs.getString("subject") %></th></tr>
<tr><th>Message:</th><th style="color:black"><%=rs.getString("message") %></th></tr>
<!-- <tr><th colspan="2"><button type="submit" style="width:100%" value="Send Reply">Send Reply</button></th></tr> -->
<tr><th colspan="2" style="background-color: black "><br/></th></tr>

<%}%>
		
		
		</table>
		</form>
		</div>

</body>
</html>