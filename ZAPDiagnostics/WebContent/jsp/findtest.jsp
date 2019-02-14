<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find Test</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
<script>
function change_state(){
	  var xmlhttp_state = new XMLHttpRequest();
	  xmlhttp_state.open("GET","activate_city_dropdown.jsp?state="+document.getElementById("cmbstate").value,false);	  
	  xmlhttp_state.send(null);
	  document.getElementById("cmbcity").innerHTML=xmlhttp_state.responseText;
	 
	  var xmlhttp_state_data = new XMLHttpRequest();
	  xmlhttp_state_data.open("GET","find_testin_state.jsp?state="+document.getElementById("cmbstate").value,false);
	  xmlhttp_state_data.send(null);
	  document.getElementById("contentBar").innerHTML=xmlhttp_state_data.responseText; 
}
 function change_city(){	 	
	  var xmlhttp_city = new XMLHttpRequest();
	  xmlhttp_city.open("GET","activate_pathology_dropdown.jsp?city="+document.getElementById("cmbcity").value,false);
	  xmlhttp_city.send(null);
	  document.getElementById("cmbpathology").innerHTML=xmlhttp_city.responseText;
	  
	  var xmlhttp_test_data = new XMLHttpRequest();
	  xmlhttp_test_data.open("GET","find_testin_city.jsp?city="+document.getElementById("cmbcity").value,false);
	  xmlhttp_test_data.send(null);
	  document.getElementById("contentBar").innerHTML=xmlhttp_test_data.responseText;  	
 } 
 function change_pathology(){	
	
	  var xmlhttp_pathology = new XMLHttpRequest();
	  xmlhttp_pathology.open("GET","activate_test_dropdown.jsp?pathology="+document.getElementById("cmbpathology").value,false);
	  xmlhttp_pathology.send(null);
	  document.getElementById("cmbtest").innerHTML=xmlhttp_pathology.responseText; 
	  
	   var xmlhttp_test_data = new XMLHttpRequest();
	  xmlhttp_test_data.open("GET","find_testin_pathology.jsp?pathology="+document.getElementById("cmbpathology").value,false);
	  xmlhttp_test_data.send(null);
	  document.getElementById("contentBar").innerHTML=xmlhttp_test_data.responseText; 
 
} 

 function change_test(){
	    
	
	  var xmlhttp_test_data = new XMLHttpRequest();
	  xmlhttp_test_data.open("GET","find_testusing_name.jsp?test="+document.getElementById("cmbtest").value,false);
	  xmlhttp_test_data.send(null);
	  document.getElementById("contentBar").innerHTML=xmlhttp_test_data.responseText; 	
} 
 


</script>


</head>
<body style="background-color: black;">
<select    id="cmbstate" onchange="change_state()" ><option  value = "default">Select State </option>

<%
String statedropdown = "select * from states";
ResultSet statedropdown_rs = CrudOperation.getData(statedropdown);

while(statedropdown_rs.next()){
     String sid = statedropdown_rs.getString("state_id");
     String sname=statedropdown_rs.getString("state_name");
%>
      <option  value= "<%=sid %>" > <%=sname %> </option>

<%} %>

</select>

<select    id="cmbcity" onchange="change_city()"><option value = "default">Select City </option></select>

<select    id="cmbpathology" onchange="change_pathology()"><option value = "default">Select Pathology </option></select>

<select    id="cmbtest" onchange="change_test()"><option value = "default">Select Test </option></select>
<div id = contentBar style="margin-top: 10px;">
			<%
				String showalltests = "Select * from  tests";               
				ResultSet rs = CrudOperation.getData(showalltests);
				 while(rs.next()){%>   
				     <%@include file="/WEB-INF/showtests.html"%>
				<% }%>	
</div>
</body>
</html>