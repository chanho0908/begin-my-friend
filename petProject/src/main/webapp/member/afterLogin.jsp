<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.DBconnection" %>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/login_style.css">
</head>	
<body>
	<div class="main_image">
		<div>
			<img src="../images/thanksDog.png" style="margin-top: 10px"/>
		</div>
	</div>
	<div class="message">
		<p><%= request.getAttribute("userID") %> 님 ! 회원 가입이 완료 되었습니다.</p>	
	</div>
	<div class="moveBtn">
		<a class="btn btn-5" href="../MainForm.jsp" style="background-color: #8b4513">HOME</a>
		<a class="btn btn-5" href="LoginForm.jsp" style="background-color: #8b4513">LOGIN</a>
	</div>
</body>
</html>