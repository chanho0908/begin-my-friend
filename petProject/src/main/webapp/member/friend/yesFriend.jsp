<%@page import="friend.FriendDAO"%>
<%@page import="friend.MyFriends"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pet.PetDAO"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.*"%>
<%@page import="user.*"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../../css/yesFriend_style.css" rel="stylesheet"/>
<link href="../../css/nav_style.css" rel="stylesheet"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = (String)session.getAttribute("userID");
	if (userID == null)
	{
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('로그인을 하세요')");
	    script.println("location.href = '../LoginForm.jsp'");
	    script.println("</script>");
	}

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
			<li><a class="petinfo" href="<%= petPath%>">내 반려동물</a></li>
			<li><a class="reserve" href="../reserveList.jsp">방문 예정 목록</a></li>
			<li><a class="friendlist" href="#">친구 목록</a></li>
			<li><a class="bmList" href="../bookmark.jsp">방문 시설</a></li>
		</ul>
	</div>
	
	<div class="info-container">
		<%
		ArrayList<MyFriends> list = new FriendDAO().getMyFriend(userID);
		for(MyFriends l : list){	
			
	%>	
		<div class="form-style-3">
			<form action="friendViseted.jsp">
				<fieldset><legend>My Pet</legend>
				<div class="img" style="background-image: url('../../upload/myPetImage/<%= l.getPath() %>')" >
				<div class="infoBody">
					<label><span>아이디 <span class="required">*</span></span>
					<input type="text" name="friendID" readonly="readonly" value="<%= l.getUserID() %>"/></label>
					<label><span>이름 <span class="required">*</span></span>
					<input type="text" name="petName" readonly="readonly" value="<%= l.getPetName() %>"/></label>
					<label><span>몸무게 <span class="required">*</span></span>
					<input type="text" name="petWeight" readonly="readonly" value="<%= l.getPetWeight() %>"/></label>
					<label><span>품종 <span class="required">*</span></span>
					<input type="text" name="petBreed" readonly="readonly" value="<%= l.getBreed() %>"/></label>
					<label><input type="submit" value="<%=l.getPetName() %>의 놀이터 보기"></label>
				</div>
			</div>
			</fieldset>
		</form>
	</div>
	<%
		}
	%>	  
	</div>
</body>
</html>