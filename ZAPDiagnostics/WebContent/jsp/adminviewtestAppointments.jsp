<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*,zapdiag.dbutils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/ZAPDiagnostics/bs/bootstrap.min.css">
  
  <script>
function change_date(){
	 
	  var xmlhttp_date_data = new XMLHttpRequest();
	  xmlhttp_date_data.open("GET","viewappointments_date.jsp?date="+document.getElementById("cmbdate").value,false);
	  xmlhttp_date_data.send(null);
	  alert(xmlhttp_date_data.responseText);
	  alert(document.getElementById("cmbdate").value);
	  document.getElementById("contentbar").innerHTML=xmlhttp_date_data.responseText; 
	//  document.getElementById("contentBar").innerHTML=xmlhttp_state_data.responseText;
}

function change_id(){
	  alert("Hello");
	  var xmlhttp_state_data = new XMLHttpRequest();
	  xmlhttp_state_data.open("GET","viewappointments_id.jsp?testid="+document.getElementById("cmbtestid").value,false);
	  xmlhttp_state_data.send(null);
	  document.getElementById("contentbar").innerHTML=xmlhttp_state_data.responseText; 
	
}

  </script>
  
  
  
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
<%   
   String strsqle= "select * from test_appointment where workerId=(select workerId from pathologyworker where workertype='appointment' and pathologyId=?) ";   
   ResultSet rse=CrudOperation.getData(strsqle,userid);   
   %> 
   
  
  <select    id="cmbdate" onchange="change_date()" >
  <option  value = "default">Select Date </option> 
   <% while(rse.next()) {%> 
       <option  value= "<%=rse.getDate("date") %>" > <%=rse.getDate("date") %> </option>
   <%} 
   
       rse.beforeFirst();%>   
       </select>
       
       
       
       
  <select    id="cmbtestid" onchange="change_id()" >
  <option  value = "default">Select Test Id </option> 
   <% while(rse.next()) {%> 
       <option  value= "<%=rse.getString("testId") %>" > <%=rse.getString("testId") %> </option>
   <%} 
   
       rse.beforeFirst();%>   
       </select>
       
       
       
       
  <div id="contentbar">     
  <% while(rse.next()) {%> 
   <table class="table">
   <thead class="thead-dark"><tr><th>Appointment Id</th> <th>Date</th>   <th> Test Id</th>  <th> Patient Id </th>  <th>Remarks</th>  <th>Status</th>  
                                 </tr></thead>        
 <tbody>
					      		<tr><th><%=rse.getString("aptId") %></th><th><%=rse.getString("date") %></th>
					      		<th><%=rse.getString("testId") %></th><th ><%=rse.getString("patientId") %> </th>
					      		
					      		<th><%=rse.getString("remarks") %></th>
					      		<th><%=rse.getString("status") %></th>
					      		
					      		
					      		</tr></tbody>

   </table>
	<% } %> 
</div>
</body>
