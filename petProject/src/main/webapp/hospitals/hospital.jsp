<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="reserve.*"%>
<%@page import="bookmark.BookmarkDAO"%>
<%@page import="gLocation.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="hospital.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="../css/content_style.css">
<link href="../css/nav_style.css" rel="stylesheet"/>
<link href="../css/reserveFrom_style.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="../js/slideAction.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hpm7nimrxi"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2562ec27e72afca8d8642f34a62bf88e"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">Kakao.init('2562ec27e72afca8d8642f34a62bf88e');</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<%
		String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	    if (session.getAttribute("userID") != null)
	    {
	        userID = (String)session.getAttribute("userID");
	    }
	    if (userID == null)
	    {
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('로그인을 하세요')");
	        script.println("location.href = '../member/LoginForm.jsp'");
	        script.println("</script>");
	    }
	    
	    String shopNo = request.getParameter("shopNo");
	    int no = Integer.parseInt(shopNo);
	   	HospitalDTO dto = new hospitalDAO().getHospital(no);
	    
	   	ArrayList<String> imgPath = new hospitalDAO().getImgPath(no);
		LocationDTO location = new LocationDAO().getLocation(no);
		String currentURL = request.getRequestURL().toString() + "?shopNo=" + no;
		
		ArrayList<Integer> list = new BookmarkDAO().getList(userID);
		String bPath = "";
		
		if(list.contains(no)){
			bPath = "icon-yesbookmark.png";
		}else{
			bPath = "icon-nobookmark.png";
		}
		
		String iPath = "";
		switch(shopNo){
			case "1" :
				iPath="yeamInfo.jsp"; break;
			case "2" :
				iPath="somInfo.jsp"; break;
			case "3" :
				iPath="bonInfo.jsp"; break;
			case "4" :
				iPath="maeumInfo.jsp"; break;
			case "5" :
				iPath="dolbomInfo.jsp"; break;	
		}
		
		LocalDateTime ldate = LocalDateTime.now().withSecond(0).withNano(0);
		ArrayList<LocalDateTime> times = new ReserveDAO().getLDTimes();
		LocalDateTime date = LocalDateTime.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd일 HH:mm");
		for(LocalDateTime t : times){ 
			if(t.isBefore(ldate)){
				new ReserveDAO().delBeforReserve(formatter.format(t));
			}
			
		}
	%>

     	<nav class="navbar" style="text-decoration: none">
       <div class="navbar_logo">
           <a href="../MainForm.jsp"><img src="../images/logo.png" width="180px" style="margin-top: 10px"/></a>
       </div>
       <div class="navbar_main_menu">
           <ul>
               <li><a href="../MainForm.jsp">Home</a></li>
               <li><a href="#">내 주변</a></li>
               <li><a href="../board/boardIndex.jsp">마을 회관</a></li>
               <li><a href="../member/userInfo.jsp">내 정보</a></li>
           </ul>
       </div>
   		<div class="navbar_join_menu">
             <ul>
 				<li><a href="../member/logout.jsp">로그아웃</a></li>
			<li><a href="#a">메시지</a></li>
 			</ul>
           </div>
	
	<script type="text/javascript">
		function addBookMark(){
    		location.href='../addBookmark1.jsp?shopNo=<%=no%>'
    	}
	
	    $(function() {
	        $("#showBtn").on("click", function() {
	            $("#Toggle").show();
	        })
	        $("#hideBtn").on("click", function() {
	            $("#Toggle").hide();
	        })
	    })
		
	    $(function() {
	        $("#showBtn2").on("click", function() {
	            $("#Toggle2").show();
	        })
	        $("#hideBtn2").on("click", function() {
	            $("#Toggle2").hide();
	        })
	    })
	    
	    function shareTwitter() {
		    var sendText = "<%= dto.getShopName()%>"; // 전달할 텍스트
		    var sendUrl = "<%= currentURL%>"; // 전달할 URL
		    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
		}
		
	    function shareFacebook() {
		    var sendUrl = "<%= location.getUrl()%>"; // 전달할 URL
		    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
		}
		
		function shareKakao() {
			  // 카카오링크 버튼 생성
			  Kakao.Link.createDefaultButton({
			    container: '#btnKakao', // 카카오공유버튼ID
			    objectType: 'feed',
			    content: {
			      title: "<%= dto.getShopName()%>", // 보여질 제목
			      description: "", // 보여질 설명
			      imageUrl: "https://www.naver.com/", // 콘텐츠 URL
			      link: {
			         mobileWebUrl: "https://www.naver.com/",
			         webUrl: "https://www.naver.com/"
			      }
			    }
			  });
			}	
	</script>
   </nav>
	
	<div class="btn_container">
	 <ul>
	 	<li id="btn_act1">
	 		<a href="tel:<%= dto.getTel() %>"><img src="../images/icons/icon-call.png" width="50px" height="50px">
	 		<h4 class="call_title">Call Now</h4></a>
	 	</li>
	 	<li id="btn_act2" onclick="addBookMark()"><a href="#">
	 		<img id="img" src="../images/<%= bPath %>" width="55px" height="55px">
	 		<h4 class="bookmark_title">Bookmark</h4>
	 		<div class="tooltip">방문 목록에 추가되요! </div>
	 	</li>
	 	<li id="btn_act3">
	 		<div id="showBtn"><img src="../images/icons/icon-share.png" width="50px" height="50px"></div>
	 		<h4 class="share_title">Share</h4></li>
	 	<li id="btn_act4">
	 		<div id="showBtn2"><img src="../images/icons/icon-join.png" width="60px" height="60px"></div>
	 		<h4 class="join_title">Schedule</h4>
	 	</li>
	 </ul>
	</div>
	<style>
		
	</style>
	<div id="Toggle" style="display: none;">
		<button type="button" id="hideBtn" >X</button>
		<div class="share_container">
			<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"><p>Twiter</p></a>
			<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();"><p class="facebook_title">FaceBook</p></a>    
			<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();">KaKao</a>  
		</div>
	</div>
	<div class="left_container">  
		<div class="image_container">
			<div class="inner-icon">
				<img src="../images/icons/icon-gallery.png" width="23px" height="23px">
				<span class="inner-title" >Gallery</span>
			</div>
		
			<div class="content_slider">
				<ul class="bxslider">
			      <li><img src="../upload/<%= imgPath.get(0) %>" width="600px" height="300px;" style="object-fit: contain;"></li>
			      <li><img src="../upload/<%= imgPath.get(1) %>" width="600px" height="300px;" style="object-fit: contain;"></li>
			      <li><img src="../upload/<%= imgPath.get(2) %>" width="600px" height="300px;" style="object-fit: contain;"></li>
			  	</ul>
			 </div> 	
		</div>
	
		<div class="map_container">
			<div class="inner-icon">
				<img src="../images/icons/icon-map.png" width="16px" height="16px">
				<span class="inner-title" >Location</span>
			</div>
			
				<div id="map" style="width:95%; height:300px;">
				
				<script>
				const locations = [
			        { place:'<%= dto.getShopName()%>', lat: <%= location.getLat()%>, lng: <%= location.getLng()%> },
			    ];


			    var HOME_PATH = window.HOME_PATH || '.';
			    var position = new naver.maps.LatLng(<%= location.getLat()%>, <%= location.getLng()%>);

			    var map = new naver.maps.Map('map', {
			        center: position,
			        zoom: 16
			    });
			    
			    var markerOptions = {
			        position: position.destinationPoint(90, 15),
			        map: map,
			        icon: {
			            url: '../images/icon-mapmarker.png',
			            size: new naver.maps.Size(75, 75),
			            origin: new naver.maps.Point(0, 0),
			            anchor: new naver.maps.Point(25, 26)
			        }
			    };
			    
			    var marker = new naver.maps.Marker(markerOptions);
			    
			    naver.maps.Event.addListener(marker, 'click', function(e) {
			    	   var overlay = e.overlay, // marker
			    	        position = overlay.getPosition(),
			    	        url = '<%= location.getUrl()%>'

			    	    window.open(url);
			    	});
			</script>			
		</div>
	</div>
