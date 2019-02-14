 
  <%@page import="java.sql.*,zapdiag.dbutils.*" %>
 
 <%@include file="/WEB-INF/newsnav.jsp"%>
 
 
 
 <div id="newsBar"  style="width:100%;height:100%;background-color: white">
					<h1 style="text-align: center;">  NEWS</h1>
					<%
					
					String strsql ="Select * from news order by date  desc limit 10";
					ResultSet rs = CrudOperation.getData(strsql);
					while(rs.next()){
					String nId = rs.getString("newsId");
					%>
					<div>
					
					<ul class="list-group">
		            <li class="list-group-item active"> <a href ="/ZAPDiagnostics/jsp/shownews.jsp?nid=<%=nId%>"><%=rs.getString("title") %></a> </li> 
					</ul>
					
					</div>
					
					<%} 
					rs.close();
					%>				
		
		
		
</div> 