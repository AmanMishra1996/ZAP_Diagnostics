<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");
String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");

if(!user_type.equals("admin") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}
%> 
<% String testid= request.getParameter("testid");
String strsql= "select * from test_appointment where workerId=(select workerId from pathologyworker where workertype='appointment' and pathologyId=?) and testId=? "; 
 ResultSet rs = CrudOperation.getData(strsql,userid,testid);   
%>
  <% while(rs.next()) {%> 
   <table class="table">
   <thead class="thead-dark"><tr><th>Appointment Id</th>    <th> Test Id</th><th>Date</th>  <th> Patient Id </th>  <th>Remarks</th>  <th>Status</th>  
                                 </tr></thead>        
 <tbody>
					      		<tr><th><%=rs.getString("aptId") %></th><th><%=rs.getString("date") %></th>
					      		<th><%=rs.getString("testId") %></th><th ><%=rs.getString("patientId") %> </th>
					      		
					      		<th><%=rs.getString("remarks") %></th>
					      		<th><%=rs.getString("status") %></th>
					      		
					      		
					      		</tr></tbody>

   </table>
	<% } %> 
</body>
</html>