<%@page import="friend.FriendDAO"%>
<%@page import="pet.PetDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<link href="../css/nopet_style.css" rel="stylesheet"/>
<link href="../css/petRegiser_style.css" rel="stylesheet"/>
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
	<%	   		
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
	</div>
	
	<div class="info-container">
		<div class="form-style-3">
			<form action="prProcess.jsp" enctype="multipart/form-data" method="post">
				<fieldset><legend>My Pet</legend>
				<label><span>이름 <span class="required">*</span></span><input type="text" name="petName" /></label>
				<label><span>생일 <span class="required">*</span></span><input type="date"  name="petBirth"/></label>
				<label><span>품종 <span class="required">*</span></span><input type="text" name="breed" /></label>
				<label><span>몸무게 <span class="required">*</span></span><input type="text" name="petWeight"/></label>
				<label><span>소개 <span class="required">*</span></span><textarea cols="100" rows="13" name="info"></textarea></label>
				</fieldset>
				<fieldset><legend>Photo</legend>
				<label><span>ImageFile <span class="required">*</span></span><input type="file" name="fileName"></p></label>
				<label><span> </span><input type="submit" value="Submit"/></label>
				</fieldset>		
			</form>
		</div>
	</div>
</body>
</html>