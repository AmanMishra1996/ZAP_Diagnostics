<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Activate city</title>
</head>
<body>

<% 
     String stateid= request.getParameter("state");
			if(stateid.equals("default")){%>
			<select>
			 <option value = "default">Select Pathlogy </option>
			</select>
			
			<%}
			else{
   String str = "Select * from cities where state_id = ?";
   ResultSet rs = CrudOperation.getData(str,stateid);%>
   <select id="cmbcity" onchange="change_city()">
		<option value = "default">Select City </option>
		<% while(rs.next()){%>		
		  <option value="<%= rs.getString("city_id")%>"><%=rs.getString("city_name") %></option>
		<% } }%>
	</select>
</body>
</html>