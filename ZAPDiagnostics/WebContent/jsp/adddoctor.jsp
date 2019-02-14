<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor++</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
  <!--  <script src="/ZAPDiagnostics/bs/jquery-3.3.1.min.js"></script>
  
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
   -->
  
  
  
</head>
<body>
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");

String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");

if(!user_type.equals("admin") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}
%> 
<form method="post" action="/ZAPDiagnostics/AddDoctor">
<table class="table table-dark" style="height:100vh;margin-bottom: 0">
<tr><th>Doctor Id : </th><th><input type="text" id="doctorid" name="doctorid"></th>

<td><span id = "uiError"></span></td>
</tr>
<tr><th>User Password : </th><th><input type="text" id="doctorpassword" name="doctorpassword"></th></tr>
<tr><th>Name : </th><th><input type="text" id="doctorname" name="doctorname"></th></tr>
<tr><th>Address : </th><th><input type="text" id="doctoraddress" name="doctoraddress"></th></tr>
<tr><th>Phone No : </th><th><input type="text" id="doctorphone" name="doctorphone"></th></tr>
<tr><th>Email : </th><th><input type="email" id="doctoremail" name="doctoremail"></th></tr>


<tr><th>Registration No : </th><th><input type="text" id="doctorregistrationnumber" name="doctorregistrationnumber"></th></tr>

<tr>	
				<th> Skills :</th>
				<th> <input type="checkbox" id="doctorSkill1" name="doctorskill" value="attention to detail" >attention to detail</th>
				<th> <input type="checkbox" id="doctorskill2" name="doctorskill" value="confidence" >confidence</th>
				<th> <input type="checkbox" id="doctorskill2" name="doctorskill" value="humane" >Humane</th>
				<th> <input type="checkbox" id="doctorskill2" name="doctorskill" value="respectfulness" >respectfulness</th>
				
</tr>
<tr>	
				<th> Higher Qualification :</th>
				<th> <input type="checkbox" id="doctorqualification1" name="doctorqualification" value="Bachelor's degree" >Bachelor's degree</th>
				<th> <input type="checkbox" id="doctorqualification2" name="doctorqualification" value="Master's degree" >Master's degree</th>
				
</tr>







<tr><th>Area Id : </th><th><input type="text" id="doctorareaid" name="doctorareaid"></th></tr>
<tr><th>Area Name : </th><th><input type="text" id="doctorareaname" name="doctorareaname"></th></tr>

<tr>
			  <th>Remarks :  </th>
			<th>  <textarea class="form-control" rows="10" id="doctorarearemarks" name="doctorarearemarks"></textarea>	</th>
									    
</tr>

<tr>	
				
				
				<th><button type="submit">Register</button></th>
				<th><button type="reset">Reset</button></th>
		
</tr>



</table>


</form>





</body>
</html>