<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin delete profile</title>
<style type="text/css">

    </style>
    <script src="/bs/js1/bootstrap.js"></script>
</head>
<body>
<body style="background-color:green">
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");//downcasting
userid= userid.toUpperCase();
String usertype=(String)hs.getAttribute("userkey_for_usertypevalidation");
if(!usertype.equals("superadmin")){
	response.sendRedirect("index.jsp");}

%>
<%
	String strsql="select * from pathology";
	ResultSet rs=CrudOperation.getData(strsql);
	
%>
<div>
		
		<%
while(rs.next())
{%>
<form  action="/ZAPDiagnostics/DeleteAdminPath" method="post">
		<table border="1">
<tr><th>Pathology Id:</th><th><input id="pid" name="pid" type="text" value="<%=rs.getString("pathologyId") %>"></th></tr>
<tr><th>Name:</th><th><input id="name" name="name" type="text" value="<%=rs.getString("name") %>"></th></tr>
<tr><th>Address:</th><th><input id="add" name="add" type="text" value="<%=rs.getString("address") %>"></th></tr>
<tr><th>Phone No.:</th><th><input id="pno" name="pno" type="text" value="<%=rs.getString("phoneNo") %>"></th></tr>
<tr><th>EMail:</th><th><input id="email" name="email" type="text" value="<%=rs.getString("email") %>"></th></tr>
<tr><th>city:<th><input id="city" name="city" type="text" value="<%=rs.getString("city_id") %>"></th></tr>
<tr><th>Speciality:</th><th><input id="spec" name="spec" type="text" value="<%=rs.getString("speciality") %>"></th></tr>
<tr><th>Description</th><th><input id="descr" name="descr" type="text" value="<%=rs.getString("description") %>"></th></tr>
<tr><th><button type="submit" value="Delete Details">Delete Details</button></th></tr>
</table>
		</form>

<%}%>
		
		
		
		</div>

</body>
</html>