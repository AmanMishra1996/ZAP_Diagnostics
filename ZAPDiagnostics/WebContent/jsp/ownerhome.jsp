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

<%@include file="/WEB-INF/ownermenu.html"%>


 <%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");//downcasting
/* userid= userid.toUpperCase(); */
%> 




<div id="parent">
	<div id="pHeader">
		<h2 style="margin-top: 40px" >Hello :<%=userid %> </h2>
	</div>
	<div id="pBody">
		<div id="pBodyMenu">
			
		</div>
		<div id="pBodyContent"></div>
	</div>
	<div id="pFooter"></div>

</div>

</body>
</html>