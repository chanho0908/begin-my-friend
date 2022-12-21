<%@page import="gLocation.LocationDAO"%>
<%@page import="gLocation.LocationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link href="css/kakao_style.css" rel="stylesheet"/>
<body>
	<%@ include file="header.jsp" %>
	
	<%  ArrayList<LocationDTO> list = new LocationDAO().getAllLocation(); %>

	<div id="map" style="width:90%;height:500px; margin: 50px 0 0 80px "></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2562ec27e72afca8d8642f34a62bf88e"></script>
	<script>
		
		var container = document.getElementById('map'); // 지도를 표시할 div
		var options = {
			center: new kakao.maps.LatLng(37.2751421, 127.0435404),
			level: 8
		};

		var map = new kakao.maps.Map(container, options);
		
		var positions = [
		    {
		        title: '죽전 예닮 동물병원', 
		        latlng: new kakao.maps.LatLng(<%= list.get(0).getLat() %>, <%= list.get(0).getLng() %>),
		    },
		    {
		        title: '24시 숨동물병원', 
		        latlng: new kakao.maps.LatLng(<%= list.get(1).getLat() %>, <%= list.get(1).getLng() %>),
		    },
		    {
		        title: '본동물의료센터', 
		        latlng: new kakao.maps.LatLng(<%= list.get(2).getLat() %>, <%= list.get(2).getLng() %>),
		    	
		    },
		    {
		        title: '24시 마음 반려동물 의료원',
		        latlng: new kakao.maps.LatLng(<%= list.get(3).getLat() %>, <%= list.get(3).getLng() %>),
		    },
		    {
		        title: '돌봄 동물병원',
		        latlng: new kakao.maps.LatLng(<%= list.get(4).getLat() %>, <%= list.get(4).getLng() %>),
		    },
		    {
		        title: '멍그라운드', 
		        latlng: new kakao.maps.LatLng(<%= list.get(5).getLat() %>, <%= list.get(5).getLng() %>),
		    },
		    {
		        title: '베리하오', 
		        latlng: new kakao.maps.LatLng(<%= list.get(6).getLat() %>, <%= list.get(6).getLng() %>),
		    },
		    {
		        title: '놀다가개', 
		        latlng: new kakao.maps.LatLng(<%= list.get(7).getLat() %>, <%= list.get(7).getLng() %>),
		    	
		    },
		    {
		        title: '양코치 애견카페',
		        latlng: new kakao.maps.LatLng(<%= list.get(8).getLat() %>, <%= list.get(8).getLng() %>),
		    },
		    {
		        title: '언니네애견카페',
		        latlng: new kakao.maps.LatLng(<%= list.get(9).getLat() %>, <%= list.get(9).getLng() %>),
		    },
		    {
		        title: '멍트럴파크 애견운동장', 
		        latlng: new kakao.maps.LatLng(<%= list.get(10).getLat() %>, <%= list.get(10).getLng() %>),
		    },
		    {
		        title: '별똥구리', 
		        latlng: new kakao.maps.LatLng(<%= list.get(11).getLat() %>, <%= list.get(11).getLng() %>),
		    },
		    {
		        title: '퍼피포레스트', 
		        latlng: new kakao.maps.LatLng(<%= list.get(12).getLat() %>, <%= list.get(12).getLng() %>),
		    	
		    },
		    {
		        title: '비숲',
		        latlng: new kakao.maps.LatLng(<%= list.get(13).getLat() %>, <%= list.get(13).getLng() %>),
		    },
		    {
		        title: '루카스',
		        latlng: new kakao.maps.LatLng(<%= list.get(14).getLat() %>, <%= list.get(14).getLng() %>),
		    },
		    
		];
		
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "images/icons/icon-mapmarker.png"; 
		  
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(30, 30); 

	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
	    //////////////////////////////////////////////////////////////////////////////////////////////////////	
		var marker1 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, 
		    position: positions[0].latlng,
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ 
		    content: '<span class="info-title">'+positions[0].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker1, 'mouseover', makeOverListener(map, marker1, infowindow));
		kakao.maps.event.addListener(marker1, 'mouseout', makeOutListener(infowindow));
		
		kakao.maps.event.addListener(marker1, 'click', function() {
		
			location.href = 'hospitals/hospital.jsp?shopNo=1'

		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var marker2 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[1].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content:  '<span class="info-title">'+positions[1].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker2, 'mouseover', makeOverListener(map, marker2, infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker2, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker2, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'hospitals/hospital.jsp?shopNo=2'
			
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var marker3 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[2].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content: '<span class="info-title">'+positions[2].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker3, 'mouseover', makeOverListener(map, marker3, infowindow));
		kakao.maps.event.addListener(marker3, 'mouseout', makeOutListener(infowindow));

		
		kakao.maps.event.addListener(marker3, 'click', function() {
		
			location.href = 'hospitals/hospital.jsp?shopNo=3'

		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var marker4 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[3].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content: '<span class="info-title2">'+positions[3].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker4, 'mouseover', makeOverListener(map, marker4, infowindow));	
		kakao.maps.event.addListener(marker4, 'mouseout', makeOutListener(infowindow));
		kakao.maps.event.addListener(marker4, 'click', function() {
		
			location.href = 'hospitals/hospital.jsp?shopNo=4'
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var marker5 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[4].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content: '<span class="info-title">'+positions[4].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker5, 'mouseover', makeOverListener(map, marker5, infowindow));
		kakao.maps.event.addListener(marker5, 'mouseout', makeOutListener(infowindow));
		
		kakao.maps.event.addListener(marker5, 'click', function() {	
			location.href = 'hospitals/hospital.jsp?shopNo=5'
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		var marker6 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[5].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content: '<span class="info-title">'+positions[5].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker6, 'mouseover', makeOverListener(map, marker6, infowindow));
		kakao.maps.event.addListener(marker6, 'mouseout', makeOutListener(infowindow));

		
		kakao.maps.event.addListener(marker6, 'click', function() {
		
			location.href = 'cafes/cafe.jsp?shopNo=6'
			
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var marker7 = new kakao.maps.Marker({ 
		    map: map, 
		    position: positions[6].latlng,
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ 
		    content:  '<span class="info-title">'+positions[6].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker7, 'mouseover', makeOverListener(map, marker7, infowindow));		
		kakao.maps.event.addListener(marker7, 'mouseout', makeOutListener(infowindow));		
		kakao.maps.event.addListener(marker7, 'click', function() {		
			location.href = 'cafes/cafe.jsp?shopNo=7'
			
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var marker8 = new kakao.maps.Marker({ 
		    map: map, 
		    position: positions[7].latlng, 
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({
		    content: '<span class="info-title">'+positions[7].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker8, 'mouseover', makeOverListener(map, marker8, infowindow));
		
		kakao.maps.event.addListener(marker8, 'mouseout', makeOutListener(infowindow));
		
		kakao.maps.event.addListener(marker8, 'click', function() {		
			location.href = 'cafes/cafe.jsp?shopNo=8'
			
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var marker9 = new kakao.maps.Marker({ 
		    map: map, 
		    position: positions[8].latlng, 
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({
		    content: '<span class="info-title2">'+positions[8].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker9, 'mouseover', makeOverListener(map, marker9, infowindow));

		
		kakao.maps.event.addListener(marker9, 'mouseout', makeOutListener(infowindow));
		
		kakao.maps.event.addListener(marker9, 'click', function() {		
			location.href = 'cafes/cafe.jsp?shopNo=9'

		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
	
		var marker10 = new kakao.maps.Marker({ 
		    map: map, 
		    position: positions[9].latlng, 
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ 
		    content: '<span class="info-title">'+positions[9].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker10, 'mouseover', makeOverListener(map, marker10, infowindow));
		
		kakao.maps.event.addListener(marker10, 'mouseout', makeOutListener(infowindow));
		
		kakao.maps.event.addListener(marker10, 'click', function() {			
			location.href = 'cafes/cafe.jsp?shopNo=10'
		});
		
		var marker11 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[10].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content: '<span class="info-title">'+positions[10].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker11, 'mouseover', makeOverListener(map, marker11, infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker11, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker11, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'grounds/ground.jsp?shopNo=11'
			// location.href : 특정 URL로 이동
			// 카카오 지도에서 특정 시설을 클릭했을 때 정보를 보여주는 주소:  https://place.map.kakao.com/ + Number
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var marker12 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[11].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content:  '<span class="info-title">'+positions[11].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker12, 'mouseover', makeOverListener(map, marker12, infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker12, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker12, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'grounds/ground.jsp?shopNo=12'
			
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var marker13 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[12].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content: '<span class="info-title">'+positions[12].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker13, 'mouseover', makeOverListener(map, marker13, infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker13, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker13, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'grounds/ground.jsp?shopNo=13'
			// location.href : 특정 URL로 이동
			// 카카오 지도에서 특정 시설을 클릭했을 때 정보를 보여주는 주소:  https://place.map.kakao.com/ + Number
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////	
		var marker14 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[13].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content: '<span class="info-title2">'+positions[13].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker14, 'mouseover', makeOverListener(map, marker14, infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker14, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker14, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'grounds/ground.jsp?shopNo=14'
			// location.href : 특정 URL로 이동
			// 카카오 지도에서 특정 시설을 클릭했을 때 정보를 보여주는 주소:  https://place.map.kakao.com/ + Number
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////	
		var marker15 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[14].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content: '<span class="info-title">'+positions[14].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker15, 'mouseover', makeOverListener(map, marker15, infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker15, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker15, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'grounds/ground.jsp?shopNo=15'
			// location.href : 특정 URL로 이동
			// 카카오 지도에서 특정 시설을 클릭했을 때 정보를 보여주는 주소:  https://place.map.kakao.com/ + Number
		});
		
		function makeOverListener(map, marker, infowindow) {
			return function() {
			    infowindow.open(map, marker);
			};
		}

		//마우스를 내릴시 InfoWindow 사라짐  
		function makeOutListener(infowindow) {
			return function() {
			    infowindow.close();
			};
		}
	</script>
</body>
</html>