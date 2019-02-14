<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<html>
<head>
	<title>Patient Portal</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
		 $(window).on("scroll", function() {
            if($(window).scrollTop()) {
                  $('nav').addClass('black');
            }

            else {
                  $('nav').removeClass('black');
            }
      })
	</script>
	<style type="text/css">
		body{
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
		}
		nav{
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100px;
			padding: 10px 100px;
			box-sizing: border-box;
			transition: .3s;
		}
		nav.black{
			background: rgba(0,0,0,0.8);
			height: 100px;
			padding: 10px 100px;
		}
		nav .logo img{
			padding: 15px 20px;
			height: 50px;
			float: left;
			transition: .3s;
			color: white;
		}
		nav.black .logo{
			color: #fff;
		}
		nav ul{
			list-style: none;
			float: right;
			margin:0;
			padding: 0;
			display: flex;
		}
		nav ul li{
			list-style: none;
			color: white;
		}
		nav ul li a{
			line-height: 80px;
			color: white;
			padding: 12px 30px;
			text-decoration: none;
			text-transform: uppercase;
			transition: .3s;

		}
		nav .black ul li a{
			color: #fff;
		}
		nav ul li a:focus{
			outline: none;
		}
		nav ul li a.active{
			background: #e2472f;
			color: #fff;
			border-radius: 6px;
		}
		/*top section image
		--------------------*/
		section.sec1{
			width: 100%;
			height: 500px;
			background: url(/ZAPDiagnostics/images/patient.png);
			background-size: cover;
			background-position: center;
			color: white;
			text-align:;
		}
		/*options for patients
		-----------------------*/
		a{
			text-decoration: none;
		}
		section.sec2{
			width: 100%;
			height: 400px;
			background: grey;
		}
		.options{
			
			width: 100%;
			height: 400px;
			background: white; 
		}
		.s1{
			transition: box-shadow .3s;
			width: 33.33%;
			height: 50%;
			background: url(/ZAPDiagnostics/images/locate.jpg) no-repeat;
			background-size: cover;
			background-position: center;
			color: white;
			float: left;
		}
		.s1 a h3{
			color: white;
			font-family: sans-serif;
			font-size: 23px;
			font-weight: 30px;
			text-align: center;
			margin-bottom: 30%;
			text-decoration: none;
		}
		.s1 img{
			width: 20%;
			height: 40%;
			margin-top: 10%;
			margin-left: 40%;
		}
		.s2{
			transition: box-shadow .3s;
			width: 33.33%;
			height: 50%;
			background: url(/ZAPDiagnostics/images/appointment.jpg) no-repeat;
			background-size: cover;
			background-position: center;
			color: white;
			float: right;
		}
		.s2 a h3{
			color: white;
			font-family: sans-serif;
			font-size: 23px;
			font-weight: 30px;
			text-align: center;
			margin-bottom: 30%;
			text-decoration: none;
		}
		.s2 img{
			width: 20%;
			height: 40%;
			margin-top: 10%;
			margin-left: 40%;
		}
		.s3{
			transition: box-shadow .3s;
			width: 33.33%;
			height: 50%;
			background: url(/ZAPDiagnostics/images/report.jpg) no-repeat;
			background-size: cover;
			background-position: center;
			color: white;
			float: left;
		}
		.s3 a h3{
			color: white;
			font-family: sans-serif;
			font-size: 23px;
			font-weight: 30px;
			text-align: center;
			margin-bottom: 30%;
			text-decoration: none;
		}
		.s3 img{
			width: 20%;
			height: 40%;
			margin-top: 10%;
			margin-left: 40%;
		}
		.s4{
			transition: box-shadow .3s;
			width: 33.33%;
			height: 50%;
			background: url(/ZAPDiagnostics/images/test.jpg) no-repeat;
			background-size: cover;
			background-position: center;
			color: white;
			float: left;
		}
		.s4 a h3{
			color: white;
			text-align: center;
			font-family: sans-serif;
			font-size: 23px;
			font-weight: 30px;
			margin-bottom: 30%;
			text-decoration: none;
		}
		.s4 img{
			width: 20%;
			height: 40%;
			margin-top: 10%;
			margin-left: 40%;
		}
		.s5{
			transition: box-shadow .3s;
			width: 33.33%;
			height: 50%;
			background: url(/ZAPDiagnostics/images/message.jpg) no-repeat;
			background-size: cover;
			background-position: center;
			color: white;
			float: left;
		}
		.s5 a h3{
			color: white;
			font-family: sans-serif;
			font-size: 23px;
			font-weight: 30px;
			text-align: center;
			margin-bottom: 30%;
			text-decoration: none;
		}
		.s5 img{
			width: 20%;
			height: 40%;
			margin-top: 10%;
			margin-left: 40%;
		}
		.s1:hover
		 {
  			box-shadow: 0 0 20px rgba(33,33,33,2); 
		 }
		 .s2:hover
		 {
  			box-shadow: 0 0 20px rgba(33,33,33,2); 
		 }
		 .s3:hover
		 {
  			box-shadow: 0 0 20px rgba(33,33,33,2); 
		 }
		 .s4:hover
		 {
  			box-shadow: 0 0 20px rgba(33,33,33,2); 
		 }
		 .s5:hover
		 {
  			box-shadow: 0 0 20px rgba(33,33,33,2); 
		 }
	</style>
