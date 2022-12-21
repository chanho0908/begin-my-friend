<%@page import="java.io.PrintWriter"%>
<%@page import="reservation.ReserveDAO"%>
<%@page import="user.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.*"%>
<%@page import="ground.GroundDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ground.*"%>
<% request.setCharacterEncoding("utf-8"); %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/ground_style.css?after">
<link rel="stylesheet" href="../css/reserve_style.css?after">
<script type="text/javascript" src="../js/checkbox.js"></script>
<title>Insert title here</title>
</head>
<body>
	<% 
		String userID = (String) session.getAttribute("userID");
		String getNo = request.getParameter("no");
		int no = Integer.parseInt(getNo);
		String infoName = request.getParameter("infoName");
		String addr = request.getParameter("addr");
		String price = request.getParameter("price");
		String rdate = request.getParameter("rdate");
		String rtime = request.getParameter("rtime");
		
		try{
			if(!new ReserveDAO().isReserved(no, rdate, rtime)){
				PrintWriter script = response.getWriter();
	   			script.println("<script>");
	            script.println("alert('이미 예약된 시간 입니다')");
	            script.println("</script>");
	        %>
	        	<META http-equiv=refresh content="0;url=ground.jsp?no=<%=no %>">
	        <%    
			}
		}catch(Exception e){}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		GroundDAO dao = new GroundDAO();
		LocationDTO dto = dao.getLocation(no);
		String lat = dto.getLat();
		String lng = dto.getLng();
		
		UserDTO user = new UserDAO().getMember(userID);
		String name = user.getUserName();
		String phone = user.getUserPhone();

	%>
	<div class="top-container">
		<div class="info" onclick="location.href='../user/userInfo.jsp'">내 정보</div>
		<div class="logout" onclick="location.href='../user/logout.jsp'">로그아웃</div>
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

	<div class="reserve_container">
			
	<div class="overlay">
		<div class="form-title">
			<h3 class="title-name">경기장 예약하기</h3>
			<h3 class="fac-name"><%= infoName %></h3>
			<h5 class="fac-addr"><%= addr %></h5>
		</div>
		<div class="step2"></div>
		<div class="agreeContainer">
			<div class="square"></div>
			<h5 class="terms"><strong>개인정보 제 3자 제공 방침 및 시설 이용 약관</strong></h5>
			<textarea name="agreeResvContent" disabled="disabled">
대관 서비스 개인정보 제3자 제공 방침

1. 수집 항목 : 실명, 휴대전화번호, 이메일, 주소, 생년월일, ID 등
2. 수집 목적 : 시설 대관 관리
3. 보관 기간 : 대관 일시로부터 1년
4. 제공 받는 자 : 해당 체육시설

대관 서비스 개인정보 제3자 제공 방침에 동의하지 않을 수 있습니다. 본 방침에 동의하지 않을 시 해당 시설과 대관 서비스를 이용 하실 수 없습니다.
			</textarea>
			<div class="check1"> 
			<form action="reserveResult.jsp" name="resreveInfo" onsubmit="return is_checked()">
				<input type="checkbox" name="chk1" value="c1">위의 개인정보 취급방침에 동의합니다.
			</div>
		</div>
		
		<div class="agreeFacContainer">
			<textarea disabled="disabled">
시설 이용 약관

1. 건물 내부 및 근처에서 절대 금연입니다.
2. 체육시설 내 음식물, 주류, 음료 반입 금지합니다.
3. 시설 이용 중 시설물 및 기물 파손은 즉각 담당자에게 보고해야하며, 대관 신청자가 원상복구 혹은 변상해야 합니다.
4. 시설물 및 기물의 용도와 위치의 변경, 광고물(현수막 등) 설치 등은 반드시 관리자에게 사전 승인을 받아야합니다.
5. 해당 시설을 이용한 상업 행위, 유료 강습, 이윤추구는 엄격하게 금지되어 있습니다.
6. 시설 이용 후 폐기물, 오물 등 뒷정리 및 원상복구 해주셔야 합니다.
7. 대관 확정 후 시설의 급한 사정으로 인해 대관이 취소 될 수 있으며, 이점 협조 부탁드립니다.
8. 과도한 소음 및 소란 행위는 금지되어 있습니다.
9. 체육 경기 외 목적(행사 진행 등)으로 이용 시 담당자에게 사전 승인을 받아야합니다.
10. 미풍양속을 해치는 행위, 풍기문란 행위, 노상방뇨 등은 금지되어 있습니다.
11. 본 시설은 시설 이용 시 발생 할 수 있는 부상 및 사고 발생 등 모든 재해에 책임지지 않습니다.
12. 본 시설을 대관 한 후 타인에게 무단 양도하는 행위는 엄격히 금지되어 있습니다.
13. 본 내용을 위반 하였을 시, 이용 취소 및 제재가 가해지며 이로 인한 손해는 전적으로 책임자 및 해당 팀에게 있습니다.
14. 시설 물 이용 중 모든 이용자에게 선량한 관리자의 의무가 부여됩니다. 허가받지 않은 제 3자의 무단이용, 홍보행위, 기물 파손, 소음 발생 등의 행위를 제지해주십시오.
15. 본 시설은 애완동물 출입 및 바퀴달린 운동기구 이용이 금지되어 있습니다.
16. 대관 신청자는 시설의 공지 사항, 환불규정, 이용규칙 등 모든 안내 내용을 숙지해야하며 해당 내용을 준수하는 것에 동의 합니다. 내용 미숙지로 인한 책임은 이용자 본인에게 있습니다.
17. 본 내용에 대한 동의 서명은 생략하며, 서비스 내 동의 버튼으로 이를 대체합니다.
			</textarea>
		<div class="check2"> 
			<input type="checkbox" name="chk2" value="c2">위의 시설 이용 약관에 동의합니다.
		</div>
		<div class="law-alert" style="margin: 10px 0 0 0 ">
			<h6 style="color:#878787; font-size:10px; font-weight: 300; margin: 5px -5px;">
			플레이 그라운드는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
			따라서 플레이 그라운드는 등록된 예약정보 및 거래에 대해 책임을 지지 않습니다.
			</h6>
		</div>		
	</div>
		<div class="resvChkRight">
			<div>
				<h6 class="help-text">예약을 진행하여 주세요.</h6>
			</div>
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
				신청팀&nbsp;&nbsp; : <%= name %>팀
				</div>
				<div class="lb">
				결제 방법&nbsp;&nbsp; : 
				<input type="radio" name="pay" value="card" checked="checked"> 체크/신용카드
				<input type="radio" name="pay" value="account">가상 계좌
				</div>
				<div class="lb">
				신청자&nbsp;&nbsp; : 	<%= name %>
				</div>
				<div class="lb">
				연락처&nbsp;&nbsp; :  <%= phone %>
				</div>	
				<div style="text-align: right">
				
					<input type="hidden" name="no" value="<%= no %>">
					<input type="hidden" name="infoName" value="<%= infoName %>">
					<input type="hidden" name="addr" value="<%= addr%>">
					<input type="hidden" name="price" value="<%= price%>">
					<input type="hidden" name="rdate" value="<%= rdate%>">
					<input type="hidden" name="rtime" value="<%= rtime%>">
					<input type="submit" value="예약" style="width:100px; height:40px; background-color: #fff	; font-weight: bold">
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>