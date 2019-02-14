<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
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
			background: url(/ZAPDiagnostics/images/profile.jpg);
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
			padding: 22px 20px;
			width: 100%;
			height: 40px;
			font-size: 30px;
			font-family: sans-serif;
			text-align: center;

		}

		section.sec3{
			width: 90%;
			height: 800px;
			background: white;
			border-radius: 10px;
			margin-left: 5%;
			box-shadow: 0 0 20px rgba(33,33,33,2); 
			
		}
		.s1{
			width: 35%;
			overflow: hidden;
			font-size: 15px;
			padding: 8px;
			margin-left: 150px;
			float: left;
			color: black;
		}
		.s2{
			width: 35%;
			overflow: hidden;
			font-size: 15px;
			padding: 8px;
			margin-right: 100px;
			float: right;
			color: grey;
		}
		.null{
			width: 100%;
			height: 10px;
		}
		.patient_id{
			width: 100%;
			height: 100px;
			margin-top: 10px;
			background: white;
		}
		.patient_name{
			width: 100%;
			height: 100px;
			background: white;
		}
		.patient_address{
			width: 100%;
			height: 200px;
			background: white;
		}
		.patient_phone{
			width: 100%;
			height: 100px;
			background: white;
		}
		.patient_email{
			width: 100%;
			height: 100px;
			background: white;
		}
		.regdate{
			width: 100%;
			height: 100px;
			background: white;
		}	
		
		.btn button
		{
			width: 25%;
			background: none;
			border: 1px solid #e2472f;
			font-size: 30px;
			color: black;
			padding: 5px;
			margin-left: 35%;
		}
		
	</style>
</head>
<body>
    <%
	   if( !session.getAttribute("userkey_for_usertypevalidation").equals("worker") ){
		  response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
		 }
	%>
    
    <%
    
    
     HttpSession hs= request.getSession(false); 
     String userid = (String)hs.getAttribute("userkey");//downcasting
     
     %> 
    <div class="wrapper">
		<nav>
			<div class="logo"><a href="a.html"><img src="/ZAPDiagnostics/images/ZAP.png"></a></div>
			
				<ul>
					<li><a href="workerhome.jsp"><%=userid %> Home</a></li>
					<%
					 if(null == session.getAttribute("userkey")){%>
						 <li><a class="active" href="login.jsp">Log In</a></li>
						<% }else{%>
						 
							 <li><a class="active" href="/ZAPDiagnostics/LogOff">Log Off</a></li>
						<%}
					 %>
				</ul>
		</nav>
 		<%
						      		
					      			String path=request.getContextPath();
						      		String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/profilepics/";
						      		System.out.println(basePath);
						      		
						      		String filename="";
						      		String filehref=null;
						      		
						      		
						      		String strsql="select * from pathologyworker  where workerId=? ";
						      		
						      		ResultSet rs=CrudOperation.getData(strsql,userid);
						      		 while(rs.next()) {%>
						      		   <% filename=rs.getString("photo");
								      			if(filename==null)
								      			{
								      				filehref="/ZAPDiagnostics/images/defaultworkerprofile.png";
								      				
								      			}
								      			else{
								      				
								      				filehref=basePath+userid+"/"+filename;
								      			}%>
								      			 
		
		<section class="sec1"></section>
		<section class="sec2">PROFILE</section>
		<section class="sec3">
			<div class="null">   </div>

			<div class="patient_id">
				<div class="s1">
					<h2>ID:</h2>
				</div>
				<div class="s2">
				 	<h2><%=rs.getString("workerId") %></h2> 
				</div>
			</div>
			<div class="patient_name">
				<div class="s1">
					<h2>Name:</h2>
				</div>
				<div class="s2">
				 	<h2><%=rs.getString("name") %></h2> 
				</div>
			</div>
			<div class="patient_address">
				<div class="s1">
					<h2>Address:</h2>
				</div>
				<div class="s2">
					 <h2><%=rs.getString("address") %></h2> 
				</div>
			</div>
			<div class="patient_phone">
				<div class="s1">
					<h2>Phone:</h2>
				</div>
				<div class="s2">
					 <h2><%=rs.getString("phoneNo") %></h2> 
				</div>
			</div>
			<div class="patient_email">
				<div class="s1">
					<h2>Email:</h2>
				</div>
				<div class="s2">
					<h2><%=rs.getString("email") %></h2> 
				</div>
			</div>
			<div class="regdate">
				<div class="s1">
					<h2>Profile Pic:</h2>
				</div>
				<div class="s2">
					 <img src="<%=filehref%>" style="width: 30%;height:30%" > 
				</div>
			</div>
			
				<div class="btn"><a href="patient_update.html"><button type="submit">Change Entry</button></a></div>
		</section>
		 <% } %>  
	</div>




</body>
</html>