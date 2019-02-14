<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 
<script type="text/javascript">
  function change_state(){
	  
	  
	  
	  var xmlhttp = new XMLHttpRequest();
	
	  xmlhttp.open("GET","activate_city_dropdown.jsp?state="+document.getElementById("cmbstate").value,false);
	  
	  xmlhttp.send(null);
	 
	 document.getElementById("cmbcity").innerHTML=xmlhttp.responseText;
	 
	   var xmlhttp_data = new XMLHttpRequest();
	  xmlhttp_data.open("GET","find_pathin_state.jsp?state="+document.getElementById("cmbstate").value,false);
	  xmlhttp_data.send(null);
	  document.getElementById("contentBar").innerHTML=xmlhttp_data.responseText; 
  }

  function change_city(){
	
	  var xmlhttp_city = new XMLHttpRequest();
	  xmlhttp_city.open("GET","find_pathin_city.jsp?city="+document.getElementById("cmbcity").value,false);
	  xmlhttp_city.send(null);
	  document.getElementById("contentBar").innerHTML=xmlhttp_city.responseText; 
	 }


</script>

</head>
<body style="background-color: black;">
	<select    id="cmbstate" onchange="change_state()" ><option value = "default">Selectcity </option>

<%
String strsql = "select * from states";
ResultSet rs = CrudOperation.getData(strsql);

while(rs.next()){
     String sid = rs.getString("state_id");
     String sname=rs.getString("state_name");
%>
      <option  value= "<%=sid %>" > <%=sname %> </option>

<%} %>

</select>

<select    id="cmbcity" onchange="change_city()"><option value = "default">Selectcity </option></select>
<div id = contentBar style="margin-top: 1%">


</div>

</body>
</html>