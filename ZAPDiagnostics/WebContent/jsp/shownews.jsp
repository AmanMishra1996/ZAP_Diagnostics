<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

int id= Integer.parseInt(request.getParameter("nid"));

String strsql = "Select contents from news where newsId=?";

ResultSet rs = CrudOperation.getData(strsql, id);

if(rs.next())
{
	%>
	
	<textarea class="form-control" rows="10" cols="10">
	<%= rs.getString("contents") %>
	
	</textarea>
<%} %>






</body>
</html>