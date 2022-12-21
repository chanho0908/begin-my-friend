<%@page import="friend.FriendDAO"%>
<%@page import="pet.PetDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/userInfo_style.css" rel="stylesheet"/>
<link rel="stylesheet" href="../css/update_style.css"/>
<link rel="stylesheet" href="../css/userInfo_style.css"/>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%	
   		UserDTO user = new UserDAO().getMember(userID);
   		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
   		String nickName = "";
   		nickName =  new NickNameDAO().getNickName(userID);
   		String petPath = "";
   		
   		if(new PetDAO().getMyPet(userID) != null){
   			petPath = "myPet.jsp";
   		}else{
   			petPath = "noPet.jsp";
   		}
   		
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
			<li><a class="petinfo" href="<%= petPath%>">내 반려동물</a></li>
			<li><a class="reserve" href="reserveList.jsp">방문 예정 목록</a></li>
			<li><a class="friendlist" href="<%= friendPath%>">친구 목록</a></li>
			<li><a class="bmList" href="bookmark.jsp">방문 시설</a></li>
		</ul>
	<div class="title-container">
		<div class="title"> 
			<h2>내 계정 정보</h2>
			<h4 style="color: #808080">가입시 등록된 본인인증 및 소셜 계정 정보입니다</h4>
		</div>
	</div>
	<div class="info-container">
		<div class="form-style-3">
			<form action="updateAction.jsp">
				<fieldset><legend>My Info</legend>
				<label><span>아이디 <span class="required">*</span></span>
				<input type="text" name="userID" readonly="readonly" value="<%=  user.getUserID() %>"></label>
				<label><span>이름 <span class="required">*</span></span>
				<input type="text"  name="userName" value="<%= user.getUserName() %>" maxlength="4"/></label>
				<label><span>나이 <span class="required">*</span></span>
				<input type="text" name="userAge" value="<%= user.getUserAge() %>" maxlength="2"/></label>
				<label><span>핸드폰 <span class="required">*</span></span>
				<input type="text" name="userPhone" value="<%= user.getUserPhone() %>"/></label>
				<label><span>가입일 <span class="required">*</span></span>
				<input type="text" name="reg" readonly="readonly" value="<%= format.format(user.getReg()) %>"/></label>
				<label><span>닉네임 <span class="required">*</span></span>
				<input type="text" name="nickName" value="<%= nickName %>"/></label>
				<label><span> </span><input type="submit" value="수정 완료"/></label>
				</fieldset>
			</form>
		  </div>
		</div>
	</div>
</body>
</html>