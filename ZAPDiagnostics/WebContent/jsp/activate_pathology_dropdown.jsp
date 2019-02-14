<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Activate pathology</title>
</head>
<body>

 
<% String cityid= request.getParameter("city");
   if(cityid.equals("default")){%>
	   <select>
	    <option value = "default">Select Pathlogy </option>
	   </select>
	   
   <%}
   else{
   String str = "Select * from pathology where city_id = ?";
   ResultSet rs = CrudOperation.getData(str,cityid);%>
   <select id="cmbpathology" onchange="change_pathology()">
		<option value = "default">Select Pathlogy </option>
		<% while(rs.next()){%>		
		  <option value="<%= rs.getString("pathologyId")%>"><%=rs.getString("name") %></option>
		<% }} %>
	</select>

</body>
</html>