<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Portal</title>
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
			font-family: sans-serif;

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
			background: url(/ZAPDiagnostics/images/doctorhome.jpg);
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
			height: auto;
			background: grey;
		}
		.options{
			
			width: 100%;
			height: auto;
			background: grey; 
		}
		.s1{
			transition: box-shadow .3s;
			width: 33.33%;
			height: 100%;
			background: url(/ZAPDiagnostics/images/news.jpg) no-repeat;
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
			margin-top: 20%;
			margin-left: 40%;
		}
		.s2{
			transition: box-shadow .3s;
			width: 33.33%;
			height: 100%;
			background: url(/ZAPDiagnostics/images/message.jpg) no-repeat;
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
			margin-top: 20%;
			margin-left: 40%;
		}
		.s3{
			transition: box-shadow .3s;
			width: 33.33%;
			height: 100%;
			background: url(/ZAPDiagnostics/images/tips.jpg) no-repeat;
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
			margin-top: 20%;
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
		
	</style>
</head>
<body>
 <%
	   if( session.getAttribute("userkey") ==null  || session.getAttribute("userkey") ==" " || !session.getAttribute("userkey_for_usertypevalidation").equals("doctor") ){
		  response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
		 }
 
 %> 
<%--   <%
HttpSession hs= request.getSession(false);
  if(hs.equals(null)){
	 response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");  
  }
  else if(!hs.getAttribute("userkey_for_usertypevalidation").equals("doctor")){
	  
	  String userid = (String)hs.getAttribute("userkey");
	  if( !session.getAttribute("userkey_for_usertypevalidation").equals("doctor") ){
	  	  response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
	  	 
	   }
	  
  }

%>     --%>


    <%--     <%


    session=request.getSession(false);

    if(session==null)
    {
        
    	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");

    }


%> --%>







<div class="wrapper">
		<nav>
			<div class="logo"><a href="index.jsp"><img src="/ZAPDiagnostics/images/ZAP.png"></a></div>
			
				<ul>
					<li><a href="doctorprofile.jsp">Profile</a></li>
					<%
					 if(null == session.getAttribute("userkey")){%>
						 <li><a class="active" href="login.jsp">Log In</a></li>
						<% }else{%>
						 
							 <li><a class="active" href="/ZAPDiagnostics/LogOff">Log Off</a></li>
						<%}
					 %>
				</ul>
		</nav>
		<section class="sec1"></section>
		<section class="sec2">
			<div class="options">
			
			    <script>
			    function addnews(){
			  		var xmlhttp_city=_data=new XMLHttpRequest();
			  		xmlhttp_city.open("GET","addnews.jsp",false);
			  		xmlhttp_city.send(null);
			  		document.getElementById("contentview").innerHTML=xmlhttp_city.responseText;}
			    
			    function addtips(){
			  		var xmlhttp_city=_data=new XMLHttpRequest();
			  		xmlhttp_city.open("GET","addtips.jsp",false);
			  		xmlhttp_city.send(null);
			  		document.getElementById("contentview").innerHTML=xmlhttp_city.responseText;}
			    
			    
			    </script>
				<div class="s1"><a href="#contentview" onclick="addnews()"><img src="/ZAPDiagnostics/images/news.png"><h3>Add News</h3></a></div>
				<div class="s2"><a href="startcommunication.jsp" ><img src="/ZAPDiagnostics/images/message.png"><h3>Message</h3></a></div>
				<div class="s3"><a href="#contentview" onclick="addtips()"><img src="/ZAPDiagnostics/images/tips.png"><h3>Add Tips</h3></a></div>
			</div>
		</section>

	</div>
	<div  id="contentview">
	
	
	</div>
		
	

</body>
</html>