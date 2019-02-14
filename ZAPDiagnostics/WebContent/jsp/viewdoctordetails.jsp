<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
</head>
<body>
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");
String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");
if(!user_type.equals("admin") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}  
   String strsql= "select * from doctor where pathologyId = ?";  
   ResultSet rs=CrudOperation.getData(strsql,userid);  
   %>
   <table class="table">
   <thead class="thead-dark"><tr><th>Doctor Id</th><th> Name</th><th> Address</th><th>PhoneNo</th><th>Email</th>
                                 <th>Area Id</th><th> Registration Number</th><th>Skills</th><th>Higher Qualification</th></tr></thead>
  <% while(rs.next()) {%>        


                                <tbody>
					      		<tr><th><%=rs.getString("doctorId") %></th><th><%=rs.getString("name") %></th><th><%=rs.getString("address") %></th>
					      		<th><%=rs.getString("phoneNo") %></th><th><%=rs.getString("email") %></th><th><%=rs.getString("areaId") %></th>
					      		<th><%=rs.getString("registrationNo") %></th><th><%=rs.getString("skills") %></th><th><%=rs.getString("higherQualification") %></th>
					      		</tr></tbody>
					      		
					      		<% } %> 

   </table>


</body>
</html>