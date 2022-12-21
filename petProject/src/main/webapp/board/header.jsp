<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title></title>
<link href="../css/nav_style.css" rel="stylesheet"/>
</head>
<body>
	<%
	    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	    if (session.getAttribute("userID") != null)
	    {
	    	userID = (String)session.getAttribute("userID");
	    }
	%>
	
	<%
       	if(userID == null){
	%>
		<nav class="navbar" style="text-decoration: none">
	        <div class="navbar_logo">
	            <a href="../MainForm.jsp"><img src="../images/logo.png" width="180px" style="margin-top: 10px"/></a>
	        </div>
	        <div class="navbar_main_menu" style="margin-left: 50px">
	            <ul>
	                <li><a href="MainForm.jsp">Home</a></li>
	                <li><a href="../../map.jsp">내 주변</a></li>
	                <li><a href="../board/boardIndex.jsp">마을 회관</a></li>
	            </ul>
	        </div>
	        
	        <div class="navbar_join_menu">
	            <ul>
					<li><a href="LoginForm.jsp">로그인</a></li>
					<li><a href="JoinForm.jsp">회원가입</a></li>
					<li><a href="#a">메시지</a></li>	
				</ul>
	        </div>
	        <% 
	      		}else{
	      	%>	
	      		<nav class="navbar" style="text-decoration: none">
	        <div class="navbar_logo">
	            <a href="../MainForm.jsp"><img src="../images/logo.png" width="180px" style="margin-top: 10px"/></a>
	        </div>
	        <div class="navbar_main_menu">
	            <ul>
	                <li><a href="../MainForm.jsp">Home</a></li>
	                <li><a href="../map.jsp">내 주변</a></li>
	                <li><a href="../board/boardIndex.jsp">마을 회관</a></li>
	                <li><a href="../member/userInfo.jsp">내 정보</a></li>
	            </ul>
	        </div>
	    		<div class="navbar_join_menu">
	              <ul>
	  				<li><a href="../member/logout.jsp">로그아웃</a></li>
					<li><a href="#a">메시지</a></li>
	  			</ul>
	            </div>
	      	<%		
	      		}
			%>
    </nav>
</body>
</html>