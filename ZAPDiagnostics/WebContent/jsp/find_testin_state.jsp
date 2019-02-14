<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FindTest In state</title>
</head>
<body>


<% String stateid= request.getParameter("state");
   
String str = "Select * from  tests where pathologyId in (select pathologyId from pathology where city_id in (select city_id from cities where state_id=?)       ) ";   
             
ResultSet rs = CrudOperation.getData(str,stateid);%>
<% while(rs.next()){

%>
<%@include file="/WEB-INF/showtests.html"%>
<% } %>

</body>
</html>