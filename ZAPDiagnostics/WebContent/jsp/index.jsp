<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<html>
<head>
	<title>ZAP Diagnostics</title>
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
    <script src="/ZAPDiagnostics/bs/jquery-3.3.1.min.js"></script>
  <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script> --> 
    <script src="/ZAPDiagnostics/bs/bootstrap.min.js"></script>
    <script src="/ZAPDiagnostics/bs/popper.min.js"></script>
    <style>
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }
 
  </style>
  
  
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
	<link rel="stylesheet" href="/ZAPDiagnostics/css/indexstyle.css">
	
	

</head>
<body>

  



   <%

		String path=request.getContextPath();
		String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/newsPics/";
		System.out.println(basePath);
		String folder;
	    String filename="";
		String filehref=null;
		String strsql="select * from news order by newsId desc  limit 10 ";
		ResultSet rs=CrudOperation.getData(strsql);
	
		
		
		%> 
	<div class="wrapper">
		<nav>
			<div class="logo"><a href="#"><img src="/ZAPDiagnostics/images/ZAP.png"></a></div>
			
				<ul>
					<li><a href="#">HOME</a></li>
					<li><a href="findpathology.jsp">LOCATE PATHOLOGY</a></li>
					<li><a href="findtest.jsp">FIND TEST</a></li>
					 
					 <%
					 if(null == session.getAttribute("userkey")){%>
						 <li><a class="active" href="login.jsp">Log In</a></li>
						<% }else{%>
						 
							 <li><a class="active" href="/ZAPDiagnostics/LogOff">Log Off</a></li>
						<%}
					 %>
					 
					 
				</ul>
			
		</nav>
		<nav2>
			<ul id="menu-v">
   				 <li><a href="doctorhome.jsp"><img src="/ZAPDiagnostics/images/docicon.png"> Doctor</a></li>
   				 <li><a href="patienthome.jsp"><img src="/ZAPDiagnostics/images/picon.png"> Patient</a></li>
   				 <li><a href="workerhome.jsp"><img src="/ZAPDiagnostics/images/mask.png"> Worker</a></li>
			</ul>
		</nav2>
		<section class="sec1">
				
		</section>
		<section class="sec2">
			OUR SERVICES
		</section>
		<section class="sec3">
			<div class="serv">
				<div class="s1"><a href="/ZAPDiagnostics/html/services.html"><img src="/ZAPDiagnostics/images/haem.png"></a></div>
				<div class="s2"><a href="/ZAPDiagnostics/html/services.html"><img src="/ZAPDiagnostics/images/biochem.png"></a></div>
				<div class="s3"><a href="/ZAPDiagnostics/html/services.html"><img src="/ZAPDiagnostics/images/sero.png"></a></div>
				<div class="s4"><a href="/ZAPDiagnostics/html/services.html"><img src="/ZAPDiagnostics/images/micro.png"></a></div>
			</div>
		</section>
		<section class="sec4">
			<div class="feeds">
				<div class="news"><h2>News</h2>
				
				
				          <div id="dynamic_slide_show"  class="carousel slide" data-ride="carousel">
								 <ul class="carousel-indicators">							      		
											      		
									 <%
											      		
											
										     int count = 0;
										     while(rs.next()) {
										           if(count == 0){%>
										      				   <li data-target="#dynamic_slide_show" data-slide-to="<%=count %>" class="active"></li> 
										      			   <% }
										           else{%>
										      				   <li data-target="#dynamic_slide_show" data-slide-to="<%=count %>"></li>
										      				   
										      				   
										            <%}
										      			   
										      		count= count +1;
										      		 }
										          
											    %>
									</ul>
				   <div class="carousel-inner">
						      		<%  
						      					int counter=0;
						      		             rs.beforeFirst();
						      					while(rs.next()) {
								      		        
						      					   filename=rs.getString("newsPic");
								      			   folder = rs.getString("title").toLowerCase();
								      			   int nId = rs.getInt("newsId");
								      			
									      			if(filename==null)
									      			{
									      				filehref="/ZAPDiagnostics/images/news.jpg";
									      				
									      			}
									      			else{
									      				
									      				filehref=basePath+folder+"/"+filename;
									      			}
							      						
							      				
						      						
						      						if(counter ==0){%>
						      							<div class="carousel-item active" style="width:100%;height:500px; ">
						      	 <a href ="/ZAPDiagnostics/jsp/shownews.jsp?nid=<%=nId%>"><img src="<%=filehref%>"> </a>
										      		    <div class="carousel-caption" style="background: #999999; opacity: 0.8; align-content: center;">
													        <h3 style="color:black"><b><%=rs.getString("title").toUpperCase() %></b></h3>
													        <p><b><%=rs.getString("contents") %></b></p>
												        </div> 
												        </div>
						      						<%}
						      						else{%>
						      							<div class="carousel-item" style="width:100%;height:500px; " >
						      							 <a href ="/ZAPDiagnostics/jsp/shownews.jsp?nid=<%=nId%>"><img src="<%=filehref%>"> </a>
										      		    <div class="carousel-caption" style="background: #999999; opacity: 0.8; align-content: center;">
													        <h3 style="color:black"><b> <%=rs.getString("title").toUpperCase() %></b></h3>
													        <p><b><%=rs.getString("contents") %></b></p>
												        </div> 
												        </div>
						      						<% } 
						      						
						      						
						      						
											      						counter = counter +1; } %> 
							</div>     	
									 <a class="carousel-control-prev" href="#dynamic_slide_show" data-slide="prev"
									 >
					    <span class="carousel-control-prev-icon"></span>
					  </a>
					  <a class="carousel-control-next" href="#dynamic_slide_show" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>	     		
					</div>
				
			
				</div>
		
			</div>
		</section>
		<section class="sec5">
			<div class="loc_tips">
			 <!-- <div class="location"><h2>LOCATION</h2></div> -->
				<div class="tips"><h2>TIPS</h2>
				
				
							<%
	String pathtest=request.getContextPath();
	String basePathtest=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathtest+"/tipPics/";
	System.out.println(basePathtest);
						      		
	String foldertest;
	String filenametest="";
	String filehreftest=null;
	String strsqltest="select * from tips order by tipId desc limit 10 ";
	ResultSet rstest=CrudOperation.getData(strsqltest);                %>
						      		
					<div id="dynamic_slide_show"  class="carousel slide" data-ride="carousel">
						  <ul class="carousel-indicators">							      		
						    						      		
					 <%	    				
						int counttest = 0;
						while(rstest.next()) {
										 if(counttest == 0){%>
										    <li data-target="#dynamic_slide_show" data-slide-to="<%=counttest %>" class="active"></li> 
									 <% }
										   else{%>
										     <li data-target="#dynamic_slide_show" data-slide-to="<%=counttest %>"></li>
										      				   
									 <%}
										  counttest= counttest +1;}
										  rstest.beforeFirst();
					   %>
					   </ul>
					   <div class="carousel-inner">
	
						      		<% 
						      		
						      		      int countertest=0;
						      		      while(rstest.next()) {%>
								      		
								      			<% filenametest=rstest.getString("tipPic");
								      			   foldertest = rstest.getString("subject").toLowerCase();
								      			 int tId = rstest.getInt("tipId");
								      			if(filenametest==null)
								      			{
								      				filehreftest="/ZAPDiagnostics/images/tips.jpg";
								      				
								      			}
								      			else{
								      				
								      				filehreftest=basePathtest+foldertest+"/"+filenametest;
								      				
								      				
								      			}
								      			
								      			if(countertest ==0){%>
				      							<div class="carousel-item active" style="width:100%;height:500px; ">
				      	 <a href ="/ZAPDiagnostics/jsp/shownews.jsp?nid=<%=tId%>"><img src="<%=filehreftest%>"> </a>
								      		    <div class="carousel-caption" style="background: #999999; opacity: 0.8; align-content: center;">
											        <h3  style="color:black"><%=rstest.getString("subject") %></h3>
											        <p><%=rstest.getString("contents") %></p>
										        </div> 
										        </div>
				      						<%}
				      						else{%>
				      							<div class="carousel-item" style="width:100%;height:500px; " >
				      							 <a href ="/ZAPDiagnostics/jsp/shownews.jsp?nid=<%=tId%>"><img src="<%=filehreftest%>"> </a>
								      		    <div class="carousel-caption" style="background: #999999; opacity: 0.8; align-content: center;">
											        <h3 style="color:black"><%=rstest.getString("subject") %></h3>
											        <p><%=rstest.getString("contents") %></p>
										        </div> 
										        </div>
				      						<% } 
				      						
				      						
				      						
				      						countertest = countertest +1; } %>
								      			
															      			
											</div>     	
											 <a class="carousel-control-prev" href="#dynamic_slide_show" data-slide="prev">
							    <span class="carousel-control-prev-icon"></span>
							  </a>
							  <a class="carousel-control-next" href="#dynamic_slide_show" data-slide="next">
							    <span class="carousel-control-next-icon"></span>
							  </a>	     		
							</div>	      		
							
				</div>
			</div>
		</section>
		<section class="sec6">
			<div class="footer">
				<div class="ele1">
					
					<h2>ABOUT US</h2>
					<div class="component">
						<ul>
							<li><a href="/ZAPDiagnostics/html/mission.html">Mission</a></li>
							
						</ul>
					</div>

				</div>
				<div class="ele2">
					
					<h2>PARTNER WITH US</h2>
					<div class="component">
						<ul>
							<li><a href="registerpathology.jsp">Register your Pathology</a></li>
							<li><a href="adminhome.jsp">visit your pathology</a></li>
							
						</ul>
					</div>
				</div>
				<div class="ele3">
					
					
				</div>
			</div>
		</section>
	</div>
</body>
