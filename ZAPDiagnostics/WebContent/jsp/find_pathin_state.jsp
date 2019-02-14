<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String stateid=request.getParameter("state");
   
String str = "Select * from  pathology where city_id in (select city_id from cities where state_id=?) ";
ResultSet rs = CrudOperation.getData(str,stateid);%>
<% while(rs.next()){
%>
<div style="width:25%;height:255px; background-color: white;box-shadow: 0 0 20px rgba(33,33,33,2);border-radius:10px; float:left;margin-left: 5%;padding:20px 20px ;overflow: hidden;margin-bottom: 5%;">
        
	        <div style="font-family: sans-serif;font-size: 30px;border-bottom: 1px solid skyblue">
	        	<%=rs.getString("name") %>
	        </div>
       <div style="border-bottom: 1px solid lightgrey;height: 160px"> 
			<div style="margin-left: 10px;margin-top: 20px;float:left;">
			     <img src="https://www.pathkindlabs.com/front/img/lab-icon.jpg" alt="PathKind Labs">
			</div>
			<div style="margin-left: 80px;">
			
				<p ><%=rs.getString("address") %></p>
				<p style="margin: 0"><%=rs.getString("phoneNo") %></p>
				<p style="margin: 0"><%=rs.getString("email") %></p>
				<p style="margin: 0"><%=rs.getString("city_id") %></p>
			</div>
       </div>
        <div style="color: lightgrey;margin-top: 20px;">
			<label><b> Speciality :</b> </label>       <%=rs.getString("speciality") %>
			
        </div>


</div>



<% } %>

</body>
</html>