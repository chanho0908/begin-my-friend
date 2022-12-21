<%@page import="pet.PetDAO"%>
<%@page import="friend.FriendDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bookmark.BookmarkList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="util.DBconnection"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../css/bookmark_style.css" rel="stylesheet"/>
<link href="../../css/nav_style.css" rel="stylesheet"/> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<style>
	@font-face { font-family: 'binggrae-Bold'; src:url("../fonts/Binggrae-Bold.woff") format('woff');}
	.title-container{
		position: absolute;
		width: 85%;
		height: 120px;
		top: 120px;
		left: 230px;
		background: rgb(255, 254, 254);
		border: 10px solid #FFD2D2;
		border-right: 0;
		border-left: 0;
	}
	a:link{
		color: white;
		text-decoration: none;
	}
	
	a:visited{
		color: white;
		text-decoration: none;
	}
	
	a:hover{
		color: white;
		text-decoration: none;
	}
	
	a:active{
		color: white;
	}
</style>
</head>
<body>
	
	<%
		String userID = (String) session.getAttribute("userID");
		String friendID = request.getParameter("friendID");
		String petName = request.getParameter("petName");
		
		Connection conn = DBconnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String petPath = "";
		if(new PetDAO().getMyPet(userID) != null){
			petPath = "../myPet.jsp";
		}else{
			petPath = "../noPet.jsp";
		}
		
		String friendPath = "";
   		if(new FriendDAO().getMyFriend(userID) != null){
   			friendPath = "friend/yesFriend.jsp";
   		}else{
   			friendPath = "friend/noFriend.jsp";
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
	
	<div class="title-container">
		<div class="title" style="margin-top: 15px"> 
			<h2 style="font-family: 'binggrae-Bold'; font-size: 30px"><%=petName %>의 놀이터</h2>
			<h4 style="font-size: 15px; color: #808080"><%=petName %>가 방문했던 목록입니다. </h4>
		</div>
	</div>
	
	<div class="info-container" style="margin-top: 120px;">
	<%

	ArrayList<BookmarkList> list = new ArrayList<>();
	BookmarkList bmk;
	
	String SQL1 = "select shopname, img, addr, b.shopno, b.reg " 
			+ "from user a, bookmark b, hospital c " 
			+ "where a.userID = b.userID and b.shopNo = c.shopNo and a.userID=?";
	
	String SQL2 = "select shopname, img, addr, b.shopno, b.reg " 
		+ "from user a, bookmark b, cafe c " 
		+ "where a.userID = b.userID and b.shopNo = c.shopNo and a.userID=?";
	
	String SQL3 = "select shopname, img, addr, b.shopno, b.reg " 
			+ "from user a, bookmark b, ground c " 
			+ "where a.userID = b.userID and b.shopNo = c.shopNo and a.userID=?";
	
	try {
		
		pstmt = conn.prepareStatement(SQL1);
		pstmt.setString(1, friendID);
		rs= pstmt.executeQuery();
		
		while(rs.next()) {
			bmk = new BookmarkList();
			bmk.setShopName(rs.getString(1));
			bmk.setImg(rs.getString(2));
			bmk.setAddr(rs.getString(3));
			bmk.setShopno(rs.getString(4));
			bmk.setReg(rs.getTimestamp(5));
			
			list.add(bmk);
		}
	}catch(Exception e){ 
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
			}catch(Exception e){e.printStackTrace();}
		}	
	
	try {
		
		pstmt = conn.prepareStatement(SQL2);
		pstmt.setString(1, friendID);
		rs= pstmt.executeQuery();
		
		while(rs.next()) {
			bmk = new BookmarkList();
			bmk.setShopName(rs.getString(1));
			bmk.setImg(rs.getString(2));
			bmk.setAddr(rs.getString(3));
			bmk.setShopno(rs.getString(4));
			bmk.setReg(rs.getTimestamp(5));
			
			list.add(bmk);
		}
	}catch(Exception e){ 
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
			}catch(Exception e){e.printStackTrace();}
		}	

	try {
		
		pstmt = conn.prepareStatement(SQL3);
		pstmt.setString(1, friendID);
		rs= pstmt.executeQuery();
		
		while(rs.next()) {
			bmk = new BookmarkList();
			bmk.setShopName(rs.getString(1));
			bmk.setImg(rs.getString(2));
			bmk.setAddr(rs.getString(3));
			bmk.setShopno(rs.getString(4));
			bmk.setReg(rs.getTimestamp(5));
			
			list.add(bmk);
		}
	}catch(Exception e){ 
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
			}catch(Exception e){e.printStackTrace();}
		}	
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	for(BookmarkList l : list){
	%>
				
 	<form action="deleteBookmark.jsp">  
		<div class="card mb-3" style="width: 800px;"> 
 		  <div class="row no-gutters"> 
		    <div class="col-md-4"> 
	      <img src="../../upload/<%= l.getImg() %>" class="card-img" style="width: 240px; height:180px; object-fit: contain;"></div> 
		    <div class="col-md-8"> 
		      <div class="card-body"> 
		        <h5 class="card-title"><b><%= l.getShopName() %></b></h5> 
		        <p class="card-text"><small class="text-muted"><%= l.getAddr() %></small></p>
		        <p class="card-text"><small class="text-muted">방문일 : <%= format.format(l.getReg())  %></small></p> 
		        <input type="hidden" value=<%= l.getShopno() %> name="shopNo"> 
	        <input type="submit" value="구경하기"> 
 		      </div> 
	       </div> 
 		  </div>
 		 </div>
	</form>
	<%
	}
	%>
 </div>
</div>
</body>
</html>