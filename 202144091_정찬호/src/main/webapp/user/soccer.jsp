<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/futsal_style.css?after"> 
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(userID == null){
			userID = (String) session.getAttribute("userID");
		}

		if(userID == null){ %>
		
		<div class="left-container">
			<div class="left-logo"><a href="../index.jsp" style="cursor: pointer;">FOOTBALL GROUND</div></a>
		</div>
			
		<div class="top-container">
			<div class="join" onclick="location.href='joinForm.jsp'">회원 가입</div>
			<div class="login" onclick="location.href='loginForm.jsp'">로그인</div>
		</div>
		<%
		}else{
		%>	
		<div class="left-container">
			<div class="left-logo">FOOTBALL GROUND</div>
		</div>
			<div class="top-container">
			<div class="info" onclick="location.href='userInfo.jsp'">내 정보</div>
			<div class="login" onclick="location.href='logout.jsp'">로그아웃</div>
		</div>		
		<%
		}
		%>
	</div>
	
	<div class="cardView-container">
		<img src="../images//notfound.png" style="position: absolute; top:20px; left:400px">
	</div>
	
	<div style="width:300px; padding-left: 10px; padding-right:10px; position: absolute; top:630px; right:400px;">
		<h1>이런!</h1>
		<h3>아직 구장이 준비중이에요 !</h3>
	</div>
	<div class="map_container">
		<%@ include file="../kakao.jsp" %>
	</div>
</body>
</html>