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
</head>
<body>
 <%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");//downcasting
/* userid= userid.toUpperCase(); */
String user_type = (String)hs.getAttribute("userkey_for_usertypevalidation");

if(!user_type.equals("patient") ){
	response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
}

%> 
<%
						      		
					      			String path=request.getContextPath();
						      		String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/reports/";
						      		System.out.println(basePath);
						      		
						      		/* HttpSession hs= request.getSession(false);
						      		String userid=(String)hs.getAttribute("userkey"); */
						      		
						      		String filename="";
						      		String filehref=null;
						      		
						      		String strsql="select workerId,testId,doctorId,remarks,status,reportName from patientreport where patientId=? order by reportId desc ";
						      		
						      		ResultSet rs=CrudOperation.getData(strsql,userid);%>
					
<table class="table">
   <thead class="thead-dark"><tr><th>Worker Id</th>    <th> Test Id</th>  <th> Doctor Id</th>  <th>Remarks</th>  <th>Status</th>  <th>Report</th>         </tr></thead>
  
						      		
						      		<% while(rs.next()) {%>
								      		
								      			<% filename=rs.getString("reportName");
								      			if(filename==null)
								      			{
								      				filehref="/ZAPDiagnostics/images/report.jpg";
								      				
								      			}
								      			else{
								      				
								      				filehref=basePath+userid+"/"+filename;
								      			}%>
								      			
					      		
					      		
					      		<tbody>
					      		<tr><th><%=rs.getString("workerId") %></th><th><%=rs.getString("testId") %></th><th><%=rs.getString("doctorId") %></th>
					      		<th><%=rs.getString("remarks") %></th><th><%=rs.getString("status") %></th><th><a href="<%=filehref%>" style="width: 100%;height:100%" ><%=filename %></a></th>
					      		</tr></tbody>
					      		
					      		<%} %>
					
		
		</table>				





</body>
</html>