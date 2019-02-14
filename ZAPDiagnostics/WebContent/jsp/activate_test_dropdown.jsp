<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>activate test</title>
</head>
<body>

<% String pathologyid= request.getParameter("pathology");

	if(pathologyid.equals("default")){%>
	<select>
	 <option value = "default">Select Pathlogy </option>
	</select>
	
	<%}
	else{
   String str = "Select * from tests where pathologyId = ?";
   ResultSet rs = CrudOperation.getData(str,pathologyid);%>
   <select id="cmbcity" onchange="change_city()">
		<option value = "default">Select Test</option>
		<% while(rs.next()){%>		
		  <option value="<%= rs.getString("testId")%>"><%=rs.getString("testName") %></option>
		<% }} %>
	</select>

</body>
</html>