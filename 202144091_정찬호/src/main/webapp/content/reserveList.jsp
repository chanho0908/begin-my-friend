<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/right_container_style.css"/>
<link rel="stylesheet" href="../css/reserveList_style.css"/>
<title>Insert title here</title>
</head>
<body>
	<div class="right-container">
		<div class="right-logo">FOOTBALL  GROUND</div>
		<div class="myPage">마이 페이지</div>
		<div class="info"><a href="../user/userInfo.jsp"> 내 정보 </a></div>
		<div class="res"><a href="reserveList.jsp"> 예약 정보 </a></div>
		<div class="homeBtn"><a href="../user/futsal.jsp">HOME</a></div>
	</div>
	<div class="title-container">
		<div class="title" style="margin:0 0 0 20px;"> 
			<h2>예약 현황</h2>
			<h4 style="color: #808080">예약 현황을 확인해 주세요.</h4>
		</div>
	</div>
	<div class="info-container">
		<form action="userUpate.jsp">
			<table border=1 class="info_table">
			<thead>
			<tr>
				<td style="margin-left: 30px; width:25px">종목</td>
				<td style="margin-left: 10px; width:90px">신청일자</td>
				<td style="margin-left: 10px; width:110px">사용일자</td>
				<td style="margin-left: 10px; width:90px">장소</td>
				<td style="margin-left: 10px; width:70px">가격</td>
				<td style="margin-left: 10px; width:70px">상태</td>
			</tr>
			</thead>
	<%
		String userID = (String)session.getAttribute("userID");
		String SQL = "Select * from reservation where userID=?";
		Connection conn = DBconnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				int gno = rs.getInt(1);
				String gName = rs.getString(2);
				String state = rs.getString(4);
				String rDate = rs.getString(5);
				Timestamp res = rs.getTimestamp(6);
				String price = rs.getString(7) +"원";
	%>
			<tr>
				<td> 풋살</td>
				<td><%= format.format(res)  %></td>
				<td><%= rDate %></td>
				<td><%= gName %></td>
				<td><%= price %></td>
				<td><%= state %></td>
			</tr>	
	<% }
		}catch(Exception e){ 
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
			}catch(Exception e){e.printStackTrace();}
		}	
	%>
		</table>
	</form>
  </div>
	</div>
	
	
	
	
	
	
</body>
</html>