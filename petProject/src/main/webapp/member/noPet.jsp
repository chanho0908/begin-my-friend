<%@page import="friend.FriendDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<link href="../css/nopet_style.css" rel="stylesheet"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%	UserDTO user = new UserDAO().getMember(userID); 
		String friendPath = "";
		if(new FriendDAO().getMyFriend(userID).size() != 0){
			friendPath = "friend/yesFriend.jsp";
		}else{
			friendPath = "friend/noFriend.jsp";
		}
	%>
    
    <div class="container">
    	<ul class="menu_list">
			<li><a class="info" href="userInfo.jsp">내 정보</a></li>
			<li><a class="petinfo" href="myPet.jsp">내 반려동물</a></li>
			<li><a class="reserve" href="reserveList.jsp">방문 예정 목록</a></li>
			<li><a class="friendlist" href="<%= friendPath%>">친구 목록</a></li>
			<li><a class="bmList" href="bookmark.jsp">방문 시설</a></li>
		</ul>
	
	<div class="info-container">
		<div><img src="../images/icons/icon-cryDog.png"></div>
    </div>
    <div class="noPet_alert">
		<h2>이런 ! 아직 등록된 반려 동물이 없어요 !<br>반려 동물을 등록해 주세요 !</h2>
		<button type="button" onclick="location.href='registerPet.jsp'">등록하기</button>
	</div>
</body>
</html>