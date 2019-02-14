<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
    <script src="/ZAPDiagnostics/bs/jquery-3.3.1.min.js"></script>
  
  <script type="text/javascript">
  
  
  $(document).ready(function()
	  		
	  		{
	      $("#patid").blur(
	      		function(){
	      			var ui=this.value;
	      			//alert(ui)
	       
	      			 $.get("/ZAPDiagnostics/Registration",
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

</head>
<body>

</head>
<body>

	<div >
		<form action="/ZAPDiagnostics/Registration" method="post" >
			<table class="table table-dark"  style="height:100vh;margin-bottom: 0">
			<tr>
				<th> Patient Id:</th>
				<th> <input type="text" id="patid" name="patid" placeholder="Patient Id" ></th>
				<td><span id = "uiError"></span></td>
			</tr>
			<tr>
				<th> Name:</th>
				<th> <input type="text" id="Name" name="Name" placeholder="Enter your Name" ></th>
				<td><span id = "NameError"></span></td>
			</tr>
			<tr>	
				<th> Email:</th>
				<th> <input type="email" id="regEmail" name="regEmail" placeholder="Your Email" ></th>
				<td><span id = "regEmailError"></span></td>
			</tr>
			<tr>	
				<th> Confirm Email</th>
				<th> <input type="email" id="confirmRegEmail" name="confirmRegEmail" placeholder="Confirm Your Email" ></th>
				<td><span id = "confirmEmailError"></span></td>
			</tr>
			<!-- <tr>	
				<th> Address: </th>
				<th><Select name="address">
							<option value = "default" >Select City</option>
							<option value = "LKO" >Lucknow</option>
							<option value = "VNS" >Varanasi</option>
				</Select></th>
			</tr>
			 -->
			<tr>
			<th>City :</th>
			<th>
			<select    id="pathologycity" name="address">
			<option value = "default">Select City </option>
			<%
			String strsql = "select * from cities";
			ResultSet rs = CrudOperation.getData(strsql);
			
			while(rs.next()){
			     String cid = rs.getString("city_id");
			     String cname=rs.getString("city_name");
			%>
			      <option  value= "<%=cid %>" > <%=cname %> </option>
			
			<%} %>
			
			</select>
			</th></tr>
			
			
			
			
			
			
			
			
			
			
			
			
			
			<tr>	
				<th> Phone:</th>
				<th> <input type="text" id="regPh" name="regPh" placeholder="enter your Phone" ></th>
				<td><span id = "regPhError"></span></td>
			</tr>
			<tr>	
				<th> Password:</th>
				<th> <input type="password" id="pass" name="pass" placeholder="enter your Password" ></th>
				<td><span id = "passError"></span></td>
			</tr>
			<tr>	
				<th> Confirm Password:</th>
				<th> <input type="password" id="cpass" name="cpass" placeholder="Confirm your Password" ></th>
				<td><span id = "passError"></span></td>
			</tr>
			<tr>	
			
				<th><button type="submit">LogIn</button></th>
				<th><button type="reset">Reset</button></th>
		
			</tr>
			
			
			
			</table>
		
		</form>
	
	</div>

</body>
</html>