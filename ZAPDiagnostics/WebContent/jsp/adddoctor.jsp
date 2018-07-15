<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="/ZAPDiagnostics/AddDoctor">
<table>
<tr><th>Doctor Id : </th><th><input type="text" id="doctorid" name="doctorid"></th></tr>
<tr><th>User Password : </th><th><input type="text" id="doctorpassword" name="doctorpassword"></th></tr>
<tr><th>Name : </th><th><input type="text" id="doctorname" name="doctorname"></th></tr>
<tr><th>Address : </th><th><input type="text" id="doctoraddress" name="doctoraddress"></th></tr>
<tr><th>Phone No : </th><th><input type="text" id="doctorphone" name="doctorphone"></th></tr>
<tr><th>Email : </th><th><input type="email" id="doctoremail" name="doctoremail"></th></tr>
<tr><th>Area Id : </th><th><input type="text" id="doctorareaid" name="doctorareaid"></th></tr>
<tr><th>Registration No : </th><th><input type="text" id="doctorregistrationnumber" name="doctorregistrationnumber"></th></tr>

<tr>	
				<th> Skills :</th>
				<th> <input type="checkbox" id="doctorSkill1" name="doctorskill" value="Singing" >Singing</th>
				<th> <input type="checkbox" id="doctorskill2" name="doctorskill" value="Dancing" >Dancing</th>
				
</tr>
<tr>	
				<th> Higher Qualification :</th>
				<th> <input type="checkbox" id="doctorqualification1" name="doctorqualification" value="Singing" >Singing</th>
				<th> <input type="checkbox" id="doctorqualification2" name="doctorqualification" value="Dancing" >Dancing</th>
				
</tr>





<tr><th>Pathology Id : </th><th><input type="text" id="doctorpathologyid" name="doctorpathologyid"></th></tr>

<tr>	
				
				
				<th><button type="submit">Register</button></th>
				<th><button type="reset">Reset</button></th>
		
</tr>



</table>


</form>





</body>
</html>