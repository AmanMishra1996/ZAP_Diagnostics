<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
  <script src="/ZAPDiagnostics/bs/jquery-3.3.1.min.js"></script>
  
  <script type="text/javascript">
  
  
  
  
  
  
  
  
  
  
  </script>
  
  
</head>
<body>

<form method="post" action="/ZAPDiagnostics/RegisterPathology">
<table class="table table-dark" style="height:100vh">
<tr><th>Pathology Id : </th><th><input type="text" id="pathologyid" name="pathologyid"></th></tr>
 <tr><th>Password : </th><th><input type="text" id="pathologypassword" name="pathologypassword"></th></tr> 
<tr><th>Name : </th><th><input type="text" id="pathologyname" name="pathologyname"></th></tr>
<tr><th>Address : </th><th><input type="text" id="pathologyaddress" name="pathologyaddress"></th></tr>
<tr><th>Phone No : </th><th><input type="text" id="pathologyphone" name="pathologyphone"></th></tr>
<tr><th>Email : </th><th><input type="email" id="pathologyemail" name="pathologyemail"></th></tr>
<tr>
<th>City :</th>
<th>
<select    id="pathologycity" name="pathologycity">
<option value = "default">Select City </option>
<%
String strsql = "select * from cities";
ResultSet rs = CrudOperation.getData(strsql);

while(rs.next()){
     String cid = rs.getString("city_id");
     String cname=rs.getString("city_name");
%>
      <option  value= "<%=cid %>" > <%=cname %> </option>

<%} %>

</select>
</th></tr>
<tr><th>Speciality : </th><th><input type="text" id="pathologyspeciality" name="pathologyspeciality"></th></tr>
<tr><th>Description : </th><th><input type="text" id="pathologydescription" name="pathologydescription"></th></tr>

<tr>	
			<th><button type="submit">Register</button></th>
				<th><button type="reset">Reset</button></th>
		
</tr>

</table>

</form>


</body>
</html>