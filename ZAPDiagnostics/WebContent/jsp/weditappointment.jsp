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

if(!user_type.equals("worker") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}
%> 
<%   
   String strsql= "select * from test_appointment where workerId = ?";   
   ResultSet rs=CrudOperation.getData(strsql,userid);   
   %> 
   
  <% while(rs.next()) {%> 
  <form action="/ZAPDiagnostics/WEditAppointment" method="post"> 
   <table class="table">
   <thead class="thead-dark"><tr><th>Appointment Id</th>    <th> Test Id</th>  <th> Patient Id </th>  <th>Remarks</th>  <th>Status</th>  
                                  <th></th></tr></thead>        
 <tbody>
					      		<tr><th><%=rs.getString("aptId") %></th><th><%=rs.getString("testId") %></th><th ><input type="text" id="uid" name="uid" value="<%=rs.getString("patientId") %>"readonly> </th>
					      		<th><textarea  name="changeremark" ><%=rs.getString("remarks") %></textarea></th>
					      		<th><input  name="changestatus" value="<%=rs.getString("status") %>"></th>
					      		<th><button type="submit">Update</button></th>
					      		
					      		</tr></tbody>
					      		
					      	

   </table>
</form>
	<% } %> 
</body>
</html>