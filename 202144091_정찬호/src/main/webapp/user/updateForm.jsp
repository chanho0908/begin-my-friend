<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/right_container_style.css"/>
<link rel="stylesheet" href="../css/update_style.css"/>
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = (String)session.getAttribute("userID");
		UserDTO user = new UserDAO().getMember(userID);
	%>
	
	<div class="right-container">
		<div class="right-logo">FOOTBALL  GROUND</div>
		<div class="myPage">마이 페이지</div>
		<div class="info" onClick="location.href='userInfo.jsp'">내 정보</div>
		<div class="res"  onClick="location.href='reserve.jsp'">예약 정보</div>
	</div>
	<div class="title-container">
		<div class="title" style="margin:0 0 0 20px;"> 
			<h2>내 계정 정보</h2>
			<h4 style="color: #808080">가입시 등록된 본인인증 및 소셜 계정 정보입니다</h4>
		</div>
	</div>
	
	<div class="info-container">
		<form action="updateAction.jsp">
			<table border=1 class="info_table">
				<tr>
					<td style="margin-left: 30px; width:120px">아이디</td>
					<td><input type="text" style="width:150px; height:20px; font-size: 18px;" value= <%= user.getUserID() %> readonly="readonly"></td>
				</tr>
				<tr>
					<td style="margin-left: 10px; width:120px">이름</td>
					<td>
					<input type="text" name="userName" style="width:150px; height:20px; font-size: 18px;" value= <%= user.getUserName() %>>
					</td>
				</tr>
				<tr>
					<td style="margin-left: 10px; width:120px">나이</td>
					<td>
					<input type="text" name="userAge" style="width:150px; height:20px; font-size: 18px;" value= <%= user.getUserAge() %>>
					</td>
				</tr>
				<tr>
					<td style="margin-left: 10px; width:120px">핸드폰 번호</td>
					<td>
					<input type="text" name="userPhone" style="width:150px; height:20px; font-size: 18px;" value= <%= user.getUserPhone() %>>
					</td>
				</tr>
				<tr>
					<td style="margin-left: 10px; width:120px">가입일</td>
					<td>
						<input type="text" style="width:150px; height:20px; font-size: 18px;" value= <%= user.getReg()%> readonly="readonly">
					</td>
				</tr>
				<tr>
					<td colspan=2 style="text-align: center;">
						<input type="submit" style="width:100px; height:30px; background-color: #ffffff" value="수정 완료">
					</td>
				</tr>
		</table>
	</form>
  </div>
	</div>
</body>
</html>