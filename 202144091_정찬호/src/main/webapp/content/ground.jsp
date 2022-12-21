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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/ground_style.css?after">
<script type="text/javascript" src="../js/ground.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%	
		String getNo = request.getParameter("no");
		int no = Integer.parseInt(getNo);
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT imgPath from images where gno=?";
		ArrayList<String> images = new ArrayList<String>();
		
		try{
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
		
			while(rs.next()){
				images.add(rs.getString(1));
			}
		}catch(Exception e){
			out.println(e.getMessage());
		}
		
		String path = "";
		
		switch(getNo){
			case "1":
				path = "sBuild/"; break;
			case "2":	
				path = "HK/"; break;
			case "3":	
				path = "plab/"; break;	
			case "4":	
				path = "sky/"; break;
			case "5":	
				path = "notso/"; break;	
		}
		
		String imgPath1 = path + images.get(0);
		String imgPath2 = path + images.get(1);
		String imgPath3 = path + images.get(2);
		
		GroundDAO dao = new GroundDAO();
		LocationDTO dto = dao.getLocation(no);
		String lat = dto.getLat();
		String lng = dto.getLng();

		ArrayList<GroundDTO> gnd =  dao.getSelectf();
		
		String gname = gnd.get(0).getgName();
		
		String userID = null;
		if(userID == null){
			userID = (String) session.getAttribute("userID");
			
		}
	
		if(userID == null){ %>
		
		<div class="top-container">
			
		<div>
			<div class="join"  onclick="location.href='../user/joinForm.jsp'">회원 가입</div>
			<div class="login" onclick="location.href='../user/loginForm.jsp'">로그인</div>
		</div>
		<%
		}else{
		%>	
		<div class="top-container">
			<div class="info" onclick="location.href='../user/userInfo.jsp'">내 정보</div>
			<div class="logout" onclick="location.href='../user/logout.jsp'">로그아웃</div>
		</div>		
		<%
		}
		%>
	</div>
	<div class="image_container">
		<div class="content_slider">
			<ul class="bxslider">
			  <li><img src="../images/<%= imgPath1 %>" width="900px" height="470px;"></li>
		      <li><img src="../images/<%= imgPath2 %>" width="900px" height="470px;"></li>
		      <li><img src="../images/<%= imgPath3 %>" width="900px" height="470px;"></li>
		  	</ul>
		 </div> 	
	</div>
	<div class="left-container"> 
		<div class="left-logo"><a href="../index.jsp"> PLAY GROUND </a></div>
		<div class="mapTitle">지도</div>
		<div id="map" style="width:338px; height:300px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2562ec27e72afca8d8642f34a62bf88e"></script>
		<script>
			var myLat = "<%=lat%>"; 
			var myLng = "<%=lng%>"; 
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(myLat, myLng), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
	
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(myLat, myLng); 
		
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			marker.setMap(map);
		</script>
	</div>
	
	<%	
		GroundDTO gd  = new GroundDAO().getGround(no);
		String infoName = gd.getgName();
		int price = gd.getPrice();
		String addr = gd.getAddr();
		String cnt = gd.getUseablecnt();
		String grass = gd.getGrass();
		String size = gd.getSize();
		int parking = gd.getParking();
		int ballrent = gd.getBallrent();
		int temp = gd.getTemp();
		int shower = gd.getShower();
		int vestrent = gd.getVestrent();
		int shoese = gd.getShoeserent();
		
		String tPath = "";
		String sPath = "";
		String bPath = "";
		String vPath = "";
		String fsPath = "";
		
		if(temp == 1){
			tPath = "tempOn.svg";
		}else{ tPath = "tempOff.svg";}
		
		if(shower == 1){
			sPath = "shOn.svg";
		}else{ sPath = "shOff.svg";}
		
		if(ballrent == 1){
			bPath = "ballrentOn.svg";
		}else{ bPath = "ballrentOff.svg";}
		
		if(vestrent == 1){
			vPath = "vestrentOn.svg";
		}else{ vPath = "vestrentOff.svg";}
		
		if(shoese == 1){
			fsPath = "shoesrentOn.svg";
		}else{ fsPath = "shoesrentOff.svg";}
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		SimpleDateFormat format = new SimpleDateFormat("MM월 dd일 (E)");
		cal.add(Calendar.DATE, 30);
	%>
	
	<div class="reserve-container">
		<div class="infoName" style="margin: 0 0 0 20px">
			<h1><%= infoName %></h1>
		</div>
		<div class="addr">
		<h4><%= addr%></h4>
		</div>
		<div class="infoContaier">
			<div class="infoBodyLeft">
				<div class="sizeContainer">
					<div class="square"></div>
					<h3>구장안내</h3>
					<h4>구장가격: 한타임(두 시간) 당 <%= price %>원</h4>
					<h4>구장크기: <%= size %></h4>
					<h4>추천인원: <%= cnt %> </h4>
					<h4>구장정보: <%= grass %></h4>
				</div>
			</div>
			<div class="infoBodyRight">
				<div class="svc1"><img src="../images/service/parkingOn.svg"></div>
				<div class="svc1"><img src="../images/service/<%= tPath %>"></div>
				<div class="svc1"><img src="../images/service/<%= sPath %>"></div>
				<div class="svc2"><img src="../images/service/<%= bPath %>"></div>
				<div class="svc2"><img src="../images/service/<%= vPath %>"></div>
				<div class="svc2"><img src="../images/service/<%= fsPath %>"></div>
			</div>
		</div>
		
		<div class="timeSelectContainer">
			<div class="possibleDate">예약 가능 날짜 : 오늘 ~ <%= format.format(cal.getTime())%></div>
			<div class="timeselector">
				<div><h4 style="padding:10px 0 0 0; color:blue;">날짜 선택</h4></div>
		<form action="reserveAction.jsp">
				<select name="rdate" id="rdate">
					<option value="12월 07일">12월 07 (수)</option>
					<option value="12월 08일">12월 08 (목)</option>
					<option value="12월 09일">12월 09 (금)</option>
					<option value="12월 10일">12월 10 (토)</option>
					<option value="12월 11일">12월 11 (일)</option>
					<option value="12월 12일">12월 12 (월)</option>
					<option value="12월 13일">12월 13 (화)</option>
					<option value="12월 14일">12월 14 (수)</option>
					<option value="12월 15일">12월 15 (목)</option>
					<option value="12월 16일">12월 16 (금)</option>
					<option value="12월 17일">12월 17 (토)</option>
					<option value="12월 18일">12월 18 (일)</option>
					<option value="12월 19일">12월 19 (월)</option>
					<option value="12월 20일">12월 20 (화)</option>
					<option value="12월 21일">12월 21 (수)</option>
					<option value="12월 22일">12월 22 (목)</option>
					<option value="12월 23일">12월 23 (금)</option>
					<option value="12월 24일">12월 24 (토)</option>
					<option value="12월 25일">12월 25 (일)</option>
					<option value="12월 26일">12월 26 (월)</option>
					<option value="12월 27일">12월 27 (화)</option>
					<option value="12월 28일">12월 28 (수)</option>
					<option value="12월 29일">12월 29 (목)</option>
					<option value="12월 30일">12월 30 (금)</option>
					<option value="12월 31일">12월 31 (토)</option>
					<option value="1월 01일">1월 01 (목)</option>
					<option value="1월 02일">1월 02 (금)</option>
					<option value="1월 03일">1월 03 (토)</option>
					<option value="1월 04일">1월 04 (일)</option>
					<option value="1월 05일">1월 05 (월)</option>
					<option value="1월 06일">1월 06 (화)</option>
				</select> 
				<div><h4 style="padding:10px 0 0 5px; color:red;">시간 선택</h4></div>
				<select style="margin-left: 0px" name="rtime">
					<option value="10:00 ~ 12:00">10:00 ~ 12:00</option>
					<option value="12:00 ~ 14:00">12:00 ~ 14:00</option>
					<option value="14:00 ~ 16:00">14:00 ~ 16:00</option>
					<option value="16:00 ~ 18:00">16:00 ~ 18:00</option>
					<option value="18:00 ~ 20:00">18:00 ~ 20:00</option>
					<option value="20:00 ~ 22:00">20:00 ~ 22:00</option>
				</select> 
				<input type="hidden" name="no" value="<%= no %>">
				<input type="hidden" name="infoName" value="<%= infoName %>">
				<input type="hidden" name="addr" value="<%= addr%>">
				<input type="hidden" name="price" value="<%= price%>">
			
			</div>
			<%
				if(userID == null){
			%>	<div style="margin-top: 30px; color:red; font-weight: bold">로그인 후 예약을 진행해 주세요 !</div>
			<%					
				}else{
			%>
				<input type="submit" id="showBtn" value="예약하기" style="cursor: pointer;"></button>
			<%
				}
			%>
			</form>
		</div>
	</div>

	
	<%
		String selNotice = "";
		
		switch(getNo){
			case "1":
				selNotice = "sBuild_notice.jsp"; break;
			case "2":	
				selNotice = "hk_notice.jsp"; break;
			case "3":
				selNotice = "plab_notice.jsp"; break;
			case "4":	
				selNotice = "sky_notice.jsp"; break;
			case "5":	
				selNotice = "notso_notice.jsp"; break;	
		}
		
		String noticePath = "../notice/" + selNotice;
		
	%>
	
	<div class="main_notice_container">		
		<jsp:include page="<%= noticePath %>" flush="true"/>
	</div>
	
	
	<div class="rule_container">	
		<jsp:include page="payRule.jsp" flush="true"/>
	</div>
	
	
</body>
</html>