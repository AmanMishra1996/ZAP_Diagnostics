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



<div id="parent" style="width:100%;height:auto;">
	<div id="pHeader" style="width:100%;height:auto;background-color: red;">
		<h2  >Hello :<%=userid %> </h2>
		 
		
	</div>
	<div id="pBody" style="width:100%;height:auto;">
		<div id="pBodyMenu" style="width:20%;height:auto;float:left;background-color: yellow;">
			<%@include file="/WEB-INF/adminmenu.html"%>
		</div>
		<div id="pBodyContent" style="width:80%;height:auto;float:left;background-color: cyan"></div>
	</div>
	<div id="pFooter" style="width:100%;height:auto;"></div>

</div>
















</body>
</html>