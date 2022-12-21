<%@page import="gLocation.LocationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gLocation.LocationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../css/kakao_style.css" rel="stylesheet"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%  ArrayList<LocationDTO> list = new LocationDAO().getAllLocation(); %>

	<div id="map" style="width:380px;height:320px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2562ec27e72afca8d8642f34a62bf88e"></script>
	<script>
		
		var container = document.getElementById('map'); // 지도를 표시할 div
		var options = {
			center: new kakao.maps.LatLng(<%= list.get(12).getLat() %>, <%= list.get(12).getLng() %>),
			level: 10
		};

		var map = new kakao.maps.Map(container, options);
		
		var positions = [
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
		    }
		];
		
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "../images/icons/icon-mapmarker.png"; 
		  
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(30, 30); 

	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
	    //////////////////////////////////////////////////////////////////////////////////////////////////////	
		var marker1 = new kakao.maps.Marker({ // 첫번째 마커 생성
		    map: map, // 마커를 표시할 지도
		    position: positions[0].latlng, // 마커의 위치
		    image : markerImage
		});

		var infowindow = new kakao.maps.InfoWindow({ // 첫번째 인포 윈도우 생성
		    content: '<span class="info-title">'+positions[0].title+'</span>'
		});
		
		kakao.maps.event.addListener(marker1, 'mouseover', makeOverListener(map, marker1, infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker1, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker1, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'ground.jsp?shopNo=11'
			// location.href : 특정 URL로 이동
			// 카카오 지도에서 특정 시설을 클릭했을 때 정보를 보여주는 주소:  https://place.map.kakao.com/ + Number
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
			location.href = 'ground.jsp?shopNo=12'
			
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
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker3, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker3, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'ground.jsp?shopNo=13'
			// location.href : 특정 URL로 이동
			// 카카오 지도에서 특정 시설을 클릭했을 때 정보를 보여주는 주소:  https://place.map.kakao.com/ + Number
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
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
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker4, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker4, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'ground.jsp?shopNo=14'
			// location.href : 특정 URL로 이동
			// 카카오 지도에서 특정 시설을 클릭했을 때 정보를 보여주는 주소:  https://place.map.kakao.com/ + Number
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
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
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 올리면, makeOverListener 함수 호출)
		
		kakao.maps.event.addListener(marker5, 'mouseout', makeOutListener(infowindow));
		//이벤트 리스너 등록 : (첫번째 마커에, 마우스를 내리면, makeOutListener 함수 호출)
		
		kakao.maps.event.addListener(marker5, 'click', function() {
		// 이벤트 리스너 등록 : (첫번쨰 마커에, 클릭하면, 함수 실행)			
			location.href = 'ground.jsp?shopNo=15'
			// location.href : 특정 URL로 이동
			// 카카오 지도에서 특정 시설을 클릭했을 때 정보를 보여주는 주소:  https://place.map.kakao.com/ + Number
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		

		//마우스를 올릴시 InfoWindow 보여줌 
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