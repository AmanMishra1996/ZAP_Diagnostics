<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
</head>
<body>
	<form action="/ZAPDiagnostics/AddTest" method="post">
		<table class="table table-dark table-striped" style="margin-bottom: 0">
			<%
			HttpSession hs= request.getSession(false); 
			String userid = (String)hs.getAttribute("userkey");//downcasting
			//userid= userid.toUpperCase();
			String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");

			if(!user_type.equals("worker") ){
				response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
			}
			
			
			%>
			<%
			   String pathid="select pathologyId from pathologyworker where workerId =?";
			   ResultSet rspathid = CrudOperation.getData(pathid, userid);
			   while(rspathid.next()){
			%>
			<tr><th>Path ID:</th><th><input type="text" id="pathid" name="pathid" value="<%=rspathid.getString("pathologyId")%>  " readonly></th></tr>
			
			<%} %>
			
			<tr><th>Test Name:</th><th><input type="text" id="testname" name="testname"></th></tr>
			<tr><th>Test Condition:</th><th><input type="text" id="testcond" name="testcond"></th></tr>
			<tr><th>Test Charges:</th><th><input type="text" id="charges" name="charges"></th></tr>
			<tr>
				<th><button type="submit">SUBMIT</button>
			</tr>
		</table>
	
	</form>
</body>
</html>