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

if(!user_type.equals("patient") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}
%> 
<%   
   String strsql= "select * from test_appointment where patientId = ?";   
   ResultSet rs=CrudOperation.getData(strsql,userid);   
   %>  
   <table class="table">
   <thead class="thead-dark"><tr><th>Appointment Id</th>    <th> Test Id</th>  <th> Worker Id </th>  <th>Remarks</th>  <th>Status</th>  
                                  </tr></thead> 
  <% while(rs.next()) {%>        
 <tbody>
					      		<tr><th><%=rs.getString("aptId") %></th><th><%=rs.getString("testId") %></th><th><%=rs.getString("workerId") %></th>
					      		<th><%=rs.getString("remarks") %></th><th><%=rs.getString("status") %></th>
					      		
					      		</tr></tbody>
					      		
					      		<% } %> 

   </table>

</body>
</html>