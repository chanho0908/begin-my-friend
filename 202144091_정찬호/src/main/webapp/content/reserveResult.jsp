<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ground.GroundDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ground.LocationDTO"%>
<%@page import="ground.GroundDAO"%>
<% request.setCharacterEncoding("utf-8"); %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/ground_style.css?after">
<link rel="stylesheet" href="../css/reserve_result_style.css	">
<script type="text/javascript" src="../js/checkbox.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%	
		String userID = (String) session.getAttribute("userID");
		String infoName = request.getParameter("infoName");
		String no = request.getParameter("no");
		String addr = request.getParameter("addr");
		String price = request.getParameter("price");
		String rdate = request.getParameter("rdate");
		String rtime = request.getParameter("rtime");
		String resDate = rdate + " " + rtime;
		
		UserDTO user = new UserDAO().getMember(userID);
		String name = user.getUserName();
		String phone = user.getUserPhone();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO reservation VALUES (?, ?, ?, ?, ?, now(), ?)";
		
		try{
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(no));
			pstmt.setString(2, infoName);
			pstmt.setString(3, userID);
			pstmt.setString(4, "대관 완료");
			pstmt.setString(5, resDate);
			pstmt.setInt(6, Integer.parseInt(price));
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
			}catch(Exception e){e.printStackTrace();}
		}

	%>
	
	<div class="top-container">
		<div class="info" onclick="location.href='../user/userInfo.jsp'">내 정보</div>
		<div class="logout" onclick="location.href='../user/logout.jsp'">로그아웃</div>
	</div>		
		
	<div class="left-container"> 
		<div class="left-logo"><a href="../index.jsp"> PLAY GROUND </a></div>
		<div class="mapTitle"></div>
	</div>
	
	<div class="reserve_container">	
		<div class="overlay">
			<div class="form-title">
				<h3 class="title-name">경기장 예약하기</h3>
				<h3 class="fac-name"><%=infoName %></h3>
				<h5 class="fac-addr"><%=addr %></h5>
			</div>
			<div class="step3"></div>
		
			<div class="resvChkRight">
				<div><h5>예약 신청이 완료 되었습니다.</h5></div>
				<table class="form-table">
					<thead class="row-title">
						<tr>
						<th class="col-date">일 자</th>
						<th class="col-time">예약 시간</th>
						<th class="col-price">가 격</th>
						</tr>
					</thead>
					<tbody id="formTableContentsPanel">
						<tr>
							<td id="resvDate"><%= rdate %></td>	
							<td id="resvTime"><%= rtime %></td>
							<td id="resvPrice"><%= price %></td>
						</tr>
					</tbody>
				</table>
				<div class="total-count">총 금액: <%= price %>원</div>
				<div class="labels">
					<div class="lb">
					신청팀&nbsp;&nbsp; :  <%= name %>팀
					</div>
					<div class="lb">
					신청자&nbsp;&nbsp; : 	 <%= name %>
					</div>
					<div class="lb">
					연락처&nbsp;&nbsp; :   <%= phone %>
					</div>	
					<div class="lb">
					가상계좌 은행명&nbsp;&nbsp; :  기업은행
					</div>
					<div class="lb">
					가상계좌 계좌번호&nbsp;&nbsp; : 9709081041512
					</div>
					<div style="text-align: right">
					<button type="submit" value="확인" id="btn" onclick="location.href='../index.jsp'">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>