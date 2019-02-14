<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<%@page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pathology owner(admin) update profile</title>

    
    <script>
function myFunction() {
    alert(" Save changes!!!");
}
</script>
</head>
<body style="background-color:green">
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");//downcasting
userid= userid.toUpperCase();
%>
<%
	String strsql="select * from pathology ";
	ResultSet rs=CrudOperation.getData(strsql);

%>
	
		<%
while(rs.next())
{%>
<div>
	<form action="/ZAPDiagnostics/UpdatePathologyDetails" method="post" onsubmit="myFunction()">
		<table class="table">
		<tr>
			<th>Pathology Id</th><th>Name</th><th>Address</th><th>Phone No.</th><th>EMail</th>
			<th>city</th><th>speciality:</th><th>Description:</th>
		</tr>
<tr><th><input type="text" id="pid" name="pid" value="<%=rs.getString("pathologyId") %>" readonly></th>
<th><input type="text" id="name" name="name" value="<%=rs.getString("name") %>"></th>
<th><input type="text" id="add" name="add" value="<%=rs.getString("address") %>"></th>
<th><input type="text" id="phno" name="phno" value="<%=rs.getString("phoneNo") %>"></th>
<th><input type="email" id="email" name="email" value="<%=rs.getString("email") %>"></th>
<th><input type="text" id="city" name="city" value="<%=rs.getString("city_id") %>"></th>
<th><input type="text" id="regno" name="regno" value="<%=rs.getString("speciality") %>"></th>
<th><input type="text" id="skill" name="skill" value="<%=rs.getString("description") %>"></th>
</tr>
<tr><th>
<input type="submit" value="UPDATE">
</th></tr>

		
		
		</table>
		</form>
	</div>
	<%}%>

</body>
</html>