</head>
<body>
     <%
	   if( session.getAttribute("userkey") ==null  || session.getAttribute("userkey") ==" " || !session.getAttribute("userkey_for_usertypevalidation").equals("patient") ){
		  response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
		 }
 
 %>    

    <% 
    
    HttpSession hs= request.getSession(false); 
       
    String userid = (String)hs.getAttribute("userkey");
    %>
   



     
	<div class="wrapper">
		<nav>
			<div class="logo"><a href="a.html"><img src="/ZAPDiagnostics/images/ZAP.png"></a></div>
			
				<ul>
					<li><a href="patientprofile.jsp">Profile</a></li>
					
					<%
					 if(null == session.getAttribute("userkey")){%>
						 <li><a class="active" href="login.jsp">Log In</a></li>
						<% }else{%>
						 
							 <li><a class="active" href="/ZAPDiagnostics/LogOff">Log Off</a></li>
						<%}
					 %>
				</ul>
		</nav>
		
		<script type="text/javascript">
		
		function viewreports(){
	  		var xmlhttp_city=_data=new XMLHttpRequest();
	  		xmlhttp_city.open("GET","pviewreport.jsp",false);
	  		xmlhttp_city.send(null);
	  		document.getElementById("contentview").innerHTML=xmlhttp_city.responseText;}
		
		</script>
		
		<section class="sec1"></section>
		<section class="sec2">
			<div class="options">
				<div class="s1"><a href="findpathology.jsp"><img src="/ZAPDiagnostics/images/locate.png"><h3>Locate Nearest Center</h3></a></div>
				<div class="s2"><a href="bookappointment.jsp?test_id=1"><img src="/ZAPDiagnostics/images/appointment.png"><h3>Book an Appointment</h3></a></div>
				<div class="s3"><a href="#contentview"  onclick="viewreports()"  ><img src="/ZAPDiagnostics/images/report.png"><h3>Investigate Report</h3></a></div>
				<div class="s4"><a href="findtest.jsp"><img src="/ZAPDiagnostics/images/test.png"><h3>Search Test</h3></a></div>
				<div class="s5"><a href="startcommunication.jsp"><img src="/ZAPDiagnostics/images/message.png"><h3>Messaging</h3></a></div>
			</div>
		</section>

	</div>
	<div id="contentview">
	
	
	</div>
	    <a    href="patientviewappointment.jsp"   >               <button>View appointment Status </button>     </a>
</body>
</html>