</div>
	
<div class="right_container">
	  <div class="info_container">
		<div class="inner-icon">
			<img src="../images/icons/icon-info.png" width="20px" height="20px">
			<span class="inner-title" >소개</span>
		</div>	
		
		<div class="info-property">
			<span>
			<% if(shopNo.equals("1")){%>
				<%@ include file="../info/yedamInfo.jsp" %>	
			<%	
			}else if(shopNo.equals("2")){%>
				<%@ include file="../info/soomInfo.jsp" %>
			<%	
			}else if(shopNo.equals("3")){%>
				<%@ include file="../info/bonInfo.jsp" %>
			<%	
			}else if(shopNo.equals("4")){%>
				<%@ include file="../info/maeumInfo.jsp" %>
			<%	
			}else if(shopNo.equals("5")){%>
				<%@ include file="../info/dolbomInfo.jsp" %>
			<%	
			}
			%>	
			</span>
		</div>
	</div>
       <div class="time_container">
           <div class="inner-icon">
               <img src="../images/icons/icon-watch.png" width="18px" height="18px">
               <span class="open_title"> open</span>
           </div>
           <hr>
           <div class="open-hours">
           	 <table width="550px">
           		<tr>
           		<td>Monday</td>
           		<td style="text-align: right"><%=dto.getOpTimeMon() %> ~ <%=dto.getCsTimeMon() %></td>
           		</tr>
           		<tr>
           		<td>Tuesday</td>
           		<td style="text-align: right"><%=dto.getOpTimeTue() %> ~ <%=dto.getCsTimeTue() %></td>
           		</tr>
           		<tr>
           		<td>Wednesday</td>
           		<td style="text-align: right"><%=dto.getOpTimeWen() %> ~ <%=dto.getCsTimeWen() %></td>
           		</tr>
           		<tr>
           		<td>Thursday</td>
           		<td style="text-align: right"><%=dto.getOpTimeThu() %> ~ <%=dto.getCsTimeThu() %></td>
           		</tr>
           		<tr>
           		<td>Friday</td>
           		<td style="text-align: right"><%=dto.getOpTimeFri() %> ~ <%=dto.getCsTimeFri() %></td>
           		</tr>
           		<tr>
           		<td>Saturday</td>
           		<td style="text-align: right"><%=dto.getOpTimeSat() %> ~ <%=dto.getCsTimeThu() %></td>
           		</tr>
           		<td>Sunday</td>
           		<td style="text-align: right"><%=dto.getOpTimeSun() %> ~ <%=dto.getCsTimeSun() %></td>
           		</tr>
           	</table>
           </div>    
       </div>  
       <%
        int parking = dto.getParking();
		int wifi = dto.getWifi();
		int reserve	 = dto.getReserve();
		int hour = dto.getHour();
		int dog	 = dto.getReserve();
		int cat = dto.getHour();
				
		String pPath = "";
		String wPath = "";
		String rPath = "";
		String hPath = "";
		String dPath = "";
		String cPath = "";
		
		if(parking == 1){
			pPath = "icon-parking.png";
		}else{ pPath = "icon-unparking.png";}
		
		if(wifi == 1){
			wPath = "icon-wifi.png";
		}else{ wPath = "icon-unwifi.png";}
		
		if(reserve == 1){
			rPath = "icon-reserved.png";
		}else{ rPath = "icon-unreserved.png";}
		
		if(hour == 1){
			hPath = "icon-24-hour.png";
		}else{ hPath = "icon-un24hour.png";}
		
		if(dog == 1){
			dPath = "icon-dog.png";
		}else{ dPath = "icon-dog.png";}
		
		if(cat == 1){
			cPath = "icon-cat.png";
		}else{ cPath = "icon-cat.png";}
       %>
       
      <div class="feature_container">
		<div class="inner-icon">
			<img src="../images/icons/icon-select.png" width="20px" height="20px">
			<span class="inner-title">특징</span>
		</div>		
		<div class="feature_property">
			 <ul>
			 	<li id="btn_li"><img src="../images/hospital_img/<%=pPath %>" width="50px" height="50px"><h4 class="info_title">주차가능</li>
			 	<li id="btn_li"><img src="../images/hospital_img/<%=wPath %>" width="50px" height="50px"><h4 class="info_title">와이파이</li>
			 	<li id="btn_li"><img src="../images/hospital_img/<%=rPath %>" width="50px" height="50px"><h4 class="info_title">예약가능</li>
			 	<li id="btn_li"><img src="../images/hospital_img/<%=hPath %>" width="50px" height="50px"><h4 class="info_title"><p class="hour_title">24시</p></li> 
			 	<li id="btn_li"><img src="../images/hospital_img/<%=dPath %>" width="50px" height="50px"><h4 class="hour">강아지</li>
			 	<li id="btn_li"><img src="../images/hospital_img/<%=cPath %>" width="50px" height="50px"><h4 class="hour">고양이</li>
			 </ul>
		</div>
	</div>
