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
	   if( session.getAttribute("userkey") ==null  || session.getAttribute("userkey") ==" " || !session.getAttribute("userkey_for_usertypevalidation").equals("superadmin") ){
		  response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
		 }
 
 %>  


<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");//downcasting

%> 	

<div id="parent" style="width:100%;height:auto;">
	<div id="pHeader" style="width:100%;height:auto;background-color: red;">
		<h2  >Hello :<%=userid %> </h2>
		 
		
	</div>
	
	
	<script type="text/javascript">
	
	function viewpathologydetails(){
  		var xmlhttp_city=_data=new XMLHttpRequest();
  		xmlhttp_city.open("GET","viewpathologydetails.jsp",false);
  		xmlhttp_city.send(null);
  		document.getElementById("pBodyContent").innerHTML=xmlhttp_city.responseText;}
	
	

	function viewpathologywiseReports(){
  		var xmlhttp_city=_data=new XMLHttpRequest();
  		xmlhttp_city.open("GET","sviewreportdetails.jsp",false);
  		xmlhttp_city.send(null);
  		document.getElementById("pBodyContent").innerHTML=xmlhttp_city.responseText;}
	
	 function change_pathology(){	
		  
		 
		   var xmlhttp_test_data = new XMLHttpRequest();
		  xmlhttp_test_data.open("GET","listreportin_pathology.jsp?pathology="+document.getElementById("cmbpathology").value,false);
		  xmlhttp_test_data.send(null);
		  document.getElementById("contentBar").innerHTML=xmlhttp_test_data.responseText; 
			 
	} 
	 
	 function deletepathology(){	
		  var xmlhttp_test_data = new XMLHttpRequest();
		  xmlhttp_test_data.open("GET","deleteadminpath.jsp",false);
		  xmlhttp_test_data.send(null);
		  document.getElementById("pBodyContent").innerHTML=xmlhttp_test_data.responseText; 
			 
	} 
	 
	 
	 function editpathologydetails(){	
		  var xmlhttp_test_data = new XMLHttpRequest();
		  xmlhttp_test_data.open("GET","updatepathologydetails.jsp",false);
		  xmlhttp_test_data.send(null);
		  document.getElementById("pBodyContent").innerHTML=xmlhttp_test_data.responseText; 
			 
	} 
	
  	
  	
	
	
	
	
	
	</script>
	
	
	
	
	
	
	<div id="pBody" style="width:100%;height:auto;">
		<div id="pBodyMenu" style="width:20%;height:auto;float:left;background-color: yellow;">
			<%@include file="/WEB-INF/superadminmenu.html"%>
		</div>
		<div id="pBodyContent" style="width:80%;height:auto;float:left;background-color: cyan"></div>
		
	</div>
	<div id="pFooter" style="width:100%;height:auto;"></div>
	

</div>

</body>
</html>