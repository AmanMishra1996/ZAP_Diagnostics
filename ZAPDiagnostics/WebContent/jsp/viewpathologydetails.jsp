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
</head>
<body>
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");
String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");
if(!user_type.equals("superadmin") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}
%> 
<%   
   String strsql= "select * from pathology";   
   ResultSet rs=CrudOperation.getData(strsql);   
   %>  
   <table class="table">
   <thead class="thead-dark"><tr><th>Pathology Id</th>    <th> Name</th>  <th> Address</th>  <th>PhoneNo</th>  <th>Email</th>  
                                <th>City</th>  <th> Speciality</th> <th>Description</th>       </tr></thead> 
  <% while(rs.next()) {%>        


                                <tbody>
					      		<tr><th><%=rs.getString("pathologyId") %></th><th><%=rs.getString("name") %></th><th><%=rs.getString("address") %></th>
					      		<th><%=rs.getString("phoneNo") %></th><th><%=rs.getString("email") %></th><th><%=rs.getString("city_id") %></th>
					      		<th><%=rs.getString("speciality") %></th><th><%=rs.getString("description") %>
					      		</tr></tbody>
					      		
					      		<% } %> 

   </table>


</body>
</html>

