<%@page import="pet.PetDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<link href="../../css/nopet_style.css" rel="stylesheet"/>
<link href="../../css/nav_style.css" rel="stylesheet"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = (String) session.getAttribute("userID");
	UserDTO user = new UserDAO().getMember(userID);
	String petPath = "";
	if(new PetDAO().getMyPet(userID) != null){
		petPath = "../myPet.jsp";
	}else{
		petPath = "../noPet.jsp";
	}
%>
<nav class="navbar" style="text-decoration: none">
     <div class="navbar_logo">
         <a href="../../MainForm.jsp"><img src="../../images/logo.png" width="180px" style="margin-top: 10px"/></a>
     </div>
     <div class="navbar_main_menu">
         <ul>
             <li><a href="../../MainForm.jsp">Home</a></li>
             <li><a href="../../map.jsp">내 주변</a></li>
             <li><a href="../../board/boardIndex.jsp">마을 회관</a></li>
             <li><a href="../userInfo.jsp">내 정보</a></li>
         </ul>
     </div>
 		<div class="navbar_join_menu">
           <ul>
			<li><a href="../logout.jsp">로그아웃</a></li>
	<li><a href="#a">메시지</a></li>
		</ul>
         </div>     
    </nav>
    <div class="container">
    	<ul class="menu_list">
			<li><a class="info" href="../userInfo.jsp">내 정보</a></li>
			<li><a class="petinfo" href="<%= petPath %>">내 반려동물</a></li>
			<li><a class="reserve" href="../reserveList.jsp">방문 예정 목록</a></li>
			<li><a class="friendlist" href="../friend/friendList.jsp">친구 목록</a></li>
			<li><a class="bmList" href="../bookmark.jsp">방문 시설</a></li>
		</ul>
	</div>
	
	<div class="info-container">
		<div><img src="../../images/icons/icon-cryDog.png"></div>
    </div>
    <div class="noPet_alert">
		<h2>이런 ! 아직 나의 친구가 없어요 !<br> 친구들을 만들어 주세요 !</h2>
	</div>
</body>
</html>