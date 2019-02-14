<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
  
  
  
  
  <script>
  	function showdoctorform(){
  		var xmlhttp_city=_data=new XMLHttpRequest();
  		xmlhttp_city.open("GET","adddoctor.jsp",false);
  		xmlhttp_city.send(null);
  		document.getElementById("pBodyContent").innerHTML=xmlhttp_city.responseText;}
  	
  	function showworkerform(){
  		var xmlhttp_city=_data=new XMLHttpRequest();
  		xmlhttp_city.open("GET","addworker.jsp",false);
  		xmlhttp_city.send(null);
  		document.getElementById("pBodyContent").innerHTML=xmlhttp_city.responseText;}
  		
  	function viewtestappointments(){
  		var xmlhttp_city=_data=new XMLHttpRequest();
  		xmlhttp_city.open("GET","adminviewtestAppointments.jsp",false);
  		xmlhttp_city.send(null);
  		document.getElementById("pBodyContent").innerHTML=xmlhttp_city.responseText;}
  	
  	function viewdoctordetails(){
  		var xmlhttp_city=_data=new XMLHttpRequest();
  		xmlhttp_city.open("GET","viewdoctordetails.jsp",false);
  		xmlhttp_city.send(null);
  		document.getElementById("pBodyContent").innerHTML=xmlhttp_city.responseText;}
  	
  	function viewworkerdetails(){
  		var xmlhttp_city=_data=new XMLHttpRequest();
  		xmlhttp_city.open("GET","viewworkerdetails.jsp",false);
  		xmlhttp_city.send(null);
  		document.getElementById("pBodyContent").innerHTML=xmlhttp_city.responseText;}
    	
  	
  </script>
</head>
<body>
<%
	   if( session.getAttribute("userkey") ==null  || session.getAttribute("userkey") ==" " || !session.getAttribute("userkey_for_usertypevalidation").equals("admin") ){
		  response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
		 }
 
 %>  


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
		 <script src="/ZAPDiagnostics/bs/jquery-3.3.1.min.js"></script>
  
  <script type="text/javascript">
  
  
  $(document).ready(function()
	  		
	  		{
	      $("#doctorid").blur(
	      		function(){
	      			var ui=this.value;
	      			//alert(ui)
	       
	      			 $.get("/ZAPDiagnostics/AddDoctor",
	      			        {
	      			          user:ui
	      			          
	      			        },
	      			        function(data,status){
	      			        	//if(data=="")
	      			          //  alert("Data: " + data + "\nStatus: " + status);
	      			             $("#uiError").html(data);//.html is methof= of jQuery
	      			           //  $("#div1").show();
	      			             //$("#div1").hide(5000);
	      			             
	      			        }); 
	      			
	      			
	      			
	      });
	  });
  

  </script>
		<div id="pBodyContent" style="width:80%;height:auto;float:left;background-color: cyan"></div>
		
	</div>
	<div id="pFooter" style="width:100%;height:auto;"></div>

</div>
















</body>
</html>