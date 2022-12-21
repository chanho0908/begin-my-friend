<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/userInfo_style.css"/>
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = (String)session.getAttribute("userID");
		UserDTO user = new UserDAO().getMember(userID);
	%>
	
	<div class="right-container">
		<div class="right-logo"><a href="futsal.jsp" style="color: white;">FOOTBALL  GROUND</a></div>
		<div class="myPage">마이 페이지</div>
		<div class="info"><a href="userInfo.jsp"> 내 정보 </a></div>
		<div class="res"><a href="../content/reserveList.jsp"> 예약 정보 </a></div>
		<div class="homeBtn"><a href="futsal.jsp">HOME</a></div>
	</div>
	
	<div class="title-container">
		<div class="title" style="margin:0 0 0 20px;"> 
			<h2>내 계정 정보</h2>
			<h4 style="color: #808080">가입시 등록된 본인인증 및 소셜 계정 정보입니다</h4>
			
		</div>
		
	</div>
	
	<div class="info-container">
		<form action="userUpate.jsp">
			<table border=1 class="info_table">
				<tr>
					<td style="margin-left: 30px; width:120px">아이디</td>
					<td><%= user.getUserID() %></td>
				</tr>
				<tr>
					<td style="margin-left: 10px; width:120px">이름</td>
					<td><%= user.getUserName() %></td>
				</tr>
				<tr>
					<td style="margin-left: 10px; width:120px">나이</td>
					<td><%= user.getUserAge() %></td>
				</tr>
				<tr>
					<td style="margin-left: 10px; width:120px">핸드폰 번호</td>
					<td><%= user.getUserPhone() %></td>
				</tr>
				<tr>
					<td style="margin-left: 10px; width:120px">가입일</td>
					<td><%= user.getReg() %></td>
				</tr>
				<tr>
					<td colspan=2 style="text-align: center;">
						<button type="button" style="width:100px; height:30px; background-color: #ffffff" onclick="location.href='updateForm.jsp'">수정
						<button type="button" style="margin-left: 80px; width:100px; height:30px; background-color: #ffffff" onclick="location.href='deleteForm.jsp'">회원 탈퇴
					</td>
				</tr>
		</table>
	</form>
  </div>
	</div>
</body>
</html>