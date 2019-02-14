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

<% String pathologyid= request.getParameter("pathology");
		if(pathologyid.equals("default")){
		 
		 }
		else{
        
			
			
      		
  			String path=request.getContextPath();
      		String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/reports/";
      		System.out.println(basePath);
      		
      		/* HttpSession hs= request.getSession(false);
      		String userid=(String)hs.getAttribute("userkey"); */
      		
      		String filename="";
      		String filehref=null;
      		
      		String strsql="select * from patientreport where workerId in (select workerId from pathologyworker where pathologyId =?)  order by reportId desc ";
      		
      		ResultSet rs=CrudOperation.getData(strsql,pathologyid);%>
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
  		
  		<%}} %>


</table>				

        




</body>
</html>