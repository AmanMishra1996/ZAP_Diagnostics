<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
	<form action="/ZAPDiagnostics/AddTips" method="post" enctype="multipart/form-data">
	<div class="table-responsive">
		<table class="table table-dark table-striped" Style="height:100vh;margin-bottom: 0">
		
			<tr><th>Subject</th><th><input type="text" id="subid" name="subid"></th></tr>
			<tr>
				    <th>Contents :  </th>
					<th>
						<textarea class="form-control" rows="16" id="contentid" name="contentid"></textarea>
                        
                        
					</th>
				    
			</tr>
			
			
			
			
			<!-- <tr><th></th><th><input type="text" id="" name=""></th></tr> -->
			<tr><th>Photo : </th><th><input type="file" class="form-control-file" id="picname" name="picname"></th></tr>
			
			<!-- <tr><th>Doctor ID</th><th><input type="text" id="doctorid" name="doctorid"></th></tr> -->
			<tr>
				<th><button type="submit" style="margin-left: 20%;">SUBMIT</button></th>
			</tr>
		</table>
		</div>
	</form>	

</body>
</html>