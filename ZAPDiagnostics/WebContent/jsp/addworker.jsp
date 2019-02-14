<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Worker++</title>
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
%> 
<form method="post" action="/ZAPDiagnostics/AddWorker"   enctype="multipart/form-data">
<table class="table table-dark" style="height:100vh;margin-bottom: 0">
<tr><th>Worker Id : </th><th><input type="text" id="workerid" name="workerid"></th></tr>
<tr><th>User Password : </th><th><input type="text" id="workerpassword" name="workerpassword"></th></tr>
<tr><th>Name : </th><th><input type="text" id="workername" name="workerrname"></th></tr>
<tr><th>Address : </th><th><input type="text" id="workeraddress" name="workeraddress"></th></tr>
<tr><th>Phone No : </th><th><input type="text" id="workerphone" name="workerphone"></th></tr>
<tr><th>Email : </th><th><input type="email" id="workeremail" name="workeremail"></th></tr>
<%
String strsql = "select city_id from pathology where pathologyId =?";
ResultSet rs = CrudOperation.getData(strsql,userid);

while(rs.next()){
     String cid = rs.getString("city_id");%>
 <tr><th>City : </th><th><input type="text" id="workercity" name="workercity" value="<%=cid %>" readonly></th></tr>   

<%} %>










<tr><th>Worker Type: </th><th><input type="text" id="workertype" name="workertype" placeholder="Appointement  / If already choosen please do not Enter anything"></th></tr>

<tr><th>Photo : </th><th><input type="file" class="form-control-file" id="picname" name="picname"></th></tr>


<tr>	
			
				<th><button type="submit">Register</button></th>
				<th><button type="reset">Reset</button></th>
		
</tr>



</table>


</form>






</body>
</html>