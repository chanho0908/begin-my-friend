<%@page import="friend.FriendDAO"%>
<%@page import="pet.PetDTO"%>
<%@page import="pet.PetDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<link href="../css/userInfo_style.css" rel="stylesheet"/>
<link href="../css/mypet_style.css" rel="stylesheet"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function del_event(){
	  if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	      location.href="deletePet.jsp";
	  }else{   //취소
	      return;
	  }
	}
	
	function up_event(){
	  if (confirm("수정 하시겠습니까??") == true){    //확인
	      location.href="updatePet.jsp";
	  }else{   //취소
	      return;
	  }
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%	PetDTO dto = new PetDAO().getMyPet(userID); 
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
		<div class="form-style-3">
			<form action="prProcess.jsp" enctype="multipart/form-data" method="post">
				<fieldset><legend>Photo</legend>
					<div class="img" style="background-image: url('../upload/myPetImage/<%= dto.getPath() %>')" object-fit: contain; ; >
					<textarea readonly="readonly"><%= dto.getInfo() %></textarea>
					</div>
				</fieldset>	
				<fieldset><legend>My Pet</legend>
				<label><span>이름 <span class="required">*</span></span>
				<input type="text" name="petName" readonly="readonly" value="<%= dto.getPetName() %>"/></label>
				<label><span>생일 <span class="required">*</span></span>
				<input type="text"  name="petBirth" readonly="readonly" value="<%= dto.getPetBirth() %>"/></label>
				<label><span>품종 <span class="required">*</span></span>
				<input type="text" name="breed" readonly="readonly" value="<%= dto.getBreed() %>"/></label>
				<label><span>몸무게 <span class="required">*</span></span>
				<input type="text" name="petWeight" readonly="readonly" value="<%= dto.getPetWeight() %>"/></label>
					<label><span> </span><input type="button" value="삭제하기" onclick="del_event()" name="delBtn"/></label> 
				<label><span> </span><input type="button" value="수정하기" onclick="up_event()" name="delBtn"/></label>
				</fieldset>
			</form>
		</div>
    </div>
</body>
</html>