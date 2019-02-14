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

  
<% String cityid= request.getParameter("city");
   if(cityid.equals("default")){%>
   
   <% }
   else{
String str = "Select * from  tests where pathologyId in (select pathologyId from pathology where city_id =?) ";   
             
ResultSet rs = CrudOperation.getData(str,cityid);%>
<% while(rs.next()){
%>
<%@include file="/WEB-INF/showtests.html"%>
<% }} %>
  


</body>
</html>