<%@page import="friend.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>   
<link href="css/addFriend_style.css" rel="stylesheet"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = (String) session.getAttribute("userID");
		String friendID = request.getParameter("friendID");
		String petName = request.getParameter("petName");
		
		FriendDTO dto = new FriendDTO(userID, friendID, petName);
		new FriendDAO().addFriend(dto);
	%>
	
	<div class="addfriend">
		친구 추가가 완료 되었어요! 
	</div>
	<div class="btn_container">
		<div class="msgBtn"><button onclick="location.href='../msg/message.jsp?friendID=<%= friendID%>&petName=<%=petName %>'">메세지 보내기</button></div>
	</div>
</body>
</html>