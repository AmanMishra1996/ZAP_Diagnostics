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
  
  <script type="text/javascript">
  
  function change_pathology(){	
	  
		 
	   var xmlhttp_test_data = new XMLHttpRequest();
	  xmlhttp_test_data.open("GET","listreportin_pathology.jsp?pathology="+document.getElementById("cmbpathology").value,false);
	  xmlhttp_test_data.send(null);
	  document.getElementById("contentBar").innerHTML=xmlhttp_test_data.responseText; 
		 
} 
  
  

  
  </script>
</head>
<body>
 <%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");
String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");

if(!user_type.equals("superadmin") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}
%> 
<select    id="cmbpathology" onchange="change_pathology()" ><option value = "default">Select Pathology </option>

<%
String listpathology = "select * from pathology";
ResultSet listpaths = CrudOperation.getData(listpathology);

while(listpaths.next()){
     String sid = listpaths.getString("pathologyId");
     String sname=listpaths.getString("name");
%>
      <option  value= "<%=sid %>" > <%=sname %> </option>

<%} %>

</select>
<div id = "contentBar">



<%
						      		
					      			String path=request.getContextPath();
						      		String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/reports/";
						      		System.out.println(basePath);
						      		
						      		/* HttpSession hs= request.getSession(false);
						      		String userid=(String)hs.getAttribute("userkey"); */
						      		
						      		String filename="";
						      		String filehref=null;
						      		
						      		String strsql="select * from patientreport where workerId in (select workerId from pathologyworker where pathologyId in (select pathologyId from pathology))  order by reportId desc ";
						      		
						      		ResultSet rs=CrudOperation.getData(strsql);%>
<table class="table">
   <thead class="thead-dark"><tr><th>Worker Id</th>    <th> Test Id</th> <th> Patient Name</th> <th> Doctor Id</th>  <th>Remarks</th>  <th>Status</th>  <th>Report</th>         </tr></thead>
  
						      		
						      		<% while(rs.next()) {%>
								      		
								      			<% filename=rs.getString("reportName");
								      			   String folderofreport = rs.getString("patientId");
								      			if(filename==null)
								      			{
								      				filehref="/ZAPDiagnostics/images/report.jpg";
								      				
								      			}
								      			else{
								      				
								      				filehref=basePath+folderofreport+"/"+filename;
								      			}%>
								      			
					      		
					      		
					      		<tbody>
					      		<tr><th><%=rs.getString("workerId") %></th><th><%=rs.getString("testId") %></th><th><%=rs.getString("patientId") %></th><th><%=rs.getString("doctorId") %></th>
					      		<th><%=rs.getString("remarks") %></th><th><%=rs.getString("status") %></th><th><a href="<%=filehref%>" style="width: 100%;height:100%" ><%=filename %></a></th>
					      		</tr></tbody>
					      		
					      		<%} %>
					
		
		</table>				
						      		

</div>

</body>
</html>