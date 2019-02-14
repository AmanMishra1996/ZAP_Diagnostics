<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,zapdiag.dbutils.*" %>
<html>
<head>
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
	<link rel="stylesheet" href="/ZAPDiagnostics/css/patientprofile.css">
	</head>
<body>

    <%
	   if( !session.getAttribute("userkey_for_usertypevalidation").equals("patient") ){
		  response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
		 }
	 %>

  	<%
		HttpSession hs= request.getSession(false); 
		String userid = (String)hs.getAttribute("userkey");
		
	%>
    <%
	String strsql="select * from patient where patientId=?";
	ResultSet rs=CrudOperation.getData(strsql,userid);
	
    %>
	<div class="wrapper">
		<nav>
			<div class="logo"><a href="index.jsp"><img src="/ZAPDiagnostics/images/ZAP.png"></a></div>
			
				<ul>
					<li><a href="patienthome.jsp">Patient Home</a></li>
					
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
		<section class="sec2">PATIENT PROFILE</section>
		<section class="sec3">
		    <%while(rs.next()){ %>
			<div class="patient_id">
				<div class="s1">
					<h2>Patient ID:</h2>
				</div>
				<div class="s2">
					<h2><%=rs.getString("patientId") %> </h2>
				</div>
			</div>
			<div class="patient_name">
				<div class="s1">
					<h2>Patient Name:</h2>
				</div>
				<div class="s2">
					<h2><%=rs.getString("name") %></h2>
				</div>
			</div>
			<div class="patient_address">
				<div class="s1">
					<h2>Patient Address:</h2>
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
					<h2>Reg. Date:</h2>
				</div>
				<div class="s2">
					<h2><%=rs.getString("regDate") %></h2>
				</div>
			</div>
			<%} %>
				<div class="btn"><a href="updatepatientprofile.jsp"><button type="submit">Change Entry</button></a></div>
			
		</section>
	</div>

</body>
</html>