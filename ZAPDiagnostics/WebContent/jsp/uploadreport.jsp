<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
String userid = (String)hs.getAttribute("userkey");//downcasting
/* userid= userid.toUpperCase(); */
%> 

		<form method="post" action="/ZAPDiagnostics/UploadReport" enctype="multipart/form-data">
				<table  class="table table-dark table-striped" style="margin-bottom: 0"  >
				<%-- <tr><th><label><%=userid%></label></th><tr> --%>
				 <tr><!-- <th>Worker Id : </th> --><th><input type="hidden" id="workerid" name="workerid" value="<%=userid%>"   readonly></th></tr>
				<tr><th>Patient Id : </th><th><input type="text" id="patientid" name="patientid"></th></tr> 
				<tr><th>Test Id : </th><th><input type="text" id="testid" name="testid"></th></tr>
				<tr><th>Choose File : </th><th><input type="file" class="form-control-file" id="reportname" name="reportname"></th></tr>
				 
				   
				    
				  
				<tr><th>Doctor Id  : </th><th><input type="text" id="doctorid" name="doctorid"></th></tr>
				<tr><th>Remarks : </th><th><input type="text" id="reportremark" name="reportremark"></th></tr>
				<tr><th>Status : </th><th><input type="text" id="reportstatus" name="reportstatus"></th></tr>
				  

				  
				 <tr><th> <button type="submit" class="btn btn-primary" data-toggle="button" aria-pressed="false" >Submit</button></th></tr>
				</table>  
			
		</form>


</body>
</html>