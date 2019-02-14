<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title></title>
<style type="text/css">
	body{
		margin: 0;
		padding: 0;
		font-family: sans-serif;
		background: url("/ZAPDiagnostics/images/LOGIN.png") no-repeat;
		background-size: cover;
	}
	.login-box
	{
		width: 280px;
		position: absolute;
		top: 50%;
		left: 75%;
		transform: translate(-50%,-50%);
		color: white;

	}
	.textbox
	{
		width: 100%;
		overflow: hidden;
		font-size: 20px;
		padding: 8px;
		margin: 8px;
		border-bottom: 1px solid #F8E71C;
	}
		
	.textbox input
	{
		border: none;
		outline: none;
		background: none;
		color: white;
		font-size: 30px;
		
	}
	.btn
	{
		width: 100%;
		background: none;
		border: 1px solid #F8E71C;
		font-size: 30px;
		color: white;
		padding: 5px;
		margin-left: 15px;
	}
	.reg{
	margin-top:10px;
	}
	a{
	text-decoration: none;
	font-size: 15px;
	color: white;
	align-content: center;
	margin-left: 6%;
	margin-top: 10px;
	}
	
</style>
</head>
<body>
	<div class="login-box">
		<form action="/ZAPDiagnostics/Login" method="post">
		<div class="textbox">
			<input type="text" name="userid" placeholder="USER ID" required>
			
		</div>
		<div class="textbox">
			<input type="password" name="userpass" placeholder="PASSWORD" required>
			
		</div>
		<button class="btn" type="submit">LogIn</button>
		
		</form>
		<div class="reg"><a href="registration.jsp">Not have an Account yet! Register here</a></div>
	</div>
</body>
</html>