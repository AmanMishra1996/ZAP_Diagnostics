<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="/ZAPDiagnostics/AddWorker">
<table>
<tr><th>Worker Id : </th><th><input type="text" id="workerid" name="workerid"></th></tr>
<tr><th>User Password : </th><th><input type="text" id="workerpassword" name="workerpassword"></th></tr>
<tr><th>Name : </th><th><input type="text" id="workername" name="workerrname"></th></tr>
<tr><th>Address : </th><th><input type="text" id="workeraddress" name="workeraddress"></th></tr>
<tr><th>Phone No : </th><th><input type="text" id="workerphone" name="workerphone"></th></tr>
<tr><th>Email : </th><th><input type="email" id="workeremail" name="workeremail"></th></tr>
<tr><th>City : </th><th><input type="text" id="workercity" name="workercity"></th></tr>






<tr><th>Pathology Id : </th><th><input type="text" id="workerpathologyid" name="workerpathologyid"></th></tr>

<tr>	
				
				
				<th><button type="submit">Register</button></th>
				<th><button type="reset">Reset</button></th>
		
</tr>



</table>


</form>






</body>
</html>