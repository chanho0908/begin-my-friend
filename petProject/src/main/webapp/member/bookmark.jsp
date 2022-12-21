<%@page import="pet.PetDAO"%>
<%@page import="friend.FriendDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bookmark.*"%>
<%@page import="java.sql.*"%>
<%@page import="user.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.BookmarkInfo"%>
<%@page import="util.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../css/bookmark_style.css" rel="stylesheet"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		Connection conn = DBconnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
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
			<li><a class="friendlist" href="<%= friendPath%> ">친구 목록</a></li>
			<li><a class="bmList" href="bookmark.jsp">방문 시설</a></li>
		</ul>
	
	<div class="info-container">
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
		pstmt.setString(1, userID);
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
		pstmt.setString(1, userID);
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
		pstmt.setString(1, userID);
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
	      <img src="../upload/<%= l.getImg() %>" class="card-img" style="width: 240px; height:180px; object-fit: contain;"> 
		    </div> 
		    <div class="col-md-8"> 
		      <div class="card-body"> 
		        <h5 class="card-title"><b><%= l.getShopName() %></b></h5> 
		        <p class="card-text"><small class="text-muted"><%= l.getAddr() %></small></p>
		        <p class="card-text"><small class="text-muted">방문일 : <%= format.format(l.getReg())  %></small></p> 
		        <input type="hidden" value=<%= l.getShopno() %> name="shopNo"> 
	        <input type="submit" value="삭제"> 
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