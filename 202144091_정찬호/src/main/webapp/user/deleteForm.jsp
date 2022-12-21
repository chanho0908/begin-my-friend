<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/right_container_style.css.css"/>
<link rel="stylesheet" href="../css/userInfo_style.css"/>
<title>Insert title here</title>
</head>
<body>
	
	<div class="right-container">
		<div class="right-logo">FOOTBALL  GROUND</div>
		<div class="myPage">마이 페이지</div>
		<div class="info" onClick="location.href='userInfo.jsp'">내 정보</div>
		<div class="res"  onClick="location.href='reserve.jsp'">예약 정보</div>
	</div>
	<div class="title-container">
		<div class="title" style="margin:0 0 0 20px;"> 
			<h2>내 계정 정보</h2>
			<h4 style="color: #808080">가입시 등록된 비밀번호를 입력해 주세요</h4>
		</div>
	</div>
	
	<div class="info-container">
		<form action="deleteAction.jsp">
			<table border=1 class="info_table" style="width:400px; height:120px;">
				<tr>
					<td style="margin-left: 30px; width:120px">비밀번호</td>
					<td><input type="password" name="userPassword"></td>
				</tr>
				<tr>
					<td colspan=2 style="text-align: center;">
						<input type="submit" value="탈퇴 하기">
					</td>
				</tr>
		</table>
	</form>
  </div>
	</div>
</body>
</html>