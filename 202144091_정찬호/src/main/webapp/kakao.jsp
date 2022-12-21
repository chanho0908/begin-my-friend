<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:328px;height:320px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2562ec27e72afca8d8642f34a62bf88e"></script>
	<script>
		
		var container = document.getElementById('map'); // 지도를 표시할 div
		var options = {
			center: new kakao.maps.LatLng(37.2611095, 126.99969),
			level: 8
		};

		var map = new kakao.maps.Map(container, options);
		
		var positions = [
		    {
		        title: '에스빌드 풋살파크 풋살장', 
		        latlng: new kakao.maps.LatLng(37.2888513, 127.0409199),
		    },
		    {
		        title: 'HK 풋살파크', 
		        latlng: new kakao.maps.LatLng(37.2611095, 126.99969),
		    },
		    {
		        title: '플랩 스타디움 수원', 
		        latlng: new kakao.maps.LatLng(37.2416487 , 126.9709358),
		    	
		    },
		    {
		        title: '스카이 필드 뉴코아',
		        latlng: new kakao.maps.LatLng(37.2663006, 127.0345357),
		    },
		    {
		        title: '낫소풋살파크',
		        latlng: new kakao.maps.LatLng(37.2720437, 126.9592415),
		    }
		];
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		    
		}
	</script>
</body>
</html>