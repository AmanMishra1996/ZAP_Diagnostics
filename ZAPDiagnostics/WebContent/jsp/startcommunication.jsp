<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*,zapdiag.dbutils.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
HttpSession hs= request.getSession(false); 
String userid = (String)hs.getAttribute("userkey");//downcasting
userid= userid.toUpperCase();
%>
<%
	String strsql="select * from sentitems where senderId=?";
	ResultSet rs=CrudOperation.getData(strsql,userid);

%>

<title>from <%=userid %> </title>
<style type="text/css">

    </style>
    <script src="/bs/js1/bootstrap.js"></script>

        		<style>
            @media only screen and (max-width : 540px) 
            {
                .chat-sidebar
                {
                    display: none !important;
                }
                
                .chat-popup
                {
                    display: none !important;
                }
            }
            
            body
            {
                background-color: #e9eaed;
            }
            
            .chat-sidebar
            {
                width: 200px;
                position: fixed;
                height: 100%;
                right: 0px;
                top: 0px;
                padding-top: 10px;
                padding-bottom: 10px;
                border: 1px solid rgba(29, 49, 91, .3);
            }
            
            .sidebar-name 
            {
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 4px;
                font-size: 12px;
            }
            
            .sidebar-name span
            {
                padding-left: 5px;
            }
            
            .sidebar-name a
            {
                display: block;
                height: 100%;
                text-decoration: none;
                color: inherit;
            }
            
            .sidebar-name:hover
            {
                background-color:#e1e2e5;
            }
            
            .sidebar-name img
            {
                width: 32px;
                height: 32px;
                vertical-align:middle;
            }
            
        
            


        </style>
        
            
           <script>
            function showinbox(){
            	var xmlhttp_city=_data=new XMLHttpRequest();
            	xmlhttp_city.open("GET","inbox.jsp",false);
            	xmlhttp_city.send(null);
            	//prompt(xmlhttp_city.responseText);
            	document.getElementById("main").innerHTML=xmlhttp_city.responseText;}
            	function showinboxs(){
                	var xmlhttp_hity=_data=new XMLHttpRequest();
                	xmlhttp_hity.open("GET","sentitem.jsp",false);
                	xmlhttp_hity.send(null);
                	//prompt(xmlhttp_city.responseText);
                	document.getElementById("main").innerHTML=xmlhttp_hity.responseText;
            	
            }
            
        </script>
        
        </head>
<body >
<div style="background-color: grey;color:white; width:1150px;height:auto;">
<h1><%=userid %>............your Inbox is here</h1>
<button onclick="return showinbox()">click here to show your INBOX</button>
</div>
<div style="background-color: grey;color:white;border: thick;width:1150px;height:auto;">
<h1><%=userid %>.............your SentItems are here</h1>
 <button onclick="return showinboxs()">click here to see your SENTITEMS</button>
 </div>
<div id="main">
 </div>
		  
        <div class="chat-sidebar">
                  <div class="sidebar-name">
                <!-- Pass username and display name to register popup -->
                <form action="/ZAPDiagnostics/StartCommunication" method="post">
                <table>
                <tr><th>
                <input type="text" id="rid" name="rid" placeholder="Enter receiver's id"></th></tr>
                 <tr><th><input type="text" id="sub" name="sub" placeholder="Enter subject"></th></tr>
                <tr><th><textarea rows="10" cols="20" id="msg" name="msg" placeholder="Enter message"></textarea></th></tr>
                <tr><th><button >send</button></th></tr>
     				</table>
     				</form>
     				</div></div>
            
       

</body>
</html>