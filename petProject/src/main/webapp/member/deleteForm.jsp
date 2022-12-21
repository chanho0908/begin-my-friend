<%@page import="friend.FriendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/deleteForm_style.css"/>
<link href="../css/userInfo_style.css" rel="stylesheet"/>
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
	<div class="title-container">
		<div class="title""> 
			<h2>내 계정 정보</h2>
			<h4 style="color: #808080">가입시 등록된 비밀번호를 입력해 주세요</h4>
		</div>
	</div>
	
	<div class="info-container">
		<form action="deleteAction.jsp">
			<table border=1 class="info_table">
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