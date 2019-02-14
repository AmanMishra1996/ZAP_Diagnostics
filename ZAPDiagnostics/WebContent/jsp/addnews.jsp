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
String userid = (String)hs.getAttribute("userkey");//downcasting
//userid= userid.toUpperCase();
String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");

if(!user_type.equals("doctor") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}
%> 

<form action="/ZAPDiagnostics/AddNews" method="post"  enctype="multipart/form-data">
								<table class="table table-dark table-striped" Style="height:100vh;margin-bottom: 0">
								
									<tr>
									    <th>Title : </th>
									    <th><input type="text" id="subjectId" name="subjectId"></th>
									</tr>
									
									
									<tr>
									    <th>Content :  </th>
										<th>
											<!-- <textarea rows="12" cols="120" id="messageBox" name="messageBox">
					                        
					                        </textarea> -->
					                        <textarea class="form-control" rows="16" id="comment" name="messageBox"></textarea>
					                        
										</th>
									    
									</tr>
									
									<tr><th>Photo : </th><th><input type="file" class="form-control-file" id="picname" name="picname"></th></tr>
			
									
									<!-- <tr>
									    <th>Doctor Id : </th>
									    <th><input type="text" id="doctorId" name="doctorId"></th>
									</tr>
									 -->
									
									<tr>	
										<th><button type="submit" style="margin-left: 20%;">Submit</button><th>
											
									</tr>
									
								
								</table>
							
					</form>


</body>
</html>