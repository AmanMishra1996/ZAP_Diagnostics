<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Worker Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
</head>
<body>
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");
String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");
if(!user_type.equals("admin") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}

    String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/profilepics/";
	System.out.println(basePath);
	String filename="";
	String filehref=null;

   String strsql= "select * from pathologyworker where pathologyId = ?";  
   ResultSet rs=CrudOperation.getData(strsql,userid);  
   %>
   <table class="table">
   <thead class="thead-dark"><tr><th>Worker Id</th><th> Name</th><th> Address</th><th>PhoneNo</th><th>Email</th>
                                 <th>City</th><th> Profile Pic</th></tr></thead>
  <% while(rs.next()) {
	                                            filename=rs.getString("photo");
								      		    String folderofreport = rs.getString("workerId").toLowerCase();
								      			if(filename==null)
								      			{
								      				filehref="/ZAPDiagnostics/images/profile.jpg";
								      				
								      			}
								      			else{
								      				
								      				filehref=basePath+folderofreport+"/"+filename;
								      			}%>						

                                <tbody>
					      		<tr><th><%=rs.getString("workerId") %></th><th><%=rs.getString("name") %></th><th><%=rs.getString("address") %></th>
					      		<th><%=rs.getString("phoneNo") %></th><th><%=rs.getString("email") %></th><th><%=rs.getString("city_id") %></th>
					      		<th><img src="<%=filehref %>" width="200px" height="100px" style="margin-right: 0px" ></th>
					      		</tr></tbody>
					      		
					      		<% } %> 

   </table>


</body>
</html>