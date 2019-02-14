<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% String testid=request.getParameter("test");
if(testid.equals("default")){%>

<% }
else{
String str = "Select * from  tests where testId =?";   
             
ResultSet rs = CrudOperation.getData(str,testid);%>
<% while(rs.next()){
%>
<%@include file="/WEB-INF/showtests.html"%>
<% }} %>
  



</body>
</html>