</div>

<script type="text/javascript">
        var openWin;
    
        function openChild()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            var width = 600;
        	var height = 400;
    		var positionX = ( window.screen.width / 2 ) - ( width / 2 );
    		var positionY = ( window.screen.height / 2 ) - ( height / 2 );
    		var url = 'reserve.jsp?shopNo='+ <%= shopNo%>;
            openWin = window.open(url,
                    "childForm", 'width=600,height=400, top=' + positionY + ', left=' + positionX + ', resizable = no, scrollbars = no');  
            const toggle = document.getElementById('Toggle2');
            toggle.style.display='none';
        }
        
        let today = new Date().toISOString().substr(0, 10);
        
        function func_close(){
        	const toggle = document.getElementById('Toggle2');
            toggle.style.display='none';
        }
        
        function openAddFriend()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            var width = 600;
        	var height = 400;
    		var positionX = ( window.screen.width / 2 ) - ( width / 2 );
    		var positionY = ( window.screen.height / 2 ) - ( height / 2 );
    		var url = 'reserve.jsp?shopNo='+ <%= shopNo%>;
            openWin = window.open(url,
                    "childForm", 'width=600,height=400, top=' + positionY + ', left=' + positionX + ', resizable = no, scrollbars = no');  
            const toggle = document.getElementById('Toggle2');
            toggle.style.display='none';
        }
        window.onload=function(){
            //from www.java2s.com
            var today = new Date().toISOString().slice(0, 16);
            document.getElementsByName("setTodaysDate")[0].min = today;
        }
