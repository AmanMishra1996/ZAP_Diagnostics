<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body >

<%
	   if( session.getAttribute("userkey") ==null  || session.getAttribute("userkey") ==" " || !session.getAttribute("userkey_for_usertypevalidation").equals("patient") ){
		  response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
		 }
 
     %>  
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");

/* String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");

if(!user_type.equals("patient") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}
 */%> 
<form method="post" action="/ZAPDiagnostics/BookAppointment">
<table>
<tr><th>Patient Id : </th><th><input type="text" id="patientid" name="patientid" value="<%=userid%>" readonly></th></tr>
<% String testid = request.getParameter("test_id");
   String str = "Select * from tests";
   ResultSet rs = CrudOperation.getData(str);%>
   <script>
    alert("please choose test Id :" +<%=testid%> );
   </script>
   <tr><th>Select Test Id :</th><th>
   <select id="cmbcity" name="cmbcity">
		<option value = "default">Select Test</option>
		<% while(rs.next()){%>		
		  <option value="<%= rs.getString("testId")%>"><%=rs.getString("testId") %></option>
		<% } %>
	</select>
    </th></tr>
    
<!-- <tr><th>Test Id : </th><th><input type="text" id="testid" name="testid" value="" readonly></th></tr> -->
<tr><th>Test Date : </th><th><input type="date" id="testdate" name="testdate"></th></tr>

<tr>	
			
				<th><button type="submit">Register</button></th>
				<th><button type="reset">Reset</button></th>
		
</tr>
</table>
</form>





</body>
</html>