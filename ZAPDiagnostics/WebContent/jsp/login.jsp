<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/touristportal/js/validation.js"></script>
<script type="text/javascript">
	function main(){
		b=true
	var ui=	document.getElementById("txtuserid").value
	var up= document.getElementById("txtuserpass").value
		if(checkEmpty(ui)==false ){
			document.getElementById("printError").innerHTML="User Id Needed"
			//return false
			b=false
		}else
			{
			document.getElementById("printError").innerHTML=""
			
			}
	    if(checkEmpty(up)==false){
	    	//alert("User password needed")
	    	document.getElementById("printErrors").innerHTML="User password Needed"
	    	//return false
	    	b=false
	    }else
			{
			document.getElementById("printErrors").innerHTML=""
			
			}
	//return true
	return b
	
	}

</script> -->
</head>
<body style="margin:0px;"><!--  onload="load()"  -->






	<div style="width:100%;height:100px;background-color: cyan;float: left">
		<form action="/ZAPDiagnostics/Login" method="post" >
			<table  style="margin-left: 350px;margin-top: 30px;display: inline-block;"><tr>
			
				<th> UserId</th>
				<th> <input type="text" id="txtuserid" name="txtuserid" placeholder="UserId" ></th>
					
				<th> UserPass</th>
				<th> <input type="password" id="txtuserpass" name="txtuserpass" placeholder="UserPass" ></th>
				<th><button type="submit">LogIn</button></th>
			
		
			</tr>
			<tr><td><span id = "printError"></span></td></tr>
			<tr><td><span id = "printErrors"></span></td></tr>
			
			 
			
			
			</table>
		    
		    
		    
		    
		    
		</form>
	  	</div>
</body>
</html>