</script>

	<div id="Toggle2" style="display: none">	
		<button type="button" name="btnExit" onclick="func_close()" 
		style="background-color: transparent; font-size: 30px; float: right; border:0px; margin:10px 10px 0 0 ">X</button>
		<div class="schedule_container">
			<div class="schedule_title">방문 예정 목록에 추가하고 친구와 같이 가요!</div>
			<hr>
			<div class="notice_title"> NOTICE </div>
			<div class="notice_content">* 일정을 등록하면 다른 사용자에게도 공유됩니다</div>
			<div class="notice_content">* 반려 동물 등록을 먼저 진행하고 등록해주세요!</div>
			<div class="notice_content">* 매장 영업 시간을 확인해 주세요</div>
			
			<div class="resContainer">
				<input type="datetime-local" id="resDate" name="setTodaysDate" required="required" value="<%= ldate%>">
				<input type="button" value="등록"  onclick="openChild()">
			</div>
	<%
		ArrayList<ReserveList> rList = new ReserveDAO().getReserveList(no);
		for(ReserveList l : rList){	
			
	%>	
		<div class="form-style-3">
			<form action="addFriend.jsp">
				<fieldset><legend>My Pet</legend>
				<div class="img" style="background-image: url('../upload/myPetImage/<%= l.getPath() %>')" >
				<div class="infoBody">
					<label><span>아이디 <span class="required">*</span></span>
					<input type="text" name="friendID" readonly="readonly" value="<%= l.getUserID() %>"/></label>
					<label><span>이름 <span class="required">*</span></span>
					<input type="text" name="petName" readonly="readonly" value="<%= l.getPetName() %>"/></label>
					<label><span>몸무게 <span class="required">*</span></span>
					<input type="text" name="petWeight" readonly="readonly" value="<%= l.getPetWeight() %>"/></label>
					<label><span>방문일 <span class="required">*</span></span>
					<input type="text" name="petWeight" readonly="readonly" value="<%= l.getResDate() %>"/></label>
				
				<% if(!userID.equals(l.getUserID())){  %>
					<label>
						<input type="button" value="친구하기" onclick="window.open('../addFriend.jsp?friendID=<%= l.getUserID()%>&petName=<%= l.getPetName()%>',
						'addFriend', 'width=600,height=390, top= 250, left= 500')"/>
					</label>
				<% 
					}
				%>
				</div>
			</div>
			</fieldset>
		</form>
	</div>
	<%
		}
	%>	  
	</div>
</div>
</body>
</html>